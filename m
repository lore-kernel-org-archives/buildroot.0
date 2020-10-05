From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Oct 2020 08:11:58 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/x11r7/xdriver-xf86-video-ati: Fix link failure with gcc 10
Message-ID: <20201005060154.643358216C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adf1da01e4ccd7db8d7c4585e7562e4f8539a479
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Backport an upstream patch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d4d0a036701b9418c59c0a251d2af45e5b8569d9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-link-failure-with-gcc-10.patch        | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

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
