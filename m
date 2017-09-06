From: Sven Haardiek <sven.haardiek@greenbone.net>
Date: Wed, 6 Sep 2017 16:48:55 +0200
Subject: [Buildroot] [PATCH 1/1] Update lcdproc version
Message-ID: <20170906164855.65d6e474@vomer.devel.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch title: Update lcdproc version

There is a newer version of lcdproc available and it seems like lcdproc moved
to github.

The new version also compiles with musl without any patches.

Signed-off-by: Sven Haardiek <sven.haardiek@greenbone.net>
---
 package/lcdproc/0002-musl.patch | 102 ----------------------------------------
 package/lcdproc/lcdproc.hash    |   1 +
 package/lcdproc/lcdproc.mk      |   4 +-
 3 files changed, 3 insertions(+), 104 deletions(-)
 delete mode 100644 package/lcdproc/0002-musl.patch

diff --git a/package/lcdproc/0002-musl.patch b/package/lcdproc/0002-musl.patch
deleted file mode 100644
index d0425fd5b2..0000000000
--- a/package/lcdproc/0002-musl.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Fix musl build
-
-Partly downloaded from
-http://lists.omnipotent.net/pipermail/lcdproc/2015-November/014291.html
-http://lists.omnipotent.net/pipermail/lcdproc/2015-November/014281.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr lcdproc-0.5.7.org/clients/lcdproc/machine.h lcdproc-0.5.7/clients/lcdproc/machine.h
---- lcdproc-0.5.7.org/clients/lcdproc/machine.h	2012-08-19 16:29:07.000000000 +0200
-+++ lcdproc-0.5.7/clients/lcdproc/machine.h	2016-01-30 14:07:33.641802847 +0100
-@@ -12,6 +12,7 @@
- #ifndef _lcdproc_machine_h_
- #define _lcdproc_machine_h_
- 
-+#include <time.h>
- #include "shared/LL.h"
- 
- #ifndef LOADAVG_NSTATS
-diff -uNr lcdproc-0.5.7.org/server/drivers/hd44780-pifacecad.c lcdproc-0.5.7/server/drivers/hd44780-pifacecad.c
---- lcdproc-0.5.7.org/server/drivers/hd44780-pifacecad.c	2014-03-23 11:22:09.000000000 +0100
-+++ lcdproc-0.5.7/server/drivers/hd44780-pifacecad.c	2016-01-30 14:12:03.521279729 +0100
-@@ -54,6 +54,7 @@
- #include <unistd.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
-+#include <linux/ioctl.h>
- #include <stdint.h>
- #include <linux/spi/spidev.h>
- 
-diff -uNr lcdproc-0.5.7.org/server/drivers/hd44780-rpi.c lcdproc-0.5.7/server/drivers/hd44780-rpi.c
---- lcdproc-0.5.7.org/server/drivers/hd44780-rpi.c	2014-03-23 11:22:09.000000000 +0100
-+++ lcdproc-0.5.7/server/drivers/hd44780-rpi.c	2016-01-30 14:04:10.288112853 +0100
-@@ -285,7 +285,7 @@
- 
- 	/* Unmap and free memory */
- 	if (gpio_map != NULL)
--		munmap((caddr_t) gpio_map, GPIO_BLOCK_SIZE);
-+		munmap((void *) gpio_map, GPIO_BLOCK_SIZE);
- 	if (p->rpi_gpio != NULL)
- 		free(p->rpi_gpio);
- 	p->rpi_gpio = NULL;
-diff -uNr lcdproc-0.5.7.org/server/drivers/hd44780-spi.c lcdproc-0.5.7/server/drivers/hd44780-spi.c
---- lcdproc-0.5.7.org/server/drivers/hd44780-spi.c	2014-03-23 11:22:09.000000000 +0100
-+++ lcdproc-0.5.7/server/drivers/hd44780-spi.c	2016-01-30 14:11:11.604763500 +0100
-@@ -29,6 +29,7 @@
- #include <unistd.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
-+#include <linux/ioctl.h>
- #include <stdint.h>
- #include <linux/spi/spidev.h>
- 
-diff -uNr lcdproc-0.5.7.org/server/drivers/mtc_s16209x.c lcdproc-0.5.7/server/drivers/mtc_s16209x.c
---- lcdproc-0.5.7.org/server/drivers/mtc_s16209x.c	2011-08-14 14:29:16.000000000 +0200
-+++ lcdproc-0.5.7/server/drivers/mtc_s16209x.c	2016-01-30 14:13:10.691122839 +0100
-@@ -49,6 +49,7 @@
- #include <fcntl.h>
- #include <string.h>
- #include <errno.h>
-+#include <sys/file.h>
- 
- #ifdef HAVE_CONFIG_H
- # include "config.h"
-diff -uNr lcdproc-0.5.7.org/server/drivers/rawserial.c lcdproc-0.5.7/server/drivers/rawserial.c
---- lcdproc-0.5.7.org/server/drivers/rawserial.c	2014-03-23 11:22:10.000000000 +0100
-+++ lcdproc-0.5.7/server/drivers/rawserial.c	2016-01-30 14:03:43.465779507 +0100
-@@ -60,13 +60,13 @@
- 	/** \name Event loop timing. refresh_time and refresh_delta form the
- 	 * event loop timing mechanism for configurable update rates.
- 	 *@{*/
--	uint refresh_time;		/**< time at the last screen update */
--	uint refresh_delta;		/**< time step to next screen update */
-+	unsigned int refresh_time;		/**< time@the last screen update */
-+	unsigned int refresh_delta;		/**< time step to next screen update */
- 	/**@}*/
- } PrivateData;
- 
- /* Local prototypes */
--static uint get_millisecond_time(void);
-+static unsigned int get_millisecond_time(void);
- 
- 
- /* Vars for the server core */
-@@ -303,7 +303,7 @@
- 	PrivateData *p = drvthis->private_data;
- 	char out[LCD_MAX_WIDTH * LCD_MAX_HEIGHT];
- 
--	uint currentTime = get_millisecond_time();
-+	unsigned int currentTime = get_millisecond_time();
- 	int t_delta = currentTime - p->refresh_time;
- 
- 	/*
-@@ -415,7 +415,7 @@
-  *
-  * \return  int with current millisecond time.
-  */
--static uint
-+static unsigned int
- get_millisecond_time(void)
- {
- 	struct timeval ts;
diff --git a/package/lcdproc/lcdproc.hash b/package/lcdproc/lcdproc.hash
index ea39a9b492..00f685448d 100644
--- a/package/lcdproc/lcdproc.hash
+++ b/package/lcdproc/lcdproc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  843007d377adc856529ed0c7c42c9a7563043f06b1b73add0372bba3a3029804  lcdproc-0.5.7.tar.gz
+sha256  d48a915496c96ff775b377d2222de3150ae5172bfb84a6ec9f9ceab962f97b83  lcdproc-0.5.9.tar.gz
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index e602088fa8..e5b6172b15 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LCDPROC_VERSION = 0.5.7
-LCDPROC_SITE = http://downloads.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
+LCDPROC_VERSION = 0.5.9
+LCDPROC_SITE = https://github.com/lcdproc/lcdproc/releases/download/v$(LCDPROC_VERSION)
 LCDPROC_LICENSE = GPL-2.0+
 LCDPROC_LICENSE_FILES = COPYING
 LCDPROC_MAKE = $(MAKE1)
-- 
2.11.0
