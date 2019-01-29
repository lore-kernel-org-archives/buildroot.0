From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Jan 2019 10:00:45 +0100
Subject: [Buildroot] [git commit] Revert "ffmpeg: fix static linking build
 failure when using libavutil"
Message-ID: <20190129090013.19E07814B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc9fd5a8780966970525b4da8313091a0f0bbc80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 483db9908985d023b858c0b59d4016f9abb4b6f9.

It was a test commit that was not supposed to be pushed. The patch
doesn't apply to ffmpeg 3.4.5.

Fixes:
  http://autobuild.buildroot.net/results/f3e/f3eaaff9e55ca7c75fe7094547dc2394b1288849

and many more.
---
 ...0002-configure-add-LIBDRM-to-Libs.private.patch | 68 ----------------------
 1 file changed, 68 deletions(-)

diff --git a/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private.patch b/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private.patch
deleted file mode 100644
index 5493473d0f..0000000000
--- a/package/ffmpeg/0002-configure-add-LIBDRM-to-Libs.private.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From e1e11d404eec24c158ae1241d6573c263e57a7b9 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Wed, 17 Oct 2018 13:13:10 +0200
-Subject: [PATCH] configure: add LIBDRM to Libs.private
-
-When static linking programs using ffmpeg libraries, if linking against
-libavutil, -ldrm is listed before -lavutil. This leads to linking
-failure due to undefined reference of drmGetVersion() and
-drmFreeVersion().
-This is why when pkg-config create libavutil.pc doesn't append -ldrm
-to Libs.private:.
-
-- Create LIBDRM=-ldrm in case libdrm is enabled.
-- Add privatelibs_avutil variable for explicit private libraries to be
-  appended to Libs.private:
-- Add $LIBDRM to privatelibs_avutil.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- configure                     | 3 ++-
- ffbuild/pkgconfig_generate.sh | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 7377046d0a..0996d8a85d 100755
---- a/configure
-+++ b/configure
-@@ -5919,7 +5919,7 @@ enabled libcelt           && require libcelt celt/celt.h celt_decode -lcelt0 &&
-                                die "ERROR: libcelt must be installed and version must be >= 0.11.0."; }
- enabled libcaca           && require_pkg_config libcaca caca caca.h caca_create_canvas
- enabled libdc1394         && require_pkg_config libdc1394 libdc1394-2 dc1394/dc1394.h dc1394_new
--enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion
-+enabled libdrm            && require_pkg_config libdrm libdrm xf86drm.h drmGetVersion && LIBDRM="-ldrm"
- enabled libfdk_aac        && { use_pkg_config libfdk_aac fdk-aac "fdk-aac/aacenc_lib.h" aacEncOpen ||
-                                { require libfdk_aac fdk-aac/aacenc_lib.h aacEncOpen -lfdk-aac &&
-                                  warn "using libfdk without pkg-config"; } }
-@@ -7097,6 +7097,7 @@ LIBPREF=${LIBPREF}
- LIBSUF=${LIBSUF}
- 
- extralibs_avutil="$LIBRT $LIBM"
-+privatelibs_avutil="$LIBDRM"
- extralibs_avcodec="$extralibs"
- extralibs_avformat="$extralibs"
- extralibs_avdevice="$extralibs"
-diff --git a/ffbuild/pkgconfig_generate.sh b/ffbuild/pkgconfig_generate.sh
-index e5de6716d2..b86486a107 100755
---- a/ffbuild/pkgconfig_generate.sh
-+++ b/ffbuild/pkgconfig_generate.sh
-@@ -13,6 +13,7 @@ name=lib${shortname}
- fullname=${name}${build_suffix}
- comment=$2
- libs=$(eval echo \$extralibs_${shortname})
-+privatelibs=$(eval echo \$privatelibs_${shortname})
- deps=$(eval echo \$${shortname}_deps)
- 
- for dep in $deps; do
-@@ -39,7 +40,7 @@ Requires: $($shared || echo $requires)
- Requires.private: $($shared && echo $requires)
- Conflicts:
- Libs: -L\${libdir} $rpath -l${fullname#lib} $($shared || echo $libs)
--Libs.private: $($shared && echo $libs)
-+Libs.private: $($shared && echo $libs) ${privatelibs}
- Cflags: -I\${includedir}
- EOF
- 
--- 
-2.17.1
-
