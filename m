From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:07:38 +0200
Subject: [Buildroot] [git commit] gcc: use BR2_EXTRA_GCC_CONFIG_OPTIONS in
	gcc-initial and gcc-intermediate
Message-ID: <20130714204246.6E71A9A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63c8887501daf28a4fb82094892444a62a35323e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When refactoring the internal toolchain backend logic, the code was
changed to pass the custom configure options given through
BR2_EXTRA_GCC_CONFIG_OPTIONS only for the gcc final pass, with the
idea that we're only interested by user customization for the final
compiler.

However, the beaglebone_defconfig was passing --with-float=hard
--with-fpu=vfpv3-d16 as BR2_EXTRA_GCC_CONFIG_OPTIONS, and since the
refactoring, it was causing build failures of the beaglebone_defconfig
(with messages saying that Busybox is built to use VFP arguments, but
libc/libm are not). This is due to the fact that the gcc intermediate,
which is used to build the C library, wasn't built to generate hard
float, while the final compiler was generating hard float.

So, we get back to the original situation where the options in
BR2_EXTRA_GCC_CONFIG_OPTIONS are passed to all of the compiler
passes. Of course, the specific case of hard float will be fixed by
following patches in this area, but the idea still remains: the three
gcc should have the same options, if those options affected the ABI of
the generated code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host                       |    4 +++-
 package/gcc/gcc-initial/gcc-initial.mk           |    3 ++-
 package/gcc/gcc-intermediate/gcc-intermediate.mk |    3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0836f9f..a529d14 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -88,7 +88,9 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
 	default ""
 	help
-	  Any additional gcc configure options you may want to include....
+	  Any additional gcc configure options you may want to
+	  include. Those options are applied for all of the gcc
+	  initial, gcc intermediate and gcc final passes.
 
 config BR2_INSTALL_OBJC
 	bool "Build/install Objective-C compiler and runtime?"
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 05c956a..e468419 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -31,7 +31,8 @@ HOST_GCC_INITIAL_CONF_OPT = \
 	--without-headers \
 	--with-newlib \
 	--disable-largefile \
-	--disable-nls
+	--disable-nls \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
 HOST_GCC_INITIAL_MAKE_OPT = all-gcc
 HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index 5460000..a666025 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -30,7 +30,8 @@ HOST_GCC_INTERMEDIATE_CONF_OPT = \
 	$(HOST_GCC_COMMON_CONF_OPT) \
 	--enable-languages=c \
 	--disable-largefile \
-	--disable-nls
+	--disable-nls \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
 HOST_GCC_INTERMEDIATE_MAKE_OPT = all-gcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
