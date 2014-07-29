From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:47 +0200
Subject: [Buildroot] [PATCH 20 of 20] packages: rename misc. occurrences of
	_OPT into _OPTS
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <246b5329db5322303fef.1406668367@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
change remaining occurrences of _OPT into _OPTS.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 linux/linux-ext-xenomai.mk                  |   6 +-
 package/boost/boost.mk                      |  14 +++---
 package/cdrkit/cdrkit.mk                    |   6 +-
 package/dhcpcd/dhcpcd.mk                    |   8 +-
 package/freetype/freetype.mk                |   2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  |  40 +++++++++---------
 package/gstreamer1/gst1-libav/gst1-libav.mk |  44 ++++++++++----------
 7 files changed, 60 insertions(+), 60 deletions(-)

diff -r 1769f2d29e40 -r 246b5329db53 linux/linux-ext-xenomai.mk
--- a/linux/linux-ext-xenomai.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/linux/linux-ext-xenomai.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -11,9 +11,9 @@
 # Adeos patch version
 XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
 ifeq ($(XENOMAI_ADEOS_PATCH),)
-XENOMAI_ADEOS_OPT = --default
+XENOMAI_ADEOS_OPTS = --default
 else
-XENOMAI_ADEOS_OPT = --adeos=$(XENOMAI_ADEOS_PATCH)
+XENOMAI_ADEOS_OPTS = --adeos=$(XENOMAI_ADEOS_PATCH)
 endif
 
 # Prepare kernel patch
@@ -21,7 +21,7 @@
 	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
 		--linux=$(LINUX_DIR) \
 		--arch=$(KERNEL_ARCH) \
-		$(XENOMAI_ADEOS_OPT) \
+		$(XENOMAI_ADEOS_OPTS) \
 		--verbose
 endef
 
diff -r 1769f2d29e40 -r 246b5329db53 package/boost/boost.mk
--- a/package/boost/boost.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/package/boost/boost.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -77,10 +77,10 @@
 endif
 endif
 
-HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared \
+HOST_BOOST_OPTS += toolset=gcc threading=multi variant=release link=shared \
 	runtime-link=shared
 
-BOOST_OPT += toolset=gcc \
+BOOST_OPTS += toolset=gcc \
 	     threading=multi \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
 	     link=$(if $(BR2_PREFER_STATIC_LIB),static,shared) \
@@ -89,7 +89,7 @@
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
-BOOST_OPT += boost.locale.posix=off
+BOOST_OPTS += boost.locale.posix=off
 endif
 
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
@@ -114,7 +114,7 @@
 define BOOST_INSTALL_TARGET_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPT) \
+	$(BOOST_OPTS) \
 	--prefix=$(TARGET_DIR)/usr \
 	--layout=$(BOOST_LAYOUT) install )
 endef
@@ -122,14 +122,14 @@
 define HOST_BOOST_BUILD_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
-	$(HOST_BOOST_OPT) \
+	$(HOST_BOOST_OPTS) \
 	--prefix=$(HOST_DIR)/usr )
 endef
 
 define HOST_BOOST_INSTALL_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
-	$(HOST_BOOST_OPT) \
+	$(HOST_BOOST_OPTS) \
 	--prefix=$(HOST_DIR)/usr \
 	--layout=$(BOOST_LAYOUT) install )
 endef
@@ -137,7 +137,7 @@
 define BOOST_INSTALL_STAGING_CMDS
 	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
 	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPT) \
+	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
 	--layout=$(BOOST_LAYOUT) install)
 endef
diff -r 1769f2d29e40 -r 246b5329db53 package/cdrkit/cdrkit.mk
--- a/package/cdrkit/cdrkit.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/package/cdrkit/cdrkit.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -11,12 +11,12 @@
 CDRKIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
-CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
+CMAKE_ENDIAN_OPTS=-DBITFIELDS_HTOL=1
 else
-CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
+CMAKE_ENDIAN_OPTS=-DBITFIELDS_HTOL=0
 endif
 
-CDRKIT_CONF_OPTS += $(CMAKE_ENDIAN_OPT)
+CDRKIT_CONF_OPTS += $(CMAKE_ENDIAN_OPTS)
 
 ## cdrkit isn't completely re-rooted by CMAKE_FIND_ROOT_PATH, so add
 ## some extra flags so it finds needed libs and headers.
diff -r 1769f2d29e40 -r 246b5329db53 package/dhcpcd/dhcpcd.mk
--- a/package/dhcpcd/dhcpcd.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/package/dhcpcd/dhcpcd.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -11,15 +11,15 @@
 DHCPCD_LICENSE = BSD-2c
 
 ifeq ($(BR2_INET_IPV6),)
