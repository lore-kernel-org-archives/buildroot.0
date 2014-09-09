From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  8 Sep 2014 22:06:45 -0400
Subject: [Buildroot] [PATCH 2/3] ffmpeg: enable or disable debug based on
	BR2_ENABLE_DEBUG
In-Reply-To: <1410228406-2140-1-git-send-email-danomimanchego123@gmail.com>
References: <1410228406-2140-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1410228406-2140-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than hard-code --disable-debug, selectively enable
or disable based on BR2_ENABLE_DEBUG.

(Similar to gst1-libav.)

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/ffmpeg/ffmpeg.mk |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 2c52183..d50720b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -17,9 +17,8 @@ FFMPEG_LICENSE_FILES += COPYING.GPLv2
 endif
 
 FFMPEG_CONF_OPT = \
-	--prefix=/usr		\
+	--prefix=/usr \
 	--enable-avfilter \
-	--disable-debug \
 	--disable-version3 \
 	--enable-logging \
 	--enable-optimizations \
@@ -68,6 +67,12 @@ FFMPEG_CONF_OPT = \
 
 FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+FFMPEG_CONF_OPT += --enable-debug
+else
+FFMPEG_CONF_OPT += --disable-debug
+endif
+
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
 else
-- 
1.7.9.5
