From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:48:34 +0200
Subject: [Buildroot] [git commit] ffmpeg: consolidate duplicated config
	options
Message-ID: <20140921205101.1EE199D739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=255aab75fc596d58c6f5f15870dd498d09978fc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 62ab07ef769bd6504fe1db144aaac3fd45db9dad added a bunch
of hard-coded options.  Some of these options are then again
added (or negated) based on kconfig settings.  This patch removes
the hard coded swscale and postproc settings, as they are enabled
or disabled later.  It also moves the --disable-pic lower
as an else clause to the part that adds --enable-pic.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d6851e1..6339cca 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -22,15 +22,12 @@ FFMPEG_CONF_OPT = \
 	--disable-debug \
 	--disable-version3 \
 	--enable-logging \
-	--disable-pic \
 	--enable-optimizations \
 	--disable-extra-warnings \
 	--disable-ffprobe \
 	--enable-avdevice \
 	--enable-avcodec \
 	--enable-avformat \
-	--enable-swscale \
-	--enable-postproc \
 	--disable-x11grab \
 	--enable-network \
 	--disable-gray \
@@ -311,6 +308,8 @@ endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 FFMPEG_CONF_OPT += --enable-pic
+else
+FFMPEG_CONF_OPT += --disable-pic
 endif
 
 FFMPEG_CONF_OPT += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
