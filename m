From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:54:02 +0200
Subject: [Buildroot] [git commit] gnuradio: add qtgui support
Message-ID: <20160611135436.4D50B81D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06321645a3383ec32ac3e518157c9b7eee20d06c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gr-qtgui provides a set of module to display time/frequency/waterfall.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in   | 12 +++++++++++-
 package/gnuradio/gnuradio.mk |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index f51b9b2..50f5e7f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -67,7 +67,7 @@ config BR2_PACKAGE_GNURADIO_UTILS
 	help
 	  Misc python utilities
 
-comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager depends fftw's single precision"
+comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
 	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
 if BR2_PACKAGE_FFTW_PRECISION_SINGLE
@@ -108,6 +108,16 @@ config BR2_PACKAGE_GNURADIO_PAGER
 	help
 	  FLEX pager decoder implementation blocks
 
+config BR2_PACKAGE_GNURADIO_QTGUI
+	bool "gr-qtgui"
+	depends on BR2_PACKAGE_PYTHON_PYQT
+	depends on BR2_PACKAGE_QWT
+	depends on BR2_PACKAGE_QT_STL
+	select BR2_PACKAGE_GNURADIO_FFT
+	select BR2_PACKAGE_GNURADIO_FILTER
+	help
+	  GNU Radio Qt scopes
+
 config BR2_PACKAGE_GNURADIO_TRELLIS
 	bool "gr-trellis support"
 	select BR2_PACKAGE_GNURADIO_DIGITAL
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index b193569..972f7a4 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -120,6 +120,13 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_PAGER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
+GNURADIO_DEPENDENCIES += python-pyqt qwt
+GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=ON
 else