-	DHCPCD_CONFIG_OPT += --disable-ipv6
+	DHCPCD_CONFIG_OPTS += --disable-ipv6
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-	DHCPCD_CONFIG_OPT += --enable-static
+	DHCPCD_CONFIG_OPTS += --enable-static
 endif
 
 ifeq ($(BR2_USE_MMU),)
-	DHCPCD_CONFIG_OPT += --disable-fork
+	DHCPCD_CONFIG_OPTS += --disable-fork
 endif
 
 define DHCPCD_CONFIGURE_CMDS
@@ -27,7 +27,7 @@
 	$(TARGET_CONFIGURE_OPTS) ./configure \
 		--target=$(BR2_GCC_TARGET_ARCH) \
 		--os=linux \
-		$(DHCPCD_CONFIG_OPT) )
+		$(DHCPCD_CONFIG_OPTS) )
 endef
 
 define DHCPCD_BUILD_CMDS
diff -r 1769f2d29e40 -r 246b5329db53 package/freetype/freetype.mk
--- a/package/freetype/freetype.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/package/freetype/freetype.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -20,7 +20,7 @@
 # Regen required because the tarball ships with an experimental ltmain.sh
 # that can't be patched by our infra.
 # autogen.sh is because autotools stuff lives in other directories and
-# even AUTORECONF with _OPT doesn't do it properly.
+# even AUTORECONF with _OPTS doesn't do it properly.
 # POST_PATCH is because we still need to patch libtool after the regen.
 define FREETYPE_RUN_AUTOGEN
 	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
diff -r 1769f2d29e40 -r 246b5329db53 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -10,69 +10,69 @@
 GST_FFMPEG_INSTALL_STAGING = YES
 GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
 
-GST_FFMPEG_CONF_EXTRA_OPT = \
+GST_FFMPEG_CONF_EXTRA_OPTS = \
 		--cross-prefix=$(TARGET_CROSS) \
 		--target-os=linux
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-zlib
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
 GST_FFMPEG_DEPENDENCIES += zlib
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-zlib
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-bzlib
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-bzlib
 GST_FFMPEG_DEPENDENCIES += bzip2
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-bzlib
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-yasm
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-yasm
 GST_FFMPEG_DEPENDENCIES += host-yasm
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-yasm
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-mmx
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-yasm
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-mmx
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-sse
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-sse
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-sse
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-ssse3
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-ssse3
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-ssse3
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-ssse3
 endif
 
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
 ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv5te
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-armv6
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv6 --disable-armv6t2
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-neon
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-neon
 endif
 
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-altivec
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-altivec
 else
-GST_FFMPEG_CONF_EXTRA_OPT += --disable-altivec
+GST_FFMPEG_CONF_EXTRA_OPTS += --disable-altivec
 endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
-GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
+GST_FFMPEG_CONF_EXTRA_OPTS += --enable-pic
 endif
 
-GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPT)"
+GST_FFMPEG_CONF_OPTS = --with-ffmpeg-extra-configure="$(GST_FFMPEG_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
diff -r 1769f2d29e40 -r 246b5329db53 package/gstreamer1/gst1-libav/gst1-libav.mk
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk	Tue Jul 29 22:13:41 2014 +0200
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk	Tue Jul 29 22:18:26 2014 +0200
@@ -10,74 +10,74 @@
 
 GST1_LIBAV_DEPENDENCIES = host-pkgconf gstreamer1 gst1-plugins-base
 
-GST1_LIBAV_CONF_EXTRA_OPT = \
+GST1_LIBAV_CONF_EXTRA_OPTS = \
 	--cross-prefix=$(TARGET_CROSS) \
 	--target-os=linux \
 	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-zlib
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-zlib
 GST1_LIBAV_DEPENDENCIES += zlib
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-zlib
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-bzlib
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-bzlib
 GST1_LIBAV_DEPENDENCIES += bzip2
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-bzlib
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-bzlib
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-yasm
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-yasm
 GST1_LIBAV_DEPENDENCIES += host-yasm
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-yasm
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-mmx
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-yasm
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-mmx
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-sse
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-sse
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-sse
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSSE3),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-ssse3
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-ssse3
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-ssse3
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-ssse3
 endif
 
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
 ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv5te
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-armv6
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-armv6
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv6 --disable-armv6t2
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
 endif
 ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-neon
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-neon
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-neon
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-neon
 endif
 ifeq ($(BR2_ARM_CPU_HAS_VFPV2),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-vfp
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-vfp
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-vfp
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-vfp
 endif
 
 ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
-GST1_LIBAV_CONF_EXTRA_OPT += --enable-altivec
+GST1_LIBAV_CONF_EXTRA_OPTS += --enable-altivec
 else
-GST1_LIBAV_CONF_EXTRA_OPT += --disable-altivec
+GST1_LIBAV_CONF_EXTRA_OPTS += --disable-altivec
 endif
 
 GST1_LIBAV_CONF_OPTS = \
-	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
+	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPTS)"
 
 $(eval $(autotools-package))
