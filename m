From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jul 2019 10:16:22 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/weston: fix build
 with latest freerdp
Message-ID: <20190729081504.AD675835E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ff9168b19a479e669db8467ce835a1b8a57dbdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit 942da943f3 (package/freerdp: security bump to version 2.0.0-rc4)
backported a patch from master, that bumps FreeRDP for security fixes.

However, the FreeRDP development process is, well, a bit weird, as they
have been in the rc phase for the past two years now (2.0.0-rc0 was on
2017-07-24). As such, they still continue to do huge code refactoring
and cleanup and stuff, even though this is the rc phase. Their API thus
changed quite a bit between rc2 and rc4.

Thus the backport now breaks weston.

We do not have the problem on master or 2019.05.x, because we are using
a more recent weston (6.0.0) which has the fix already. But on 2019.02.x,
we're still using an older weston (5.0.0), which misses the fix.

Backport the fix from upstream.

Fixes (2019.02.x):
    http://autobuild.buildroot.net/results/5fb140acadf26b7f38d3f5c07a4f8dd4dc9acb9e
    http://autobuild.buildroot.org/results/b16610516a8514cf45860a48d693dd0db275e8d9

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Lukyanchuk <skif@skif-web.ru>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...itor-fix-compilation-with-FreeRDP-2.0-rc4.patch | 218 +++++++++++++++++++++
 1 file changed, 218 insertions(+)

