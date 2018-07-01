From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 21:10:07 +0200
Subject: [Buildroot] [git commit] gnuradio: add zeromq support
Message-ID: <20180701192819.7480A82161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=855295b6588abd1878419c9ada1b7cef387a57c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for sink/source GNURadio blocks to send/receive
zeromq data stream.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in   |  7 +++++++
 package/gnuradio/gnuradio.mk | 10 ++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 178bdc8861..d2892faff2 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -69,6 +69,13 @@ config BR2_PACKAGE_GNURADIO_UTILS
 	help
 	  Misc python utilities
 
+config BR2_PACKAGE_GNURADIO_ZEROMQ
+	bool "gr-zeromq support"
+	select BR2_PACKAGE_CPPZMQ
+	select BR2_PACKAGE_PYTHON_PYZMQ if BR2_PACKAGE_GNURADIO_PYTHON
+	help
+	  zeromq communication support
+
 comment "gr-fft, -filter, -analog, -channels, -digital, -trellis, -pager, -qtgui depends fftw's single precision"
 	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
 
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index e79f848388..9573b65b73 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -147,4 +147,14 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_UTILS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_ZEROMQ),y)
+GNURADIO_DEPENDENCIES += cppzmq
+ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
+GNURADIO_DEPENDENCIES += python-pyzmq
+endif
+GNURADIO_CONF_OPTS += -DENABLE_GR_ZEROMQ=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_ZEROMQ=OFF
+endif
+
 $(eval $(cmake-package))
