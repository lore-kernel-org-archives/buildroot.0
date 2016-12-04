From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:22:13 +0100
Subject: [Buildroot] [git commit] package/aubio: add ffmpeg libav optional
	dependency
Message-ID: <20161204152218.3581581D38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d5bc8b0a711cb80ba5d9a8dd45c15f646932f84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Aubio libav support require libavcodec, libavformat, libavutil and
libavresample. Enable libav support only when
BR2_PACKAGE_FFMPEG_AVRESAMPLE is set.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aubio/aubio.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index 9339f44..cfa233f 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -13,8 +13,7 @@ AUBIO_INSTALL_STAGING = YES
 
 AUBIO_CONF_OPTS = \
 	--disable-docs \
-	--disable-atlas \
-	--disable-avcodec
+	--disable-atlas
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 AUBIO_DEPENDENCIES += libsndfile
@@ -49,4 +48,11 @@ else  # !BR2_PACKAGE_FFTW
 AUBIO_CONF_OPTS += --disable-fftw3
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
+AUBIO_DEPENDENCIES += ffmpeg
+AUBIO_CONF_OPTS += --enable-avcodec
+else
+AUBIO_CONF_OPTS += --disable-avcodec
+endif
+
 $(eval $(waf-package))
