From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 Jul 2013 17:59:45 +0200
Subject: [Buildroot] [PATCH] gcc: remove BR2_GCC_SHARED_LIBGCC option
Message-ID: <1373299185-9359-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6b48b4803450 ("add a know to enable/disable building a shared
libgcc"), from october 2006, isn't really as to why a
BR2_GCC_SHARED_LIBGCC option was needed. However, now that gcc has
been converted to the package infrastructure, it causes problems
because the host packages are always being passed --enable-shared
--disable-static, so re-adding --disable-shared on top of that break
things.

Moreover, our tests indicate that both a shared *and* a static version
of libgcc are built, and that linking dynamically and statically a
program that uses libgcc_s gives correct results: dynamically linked
against libgcc_s in the first case, statically linked in the second
case.

Therefore, it appears that this option is no longer necessary, and
removing it has the advantage of fixing the builds of
qemu_mips64_malta_defconfig and qemu_sparc_ss10_defconfig, both of
which had BR2_GCC_SHARED_LIBGCC not enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host         |  8 --------
 package/gcc/gcc-final/gcc-final.mk | 10 +---------
 package/gcc/gcc.mk                 |  2 +-
 3 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1b19128..0836f9f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -105,14 +105,6 @@ config BR2_INSTALL_FORTRAN
 	  Note that it is highly recommended NOT to use gfortran
 	  from gcc older than 4.2.0
 
-config BR2_GCC_SHARED_LIBGCC
-	bool "Build/install a shared libgcc?"
-	depends on !BR2_PREFER_STATIC_LIB
-	default y
-	depends on !BR2_sparc
-	help
-	  Build/install a shared libgcc library
-
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index f99f1a3..0db2eaa 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -49,12 +49,6 @@ else
 HOST_GCC_FINAL_CONF_OPT += --disable-libgomp
 endif
 
-ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
-HOST_GCC_FINAL_CONF_OPT += --enable-shared
-else
-HOST_GCC_FINAL_CONF_OPT += --disable-shared
-endif
-
 # End with user-provided options, so that they can override previously
 # defined options.
 HOST_GCC_FINAL_CONF_OPT += \
@@ -99,7 +93,6 @@ HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_SIMPLE_SYMLINKS
 # Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
 # libgcc_s to be installed in /lib and not /usr/lib. We add +x on
 # libgcc_s to ensure it will be stripped.
-ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 define HOST_GCC_FINAL_INSTALL_LIBGCC
 	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(STAGING_DIR)/lib/
@@ -109,12 +102,11 @@ define HOST_GCC_FINAL_INSTALL_LIBGCC
 endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
-endif
 
 # Handle the installation of libraries in /usr/lib
 HOST_GCC_FINAL_USR_LIBS =
 
-ifeq ($(BR2_GCC_SHARED_LIBGCC)$(BR2_INSTALL_LIBSTDCPP),yy)
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 HOST_GCC_FINAL_USR_LIBS += libstdc++
 endif
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 968354b..d3e9bc0 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -38,7 +38,7 @@ endef
 # Apply patches
 #
 
-ifeq ($(ARCH)-$(BR2_GCC_SHARED_LIBGCC),powerpc-y)
+ifeq ($(ARCH),powerpc)
 ifneq ($(BR2_SOFT_FLOAT),)
 define HOST_GCC_APPLY_POWERPC_PATCH
 	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
-- 
1.8.1.2
