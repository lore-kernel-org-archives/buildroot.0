From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Sep 2020 13:58:16 +0200
Subject: [Buildroot] [PATCH 3/3] package/ffmpeg: fix static build with
 wavpack support enabled
In-Reply-To: <20200920115816.1567616-1-bernd.kuhls@t-online.de>
References: <20200920115816.1567616-1-bernd.kuhls@t-online.de>
Message-ID: <20200920115816.1567616-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d2d/d2d73f3c7075ca6e9782b9bb591dae40ab56b6a2/

Please note that the wavpack error only occurs after fixing fontconfig.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...quire_pkg_config-to-check-for-wavpac.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch

diff --git a/package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch b/package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch
new file mode 100644
index 0000000000..49c3ccee9b
--- /dev/null
+++ b/package/ffmpeg/0002-configure-use-require_pkg_config-to-check-for-wavpac.patch
@@ -0,0 +1,31 @@
+From a507a9cd6525d5b3a1eea32e25a139b4023800a2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 20 Sep 2020 13:48:00 +0200
+Subject: [PATCH] configure: use require_pkg_config to check for wavpack
+
+Fixes static builds with toolchains needing "-lm" for math functions.
+
+Patch sent upstream:
+http://ffmpeg.org/pipermail/ffmpeg-devel/2020-September/270127.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 5d68695192..4e6c6edd30 100755
+--- a/configure
++++ b/configure
+@@ -6438,7 +6438,7 @@ enabled libvpx            && {
+     fi
+ }
+ 
+-enabled libwavpack        && require libwavpack wavpack/wavpack.h WavpackOpenFileOutput  -lwavpack
++enabled libwavpack        && require_pkg_config libwavpack wavpack "wavpack/wavpack.h" WavpackOpenFileOutput
+ enabled libwebp           && {
+     enabled libwebp_encoder      && require_pkg_config libwebp "libwebp >= 0.2.0" webp/encode.h WebPGetEncoderVersion
+     enabled libwebp_anim_encoder && check_pkg_config libwebp_anim_encoder "libwebpmux >= 0.4.0" webp/mux.h WebPAnimEncoderOptionsInit; }
+-- 
+2.27.0
+
-- 
2.27.0
