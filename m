From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 09:46:00 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad:
 explicitly enable C99 for dvbsubenc/gcc 4.8
Message-ID: <20201110084133.DA34382167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f01db4f73b9a7f1250ffc6d6a5aa9f318b83b4c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dvbsubenc fails to build with gcc 4.8 due to restrict keyword and for
loop declarations:

../gst/dvbsubenc/libimagequant/blur.c:10:46: error: expected ';', ',' or ')' before 'src'
 transposing_1d_blur (unsigned char *restrict src, unsigned char *restrict dst,
                                              ^
../gst/dvbsubenc/libimagequant/blur.c: In function 'liq_min3':
../gst/dvbsubenc/libimagequant/blur.c:101:5: error: 'for' loop initial declarations are only allowed in C99 mode
     for (unsigned int i = 0; i < width - 1; i++) {
     ^
../gst/dvbsubenc/libimagequant/blur.c:101:5: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/183e876d63340b5c204f47a4653cbfebb0523277

Both of which are C99 features, so explicitly enable C99 support to fix
that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 78a3785449..86aa345b00 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -13,6 +13,7 @@ GST1_PLUGINS_BAD_INSTALL_STAGING = YES
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING
 GST1_PLUGINS_BAD_LICENSE = LGPL-2.0+
 
+GST1_PLUGINS_BAD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 GST1_PLUGINS_BAD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_BAD_CONF_OPTS = \
