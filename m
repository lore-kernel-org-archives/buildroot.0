From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Dec 2016 13:17:38 +0100
Subject: [Buildroot] [PATCH 5/6] package/aubio: add fftw optional dependency
In-Reply-To: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
References: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1480767459-17230-5-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/aubio/aubio.mk | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index 7aac6e5..9339f44 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -14,9 +14,7 @@ AUBIO_INSTALL_STAGING = YES
 AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas \
-	--disable-avcodec \
-	--disable-fftw3 \
-	--disable-fftw3f
+	--disable-avcodec
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 AUBIO_DEPENDENCIES += libsndfile
@@ -39,4 +37,16 @@ else
 AUBIO_CONF_OPTS += --disable-jack
 endif
 
+ifeq ($(BR2_PACKAGE_FFTW),y)
+AUBIO_DEPENDENCIES += fftw
+# fftw3 require double otherwise it will look for fftw3f
+ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+AUBIO_CONF_OPTS += --enable-fftw3 --enable-double
+else ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+AUBIO_CONF_OPTS += --enable-fftw3f --disable-double
+endif
+else  # !BR2_PACKAGE_FFTW
+AUBIO_CONF_OPTS += --disable-fftw3
+endif
+
 $(eval $(waf-package))
-- 
2.5.5