diff --git a/package/weston/0002-rdp-compositor-fix-compilation-with-FreeRDP-2.0-rc4.patch b/package/weston/0002-rdp-compositor-fix-compilation-with-FreeRDP-2.0-rc4.patch
new file mode 100644
index 0000000000..fe2303d42e
--- /dev/null
+++ b/package/weston/0002-rdp-compositor-fix-compilation-with-FreeRDP-2.0-rc4.patch
@@ -0,0 +1,218 @@
+From 7b7d9d316a9ce9b4f5f50ba766c2963b0fdcbaa5 Mon Sep 17 00:00:00 2001
+From: David Fort <contact@hardening-consulting.com>
+Date: Tue, 4 Dec 2018 23:25:39 +0100
+Subject: [PATCH] rdp-compositor: fix compilation with FreeRDP 2.0-rc4
+
+Some members have been removed from FreeRDP structs, so let's use local
+variables.
+
+[yann.morin.1998 at free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+
+---
+ libweston/compositor-rdp.c | 86 +++++++++++++++++++-------------------
+ 1 file changed, 43 insertions(+), 43 deletions(-)
+
+diff --git a/libweston/compositor-rdp.c b/libweston/compositor-rdp.c
+index 134e7298..871a0a3e 100644
+--- a/libweston/compositor-rdp.c
++++ b/libweston/compositor-rdp.c
+@@ -67,19 +67,19 @@
+ #endif
+ 
+ #ifdef HAVE_SURFACE_BITS_BMP
+-#define SURFACE_BPP(cmd) cmd->bmp.bpp
+-#define SURFACE_CODECID(cmd) cmd->bmp.codecID
+-#define SURFACE_WIDTH(cmd) cmd->bmp.width
+-#define SURFACE_HEIGHT(cmd) cmd->bmp.height
+-#define SURFACE_BITMAP_DATA(cmd) cmd->bmp.bitmapData
+-#define SURFACE_BITMAP_DATA_LEN(cmd) cmd->bmp.bitmapDataLength
++#define SURFACE_BPP(cmd) cmd.bmp.bpp
++#define SURFACE_CODECID(cmd) cmd.bmp.codecID
++#define SURFACE_WIDTH(cmd) cmd.bmp.width
++#define SURFACE_HEIGHT(cmd) cmd.bmp.height
++#define SURFACE_BITMAP_DATA(cmd) cmd.bmp.bitmapData
++#define SURFACE_BITMAP_DATA_LEN(cmd) cmd.bmp.bitmapDataLength
+ #else
+-#define SURFACE_BPP(cmd) cmd->bpp
+-#define SURFACE_CODECID(cmd) cmd->codecID
+-#define SURFACE_WIDTH(cmd) cmd->width
+-#define SURFACE_HEIGHT(cmd) cmd->height
+-#define SURFACE_BITMAP_DATA(cmd) cmd->bitmapData
+-#define SURFACE_BITMAP_DATA_LEN(cmd) cmd->bitmapDataLength
++#define SURFACE_BPP(cmd) cmd.bpp
++#define SURFACE_CODECID(cmd) cmd.codecID
++#define SURFACE_WIDTH(cmd) cmd.width
++#define SURFACE_HEIGHT(cmd) cmd.height
++#define SURFACE_BITMAP_DATA(cmd) cmd.bitmapData
++#define SURFACE_BITMAP_DATA_LEN(cmd) cmd.bitmapDataLength
+ #endif
+ 
+ #include <freerdp/freerdp.h>
+@@ -198,7 +198,7 @@ rdp_peer_refresh_rfx(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
+ 	uint32_t *ptr;
+ 	RFX_RECT *rfxRect;
+ 	rdpUpdate *update = peer->update;
+-	SURFACE_BITS_COMMAND *cmd = &update->surface_bits_command;
++	SURFACE_BITS_COMMAND cmd;
+ 	RdpPeerContext *context = (RdpPeerContext *)peer->context;
+ 
+ 	Stream_Clear(context->encode_stream);
+@@ -208,14 +208,14 @@ rdp_peer_refresh_rfx(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
+ 	height = (damage->extents.y2 - damage->extents.y1);
+ 
+ #ifdef HAVE_SKIP_COMPRESSION
+-	cmd->skipCompression = TRUE;
++	cmd.skipCompression = TRUE;
+ #else
+-	memset(cmd, 0, sizeof(*cmd));
++	memset(&cmd, 0, sizeof(*cmd));
+ #endif
+-	cmd->destLeft = damage->extents.x1;
+-	cmd->destTop = damage->extents.y1;
+-	cmd->destRight = damage->extents.x2;
+-	cmd->destBottom = damage->extents.y2;
++	cmd.destLeft = damage->extents.x1;
++	cmd.destTop = damage->extents.y1;
++	cmd.destRight = damage->extents.x2;
++	cmd.destBottom = damage->extents.y2;
+ 	SURFACE_BPP(cmd) = 32;
+ 	SURFACE_CODECID(cmd) = peer->settings->RemoteFxCodecId;
+ 	SURFACE_WIDTH(cmd) = width;
+@@ -245,7 +245,7 @@ rdp_peer_refresh_rfx(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
+ 	SURFACE_BITMAP_DATA_LEN(cmd) = Stream_GetPosition(context->encode_stream);
+ 	SURFACE_BITMAP_DATA(cmd) = Stream_Buffer(context->encode_stream);
+ 
+-	update->SurfaceBits(update->context, cmd);
++	update->SurfaceBits(update->context, &cmd);
+ }
+ 
+ 
+@@ -255,7 +255,7 @@ rdp_peer_refresh_nsc(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
+ 	int width, height;
+ 	uint32_t *ptr;
+ 	rdpUpdate *update = peer->update;
+-	SURFACE_BITS_COMMAND *cmd = &update->surface_bits_command;
++	SURFACE_BITS_COMMAND cmd;
+ 	RdpPeerContext *context = (RdpPeerContext *)peer->context;
+ 
+ 	Stream_Clear(context->encode_stream);
+@@ -265,15 +265,15 @@ rdp_peer_refresh_nsc(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
+ 	height = (damage->extents.y2 - damage->extents.y1);
+ 
+ #ifdef HAVE_SKIP_COMPRESSION
+-	cmd->skipCompression = TRUE;
++	cmd.skipCompression = TRUE;
+ #else
+ 	memset(cmd, 0, sizeof(*cmd));
+ #endif
+ 
+-	cmd->destLeft = damage->extents.x1;
+-	cmd->destTop = damage->extents.y1;
+-	cmd->destRight = damage->extents.x2;
+-	cmd->destBottom = damage->extents.y2;
++	cmd.destLeft = damage->extents.x1;
++	cmd.destTop = damage->extents.y1;
++	cmd.destRight = damage->extents.x2;
++	cmd.destBottom = damage->extents.y2;
+ 	SURFACE_BPP(cmd) = 32;
+ 	SURFACE_CODECID(cmd) = peer->settings->NSCodecId;
+ 	SURFACE_WIDTH(cmd) = width;
+@@ -289,7 +289,7 @@ rdp_peer_refresh_nsc(pixman_region32_t *damage, pixman_image_t *image, freerdp_p
+ 	SURFACE_BITMAP_DATA_LEN(cmd) = Stream_GetPosition(context->encode_stream);
+ 	SURFACE_BITMAP_DATA(cmd) = Stream_Buffer(context->encode_stream);
+ 
+-	update->SurfaceBits(update->context, cmd);
++	update->SurfaceBits(update->context, &cmd);
+ }
+ 
+ static void
+@@ -310,8 +310,8 @@ static void
+ rdp_peer_refresh_raw(pixman_region32_t *region, pixman_image_t *image, freerdp_peer *peer)
+ {
+ 	rdpUpdate *update = peer->update;
+-	SURFACE_BITS_COMMAND *cmd = &update->surface_bits_command;
+-	SURFACE_FRAME_MARKER *marker = &update->surface_frame_marker;
++	SURFACE_BITS_COMMAND cmd;
++	SURFACE_FRAME_MARKER marker;
+ 	pixman_box32_t *rect, subrect;
+ 	int nrects, i;
+ 	int heightIncrement, remainingHeight, top;
+@@ -320,18 +320,18 @@ rdp_peer_refresh_raw(pixman_region32_t *region, pixman_image_t *image, freerdp_p
+ 	if (!nrects)
+ 		return;
+ 
+-	marker->frameId++;
+-	marker->frameAction = SURFACECMD_FRAMEACTION_BEGIN;
+-	update->SurfaceFrameMarker(peer->context, marker);
++	marker.frameId++;
++	marker.frameAction = SURFACECMD_FRAMEACTION_BEGIN;
++	update->SurfaceFrameMarker(peer->context, &marker);
+ 
+-	memset(cmd, 0, sizeof(*cmd));
++	memset(&cmd, 0, sizeof(cmd));
+ 	SURFACE_BPP(cmd) = 32;
+ 	SURFACE_CODECID(cmd) = 0;
+ 
+ 	for (i = 0; i < nrects; i++, rect++) {
+ 		/*weston_log("rect(%d,%d, %d,%d)\n", rect->x1, rect->y1, rect->x2, rect->y2);*/
+-		cmd->destLeft = rect->x1;
+-		cmd->destRight = rect->x2;
++		cmd.destLeft = rect->x1;
++		cmd.destRight = rect->x2;
+ 		SURFACE_WIDTH(cmd) = rect->x2 - rect->x1;
+ 
+ 		heightIncrement = peer->settings->MultifragMaxRequestSize / (16 + SURFACE_WIDTH(cmd) * 4);
+@@ -343,8 +343,8 @@ rdp_peer_refresh_raw(pixman_region32_t *region, pixman_image_t *image, freerdp_p
+ 
+ 		while (remainingHeight) {
+ 			   SURFACE_HEIGHT(cmd) = (remainingHeight > heightIncrement) ? heightIncrement : remainingHeight;
+-			   cmd->destTop = top;
+-			   cmd->destBottom = top + SURFACE_HEIGHT(cmd);
++			   cmd.destTop = top;
++			   cmd.destBottom = top + SURFACE_HEIGHT(cmd);
+ 			   SURFACE_BITMAP_DATA_LEN(cmd) = SURFACE_WIDTH(cmd) * SURFACE_HEIGHT(cmd) * 4;
+ 			   SURFACE_BITMAP_DATA(cmd) = (BYTE *)realloc(SURFACE_BITMAP_DATA(cmd), SURFACE_BITMAP_DATA_LEN(cmd));
+ 
+@@ -353,15 +353,15 @@ rdp_peer_refresh_raw(pixman_region32_t *region, pixman_image_t *image, freerdp_p
+ 			   pixman_image_flipped_subrect(&subrect, image, SURFACE_BITMAP_DATA(cmd));
+ 
+ 			   /*weston_log("*  sending (%d,%d, %d,%d)\n", subrect.x1, subrect.y1, subrect.x2, subrect.y2); */
+-			   update->SurfaceBits(peer->context, cmd);
++			   update->SurfaceBits(peer->context, &cmd);
+ 
+ 			   remainingHeight -= SURFACE_HEIGHT(cmd);
+ 			   top += SURFACE_HEIGHT(cmd);
+ 		}
+ 	}
+ 
+-	marker->frameAction = SURFACECMD_FRAMEACTION_END;
+-	update->SurfaceFrameMarker(peer->context, marker);
++	marker.frameAction = SURFACECMD_FRAMEACTION_END;
++	update->SurfaceFrameMarker(peer->context, &marker);
+ }
+ 
+ static void
+@@ -956,7 +956,7 @@ xf_peer_activate(freerdp_peer* client)
+ 	pixman_box32_t box;
+ 	pixman_region32_t damage;
+ 	char seat_name[50];
+-
++	POINTER_SYSTEM_UPDATE pointer_system;
+ 
+ 	peerCtx = (RdpPeerContext *)client->context;
+ 	b = peerCtx->rdpBackend;
+@@ -1056,8 +1056,8 @@ xf_peer_activate(freerdp_peer* client)
+ 
+ 	/* disable pointer on the client side */
+ 	pointer = client->update->pointer;
+-	pointer->pointer_system.type = SYSPTR_NULL;
+-	pointer->PointerSystem(client->context, &pointer->pointer_system);
++	pointer_system.type = SYSPTR_NULL;
++	pointer->PointerSystem(client->context, &pointer_system);
+ 
+ 	/* sends a full refresh */
+ 	box.x1 = 0;
+-- 
+2.20.1
+
