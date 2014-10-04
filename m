From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 18:56:25 +0200
Subject: [Buildroot] [git commit] packages: rename misc. occurrences of _OPT
	into _OPTS
Message-ID: <20141004170454.41D2F9D584@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed8338b8683d89af895fb4d130c9344b38277b8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To be consistent with the recent change of FOO_MAKE_OPT into FOO_MAKE_OPTS,
change remaining occurrences of _OPT into _OPTS.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux-ext-xenomai.mk                  |    6 ++--
 package/boost/boost.mk                      |   14 ++++----
 package/dhcpcd/dhcpcd.mk                    |    8 ++--
 package/freetype/freetype.mk                |    2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  |   40 ++++++++++++------------
 package/gstreamer1/gst1-libav/gst1-libav.mk |   44 +++++++++++++-------------
 6 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index 115d4a8..84d2c17 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -11,9 +11,9 @@ LINUX_DEPENDENCIES += xenomai
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
@@ -21,7 +21,7 @@ define XENOMAI_PREPARE_KERNEL
 	$(XENOMAI_DIR)/scripts/prepare-kernel.sh \
 		--linux=$(LINUX_DIR) \
 		--arch=$(KERNEL_ARCH) \
-		$(XENOMAI_ADEOS_OPT) \
+		$(XENOMAI_ADEOS_OPTS) \
 		--verbose
 endef
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index caaeec0..46a98e8 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -77,7 +77,7 @@ BOOST_DEPENDENCIES += python
 endif
 endif
 
-HOST_BOOST_OPT += toolset=gcc threading=multi variant=release link=shared \
+HOST_BOOST_OPTS += toolset=gcc threading=multi variant=release link=shared \
 	runtime-link=shared
 
 ifeq ($(BR2_MIPS_OABI32),y)
@@ -88,7 +88,7 @@ else
 BOOST_ABI = sysv
 endif
 
-BOOST_OPT += toolset=gcc \
+BOOST_OPTS += toolset=gcc \
 	     threading=multi \
 	     abi=$(BOOST_ABI) \
 	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release) \
@@ -98,7 +98,7 @@ BOOST_OPT += toolset=gcc \
 ifeq ($(BR2_PACKAGE_BOOST_LOCALE),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 # posix backend needs monetary.h which isn't available on uClibc
-BOOST_OPT += boost.locale.posix=off
+BOOST_OPTS += boost.locale.posix=off
 endif
 
 BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
@@ -123,7 +123,7 @@ endef
 define BOOST_INSTALL_TARGET_CMDS
 	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPT) \
+	$(BOOST_OPTS) \
 	--prefix=$(TARGET_DIR)/usr \
 	--layout=$(BOOST_LAYOUT) install )
 endef
@@ -131,14 +131,14 @@ endef
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
@@ -146,7 +146,7 @@ endef
 define BOOST_INSTALL_STAGING_CMDS
 	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
 	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPT) \
+	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
 	--layout=$(BOOST_LAYOUT) install)
 endef
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index fe997c8..f4b821a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -11,15 +11,15 @@ DHCPCD_DEPENDENCIES = host-pkgconf
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
@@ -27,7 +27,7 @@ define DHCPCD_CONFIGURE_CMDS
 	$(TARGET_CONFIGURE_OPTS) ./configure \
 		--target=$(BR2_GCC_TARGET_ARCH) \
 		--os=linux \
-		$(DHCPCD_CONFIG_OPT) )
+		$(DHCPCD_CONFIG_OPTS) )
 endef
 
 define DHCPCD_BUILD_CMDS
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index d992610..b85d0ec 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -20,7 +20,7 @@ HOST_FREETYPE_CONF_OPTS = --without-zlib --without-bzip2 --without-png
 # Regen required because the tarball ships with an experimental ltmain.sh
 # that can't be patched by our infra.
 # autogen.sh is because autotools stuff lives in other directories and
-# even AUTORECONF with _OPT doesn't do it properly.
+# even AUTORECONF with _OPTS doesn't do it properly.
 # POST_PATCH is because we still need to patch libtool after the regen.
 define FREETYPE_RUN_AUTOGEN
 	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 0deb985..b94fb0f 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -10,69 +10,69 @@ GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
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
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index b269edc..b903da2 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -10,74 +10,74 @@ GST1_LIBAV_SITE = http://gstreamer.freedesktop.org/src/gst-libav
 
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
