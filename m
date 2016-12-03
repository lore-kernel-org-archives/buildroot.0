From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Dec 2016 13:17:39 +0100
Subject: [Buildroot] [PATCH 6/6] package/aubio: add ffmpeg libav optional
	dependency
In-Reply-To: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
References: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480767459-17230-6-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Aubio libav support require libavcodec, libavformat, libavutil and
libavresample. Enable libav support only when
BR2_PACKAGE_FFMPEG_AVRESAMPLE is set.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.5.5
