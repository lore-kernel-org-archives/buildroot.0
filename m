From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 19:31:57 +0100
Subject: [Buildroot] [git commit] gst1-libav: fix build for xtensa
Message-ID: <20140211185414.757CB9C94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae3298d7d489f5ee465ff4ce83494de527d0ac73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gst1-libav needs the same fix for xtensa like ffmpeg got in commit
4ec35e76b8a3 (ffmpeg: fix build for xtensa).

Fixes:
http://autobuild.buildroot.net/results/33f/33fcbb79809719f68f3ee2cdb0fcacad82b9e0eb/

[Peter: pass the correct flags, not the ones from ffmpeg]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-libav/gst1-libav.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 1c45acc..a0a536e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -83,4 +83,12 @@ endif
 GST1_LIBAV_CONF_OPT = \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
 
+GST1_LIBAV_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_xtensa),y)
+GST1_LIBAV_CFLAGS += -mtext-section-literals
+endif
+
+GST1_LIBAV_CONF_ENV += CFLAGS="$(GST1_LIBAV_CFLAGS)"
+
 $(eval $(autotools-package))
