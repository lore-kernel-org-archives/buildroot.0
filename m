From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 11:49:59 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain: switch to a two stage gcc build
In-Reply-To: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410688203-28621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410688203-28621-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the internal toolchain backend does a three stage gcc
build, with the following sequence of builds:

 - build gcc-initial
 - configure libc, install headers and start files
 - build gcc-intermediate
 - build libc
 - build gcc-final

However, it turns out that this is not necessary, and only a two stage
gcc build is needed. At some point, it was believed that a three stage
gcc build was needed for NPTL based toolchains with old gcc versions,
but even a gcc 4.4 build with a NPTL toolchain works fine.

So, this commit switches the internal toolchain backend to use a two
stage gcc build: just gcc-initial and gcc-final. It does so by:

 * Removing the custom dependency of all C libraries build step to
   host-gcc-intermediate. Now the C library packages simply have to
   depend on host-gcc-initial as a normal dependency (which they
   already do), and that's it.

 * Build and install both gcc *and* libgcc in
   host-gcc-initial. Previously, only gcc was built and installed in
   host-gcc-initial. libgcc was only done in host-gcc-intermediate,
   but now we need libgcc to build the C library.

 * Pass appropriate environment variables to get SSP (Stack Smashing
   Protection) to work properly:

    - Tell the compiler that the libc will provide the SSP support, by
      passing gcc_cv_libc_provides_ssp=yes. In Buildroot, we have
      chosen to use the SSP support from the C library instead of the
      SSP support from the compiler (this is not changed by this patch
      series, it was already the case).

    - Tell glibc to *not* build its own programs with SSP support. The
      issue is that if glibc detects that the compiler supports
      -fstack-protector, then glibc uses it to build a few things with
      SSP. However, at this point, the support is not complete (we
      only have host-gcc-initial, and the C library is not completely
      built). So, we pass libc_cv_ssp=no to tell the C library to not
      use SSP support itself. Note that this is not a big lose: only a
      few parts of the C library were built with -fstack-protector,
      not the entire library.

 * A special change is needed for ARC, because its libgcc depends on
   the C library, which breaks building libgcc in
   host-gcc-initial. This looks like a bug in the ARC compiler, as it
   does not obey the inhibit_libc variable which tells the compiler
   build process to *not* enable things that depend on the C
   library. So for now, in host-gcc-initial, we simply disable the
   build of libgmon.a for ARC. It's going to be built as part of
   host-gcc-final, so the final compiler will have gmon support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-initial/gcc-initial.mk | 20 ++++++++++++++++++--
 package/glibc/glibc.mk                 |  4 +---
 package/musl/musl.mk                   |  3 ---
 package/uclibc/uclibc.mk               |  3 ---
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index bc5ad26..4470477 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -24,11 +24,24 @@ HOST_GCC_INITIAL_SUBDIR = build
 
 HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
+# gcc on ARC has a bug: in its libgcc, even when no C library is
+# available (--with-newlib is passed, and therefore inhibit_libc is
+# defined), it tries to use the C library for the libgmon
+# library. Since it's not needed in gcc-initial, we disabled it here.
+ifeq ($(BR2_GCC_VERSION_4_8_ARC),y)
+define HOST_GCC_INITIAL_DISABLE_LIBGMON
+	$(SED) 's/crtbeginS.o libgmon.a crtg.o/crtbeginS.o crtg.o/' \
+		$(@D)/libgcc/config.host
+endef
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_DISABLE_LIBGMON
+endif
+
 HOST_GCC_INITIAL_CONF_OPT = \
 	$(HOST_GCC_COMMON_CONF_OPT) \
 	--enable-languages=c \
 	--disable-shared \
 	--without-headers \
+	--disable-threads \
 	--with-newlib \
 	--disable-largefile \
 	--disable-nls \
@@ -37,7 +50,10 @@ HOST_GCC_INITIAL_CONF_OPT = \
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
-HOST_GCC_INITIAL_MAKE_OPT = all-gcc
-HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
+# We need to tell gcc that the C library will be providing the ssp
+# support, as it can't guess it since the C library hasn't been built
+# yet (we're gcc-initial).
+HOST_GCC_INITIAL_MAKE_OPT = $(if $(BR2_TOOLCHAIN_HAS_SSP),gcc_cv_libc_provides_ssp=yes) all-gcc all-target-libgcc
+HOST_GCC_INITIAL_INSTALL_OPT = install-gcc install-target-libgcc
 
 $(eval $(host-autotools-package))
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 4cbca88..0f63445 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -79,6 +79,7 @@ define GLIBC_CONFIGURE_CMDS
 		$(SHELL) $(@D)/$(GLIBC_SRC_SUBDIR)/configure \
 		ac_cv_path_BASH_SHELL=/bin/bash \
 		libc_cv_forced_unwind=yes \
+		libc_cv_ssp=no \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
@@ -127,6 +128,3 @@ define GLIBC_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(autotools-package))
-
-# Before (e)glibc is built, we must have the second stage cross-compiler
-$(GLIBC_TARGET_BUILD): | host-gcc-intermediate
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 63607f9..2eccb3d 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -68,6 +68,3 @@ define MUSL_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
-
-# Before musl is built, we must have the second stage cross-compiler
-$(MUSL_TARGET_BUILD): | host-gcc-intermediate
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c68dc56..31ff47b 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -534,6 +534,3 @@ define UCLIBC_INSTALL_STAGING_CMDS
 endef
 
 $(eval $(kconfig-package))
-
-# Before uClibc is built, we must have the second stage cross-compiler
-$(UCLIBC_TARGET_BUILD): | host-gcc-intermediate
-- 
2.0.0
