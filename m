From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  4 Oct 2020 01:29:46 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xdriver-xf86-video-ati: Fix link
 failure with gcc 10
Message-ID: <20201003232946.550242-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport an upstream patch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 .../0001-Fix-link-failure-with-gcc-10.patch   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch

diff --git a/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch b/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
new file mode 100644
index 0000000000..b7a66c5c27
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-ati/0001-Fix-link-failure-with-gcc-10.patch
@@ -0,0 +1,35 @@
+From f223035f4ffcff2a9296d1e907a5193f8e8845a3 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 4 Feb 2020 16:38:06 -0500
+Subject: [PATCH xf86-video-ati] Fix link failure with gcc 10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Without the 'extern' this looks like a definition not just a
+declaration, in every file that includes the header. gcc 10 is stricter
+about this kind of multiple definition.
+
+Reviewed-by: Michel D??nzer <mdaenzer@redhat.com>
+[backport from upstream: f223035f4ffcff2a9296d1e907a5193f8e8845a3]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/drmmode_display.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/drmmode_display.h b/src/drmmode_display.h
+index 96eaef0a..8cd8a0a6 100644
+--- a/src/drmmode_display.h
++++ b/src/drmmode_display.h
+@@ -262,7 +262,7 @@ Bool drmmode_wait_vblank(xf86CrtcPtr crtc, drmVBlankSeqType type,
+ 			 uint64_t *ust, uint32_t *result_seq);
+ 
+ 
+-miPointerSpriteFuncRec drmmode_sprite_funcs;
++extern miPointerSpriteFuncRec drmmode_sprite_funcs;
+ 
+ 
+ #endif
+-- 
+2.25.4
+
-- 
2.25.4
