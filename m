From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 10:40:23 +0100
Subject: [Buildroot] [git commit] gnuradio: gr-fec: add missing dependency
	to gsl
Message-ID: <20161122094029.4FE3981D2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82f7217b334cc5e86ed81b62c3c184a44c813405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gr-fec needs gsl. Without this dependency cmake search gsl in the host system.
This issue produce errors like :

arm-buildroot-linux-uclibcgnueabihf-gcc: ERROR: unsafe header/library path used
in cross-compilation: '-I/usr/include'
make[3]: *** [gr-fec/lib/CMakeFiles/gnuradio-fec.dir/reed-solomon/encode_rs.c.o] Error 1

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
