From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 21:14:08 +0200
Subject: [Buildroot] [git commit] powerpc: add BR2_POWERPC_CPU_HAS_ALTIVEC
	to replace adhoc deps/checks
Message-ID: <20140601083246.22F939CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40e58dab0cc2de728c1363b4aa14c252559c93db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.powerpc                      |    6 ++++++
 package/efl/libevas/libevas.mk              |    2 +-
 package/ffmpeg/ffmpeg.mk                    |    5 +----
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  |    5 +----
 package/gstreamer1/gst1-libav/gst1-libav.mk |    5 +----
 package/mpg123/mpg123.mk                    |    4 +---
 package/vlc/vlc.mk                          |    3 +--
 7 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index cb8935c..8479103 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,3 +1,6 @@
+config BR2_POWERPC_CPU_HAS_ALTIVEC
+	bool
+
 config BR2_POWERPC_CPU_HAS_SPE
 	bool
 
@@ -51,8 +54,10 @@ config BR2_powerpc_740
 	bool "740"
 config BR2_powerpc_7400
 	bool "7400"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_7450
 	bool "7450"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_750
 	bool "750"
 config BR2_powerpc_821
@@ -63,6 +68,7 @@ config BR2_powerpc_860
 	bool "860"
 config BR2_powerpc_970
 	bool "970"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
 	select BR2_POWERPC_CPU_HAS_SPE
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 41ceb49..71f1aeb 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -136,7 +136,7 @@ else
 LIBEVAS_CONF_OPT += --disable-cpu-sse3
 endif
 
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 LIBEVAS_CONF_OPT += --enable-cpu-altivec
 else
 LIBEVAS_CONF_OPT += --disable-cpu-altivec
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a0a15a3..5510b80 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -299,14 +299,11 @@ FFMPEG_CONF_OPT += \
 	--disable-mipsdspr2
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc),y)
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 FFMPEG_CONF_OPT += --enable-altivec
 else
 FFMPEG_CONF_OPT += --disable-altivec
 endif
-endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 FFMPEG_CONF_OPT += --enable-pic
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index f18ab18..5c4b754 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -63,14 +63,11 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-neon
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc),y)
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-altivec
 else
 GST_FFMPEG_CONF_EXTRA_OPT += --disable-altivec
 endif
-endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 7a0182e..f84bcb2 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -71,14 +71,11 @@ else
 GST1_LIBAV_CONF_EXTRA_OPT += --disable-vfp
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc),y)
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
 GST1_LIBAV_CONF_EXTRA_OPT += --enable-altivec
 else
 GST1_LIBAV_CONF_EXTRA_OPT += --disable-altivec
 endif
-endif
 
 GST1_LIBAV_CONF_OPT = \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index a950813..d66592c 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -22,14 +22,12 @@ ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
 endif
 
-ifeq ($(BR2_powerpc),y)
-ifneq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 MPG123_CPU = altivec
 endif
 ifeq ($(BR2_SOFT_FLOAT),y)
 MPG123_CPU = ppc_nofpu
 endif
-endif
 
 ifeq ($(BR2_x86_64),y)
 MPG123_CPU = x86-64
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e14c9c3..6eb7eea 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -49,8 +49,7 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
 VLC_CONF_OPT += --disable-static
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 VCL_CONF_OPT += --enable-altivec
 else
 VLC_CONF_OPT += --disable-altivec
