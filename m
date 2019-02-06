From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/aubio: use the new fftw-double and
 fftw-single packages
Message-ID: <20190206091325.5C7AD81387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2519d99345be4f9aee92c8e1645548f76ae0f66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Thomas: drop the condition on BR2_PACKAGE_FFTW]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
