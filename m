From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:34 +0100
Subject: [Buildroot] [PATCH 04/11] gnuradio: change depend to select for ffw
 and use fft-single in DEPENDENCIES
In-Reply-To: <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

With fftw with multiple precision selectable without choise it's possible
to replace depend on by select.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 8 ++------
 package/gnuradio/gnuradio.mk | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 56957d59e4..4508643940 100644
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
+	select BR2_PACKAGE_FFTW_PRECISION_SINGLE
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
-- 
2.19.2
