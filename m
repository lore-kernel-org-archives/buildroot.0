From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/gnuradio: use the new fftw-single
 package
Message-ID: <20190206091325.62FE781387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=294d17d9bfb7a69d246a15796a131d02fe9c2088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to the new fftw package organization, we can use a "select"
instead of "depends on".

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in   | 8 ++------
 package/gnuradio/gnuradio.mk | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 56957d59e4..533a49c81e 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -78,11 +78,6 @@ config BR2_PACKAGE_GNURADIO_ZEROMQ
 	help
 	  zeromq communication support
 
-comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
-	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
-
-if BR2_PACKAGE_FFTW_PRECISION_SINGLE
-
 config BR2_PACKAGE_GNURADIO_ANALOG
 	bool "gr-analog support"
 	select BR2_PACKAGE_GNURADIO_FILTER
@@ -103,6 +98,8 @@ config BR2_PACKAGE_GNURADIO_DIGITAL
 
 config BR2_PACKAGE_GNURADIO_FFT
 	bool "gr-fft support"
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_SINGLE
 	select BR2_PACKAGE_GNURADIO_BLOCKS
 	help
 	  FFT signal processing blocks
@@ -136,4 +133,3 @@ config BR2_PACKAGE_GNURADIO_TRELLIS
 	  Trellis coded modulation blocks
 
 endif
-endif
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index ed537e3934..564ad8b2a4 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -101,7 +101,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_FFT),y)
-GNURADIO_DEPENDENCIES += fftw
+GNURADIO_DEPENDENCIES += fftw-single
 GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=OFF
