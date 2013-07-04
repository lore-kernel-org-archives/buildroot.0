From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Jul 2013 09:08:42 +0200
Subject: [Buildroot] [git commit] Introduce BR2_TOOLCHAIN_USES_{UCLIBC,
	GLIBC}
Message-ID: <20130704095652.A0A069A2A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=381616e77ae7610f8fe07b9e0eb193d613fb3bf7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when we need to do a conditional on the type of C library
used, we need to take into account the three toolchain backends. As we
are going to add eglibc support to the Buildroot toolchain backend, it
would become even uglier, so this patch introduces two new hidden
options: BR2_TOOLCHAIN_USES_UCLIBC and BR2_TOOLCHAIN_USES_GLIBC, that
exist regardless of the toolchain backend. The entire Buildroot code
base is converted to use those options.

Note that we have intentionally created only one option
(BR2_TOOLCHAIN_USES_GLIBC) for both glibc and eglibc, since they are
essentially the same, as far as Buildroot is concerned.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                                         |    2 +-
 package/Makefile.in                              |    2 +-
 package/boost/boost.mk                           |    2 +-
 package/elfutils/Config.in                       |    9 ++-------
 package/elfutils/elfutils.mk                     |    2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |    8 ++------
 package/gpsd/Config.in                           |    4 ++--
 package/gsl/gsl.mk                               |    2 +-
 package/iozone/iozone.mk                         |    2 +-
 package/libv4l/Config.in                         |    8 ++++----
 package/ltp-testsuite/Config.in                  |    2 +-
 package/mongrel2/Config.in                       |    4 +---
 package/multimedia/gst-plugin-x170/Config.in     |    4 +---
 package/multimedia/on2-8170-libs/Config.in       |    4 +---
 package/nbd/nbd.mk                               |    2 +-
 package/network-manager/network-manager.mk       |    2 +-
 package/nss-mdns/Config.in                       |    2 +-
 package/php/php.mk                               |    2 +-
 package/squid/squid.mk                           |    2 +-
 package/tzdata/Config.in                         |    2 +-
 toolchain/Config.in                              |   16 ++++++++++++++++
 toolchain/toolchain-common.in                    |    8 ++------
 toolchain/toolchain-crosstool-ng/Config.in       |   11 +++--------
 toolchain/toolchain-external/Config.in           |    9 ++-------
 24 files changed, 49 insertions(+), 62 deletions(-)

diff --git a/Makefile b/Makefile
index fe9bde7..955e684 100644
--- a/Makefile
+++ b/Makefile
@@ -346,7 +346,7 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 TARGETS+=target-purgelocales
 endif
 
-ifneq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_CTNG_eglibc)$(BR2_TOOLCHAIN_CTNG_glibc),)
+ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
 ifneq ($(GENERATE_LOCALE),)
 TARGETS+=target-generatelocales
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index 6835de3..405b3e4 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -23,7 +23,7 @@ MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-buildroot-linux-$(LIBC)$(ABI)
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 LIBC=uclibc
 else
 LIBC=gnu
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index ce72990..160a9f1 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -59,7 +59,7 @@ BOOST_OPT += toolset=gcc \
 	     runtime-link=$(if $(BR2_PREFER_STATIC_LIB),static,shared)
 
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
 BOOST_OPT += boost.locale.posix=off
 endif
diff --git a/package/elfutils/Config.in b/package/elfutils/Config.in
index 914eec6..c6a2b84 100644
--- a/package/elfutils/Config.in
+++ b/package/elfutils/Config.in
@@ -3,10 +3,7 @@ comment "elfutils requires a toolchain with LARGEFILE and WCHAR support"
 
 config BR2_PACKAGE_ELFUTILS
 	bool "elfutils"
-	select BR2_PACKAGE_ARGP_STANDALONE if \
-	       BR2_TOOLCHAIN_BUILDROOT   || \
-	       BR2_TOOLCHAIN_CTNG_uClibc || \
-	       BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR
@@ -23,9 +20,7 @@ if BR2_PACKAGE_ELFUTILS
 
 config BR2_PACKAGE_ELFUTILS_PROGS
 	bool "Install programs"
-	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		   BR2_TOOLCHAIN_CTNG_glibc     || \
-		   BR2_TOOLCHAIN_CTNG_eglibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  This option tells elfutils to not only install the libelf
 	  libraries, but also the elfutils programs.
diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 2658786..696b566 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -37,7 +37,7 @@ endif
 ELFUTILS_CONF_ENV += \
 	LDFLAGS="$(ELFUTILS_LDFLAGS)"
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
  ELFUTILS_DEPENDENCIES += argp-standalone
 endif
 
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index 06544c4..e80eae4 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -1,7 +1,5 @@
 comment "gpu-viv-bin-mx6q requires a glibc toolchain"
