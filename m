From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 21 Jan 2019 14:51:01 +0100
Subject: [Buildroot] [PATCH v4 07/17] package/aubio: use the new fftw-double
 and fftw-single packages
In-Reply-To: <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
References: <1548078671-63318-1-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-2-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-3-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-4-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-5-git-send-email-gwenj@trabucayre.com>
 <1548078671-63318-6-git-send-email-gwenj@trabucayre.com>
Message-ID: <1548078671-63318-7-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Thomas: drop the condition on BR2_PACKAGE_FFTW]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v3 -> v4:
 * allows to build samplerate without fft support and ensure samplerate and
   double precision are not enabled in same time. (yann)
---
 package/aubio/aubio.mk | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b0cc8b899e..ba182d9bd7 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -27,7 +27,7 @@ AUBIO_CONF_OPTS += --disable-sndfile
 endif
 
 # Could not compile aubio in double precision mode with libsamplerate
-ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE):$(BR2_PACKAGE_FFTW_DOUBLE),y:)
 AUBIO_DEPENDENCIES += libsamplerate
 AUBIO_CONF_OPTS += --enable-samplerate
 else
@@ -41,15 +41,14 @@ else
 AUBIO_CONF_OPTS += --disable-jack
 endif
 
-ifeq ($(BR2_PACKAGE_FFTW),y)
-AUBIO_DEPENDENCIES += fftw
 # fftw3 require double otherwise it will look for fftw3f
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
 AUBIO_CONF_OPTS += --enable-fftw3 --enable-double
-else ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+AUBIO_DEPENDENCIES += fftw-double
+else ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
 AUBIO_CONF_OPTS += --enable-fftw3f --disable-double
-endif
-else  # !BR2_PACKAGE_FFTW
+AUBIO_DEPENDENCIES += fftw-single
+else
 AUBIO_CONF_OPTS += --disable-fftw3
 endif
 
-- 
2.19.2
