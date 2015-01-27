From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 23:06:18 +0100
Subject: [Buildroot] [git commit] ffmpeg: enable use of freetype and
	fontconfig
Message-ID: <20150127221916.64556805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ff42f101f26bf6fe6035afaa90f808f33398590
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Configure ffmpeg to use freetype and fontconfig
if those packages are selected.

ffmpeg freetype support require fenv.h, which is not available in uClibc or
musl, except for certain archs / depending on specific configuration
options, so only enable it for glibc.

[Peter: only enable on glibc, simplify logic]
Signed-off-by Stephen M. Kenton <skenton@ou.edu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index bc8c220..16f53be 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -49,7 +49,6 @@ FFMPEG_CONF_OPTS = \
 	--disable-libopencv \
 	--disable-libdc1394 \
 	--disable-libfaac \
-	--disable-libfreetype \
 	--disable-libgsm \
 	--disable-libmp3lame \
 	--disable-libnut \
@@ -234,6 +233,22 @@ else
 FFMPEG_CONF_OPTS += --disable-libvpx
 endif
 
+# ffmpeg freetype support require fenv.h which is only
+# available/working on glibc
+ifeq ($(BR2_PACKAGE_FREETYPE)$(BR2_TOOLCHAIN_USES_GLIBC),yy)
+FFMPEG_CONF_OPTS += --enable-libfreetype
+FFMPEG_DEPENDENCIES += freetype
+else
+FFMPEG_CONF_OPTS += --disable-libfreetype
+endif
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+FFMPEG_CONF_OPTS += --enable-fontconfig
+FFMPEG_DEPENDENCIES += fontconfig
+else
+FFMPEG_CONF_OPTS += --disable-fontconfig
+endif
+
 ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
 FFMPEG_CONF_OPTS += --enable-libx264
 FFMPEG_DEPENDENCIES += x264