-	depends on !(BR2_TOOLCHAIN_CTNG_glibc || \
-		BR2_TOOLCHAIN_CTNG_eglibc || \
-		BR2_TOOLCHAIN_EXTERNAL_GLIBC)
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	bool "gpu-viv-bin-mx6q"
@@ -9,9 +7,7 @@ config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
 	select BR2_PACKAGE_HAS_OPENGL_ES
 	depends on BR2_arm # Only relevant for i.MX6
 	 # Library binaries are linked against libc.so.6
-	depends on BR2_TOOLCHAIN_CTNG_glibc || \
-		BR2_TOOLCHAIN_CTNG_eglibc || \
-		BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Userspace libraries for Vivante GPU on i.MX6 platforms
 
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 337f8e7..70c8cbf 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -32,10 +32,10 @@ config BR2_PACKAGE_GPSD_OLDSTYLE
 
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
-	depends on !BR2_TOOLCHAIN_BUILDROOT && !BR2_TOOLCHAIN_CTNG_uClibc && !BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 
 comment "profiling support not available with uClibc-based toolchain"
-	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_CTNG_uClibc || BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_GPSD_NTP_SHM
 	bool "NTP time hinting support"
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 68b9948..c32a0eb 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -17,7 +17,7 @@ GSL_CONFIG_SCRIPTS = gsl-config
 # at: http://lists.busybox.net/pipermail/uclibc/2012-October/047067.html.
 # So we tell gsl that fenv related functions are not available in this
 # case.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ifneq ($(BR2_i386),y)
 GSL_CONF_ENV = \
        ac_cv_have_decl_feenableexcept=no \
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 970e509..328a526 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -15,7 +15,7 @@ IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 IOZONE_TARGET = linux-noth
 # AIO support not available on uClibc, use the linux (non-aio) target.
-else ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+else ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 IOZONE_TARGET = linux-noaio
 else
 IOZONE_TARGET = linux
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index 70f20ac..de4af30 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -13,21 +13,21 @@ if BR2_PACKAGE_LIBV4L
 
 config BR2_PACKAGE_LIBV4L_DECODE_TM6000
 	bool "decode_tm6000"
-	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Tool to decode tm6000 proprietary format streams
 
 comment "decode_tm6000 requires a GLIBC based toolchain"
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc)
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
 	bool "ir-keytable"
-	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Tool to alter keymaps of Remote Controller devices
 
 comment "ir-keytable requires a GLIBC based toolchain"
-	depends on !(BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_glibc || BR2_TOOLCHAIN_CTNG_eglibc)
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
 	bool "v4l2-compliance"
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 46e7380..75b029f 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,6 +1,6 @@
 comment "ltp-testsuite needs specific uClibc options, see help"
 	depends on BR2_PACKAGE_LTP_TESTSUITE
-	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_UCLIBC || BR2_TOOLCHAIN_CTNG_uClibc
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index cd93236..ca7e609 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -9,9 +9,7 @@ config BR2_PACKAGE_MONGREL2
 	# {get,make,swap}context functions present in
 	# {e,}glibc and in uClibc's master branch. Source has arm workaround
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
-		BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		BR2_TOOLCHAIN_CTNG_eglibc || \
-		BR2_TOOLCHAIN_CTNG_glibc || \
+		BR2_TOOLCHAIN_USES_GLIBC || \
 		BR2_arm
 	help
 	  Mongrel2 is an application, language, and network architecture
diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
index fd93947..9a1ae63 100644
--- a/package/multimedia/gst-plugin-x170/Config.in
+++ b/package/multimedia/gst-plugin-x170/Config.in
@@ -2,9 +2,7 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 	bool "gst-plugin-x170"
 	depends on BR2_PACKAGE_GSTREAMER
 	depends on BR2_arm926t
-	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		BR2_TOOLCHAIN_CTNG_eglibc || \
-		BR2_TOOLCHAIN_CTNG_glibc) # on2-8170-libs
+	depends on BR2_TOOLCHAIN_USES_GLIBC # on2-8170-libs
 	select BR2_PACKAGE_ON2_8170_LIBS
 	help
 	  GStreamer plug-in to use the Hantro X170 video decoder present on
diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
index 0cf05ad..8c2d963 100644
--- a/package/multimedia/on2-8170-libs/Config.in
+++ b/package/multimedia/on2-8170-libs/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_ON2_8170_LIBS
 	#This is a binary only package which has been compiled for glibc
 	depends on BR2_arm926t
