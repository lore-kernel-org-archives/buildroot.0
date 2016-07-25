From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Jul 2016 22:19:52 +0200
Subject: [Buildroot] [PATCH v1] qt5imageformats: fix AArch64 compile
Message-ID: <1469477992-27484-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix libwebp.pri arm64/neon detection.

Fixes [1], [2], [3] and bug reported by Uwe Hermann [4]:

  .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/dec.o: In function `VP8DspInit':
  dec.c:(.text+0x2b28): undefined reference to `VP8DspInitNEON'
  .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/enc.o: In function `VP8EncDspInit':
  enc.c:(.text+0x1970): undefined reference to `VP8EncDspInitNEON'
  ../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/lossless.o: In function `VP8LDspInit':
  lossless.c:(.text+0x2b18): undefined reference to `VP8LDspInitNEON'
  .../build/qt5imageformats-5.6.1-1/src/3rdparty/libwebp/src/dsp/upsampling.o: In function `WebPInitUpsamplers':
  upsampling.c:(.text+0x41e0): undefined reference to `WebPInitUpsamplersNEON'

[1] http://autobuild.buildroot.net/results/0e5/0e577a70bb88e2ba685ccde28576a6857c99876c
[2] http://autobuild.buildroot.net/results/c85/c85f0445151171548cf7c39999ef00d1638871e0
[3] http://autobuild.buildroot.net/results/ae7/ae74f93f09e61151553a54b9d3a6b19946e42938
[4] https://bugs.busybox.net/show_bug.cgi?id=8986

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...arty-libwebp.pri-fix-arm64-neon-detection.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/qt5/qt5imageformats/0001-3rdparty-libwebp.pri-fix-arm64-neon-detection.patch

diff --git a/package/qt5/qt5imageformats/0001-3rdparty-libwebp.pri-fix-arm64-neon-detection.patch b/package/qt5/qt5imageformats/0001-3rdparty-libwebp.pri-fix-arm64-neon-detection.patch
new file mode 100644
index 0000000..80ef7fb
--- /dev/null
+++ b/package/qt5/qt5imageformats/0001-3rdparty-libwebp.pri-fix-arm64-neon-detection.patch
@@ -0,0 +1,26 @@
+From 692d238f38f5fbd3c5983584b503f4299bc08da9 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 25 Jul 2016 22:05:01 +0200
+Subject: [PATCH] 3rdparty/libwebp.pri: fix arm64 neon detection
+
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
-- 
2.8.1
