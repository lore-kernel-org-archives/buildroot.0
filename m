From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Fri, 21 Feb 2014 00:27:59 +0000
Subject: [Buildroot] [PATCH 1/1] ffmpeg: pass BR2_GCC_TARGET_CPU option on
	ARM
Message-ID: <1392942479-18781-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d3539dd53b ('arch: pass cpu option instead of tune option on ARM')
changed variable from BR2_GCC_TARGET_TUNE to BR2_GCC_TARGET_CPU

Therefore, doesn't pass the "--cpu=" option on ARM.

Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/ffmpeg/ffmpeg.mk |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a067fe6..ca48a92 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -17,7 +17,7 @@ FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
 FFMPEG_CONF_OPT = \
-	--prefix=/usr		\
+	--prefix=/usr \
 	--enable-avfilter \
 	--disable-debug \
 	--disable-version3 \
@@ -320,6 +320,14 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
 FFMPEG_CONF_OPT += --enable-pic
 endif
 
+ifeq ($(BR2_arm),y)
+FFMPEG_CONF_OPT += \
+	--cpu=$(BR2_GCC_TARGET_CPU)
+else
+FFMPEG_CONF_OPT += \
+$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE))
+endif
+
 FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
@@ -335,7 +343,6 @@ define FFMPEG_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--arch=$(BR2_ARCH) \
 		--target-os="linux" \
-		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPT) \
 	)
-- 
1.7.10.4
