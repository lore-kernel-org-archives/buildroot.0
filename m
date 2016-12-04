From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:22:12 +0100
Subject: [Buildroot] [git commit] package/aubio: add fftw optional dependency
Message-ID: <20161204152218.333B9817E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5812e3989336fb8fbfb114096e36da43730ccfcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
