From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  9 Apr 2015 15:04:48 +0200
Subject: [Buildroot] [PATCH 1/1] GNURadio: add processing blocks
Message-ID: <1428584688-10074-1-git-send-email-gwenj@trabucayre.com>
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
Changes v1 -> v2:
 * supress hidden variable and use direct depends on
   BR2_PACKAGE_FFTW_PRECISION_SINGLE.
 * use a single if BR2_PACKAGE_FFTW_PRECISION_SINGLE for all options that need
   this.
---
 package/gnuradio/Config.in   | 63 ++++++++++++++++++++++++++++++++++++++++++++
 package/gnuradio/gnuradio.mk | 55 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index a33deeb..e6c8dc5 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -37,6 +37,12 @@ config BR2_PACKAGE_GNURADIO_BLOCKS
 	help
 	  GNU Radio basic block library
 
+config BR2_PACKAGE_GNURADIO_FEC
+	bool "FEC signal processing support"
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  GNU Radio's FEC signal processing blocks
+
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	select BR2_PACKAGE_BOOST_PYTHON
@@ -44,4 +50,61 @@ config BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Enable python component
 
+config BR2_PACKAGE_GNURADIO_UTILS
+	bool "misc python utilities support"
+	select BR2_PACKAGE_GNURADIO_PYTHON
+	help
+	  GNU Radio misc python utilities
+
+comment "gr-fft depends on fftw and fftw's single precision"
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+comment "gr-filter, -analog, -channels, -digital, -trellis, -pager depends on gr-fft"
+	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+if BR2_PACKAGE_FFTW_PRECISION_SINGLE
+
+config BR2_PACKAGE_GNURADIO_ANALOG
+	bool "analog communications support"
+	select BR2_PACKAGE_GNURADIO_FILTER
+	help
+	  GNU Radio blocks for analog communications
+
+config BR2_PACKAGE_GNURADIO_CHANNELS
+	bool "channels model blocks support"
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	help
+	  GNU Radio's channel model blocks
+
+config BR2_PACKAGE_GNURADIO_DIGITAL
+	bool "digital communications support"
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	help
+	  GNU Radio blocks for digital communications
+
+config BR2_PACKAGE_GNURADIO_FFT
+	bool "fft blocks support"
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	help
+	  GNU Radio's FFT signal processing blocks
+
+config BR2_PACKAGE_GNURADIO_FILTER
+	bool "signal processing filter blocks support"
+	select BR2_PACKAGE_GNURADIO_FFT
+	help
+	  GNU Radio's filter signal processing blocks
+
+config BR2_PACKAGE_GNURADIO_PAGER
+	bool "FLEX pager decoder support"
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	help
+	 GNU Radio blocks implementing a FLEX pager decoder
+
+config BR2_PACKAGE_GNURADIO_TRELLIS
+	bool "trellis coded modulation support"
+	select BR2_PACKAGE_GNURADIO_DIGITAL
+	help
+	  GNU Radio blocks for trellis coded modulation
+
+endif
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
