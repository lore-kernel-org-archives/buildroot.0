From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Sep 2013 23:24:35 +0200
Subject: [Buildroot] [git commit] gcc: provide option to enable mudflap
	support
Message-ID: <20130915213314.D5B1C82A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=530777aaebdcd63b7acd75ab5df650d9db750f49
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mudflap library is only useful if one uses the -fmudflap gcc
option to do more checks on pointers/arrays. This commit adds an
option to enable/disable mudflap support at the gcc level. By default,
it is disabled, which saves a little bit of build time compared to the
default of gcc which consists in enabling mudflap support.

Since mudflap is now disabled by default, and ensured to never be enabled
on platforms where it is not available, some gcc.mk code that was used to
disable mudflap in problematic configurations can be removed.

Whether -fmudflap is used when building is left to the user.

[Peter: tweak commit text, fix white space]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gcc/Config.in.host         |   15 +++++++++++++++
 package/gcc/gcc-final/gcc-final.mk |    8 ++++++++
 package/gcc/gcc.mk                 |   24 +++++++-----------------
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 111da3b..116fd24 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -155,3 +155,18 @@ config BR2_GCC_ENABLE_OPENMP
 	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
 	help
 	  Enable OpenMP support for the compiler
+
+config BR2_GCC_ENABLE_LIBMUDFLAP
+	bool "Enable libmudflap support"
+	# There are architectures, or specific configurations for
+	# which mudflap is not supported.
+	depends on !BR2_avr32 && !BR2_bfin && !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
+	help
+	  libmudflap is a gcc library used for the mudflap pointer
+	  debugging functionality. It is only needed if you intend to
+	  use the -fmudflap gcc flag.
+
+	  See http://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging and
+	  the help of the gcc -fmudflap option for more details.
+
+	  If you're unsure, leave this option disabled.
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 69a4ccd..b396382 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -119,6 +119,14 @@ ifeq ($(BR2_INSTALL_OBJC),y)
 HOST_GCC_FINAL_USR_LIBS += libobjc
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HOST_GCC_FINAL_USR_LIBS += libmudflapth
+else
+HOST_GCC_FINAL_USR_LIBS += libmudflap
+endif
+endif
+
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
 define HOST_GCC_FINAL_INSTALL_USR_LIBS
 	mkdir -p $(TARGET_DIR)/usr/lib
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 5636c6f..0c0cc99 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -125,6 +125,12 @@ else
 HOST_GCC_COMMON_CONF_OPT += --disable-tls
 endif
 
+ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
+HOST_GCC_COMMON_CONF_OPT += --enable-libmudflap
+else
+HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
+endif
+
 ifeq ($(BR2_PTHREADS_NONE),y)
 HOST_GCC_COMMON_CONF_OPT += \
 	--disable-threads \
@@ -198,25 +204,9 @@ HOST_GCC_COMMON_CONF_OPT += \
 	--with-bugurl="http://bugs.buildroot.net/"
 endif
 
-# AVR32 GCC special configuration
-ifeq ($(BR2_avr32),y)
-HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
-endif
-
-# ARM Thumb and mudflap aren't friends
-ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
-endif
-
-# Blackfin doesn't do mudflap
-ifeq ($(BR2_bfin),y)
-HOST_GCC_COMMON_CONF_OPT += --disable-libmudflap
-endif
-
-# Disable mudflap and enable proper double/long double for SPE ABI
+# Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPT += \
-	--disable-libmudflap \
 	--enable-e500_double \
 	--with-long-double-128
 endif