-	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		BR2_TOOLCHAIN_CTNG_eglibc || \
-		BR2_TOOLCHAIN_CTNG_glibc)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_LINUX_KERNEL # on2-8170-modules
 	select BR2_PACKAGE_ON2_8170_MODULES # runtime
 	bool "on2-8170-libs"
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index e790a34..e5b5023 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -11,7 +11,7 @@ NBD_CONF_OPT = $(if $(BR2_LARGEFILE),--enable-lfs,--disable-lfs)
 NBD_DEPENDENCIES = libglib2
 NBD_LICENSE = GPLv2
 
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # We have linux/falloc.h
 # but uClibc lacks fallocate(2) which is a glibc-ism
 NBD_CONF_ENV = ac_cv_header_linux_falloc_h=no
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 9c143aa..b4d3408 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -35,7 +35,7 @@ NETWORK_MANAGER_CONF_OPT = \
 		--disable-ifnet
 
 # uClibc by default doesn't have backtrace support, so don't use it
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 NETWORK_MANAGER_CONF_OPT += --disable-crashtrace
 endif
 
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index 1df0ce4..b537fa5 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_NSS_MDNS
 	bool "nss-mdns"
 	# libdaemon->avahi uses fork()
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_AVAHI_DAEMON
 	help
 	  nss-mdns is a plugin for the GNU Name Service Switch (NSS)
diff --git a/package/php/php.mk b/package/php/php.mk
index 07f396e..299395f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -24,7 +24,7 @@ PHP_CONFIG_SCRIPTS = php-config
 PHP_CFLAGS = $(TARGET_CFLAGS)
 
 # Workaround for non-IPv6 uClibc toolchain
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ifneq ($(BR2_INET_IPV6),y)
 	PHP_CFLAGS += -DHAVE_DEPRECATED_DNS_FUNCS
 endif
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 4dd1404..e3daa32 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -26,7 +26,7 @@ SQUID_CONF_OPT =	--enable-async-io=8 --enable-linux-netfilter \
 			--enable-external-acl-helpers="ip_user"
 
 # On uClibc librt needs libpthread
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),yy)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)$(BR2_TOOLCHAIN_USES_UCLIBC),yy)
 	SQUID_CONF_ENV += ac_cv_search_shm_open="-lrt -lpthread"
 endif
 
diff --git a/package/tzdata/Config.in b/package/tzdata/Config.in
index 4e68a97..dec5f86 100644
--- a/package/tzdata/Config.in
+++ b/package/tzdata/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TZDATA
 	bool "tzdata"
-	depends on BR2_TOOLCHAIN_EXTERNAL_GLIBC || BR2_TOOLCHAIN_CTNG_eglibc || BR2_TOOLCHAIN_CTNG_glibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Time zone database
 
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 665618c..448bccc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,4 +1,19 @@
 menu "Toolchain"
+
+# Should be selected for glibc or eglibc
+config BR2_TOOLCHAIN_USES_GLIBC
+	bool
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+
+config BR2_TOOLCHAIN_USES_UCLIBC
+	bool
+
 choice
 	prompt "Toolchain type"
 	help
@@ -12,6 +27,7 @@ config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
 	depends on !BR2_microblaze && !BR2_aarch64
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External toolchain"
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 208ccac..7c9b842 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -62,9 +62,7 @@ config BR2_GENERATE_LOCALE
 	# build time.
 	depends on \
 		BR2_TOOLCHAIN_BUILDROOT      || \
-		BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
-		BR2_TOOLCHAIN_CTNG_eglibc    || \
-		BR2_TOOLCHAIN_CTNG_glibc
+		BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Generate support for a list of locales. Locales can be
 	  specified with or without encoding, when no encoding is
@@ -79,9 +77,7 @@ config BR2_GENERATE_LOCALE
 
 config BR2_NEEDS_GETTEXT
 	bool
-	default y if BR2_TOOLCHAIN_BUILDROOT
-	default y if BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	default y if BR2_TOOLCHAIN_CTNG_uClibc
+	default y if BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_NEEDS_GETTEXT_IF_LOCALE
 	bool
diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 93c12e9..7cfd8c2 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -7,27 +7,22 @@ choice
 
 config BR2_TOOLCHAIN_CTNG_uClibc
 	bool "uClibc"
+	select BR2_TOOLCHAIN_USES_UCLIBC
 
 # Although eglibc can be configured to opt-out some features,
 # let's not deal with that for the time being, it's complex...
 config BR2_TOOLCHAIN_CTNG_eglibc
 	bool "eglibc"
-	select BR2_LARGEFILE
-	select BR2_INET_IPV6
 	# Our default ct-ng configuration uses eglibc 2.12, which has
 	# native RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_TOOLCHAIN_CTNG_glibc
 	bool "glibc"
-	select BR2_LARGEFILE
-	select BR2_INET_IPV6
 	# Our default ct-ng configuration uses glibc 2.14.1, which
 	# does not have native RPC support
-	select BR2_ENABLE_LOCALE
-	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_USES_GLIBC
 
 endchoice # C library
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2c1c99b..946063f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -815,16 +815,11 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 
 config BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	bool
-	select BR2_LARGEFILE
-	select BR2_INET_IPV6
-	select BR2_USE_WCHAR
-	select BR2_ENABLE_LOCALE
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
+	select BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	bool
+	select BR2_TOOLCHAIN_USES_UCLIBC
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
