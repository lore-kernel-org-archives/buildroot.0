From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Oct 2014 15:33:20 -0400
Subject: [Buildroot] [PATCH v4 2/4] gst-ffmpeg: add --pkg-config to internal
	libav configure options
In-Reply-To: <1413747202-8919-1-git-send-email-danomimanchego123@gmail.com>
References: <1413747202-8919-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1413747202-8919-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The internal copy of libav in gst-ffmpeg does not understand the
PKG_CONFIG env variable, so it throws a line like this at the end
of its configuration:

WARNING: .../output/host/usr/bin/i686-pc-linux-gnu-pkg-config not found, library detection may fail.

This patch adds the --pkg-config to let libav know where it is.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

---

This is basically the same problem suffered by ffmpeg, fixed in
commit a9a5a8159937cbc5e472cbd0b144d596b85a3386.

v3 -> v4:
 - Add Luca Ceresoli's Tested-by and Reviewed-by.
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 2db0f15..e8c6d61 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -22,7 +22,8 @@ endif
 
 GST_FFMPEG_CONF_EXTRA_OPTS = \
 		--cross-prefix=$(TARGET_CROSS) \
-		--target-os=linux
+		--target-os=linux \
+		--pkg-config='$(PKG_CONFIG_HOST_BINARY)'
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_FFMPEG_CONF_EXTRA_OPTS += --enable-zlib
-- 
1.9.1
