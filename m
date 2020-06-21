From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 09:32:48 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 4.3
Message-ID: <20200621074233.E92148263E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6312941d66886bea75ad9915bf406cf9472c04d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to fix build without ssse3.

Update the license hash due to various changes since August 2019 [0]:

  - some files were relicensed from GPL-2.0+ to LGPL-2.1+; no impact on
    the licensing information;

  - clarification about the licensing when linked with external
    libraries, which now requires passing --enable-version3; Buildroot
    is not concerned, because it passes --disable-version3;

  - various clarification about applicable licensing terms.

[0] http://git.videolan.org/?p=ffmpeg.git;a=history;f=LICENSE.md;h=613070e1b631a919a74c862f2a75a0f249a631ff;hb=8e12af29d1a3f95c9e952d78354e3c8b1c0431a8

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr:
  - fix the SoB order in the patch
  - clarify the impact of the licensing changes
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...scale-x86-yuv2rgb-Fix-build-without-SSSE3.patch | 43 ++++++++++++++++++++++
 package/ffmpeg/ffmpeg.hash                         |  4 +-
 package/ffmpeg/ffmpeg.mk                           |  2 +-
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
new file mode 100644
index 0000000000..951ce4186d
--- /dev/null
+++ b/package/ffmpeg/0001-swscale-x86-yuv2rgb-Fix-build-without-SSSE3.patch
@@ -0,0 +1,43 @@
+From bf8eae2d30a205bb76ac625e04c0351106981b9e Mon Sep 17 00:00:00 2001
+From: Parker Ernest <@>
+Date: Sun, 23 Feb 2020 13:22:42 +0100
+Subject: [PATCH] swscale/x86/yuv2rgb: Fix build without SSSE3
+
+commit fc6a5883d6af8cae0e96af84dda0ad74b360a084 breaks build on
+x86_64 CPUs which do not have SSSE3, e.g. AMD Phenom-II
+
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+[bernd.kuhls at t-online.de:
+  - retrieved from upstream patchwork:
+    https://patchwork.ffmpeg.org/project/ffmpeg/patch/20200223122256.23402-1-michael at niedermayer.cc/
+]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[yann.morin.1998 at free.fr: fix reference top patchwork and SoB order]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ libswscale/x86/yuv2rgb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libswscale/x86/yuv2rgb.c b/libswscale/x86/yuv2rgb.c
+index c12e88cbb5..4791e5b93a 100644
+--- a/libswscale/x86/yuv2rgb.c
++++ b/libswscale/x86/yuv2rgb.c
+@@ -83,6 +83,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+ #if HAVE_X86ASM
+     int cpu_flags = av_get_cpu_flags();
+ 
++#if HAVE_SSSE3
+     if (EXTERNAL_SSSE3(cpu_flags)) {
+         switch (c->dstFormat) {
+         case AV_PIX_FMT_RGB32:
+@@ -111,6 +112,7 @@ av_cold SwsFunc ff_yuv2rgb_init_x86(SwsContext *c)
+             return yuv420_rgb15_ssse3;
+         }
+     }
++#endif
+ 
+     if (EXTERNAL_MMXEXT(cpu_flags)) {
+         switch (c->dstFormat) {
+-- 
+2.26.2
+
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 35bd681326..1572285cd6 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31  ffmpeg-4.2.3.tar.xz
+sha256  1d0ad06484f44bcb97eba5e93c40bcb893890f9f64aeb43e46cd9bb4cbd6795d  ffmpeg-4.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
-sha256  cad1218c22121b169fb1380178ab7a0b33cb38a3ff6d3915b8533d1d954f3ce7  LICENSE.md
+sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 736aa5b4ba..aeebc0effc 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.2.3
+FFMPEG_VERSION = 4.3
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
