From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Mar 2011 23:36:06 +0100
Subject: [Buildroot] [git commit master 1/1] ffmpeg: bump to version 0.6.1
Message-ID: <20110306223740.65BB48E5E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1b269dd5524c76e339a4ca966b59854dfec075b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/Config.in                |    5 ++-
 .../ffmpeg-0.5.2-fix-sdl-config-search.patch       |   17 -------------
 package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch   |   17 +++++++++++++
 package/multimedia/ffmpeg/ffmpeg.mk                |   26 +++++++++++++++----
 4 files changed, 40 insertions(+), 25 deletions(-)
 delete mode 100644 package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch
 create mode 100644 package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch

diff --git a/package/multimedia/ffmpeg/Config.in b/package/multimedia/ffmpeg/Config.in
index 2f94991..7a9513c 100644
--- a/package/multimedia/ffmpeg/Config.in
+++ b/package/multimedia/ffmpeg/Config.in
@@ -1,9 +1,10 @@
-comment "ffmpeg requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "ffmpeg requires a toolchain with LARGEFILE and IPV6 support"
+	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
 	help
          FFmpeg is a complete, cross-platform solution to record, convert
          and stream audio and video.
diff --git a/package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch b/package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch
deleted file mode 100644
index 58d08aa..0000000
--- a/package/multimedia/ffmpeg/ffmpeg-0.5.2-fix-sdl-config-search.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Allow FFmpeg's ./configure script to use a custom sdl-config command.
-
-Inspired from:
-http://www.mail-archive.com/uclinux-dist-commits at blackfin.uclinux.org/msg01099.html
-
-diff -u ffmpeg-0.5.2-orig/configure ffmpeg-0.5.2/configure
---- a/configure
-+++ b/configure
-@@ -2066,7 +2066,7 @@
- 
- disable sdl_too_old
- disable sdl
--SDL_CONFIG="${cross_prefix}sdl-config"
-+SDL_CONFIG="${SDL_CONFIG-${cross_prefix}sdl-config}"
- if "${SDL_CONFIG}" --version > /dev/null 2>&1; then
-     sdl_cflags=`"${SDL_CONFIG}" --cflags`
-     temp_cflags $sdl_cflags
diff --git a/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch b/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
new file mode 100644
index 0000000..de2c004
--- /dev/null
+++ b/package/multimedia/ffmpeg/ffmpeg-sdlconfig.patch
@@ -0,0 +1,17 @@
+We need to pass the location sdl-config so that ffmpeg picks it up.
+So just pass the whole string to make things simpler.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura ffmpeg-0.6.1/configure ffmpeg-0.6.1.sdl/configure
+--- ffmpeg-0.6.1/configure	2010-06-15 16:44:30.000000000 -0300
++++ ffmpeg-0.6.1.sdl/configure	2011-02-25 17:13:12.979168176 -0300
+@@ -2640,7 +2640,7 @@
+     die "ERROR: No version of libdc1394 found "
+ fi
+ 
+-SDL_CONFIG="${cross_prefix}sdl-config"
++SDL_CONFIG="${SDL_CONFIG}"
+ if "${SDL_CONFIG}" --version > /dev/null 2>&1; then
+     sdl_cflags=$("${SDL_CONFIG}" --cflags)
+     sdl_libs=$("${SDL_CONFIG}" --libs)
diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index b37ac90..1e8f09a 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -3,17 +3,16 @@
 # ffmpeg
 #
 #############################################################
-FFMPEG_VERSION := 0.5.2
-FFMPEG_SOURCE := ffmpeg-$(FFMPEG_VERSION).tar.bz2
-FFMPEG_SITE := http://ffmpeg.org/releases
+
+FFMPEG_VERSION = 0.6.1
+FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
+FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
-FFMPEG_INSTALL_TARGET = YES
 
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
 	--enable-shared 	\
 	--disable-avfilter	\
-	--disable-vhook		\
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
@@ -129,6 +128,21 @@ ifeq ($(BR2_x86_i386)$(BR2_x86_i486)$(BR2_x86_i586)$(BR2_x86_i686)$(BR2_x86_pent
 FFMPEG_CONF_OPT += --disable-mmx
 endif
 
+# ARM defaults to v5: clear if less, add extra if more
+ifeq ($(BR2_generic_arm)$(BR2_arm7tdmi)$(BR2_arm610)$(BR2_arm710)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t),y)
+FFMPEG_CONF_OPT += --disable-armv5te
+endif
+ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s),y)
+FFMPEG_CONF_OPT += --enable-armv6
+endif
+ifeq ($(BR2_arm10)$(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf-s)$(BR2_cortex_a8)$(BR2_cortex_a9),y)
+FFMPEG_CONF_OPT += --enable-armvfp
+endif
+# NEON is optional for A9
+ifeq ($(BR2_cortex_a8),y)
+FFMPEG_CONF_OPT += --enable-neon
+endif
+
 FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
@@ -143,8 +157,8 @@ define FFMPEG_CONFIGURE_CMDS
 		--sysroot=$(STAGING_DIR) \
 		--host-cc="$(HOSTCC)" \
 		--arch=$(BR2_ARCH) \
+		--target-os=linux \
 		--extra-cflags=-fPIC \
-		$(DISABLE_IPV6) \
 		$(FFMPEG_CONF_OPT) \
 	)
 endef
-- 
1.7.3.4
