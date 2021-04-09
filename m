From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Apr 2021 22:53:50 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: bump version to 4.4
Message-ID: <20210409203017.27F2781482@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e243ec75f3b6bb473d30116b8112c5540e6b7567
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove wavpack-related patch and configure options due to upstream
removal of wavpack support:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=45070eec4c089b06947f07e25cdb1bc8b2102553

Changelog:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=Changelog;;hb=refs/heads/release/4.4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pi_h264-skip-decode-if-pic-has-no-slices.patch} |  0
 ...se-require_pkg_config-to-check-for-wavpac.patch | 31 ----------------------
 package/ffmpeg/ffmpeg.hash                         |  2 +-
 package/ffmpeg/ffmpeg.mk                           |  9 +------
 4 files changed, 2 insertions(+), 40 deletions(-)

diff --git a/package/ffmpeg/0003-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch b/package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
similarity index 100%
rename from package/ffmpeg/0003-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
rename to package/ffmpeg/0002-avcodec-vaapi_h264-skip-decode-if-pic-has-no-slices.patch
diff --git a/package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch b/package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch
deleted file mode 100644
index 49c3ccee9b..0000000000
--- a/package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a507a9cd6525d5b3a1eea32e25a139b4023800a2 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 20 Sep 2020 13:48:00 +0200
-Subject: [PATCH] configure: use require_pkg_config to check for wavpack
-
-Fixes static builds with toolchains needing "-lm" for math functions.
-
-Patch sent upstream:
-http://ffmpeg.org/pipermail/ffmpeg-devel/2020-September/270127.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index 5d68695192..4e6c6edd30 100755
---- a/configure
-+++ b/configure
-@@ -6438,7 +6438,7 @@ enabled libvpx            && {
-     fi
- }
- 
--enabled libwavpack        && require libwavpack wavpack/wavpack.h WavpackOpenFileOutput  -lwavpack
-+enabled libwavpack        && require_pkg_config libwavpack wavpack "wavpack/wavpack.h" WavpackOpenFileOutput
- enabled libwebp           && {
-     enabled libwebp_encoder      && require_pkg_config libwebp "libwebp >= 0.2.0" webp/encode.h WebPGetEncoderVersion
-     enabled libwebp_anim_encoder && check_pkg_config libwebp_anim_encoder "libwebpmux >= 0.4.0" webp/mux.h WebPAnimEncoderOptionsInit; }
--- 
-2.27.0
-
diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 81dc0d3e6b..d841afd625 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb  ffmpeg-4.3.2.tar.xz
+sha256  06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909  ffmpeg-4.4.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 9b79dff48e..8ff8ea8c6c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FFMPEG_VERSION = 4.3.2
+FFMPEG_VERSION = 4.4
 FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.xz
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
@@ -368,13 +368,6 @@ else
 FFMPEG_CONF_OPTS += --disable-libtheora
 endif
 
-ifeq ($(BR2_PACKAGE_WAVPACK),y)
-FFMPEG_CONF_OPTS += --enable-libwavpack
-FFMPEG_DEPENDENCIES += wavpack
-else
-FFMPEG_CONF_OPTS += --disable-libwavpack
-endif
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 FFMPEG_CONF_OPTS += --enable-iconv
 FFMPEG_DEPENDENCIES += libiconv
