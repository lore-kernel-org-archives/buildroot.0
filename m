From: Ben Widawsky <ben@bwidawsk.net>
Date: Thu, 17 Jul 2014 22:27:28 -0700
Subject: [Buildroot] [PATCH 1/2] xf86-video-intel: Disable SNA without
	composite
Message-ID: <1405661249-6506-1-git-send-email-ben@bwidawsk.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

SNA requires the composite extension. Fallback to UXA is the user has
decided not to add this. Ideally we could fall back to glamor, but that
was more work.

Cc: Bernd Kuhls <berndkuhls@hotmail.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ben Widawsky <ben@bwidawsk.net>
---
 .../xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 332de54..787b8fa 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -16,13 +16,23 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPT = \
 	--enable-kms-only \
 	--disable-xvmc \
 	--disable-ums-only \
-	--enable-sna \
-	--disable-uxa \
-	--disable-glamor \
 	--disable-xaa \
 	--disable-dga \
 	--disable-async-swap
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXCOMPOSITE),y)
+	XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += \
+		--enable-sna \
+		--disable-uxa \
+		--disable-glamor
+else
+	XDRIVER_XF86_VIDEO_INTEL_CONF_OPT += \
+		--disable-sna \
+		--enable-uxa \
+		--disable-glamor
+endif
+
+
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xproto libdrm xlib_libpciaccess
 
 $(eval $(autotools-package))
-- 
2.0.1
