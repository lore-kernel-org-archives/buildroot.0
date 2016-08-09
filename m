From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  9 Aug 2016 21:24:06 +0200
Subject: [Buildroot] [PATCH] package/weston: no-break space U+A0 (U8+C2A0)
Message-ID: <1470770646-21912-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/f49/f49a9cbb7bdc5d9e05dcf0a20bd83f059e234e74/
    http://autobuild.buildroot.org/results/1d3/1d3e7f07388ae11d70103e04d8a14c20d50fc212/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...ompositor-rdp-fix-no-break-space-U-A0-U8-.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch

diff --git a/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch b/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
new file mode 100644
index 0000000..32db32f
--- /dev/null
+++ b/package/weston/0002-libweston-compositor-rdp-fix-no-break-space-U-A0-U8-.patch
@@ -0,0 +1,34 @@
+From 7ee8589dd83e52ae6af3ec5247c3403e8ded69a5 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Tue, 9 Aug 2016 20:00:29 +0200
+Subject: [PATCH] libweston/compositor-rdp: fix no-break space U+A0 (U8+C2A0)
+
+There is a UTF-8 no-break space (U+A0, U8+C2A0) in the definition of
+macro NSC_RESET in the case of  1.2.2 <= FreeRDP < 2.0.
+
+This is causing build issues (\302 is 0xC2, \240 is 0xA0):
+    http://autobuild.buildroot.net/results/f49/f49a9cbb7bdc5d9e05dcf0a20bd83f059e234e74/build-end.log
+
+Fix that by using a plain, boring space U+20.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ libweston/compositor-rdp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/compositor-rdp.c b/libweston/compositor-rdp.c
+index 11f5f05..ee81300 100644
+--- a/libweston/compositor-rdp.c
++++ b/libweston/compositor-rdp.c
+@@ -58,7 +58,7 @@
+ #	define NSC_RESET(C, W, H) nsc_context_reset(C, W, H)
+ #	define RFX_RESET(C, W, H) rfx_context_reset(C, W, H)
+ #else
+-#	define NSC_RESET(C, W, H) do {?nsc_context_reset(C); C->width = W; C->height = H; } while(0)
++#	define NSC_RESET(C, W, H) do { nsc_context_reset(C); C->width = W; C->height = H; } while(0)
+ #	define RFX_RESET(C, W, H) do { rfx_context_reset(C); C->width = W; C->height = H; } while(0)
+ #endif
+ #define FREERDP_CB_RET_TYPE BOOL
+-- 
+2.7.4
+
-- 
2.7.4
