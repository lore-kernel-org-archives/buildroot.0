From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 18 Jan 2019 21:10:43 +0100
Subject: [Buildroot] [PATCH 4/6] ffmpeg: bump to version 4.1. ffserver is
 not supported anymore.
In-Reply-To: <20190118201045.13947-1-lpdev@cordier.org>
References: <20190118201045.13947-1-lpdev@cordier.org>
Message-ID: <20190118201045.13947-5-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/ffmpeg/0001-ffmpeg-pthreads.patch | 34 -----------------------
 package/ffmpeg/Config.in                  |  6 ----
 package/ffmpeg/ffmpeg.hash                |  2 +-
 package/ffmpeg/ffmpeg.mk                  |  8 +-----
 4 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 package/ffmpeg/0001-ffmpeg-pthreads.patch

diff --git a/package/ffmpeg/0001-ffmpeg-pthreads.patch b/package/ffmpeg/0001-ffmpeg-pthreads.patch
deleted file mode 100644
index c6d75d2297..0000000000
--- a/package/ffmpeg/0001-ffmpeg-pthreads.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From patchwork Wed Oct 25 13:32:36 2017
-Content-Type: text/plain; charset="utf-8"
-MIME-Version: 1.0
-Content-Transfer-Encoding: 7bit
-Subject: [FFmpeg-devel] configure: v4l2_m2m depends on pthreads
-From: Mark Thompson <sw@jkqxz.net>
-X-Patchwork-Id: 5688
-Message-Id: <27e5b360-1210-d550-c8de-a761f8e9f326@jkqxz.net>
-To: FFmpeg development discussions and patches <ffmpeg-devel@ffmpeg.org>
-Date: Wed, 25 Oct 2017 14:32:36 +0100
-
-Fixes build with --disable-pthreads.
-
-Downloaded from upstream patchworks:
-https://patchwork.ffmpeg.org/patch/5688/
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index c86e578..76523c8 100755
---- a/configure
-+++ b/configure
-@@ -2780,7 +2780,7 @@ omx_rpi_select="omx"
- qsvdec_select="qsv"
- qsvenc_select="qsv"
- vaapi_encode_deps="vaapi"
--v4l2_m2m_deps_any="linux_videodev2_h"
-+v4l2_m2m_deps="linux_videodev2_h pthreads"
- 
- hwupload_cuda_filter_deps="cuda"
- scale_npp_filter_deps="cuda libnpp"
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 2d94c5712a..eec7ce0f6b 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -63,12 +63,6 @@ config BR2_PACKAGE_FFMPEG_FFPLAY
 comment "ffplay needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_FFMPEG_FFSERVER
-	bool "Build ffserver"
-	depends on BR2_USE_MMU # fork()
-	help
-	  FFserver is a streaming server for both audio and video.
-
 config BR2_PACKAGE_FFMPEG_FFPROBE
 	bool "Build ffprobe"
 	help
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index e00c4ec56c..c21561698f 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 741cbd6394eaed370774ca4cc089eaafbc54d0824b9aa360d4b3b0cbcbc4a92c  ffmpeg-3.4.5.tar.xz
+sha256 a38ec4d026efb58506a99ad5cd23d5a9793b4bf415f2c4c2e9c1bb444acd1994  ffmpeg-4.1.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256 b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256 73d99bc83313fff665b426d6672b4e0479102bc402fe22314ac9ce94a38aa5ff  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b86d465df8..c42fa54cd1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 3.4.5
+FFMPEG_VERSION = 4.1
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -84,12 +84,6 @@ else
 FFMPEG_CONF_OPTS += --disable-ffplay
 endif
 
-ifeq ($(BR2_PACKAGE_FFMPEG_FFSERVER),y)
-FFMPEG_CONF_OPTS += --enable-ffserver
-else
-FFMPEG_CONF_OPTS += --disable-ffserver
-endif
-
 ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
 FFMPEG_CONF_OPTS += --enable-avresample
 else
-- 
2.20.1
