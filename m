From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 11 Sep 2018 22:42:30 +0200
Subject: [Buildroot] [PATCH] ffmpeg: fix static linking build failure when
 using libavutil
Message-ID: <20180911204230.15890-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When static linking programs using ffmpeg libraries, if linking against
libavutil, -ldrm is listed before -lavutil. This leads to linking failure
due to undefined reference of drmGetVersion() and drmFreeVersion().
This is why when pkg-config generates libavutil.pc doesn't append -ldrm
after -lavutil.
Subsequentely if a package uses pkg-config and ffmpeg it will load
library dependencies from libavutil.pc without placing -ldrm at the tail.
Without this fix the only way is to workaround the problem directly in
the single package, like this:
https://github.com/buildroot/buildroot/commit/daf7dd87f4d93923df5e757fd43b3ad214a4a2ae

Add patch to assure -ldrm comes after -lavutil when static linking.

Fixes:
http://autobuild.buildroot.net/results/515/5152dcca58944cf732d09fba6e6c9af8a9243c75//
http://autobuild.buildroot.net/results/395/395be1a9cab824b82ef34c2ebd84d54243029b33//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...igure-add-LIBDRM-to-extralibs_avutil.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/ffmpeg/0002-configure-add-LIBDRM-to-extralibs_avutil.patch

diff --git a/package/ffmpeg/0002-configure-add-LIBDRM-to-extralibs_avutil.patch b/package/ffmpeg/0002-configure-add-LIBDRM-to-extralibs_avutil.patch
new file mode 100644
index 0000000000..ae1f3423ae
--- /dev/null
+++ b/package/ffmpeg/0002-configure-add-LIBDRM-to-extralibs_avutil.patch
@@ -0,0 +1,44 @@
+From f4c9a7f55229d5275edb89c29ac9b18a737faf65 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Tue, 11 Sep 2018 19:22:27 +0200
+Subject: [PATCH] configure: add LIBDRM to extralibs_avutil
+
+When static linking programs using ffmpeg libraries, if linking against
+libavutil, -ldrm is listed before -lavutil. This leads to linking failure
+due to undefined reference of drmGetVersion() and drmFreeVersion().
+This is why when pkg-config create libavutil.pc doesn't append -ldrm
+after -lavutil.
+
+Add -ldrm to LIBDRM in case libdrm is enabled and add $LIBDRM to
+extralibs_avutil.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index 7377046d0a..7599fcc2bd 100755
+--- a/configure
++++ b/configure
+@@ -5919,7 +5919,7 @@ enabled libcelt           && require libcelt celt/celt.h celt_decode -lcelt0 &&
+                                die "ERROR: libcelt must be installed and version must be >= 0.11.0."; }
+ enabled libcaca           && require_pkg_config libcaca caca caca.h caca_create_canvas
+ enabled libdc1394         && require_pkg_config libdc1394 libdc1394-2 dc1394/dc1394.h dc1394_new
+-enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion
++enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion && LIBDRM="-ldrm"
+ enabled libfdk_aac        && { use_pkg_config libfdk_aac fdk-aac "fdk-aac/aacenc_lib.h" aacEncOpen ||
+                                { require libfdk_aac fdk-aac/aacenc_lib.h aacEncOpen -lfdk-aac &&
+                                  warn "using libfdk without pkg-config"; } }
+@@ -7096,7 +7096,7 @@ source_path=${source_path}
+ LIBPREF=${LIBPREF}
+ LIBSUF=${LIBSUF}
+ 
+-extralibs_avutil="$LIBRT $LIBM"
++extralibs_avutil="$LIBDRM $LIBRT $LIBM"
+ extralibs_avcodec="$extralibs"
+ extralibs_avformat="$extralibs"
+ extralibs_avdevice="$extralibs"
+-- 
+2.17.1
+
-- 
2.17.1
