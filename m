From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 29 Apr 2016 10:12:14 +0200
Subject: [Buildroot] [PATCH 3/3] gnuradio: add qtgui support
In-Reply-To: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
References: <1461917534-27882-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1461917534-27882-3-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-qtgui provides a set of module to display time/frequency/waterfall.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 12 +++++++++++-
 package/gnuradio/gnuradio.mk |  7 +++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index dc29dfc..a572773 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -69,7 +69,7 @@ config BR2_PACKAGE_GNURADIO_UTILS
 	help
 	  Misc python utilities
 
-comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager depends fftw's single precision"
+comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
 	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
 if BR2_PACKAGE_FFTW_PRECISION_SINGLE
@@ -110,6 +110,16 @@ config BR2_PACKAGE_GNURADIO_PAGER
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
-- 
2.7.3
