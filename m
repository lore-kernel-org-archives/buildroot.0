From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 18 Mar 2015 17:17:59 +0100
Subject: [Buildroot] [PATCH 1/1] GNURadio: add processing blocks
Message-ID: <1426695479-12524-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

GNURadio provides a set of processing blocks like analog or digital
communication, filters, ...

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 72 ++++++++++++++++++++++++++++++++++++++++++++
 package/gnuradio/gnuradio.mk | 55 +++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 274afaa..26b00bc 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -32,11 +32,60 @@ config BR2_PACKAGE_GNURADIO
 
 if BR2_PACKAGE_GNURADIO
 
+config BR2_PACKAGE_GNURADIO_ANALOG
+	bool "analog communications support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_FILTER
+	help
+	  GNU Radio blocks for analog communications
+
 config BR2_PACKAGE_GNURADIO_BLOCKS
 	bool "blocks support"
 	help
 	  GNU Radio basic block library
 
+config BR2_PACKAGE_GNURADIO_CHANNELS
+	bool "channels model blocks support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	help
+	  GNU Radio's channel model blocks
+
+config BR2_PACKAGE_GNURADIO_DIGITAL
+	bool "digital communications support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	help
+	  GNU Radio blocks for digital communications
+
+config BR2_PACKAGE_GNURADIO_FEC
+	bool "FEC signal processing support"
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  GNU Radio's FEC signal processing blocks
+
+config BR2_PACKAGE_GNURADIO_FFT_OK
+	bool
+	default y
+	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+config BR2_PACKAGE_GNURADIO_FFT
+	bool "fft blocks support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  GNU Radio's FFT signal processing blocks
+
+comment "gr-fft depends on fftw and fftw's single precision"
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+config BR2_PACKAGE_GNURADIO_FILTER
+	bool "signal processing filter blocks support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_FFT
+	help
+	  GNU Radio's filter signal processing blocks
+
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	select BR2_PACKAGE_BOOST_PYTHON
@@ -44,4 +93,27 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
+config BR2_PACKAGE_GNURADIO_PAGER
+	bool "FLEX pager decoder support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	help
+	 GNU Radio blocks implementing a FLEX pager decoder
+
+config BR2_PACKAGE_GNURADIO_TRELLIS
+	bool "trellis coded modulation support"
+	depends on BR2_PACKAGE_GNURADIO_FFT_OK
+	select BR2_PACKAGE_GNURADIO_DIGITAL
+	help
+	  GNU Radio blocks for trellis coded modulation
+
+config BR2_PACKAGE_GNURADIO_UTILS
+	bool "misc python utilities support"
+	select BR2_PACKAGE_GNURADIO_PYTHON
+	help
+	  GNU Radio misc python utilities
+
+comment "gr-filter, -analog, -channels, -digital, -trellis, -pager depends on gr-fft"
+	depends on !BR2_PACKAGE_GNURADIO_FFT_OK
+
 endif
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index e58c7dc..fc5cd1f 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -42,12 +42,49 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),)
 GNURADIO_CONF_OPTS += -Dhave_mfpu_neon=0
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_ANALOG),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_CHANNELS),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_CHANNELS=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_CHANNELS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_DIGITAL),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_FEC),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_FFT),y)
+GNURADIO_DEPENDENCIES += fftw
+GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_FFT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_FILTER),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
@@ -55,4 +92,22 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_PAGER),y)
+GNURADIO_CONF_OPTS += -DENABLE_PAGER=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_PAGER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_GNURADIO_UTILS),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_UTILS=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_UTILS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.0.5
