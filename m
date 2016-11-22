From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue, 22 Nov 2016 10:18:21 +0100
Subject: [Buildroot] [PATCH] gnuradio: gr-fec: add missing dependency to gsl
Message-ID: <1479806301-9840-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

gr-fec needs gsl. Without this dependency cmake search gsl in the host system.
This issue produce errors like :

arm-buildroot-linux-uclibcgnueabihf-gcc: ERROR: unsafe header/library path used
in cross-compilation: '-I/usr/include'
make[3]: *** [gr-fec/lib/CMakeFiles/gnuradio-fec.dir/reed-solomon/encode_rs.c.o] Error 1


Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 1 +
 package/gnuradio/gnuradio.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 50f5e7f..8301afe 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_GNURADIO_CTRLPORT
 config BR2_PACKAGE_GNURADIO_FEC
 	bool "gr-fec support"
 	select BR2_PACKAGE_GNURADIO_BLOCKS
+	select BR2_PACKAGE_GSL
 	help
 	  FEC signal processing blocks
 
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 5cb00d2..f1817f6 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -89,6 +89,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_DIGITAL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_FEC),y)
+GNURADIO_DEPENDENCIES += gsl
 GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FEC=OFF
-- 
2.7.3
