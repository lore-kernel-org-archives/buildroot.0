From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:22:35 +0100
Subject: [Buildroot] [git commit] mesa3d: Add temporary fixes for etnaviv
	rendering
Message-ID: <20170319202241.528FA7FE1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8273895a5878372c0779dc40c2713ae966ebf2d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently when running Qt5_CinematicExperience demo from Qt5.8 the
covers of the movies appear with a black box instead of showing the
actual art cover.

Also, the fonts are incorrectly displayed in many cases.

Fix these issues by applying temporary patches to etnaviv.

According to Christian Gmeiner and Wladimir J. van der Laan
the correct solution to this problem is to use shader variants [1].

Use these temporary patches until the correct solution appears in
mesa mainline, so that etaniv users can run Qt successfully for
the time being.

[1] https://lists.freedesktop.org/archives/mesa-dev/2017-March/147948.html

Tested on imx6q-sabresd board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...naviv-Cannot-render-to-rb-swapped-formats.patch | 35 ++++++++++++++++++
 ...ect-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch | 41 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch b/package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch
new file mode 100644
index 0000000..c919fc4
--- /dev/null
+++ b/package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch
@@ -0,0 +1,35 @@
+From 309d4f0f11bac24a0b487404c51564735ac2c9ed Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Tue, 14 Mar 2017 09:51:23 -0300
+Subject: [PATCH 1/2] Revert "etnaviv: Cannot render to rb-swapped formats"
+Organization: O.S. Systems Software LTDA.
+
+This reverts commit 6c89a728d9e5d072cb504453e73077564c6523d3.
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ src/gallium/drivers/etnaviv/etnaviv_screen.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/src/gallium/drivers/etnaviv/etnaviv_screen.c b/src/gallium/drivers/etnaviv/etnaviv_screen.c
+index 28db9b95bf..2298936f51 100644
+--- a/src/gallium/drivers/etnaviv/etnaviv_screen.c
++++ b/src/gallium/drivers/etnaviv/etnaviv_screen.c
+@@ -469,11 +469,8 @@ etna_screen_is_format_supported(struct pipe_screen *pscreen,
+       return FALSE;
+ 
+    if (usage & PIPE_BIND_RENDER_TARGET) {
+-      /* If render target, must be RS-supported format that is not rb swapped.
+-       * Exposing rb swapped (or other swizzled) formats for rendering would
+-       * involve swizzing in the pixel shader.
+-       */
+-      if (translate_rs_format(format) != ETNA_NO_MATCH && !translate_rs_format_rb_swap(format)) {
++      /* if render target, must be RS-supported format */
++      if (translate_rs_format(format) != ETNA_NO_MATCH) {
+          /* Validate MSAA; number of samples must be allowed, and render target
+           * must have MSAA'able format. */
+          if (sample_count > 1) {
+-- 
+2.12.0
+
diff --git a/package/mesa3d/0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch b/package/mesa3d/0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
new file mode 100644
index 0000000..a78bd0e
--- /dev/null
+++ b/package/mesa3d/0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
@@ -0,0 +1,41 @@
+From ee18f89c49927f6696df2d557837acc9bfd71f71 Mon Sep 17 00:00:00 2001
+From: "Wladimir J. van der Laan" <laanwj@gmail.com>
+Date: Fri, 3 Feb 2017 09:30:53 +0000
+Subject: [PATCH 2/2] Revert "Subject: [PATCH] etnaviv: add RGBX/RGBA pixel
+ formats"
+Organization: O.S. Systems Software LTDA.
+
+This reverts commit 89bb5c79e29613ad9a4e43d670654e98a220fc60.
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ src/gallium/drivers/etnaviv/etnaviv_format.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/gallium/drivers/etnaviv/etnaviv_format.c b/src/gallium/drivers/etnaviv/etnaviv_format.c
+index 0794603b2f..693558476b 100644
+--- a/src/gallium/drivers/etnaviv/etnaviv_format.c
++++ b/src/gallium/drivers/etnaviv/etnaviv_format.c
+@@ -141,8 +141,6 @@ static struct etna_format formats[PIPE_FORMAT_COUNT] = {
+    V_(R16G16_SSCALED, SHORT,          NONE),
+    V_(R16G16_FLOAT,   HALF_FLOAT,     NONE),
+ 
+-   V_(A8B8G8R8_UNORM,   UNSIGNED_BYTE, NONE),
+-
+    V_(R8G8B8A8_UNORM,   UNSIGNED_BYTE, A8B8G8R8),
+    V_(R8G8B8A8_SNORM,   BYTE,          A8B8G8R8),
+    _T(R8G8B8X8_UNORM,   X8B8G8R8,      X8B8G8R8),
+@@ -151,9 +149,6 @@ static struct etna_format formats[PIPE_FORMAT_COUNT] = {
+    V_(R8G8B8A8_USCALED, UNSIGNED_BYTE, A8B8G8R8),
+    V_(R8G8B8A8_SSCALED, BYTE,          A8B8G8R8),
+ 
+-   _T(R8G8B8A8_UNORM, A8B8G8R8, A8B8G8R8),
+-   _T(R8G8B8X8_UNORM, X8B8G8R8, X8B8G8R8),
+-
+    _T(B8G8R8A8_UNORM, A8R8G8B8, A8R8G8B8),
+    _T(B8G8R8X8_UNORM, X8R8G8B8, X8R8G8B8),
+ 
+-- 
+2.12.0
+
