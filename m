From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Apr 2017 10:42:18 +0100
Subject: [Buildroot] [PATCH] mpv: bump version to 0.25.0
Message-ID: <20170424094218.60220-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove 0003-fix-build-with-have-gl.patch which is already included in
this release.

Remove --{enable|disable}-standard-gl configure option because it
doesn't exist.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mpv/0003-fix-build-with-have-gl.patch | 39 ---------------------------
 package/mpv/mpv.hash                          |  2 +-
 package/mpv/mpv.mk                            |  6 ++---
 3 files changed, 4 insertions(+), 43 deletions(-)
 delete mode 100644 package/mpv/0003-fix-build-with-have-gl.patch

diff --git a/package/mpv/0003-fix-build-with-have-gl.patch b/package/mpv/0003-fix-build-with-have-gl.patch
deleted file mode 100644
index 0934bc8..0000000
--- a/package/mpv/0003-fix-build-with-have-gl.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 212f6c8206bd4dcc7d8970c5f1632823ae4e783a Mon Sep 17 00:00:00 2001
-From: Michael Forney <mforney@mforney.org>
-Date: Sun, 12 Feb 2017 23:01:21 -0800
-Subject: [PATCH] Fix build with HAVE_GL==0
-
-video/out/opengl/hwdec.h includes video/out/opengl/common.h, which tries
-to include opengl headers.
-
-Downloaded from upstream commit:
-https://github.com/mpv-player/mpv/commit/212f6c8206bd4dcc7d8970c5f1632823ae4e783a
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- options/options.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/options/options.c b/options/options.c
-index b711156..0bb36ad 100644
---- a/options/options.c
-+++ b/options/options.c
-@@ -40,7 +40,6 @@
- #include "stream/stream.h"
- #include "video/csputils.h"
- #include "video/hwdec.h"
--#include "video/out/opengl/hwdec.h"
- #include "video/image_writer.h"
- #include "sub/osd.h"
- #include "audio/filter/af.h"
-@@ -53,6 +52,10 @@
- #include "video/out/drm_common.h"
- #endif
- 
-+#if HAVE_GL
-+#include "video/out/opengl/hwdec.h"
-+#endif
-+
- extern const char mp_help_text[];
- 
- static void print_version(struct mp_log *log)
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index e0644a3..10a91cf 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 a41854fa0ac35b9c309ad692aaee67c8d4495c3546f11cb4cdd0a124195d3f15  v0.24.0.tar.gz
+sha256 07423ffad6921ec4da32f703cd7fbfb27012301dcb736ac8542ac8e6083b0bce  v0.25.0.tar.gz
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 6191821..24ccf8c 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.24.0
+MPV_VERSION = 0.25.0
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
@@ -134,10 +134,10 @@ endif
 
 # OpenGL support
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-MPV_CONF_OPTS += --enable-gl --enable-standard-gl
+MPV_CONF_OPTS += --enable-gl
 MPV_DEPENDENCIES += libgl
 else
-MPV_CONF_OPTS += --disable-gl --disable-standard-gl
+MPV_CONF_OPTS += --disable-gl
 endif
 
 # pulseaudio support
-- 
2.10.2
