From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Mon, 10 Dec 2018 19:06:26 +0800
Subject: [Buildroot] [PATCH 1/1] package/weston: bump to version 5.0.0
Message-ID: <1544439986-16889-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...tor-fix-compilation-against-FreeRDP-2.0.0.patch | 181 ---------------------
 package/weston/weston.hash                         |  10 +-
 package/weston/weston.mk                           |   2 +-
 3 files changed, 6 insertions(+), 187 deletions(-)
 delete mode 100644 package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch

diff --git a/package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch b/package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch
deleted file mode 100644
index 1d02e0c..0000000
--- a/package/weston/0002-rdp-compositor-fix-compilation-against-FreeRDP-2.0.0.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-From 029583e56e6eaad4139e39b4cf908158ab8cc91a Mon Sep 17 00:00:00 2001
-From: David Fort <rdp.effort@gmail.com>
-Date: Sun, 27 May 2018 23:56:43 +0200
-Subject: [PATCH] rdp-compositor: fix compilation against FreeRDP 2.0.0 rc2
-
-The SURFACE_BITS_COMMAND struct has changed and some members have been moved in the
-bmp field.
-
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-Tested-by: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
-[yann.morin.1998 at free.fr: backported from upstream]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- configure.ac               |  9 +++++-
- libweston/compositor-rdp.c | 69 +++++++++++++++++++++++++++++-----------------
- 2 files changed, 52 insertions(+), 26 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index da3f7342..1dce05fa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -264,10 +264,17 @@ if test x$enable_rdp_compositor = xyes; then
-     [],
-     [PKG_CHECK_MODULES(RDP_COMPOSITOR, [freerdp >= 1.1.0],[])]
-   )
--
-   SAVED_CPPFLAGS="$CPPFLAGS"
-   CPPFLAGS="$CPPFLAGS $RDP_COMPOSITOR_CFLAGS"
-+
-   AC_CHECK_HEADERS([freerdp/version.h])
-+  AC_CHECK_MEMBER([SURFACE_BITS_COMMAND.bmp],
-+	[AC_DEFINE([HAVE_SURFACE_BITS_BMP], [1], [SURFACE_BITS_CMD has bmp field])],
-+	[],
-+	[[#include <freerdp/update.h>]]
-+  )
-+
-+
-   CPPFLAGS="$SAVED_CPPFLAGS"
- fi
- 
-diff --git a/libweston/compositor-rdp.c b/libweston/compositor-rdp.c
-index fd0651af..134e7298 100644
---- a/libweston/compositor-rdp.c
-+++ b/libweston/compositor-rdp.c
-@@ -66,6 +66,22 @@
- #define FREERDP_CB_RETURN(V) return TRUE
- #endif
- 
-+#ifdef HAVE_SURFACE_BITS_BMP
-+#define SURFACE_BPP(cmd) cmd->bmp.bpp
-+#define SURFACE_CODECID(cmd) cmd->bmp.codecID
-+#define SURFACE_WIDTH(cmd) cmd->bmp.width
-+#define SURFACE_HEIGHT(cmd) cmd->bmp.height
-+#define SURFACE_BITMAP_DATA(cmd) cmd->bmp.bitmapData
-+#define SURFACE_BITMAP_DATA_LEN(cmd) cmd->bmp.bitmapDataLength
-+#else
-+#define SURFACE_BPP(cmd) cmd->bpp
-+#define SURFACE_CODECID(cmd) cmd->codecID
-+#define SURFACE_WIDTH(cmd) cmd->width
-+#define SURFACE_HEIGHT(cmd) cmd->height
-+#define SURFACE_BITMAP_DATA(cmd) cmd->bitmapData
-+#define SURFACE_BITMAP_DATA_LEN(cmd) cmd->bitmapDataLength
-+#endif
-+
- #include <freerdp/freerdp.h>
- #include <freerdp/listener.h>
- #include <freerdp/update.h>
-@@ -200,10 +216,10 @@ rdp_peer_refresh_rfx(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
- 	cmd->destTop = damage->extents.y1;
- 	cmd->destRight = damage->extents.x2;
- 	cmd->destBottom = damage->extents.y2;
--	cmd->bpp = 32;
--	cmd->codecID = peer->settings->RemoteFxCodecId;
--	cmd->width = width;
--	cmd->height = height;
-+	SURFACE_BPP(cmd) = 32;
-+	SURFACE_CODECID(cmd) = peer->settings->RemoteFxCodecId;
-+	SURFACE_WIDTH(cmd) = width;
-+	SURFACE_HEIGHT(cmd) = height;
- 
- 	ptr = pixman_image_get_data(image) + damage->extents.x1 +
- 				damage->extents.y1 * (pixman_image_get_stride(image) / sizeof(uint32_t));
-@@ -226,8 +242,8 @@ rdp_peer_refresh_rfx(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
- 			pixman_image_get_stride(image)
- 	);
- 
--	cmd->bitmapDataLength = Stream_GetPosition(context->encode_stream);
--	cmd->bitmapData = Stream_Buffer(context->encode_stream);
-+	SURFACE_BITMAP_DATA_LEN(cmd) = Stream_GetPosition(context->encode_stream);
-+	SURFACE_BITMAP_DATA(cmd) = Stream_Buffer(context->encode_stream);
- 
- 	update->SurfaceBits(update->context, cmd);
- }
-@@ -253,23 +269,26 @@ rdp_peer_refresh_nsc(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
- #else
- 	memset(cmd, 0, sizeof(*cmd));
- #endif
-+
- 	cmd->destLeft = damage->extents.x1;
- 	cmd->destTop = damage->extents.y1;
- 	cmd->destRight = damage->extents.x2;
- 	cmd->destBottom = damage->extents.y2;
--	cmd->bpp = 32;
--	cmd->codecID = peer->settings->NSCodecId;
--	cmd->width = width;
--	cmd->height = height;
-+	SURFACE_BPP(cmd) = 32;
-+	SURFACE_CODECID(cmd) = peer->settings->NSCodecId;
-+	SURFACE_WIDTH(cmd) = width;
-+	SURFACE_HEIGHT(cmd) = height;
- 
- 	ptr = pixman_image_get_data(image) + damage->extents.x1 +
- 				damage->extents.y1 * (pixman_image_get_stride(image) / sizeof(uint32_t));
- 
- 	nsc_compose_message(context->nsc_context, context->encode_stream, (BYTE *)ptr,
--			cmd->width,	cmd->height,
-+			width, height,
- 			pixman_image_get_stride(image));
--	cmd->bitmapDataLength = Stream_GetPosition(context->encode_stream);
--	cmd->bitmapData = Stream_Buffer(context->encode_stream);
-+
-+	SURFACE_BITMAP_DATA_LEN(cmd) = Stream_GetPosition(context->encode_stream);
-+	SURFACE_BITMAP_DATA(cmd) = Stream_Buffer(context->encode_stream);
-+
- 	update->SurfaceBits(update->context, cmd);
- }
- 
-@@ -306,16 +325,16 @@ rdp_peer_refresh_raw(pixman_region32_t *region, pixman_image_t *image, freerdp_p
- 	update->SurfaceFrameMarker(peer->context, marker);
- 
- 	memset(cmd, 0, sizeof(*cmd));
--	cmd->bpp = 32;
--	cmd->codecID = 0;
-+	SURFACE_BPP(cmd) = 32;
-+	SURFACE_CODECID(cmd) = 0;
- 
- 	for (i = 0; i < nrects; i++, rect++) {
- 		/*weston_log("rect(%d,%d, %d,%d)\n", rect->x1, rect->y1, rect->x2, rect->y2);*/
- 		cmd->destLeft = rect->x1;
- 		cmd->destRight = rect->x2;
--		cmd->width = rect->x2 - rect->x1;
-+		SURFACE_WIDTH(cmd) = rect->x2 - rect->x1;
- 
--		heightIncrement = peer->settings->MultifragMaxRequestSize / (16 + cmd->width * 4);
-+		heightIncrement = peer->settings->MultifragMaxRequestSize / (16 + SURFACE_WIDTH(cmd) * 4);
- 		remainingHeight = rect->y2 - rect->y1;
- 		top = rect->y1;
- 
-@@ -323,21 +342,21 @@ rdp_peer_refresh_raw(pixman_region32_t *region, pixman_image_t *image, freerdp_p
- 		subrect.x2 = rect->x2;
- 
- 		while (remainingHeight) {
--			   cmd->height = (remainingHeight > heightIncrement) ? heightIncrement : remainingHeight;
-+			   SURFACE_HEIGHT(cmd) = (remainingHeight > heightIncrement) ? heightIncrement : remainingHeight;
- 			   cmd->destTop = top;
--			   cmd->destBottom = top + cmd->height;
--			   cmd->bitmapDataLength = cmd->width * cmd->height * 4;
--			   cmd->bitmapData = (BYTE *)realloc(cmd->bitmapData, cmd->bitmapDataLength);
-+			   cmd->destBottom = top + SURFACE_HEIGHT(cmd);
-+			   SURFACE_BITMAP_DATA_LEN(cmd) = SURFACE_WIDTH(cmd) * SURFACE_HEIGHT(cmd) * 4;
-+			   SURFACE_BITMAP_DATA(cmd) = (BYTE *)realloc(SURFACE_BITMAP_DATA(cmd), SURFACE_BITMAP_DATA_LEN(cmd));
- 
- 			   subrect.y1 = top;
--			   subrect.y2 = top + cmd->height;
--			   pixman_image_flipped_subrect(&subrect, image, cmd->bitmapData);
-+			   subrect.y2 = top + SURFACE_HEIGHT(cmd);
-+			   pixman_image_flipped_subrect(&subrect, image, SURFACE_BITMAP_DATA(cmd));
- 
- 			   /*weston_log("*  sending (%d,%d, %d,%d)\n", subrect.x1, subrect.y1, subrect.x2, subrect.y2); */
- 			   update->SurfaceBits(peer->context, cmd);
- 
--			   remainingHeight -= cmd->height;
--			   top += cmd->height;
-+			   remainingHeight -= SURFACE_HEIGHT(cmd);
-+			   top += SURFACE_HEIGHT(cmd);
- 		}
- 	}
- 
--- 
-2.14.1
-
diff --git a/package/weston/weston.hash b/package/weston/weston.hash
index 55d87ac..a44bbcb 100644
--- a/package/weston/weston.hash
+++ b/package/weston/weston.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-April/037768.html
-md5 33709aa4d5916f89643fca0fc0064b39  weston-4.0.0.tar.xz
-sha1 df1da4a880920c515162e95b18f3709a46690be7  weston-4.0.0.tar.xz
-sha256 a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58  weston-4.0.0.tar.xz
-sha512 0af41016ff4eae85779f95b5c5e44b9683f4ef681a8e52256efeebfa38073082b83e039d0db3c94ac22f22f8d8314c9d6cd16611144b260b353fc5bfdd1ded19  weston-4.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039359.html
+md5 752a04ce3c65af4884cfac4e57231bdb  weston-5.0.0.tar.xz
+sha1 56b42b1fbea9e120a8127736328e4c71ac781a57  weston-5.0.0.tar.xz
+sha256 15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf  weston-5.0.0.tar.xz
+sha512 b6f97eca014ea47f3de0c5ddd89712f896cd66423d0eb499e1d88d35aab616cef1e735ebb8e0cefd8b60085314b6ec3d56b39d7c4776188bb56d58efc84a52cf  weston-5.0.0.tar.xz
diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a60fb5d..e9ce2ca 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WESTON_VERSION = 4.0.0
+WESTON_VERSION = 5.0.0
 WESTON_SITE = http://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
-- 
2.7.4
