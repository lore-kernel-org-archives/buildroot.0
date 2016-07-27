From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 15:05:46 +0200
Subject: [Buildroot] [git commit] qt5imageformats: fix AArch64 compile
Message-ID: <20160727130658.364B87FEF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c18d403a8df7a3dbe3aaffeb20f214ecd4d0bc3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix libwebp.pri arm64/neon detection using upstream patch [1].

Fixes bug reported by Uwe Hermann [2] and [3], [4], [5]:

  .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/dec.o: In function `VP8DspInit':
  dec.c:(.text+0x2b28): undefined reference to `VP8DspInitNEON'
  .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/enc.o: In function `VP8EncDspInit':
  enc.c:(.text+0x1970): undefined reference to `VP8EncDspInitNEON'
  ../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/lossless.o: In function `VP8LDspInit':
  lossless.c:(.text+0x2b18): undefined reference to `VP8LDspInitNEON'
  .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/upsampling.o: In function `WebPInitUpsamplers':
  upsampling.c:(.text+0x41e0): undefined reference to `WebPInitUpsamplersNEON'

[1] https://code.qt.io/cgit/qt/qtimageformats.git/patch/?id=e4c1d9ece74de212ebe5c55b134de7cb23469e2d
[2] https://bugs.busybox.net/show_bug.cgi?id=8986
[3] http://autobuild.buildroot.net/results/0e5/0e577a70bb88e2ba685ccde28576a6857c99876c
[4] http://autobuild.buildroot.net/results/c85/c85f0445151171548cf7c39999ef00d1638871e0
[5] http://autobuild.buildroot.net/results/ae7/ae74f93f09e61151553a54b9d3a6b19946e42938

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../qt5/qt5imageformats/0001-tvOS-support.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/qt5/qt5imageformats/0001-tvOS-support.patch b/package/qt5/qt5imageformats/0001-tvOS-support.patch
new file mode 100644
index 0000000..3759c10
--- /dev/null
+++ b/package/qt5/qt5imageformats/0001-tvOS-support.patch
@@ -0,0 +1,35 @@
+From a9e4b41a04b8d1a6d3d687964c146b87f60f9683 Mon Sep 17 00:00:00 2001
+From: Mike Krus <mike.krus@kdab.com>
+Date: Mon, 28 Dec 2015 21:02:35 +0000
+Subject: [PATCH] tvOS support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+QT_ARCH for tvOS is arm64 (not arm, since it???s 64bits only)
+
+Change-Id: Ia03d3ee07d2543a0e70ee7d77448aff9382d8fc8
+Reviewed-by: Jake Petroules <jake.petroules@theqtcompany.com>
+
+Upstream: https://code.qt.io/cgit/qt/qtimageformats.git/patch/?id=e4c1d9ece74de212ebe5c55b134de7cb23469e2d
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/3rdparty/libwebp.pri | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/libwebp.pri b/src/3rdparty/libwebp.pri
+index b7c1bb6..2197953 100644
+--- a/src/3rdparty/libwebp.pri
++++ b/src/3rdparty/libwebp.pri
+@@ -82,7 +82,7 @@ android {
+     INCLUDEPATH += $$NDK_ROOT/sources/android/cpufeatures
+ }
+ 
+-equals(QT_ARCH, arm) {
++equals(QT_ARCH, arm)|equals(QT_ARCH, arm64) {
+     SOURCES_FOR_NEON += \
+         $$PWD/libwebp/src/dsp/dec_neon.c \
+         $$PWD/libwebp/src/dsp/enc_neon.c \
+-- 
+2.8.1
+
