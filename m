From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Apr 2017 14:21:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpv: bump version to 0.24.0
Message-ID: <20170416122144.7459-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/0003-fix-build-with-have-gl.patch | 39 +++++++++++++++++++++++++++
 package/mpv/mpv.hash                          |  2 +-
 package/mpv/mpv.mk                            |  2 +-
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 package/mpv/0003-fix-build-with-have-gl.patch

diff --git a/package/mpv/0003-fix-build-with-have-gl.patch b/package/mpv/0003-fix-build-with-have-gl.patch
new file mode 100644
index 000000000..0934bc895
--- /dev/null
+++ b/package/mpv/0003-fix-build-with-have-gl.patch
@@ -0,0 +1,39 @@
+From 212f6c8206bd4dcc7d8970c5f1632823ae4e783a Mon Sep 17 00:00:00 2001
+From: Michael Forney <mforney@mforney.org>
+Date: Sun, 12 Feb 2017 23:01:21 -0800
+Subject: [PATCH] Fix build with HAVE_GL==0
+
+video/out/opengl/hwdec.h includes video/out/opengl/common.h, which tries
+to include opengl headers.
+
+Downloaded from upstream commit:
+https://github.com/mpv-player/mpv/commit/212f6c8206bd4dcc7d8970c5f1632823ae4e783a
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ options/options.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/options/options.c b/options/options.c
+index b711156..0bb36ad 100644
+--- a/options/options.c
++++ b/options/options.c
+@@ -40,7 +40,6 @@
+ #include "stream/stream.h"
+ #include "video/csputils.h"
+ #include "video/hwdec.h"
+-#include "video/out/opengl/hwdec.h"
+ #include "video/image_writer.h"
+ #include "sub/osd.h"
+ #include "audio/filter/af.h"
+@@ -53,6 +52,10 @@
+ #include "video/out/drm_common.h"
+ #endif
+ 
++#if HAVE_GL
++#include "video/out/opengl/hwdec.h"
++#endif
++
+ extern const char mp_help_text[];
+ 
+ static void print_version(struct mp_log *log)
diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 0e7aab707..e0644a3c5 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8aeefe5970587dfc454d2b89726b603f156bd7a9ae427654eef0d60c68d94998	v0.23.0.tar.gz
+sha256 a41854fa0ac35b9c309ad692aaee67c8d4495c3546f11cb4cdd0a124195d3f15  v0.24.0.tar.gz
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index a21ddeb1d..6191821e2 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.23.0
+MPV_VERSION = 0.24.0
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
-- 
2.11.0
