From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:50:38 +0200
Subject: [Buildroot] [git commit] ffmpeg: enable or disable debug based on
	BR2_ENABLE_DEBUG
Message-ID: <20140921205101.3B2D19D627@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca57e88552759dc729226888e43df26b61487219
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than hard-code --disable-debug, selectively enable
or disable based on BR2_ENABLE_DEBUG.

(Similar to gst1-libav.)

[Thomas: do not make other changes such as reformatting the
--prefix=/usr line.]

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6339cca..1481abc 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -19,7 +19,6 @@ endif
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
 	--enable-avfilter \
-	--disable-debug \
 	--disable-version3 \
 	--enable-logging \
 	--enable-optimizations \
@@ -67,6 +66,12 @@ FFMPEG_CONF_OPT = \
 
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
