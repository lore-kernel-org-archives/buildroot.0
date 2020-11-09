From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Nov 2020 22:38:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 dvbsubenc needs gcc 4.9
Message-ID: <20201109213856.610071-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

dvbsubenc fails to build with gcc 4.8 due to restrict keyword and for
loop declarations:

../gst/dvbsubenc/libimagequant/blur.c:10:46: error: expected ';', ',' or ')' before 'src'
 transposing_1d_blur (unsigned char *restrict src, unsigned char *restrict dst,
                                              ^
../gst/dvbsubenc/libimagequant/blur.c: In function 'liq_min3':
../gst/dvbsubenc/libimagequant/blur.c:101:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (unsigned int i = 0; i < width - 1; i++) {
     ^

Fixes:
 - http://autobuild.buildroot.org/results/183e876d63340b5c204f47a4653cbfebb0523277

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 191820df1d..87a047b779 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -89,9 +89,13 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBENC
 	bool "dvbsubenc"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  DVB subpicture encoding support
 
+comment "dvbsubenc plugin needs a toolchain w/ gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
 	bool "dvbsuboverlay"
 	help
-- 
2.28.0
