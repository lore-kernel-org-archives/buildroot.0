From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:31 +0100
Subject: [Buildroot] [PATCH v2 06/14] aubio: update DEPENDENCIES to
 ffw-single or fftw-double depending on enabled option
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-6-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/aubio/aubio.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b0cc8b899e..69d0815ab5 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -27,7 +27,7 @@ AUBIO_CONF_OPTS += --disable-sndfile
 endif
 
 # Could not compile aubio in double precision mode with libsamplerate
-ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_SINGLE),yy)
 AUBIO_DEPENDENCIES += libsamplerate
 AUBIO_CONF_OPTS += --enable-samplerate
 else
@@ -42,12 +42,13 @@ AUBIO_CONF_OPTS += --disable-jack
 endif
 
 ifeq ($(BR2_PACKAGE_FFTW),y)
-AUBIO_DEPENDENCIES += fftw
 # fftw3 require double otherwise it will look for fftw3f
-ifeq ($(BR2_PACKAGE_FFTW_PRECISION_DOUBLE),y)
+ifeq ($(BR2_PACKAGE_FFTW_DOUBLE),y)
 AUBIO_CONF_OPTS += --enable-fftw3 --enable-double
-else ifeq ($(BR2_PACKAGE_FFTW_PRECISION_SINGLE),y)
+AUBIO_DEPENDENCIES += fftw-double
+else ifeq ($(BR2_PACKAGE_FFTW_SINGLE),y)
 AUBIO_CONF_OPTS += --enable-fftw3f --disable-double
+AUBIO_DEPENDENCIES += fftw-single
 endif
 else  # !BR2_PACKAGE_FFTW
 AUBIO_CONF_OPTS += --disable-fftw3
-- 
2.19.2
