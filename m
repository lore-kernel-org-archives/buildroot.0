From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:18:15 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version,
	add optional dependencies to opus & x265
Message-ID: <20170919201318.A95B081076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e0633439e9977ccb1b2c30457ab803ae5d52529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump
https://github.com/tvheadend/tvheadend/compare/54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732...303f418e1ac2bb3078f7a974b69f04ab6a56c636
updated the transcoding support already present:
https://github.com/tvheadend/tvheadend/commit/014bb9505e1d7eb6e37e10931dd89ab3b1a0dc01

To avoid these build errors

src/transcoding/codec/codecs/libs/libx26x.c:105:18: fatal error: x264.h: No such file or directory
 #include <x264.h>

src/transcoding/codec/codecs/libs/libx26x.c:213:18: fatal error: x265.h: No such file or directory
 #include <x265.h>

src/transcoding/codec/codecs/libs/libopus.c:23:31: fatal error: opus/opus_defines.h: No such file or directory
 #include <opus/opus_defines.h>

we need to add dependency handling already with this patch and keep the
hard dependency x264 as minimum codec for transcoding but we now need
to enable BR2_PACKAGE_FFMPEG_GPL to enable x264-support also in ffmpeg.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tvheadend/Config.in      |  1 +
 package/tvheadend/tvheadend.hash |  2 +-
 package/tvheadend/tvheadend.mk   | 24 ++++++++++++++++++++----
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 191593e..56a3b38 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -31,6 +31,7 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_LIBVPX if !BR2_bfin # libvpx
 	select BR2_PACKAGE_X264
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 3154b32..a33b0a5 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 1994e379c798b118243e70f7fa38064a9b288d6e38b9ced0e8ad465f5d2e8fd9  tvheadend-54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732.tar.gz
+sha256 00f67fbf9d8cfea7da90f469b36a8205fb9a38727c4cc5022f4ee5fd322459d3  tvheadend-303f418e1ac2bb3078f7a974b69f04ab6a56c636.tar.gz
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b1c1fca..4722cb0 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 54e63e3f9af8fdc0d23f61f3cda7fa7b246c1732
+TVHEADEND_VERSION = 303f418e1ac2bb3078f7a974b69f04ab6a56c636
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -27,10 +27,26 @@ TVHEADEND_CONF_OPTS += --disable-dbus-1
 endif
 
 ifeq ($(BR2_PACKAGE_TVHEADEND_TRANSCODING),y)
-TVHEADEND_DEPENDENCIES += ffmpeg
-TVHEADEND_CONF_OPTS += --enable-libav
+TVHEADEND_CONF_OPTS += --enable-libav --enable-libx264
+TVHEADEND_DEPENDENCIES += ffmpeg x264
+ifeq ($(BR2_PACKAGE_OPUS),y)
+TVHEADEND_CONF_OPTS += --enable-libopus
+TVHEADEND_DEPENDENCIES += opus
 else
-TVHEADEND_CONF_OPTS += --disable-libav
+TVHEADEND_CONF_OPTS += --disable-libopus
+endif
+ifeq ($(BR2_PACKAGE_X265),y)
+TVHEADEND_CONF_OPTS += --enable-libx265
+TVHEADEND_DEPENDENCIES += x265
+else
+TVHEADEND_CONF_OPTS += --disable-libx265
+endif
+else
+TVHEADEND_CONF_OPTS += \
+	--disable-libav \
+	--disable-libopus \
+	--disable-libx264 \
+	--disable-libx265
 endif
 
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
