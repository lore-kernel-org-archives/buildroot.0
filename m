From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 16:16:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcdproc: fix musl build
Message-ID: <1454167019-24428-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/9ce/9cec3bea99f2aa10313da38c1e81655666c774f7/
http://autobuild.buildroot.net/results/b3d/b3d09286d018e53a6d57f8dd5616010a3b212731/
http://autobuild.buildroot.net/results/aa2/aa27b150a79b14fe1dda74a56371b4ee35b3ac15/
and others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/lcdproc/0002-musl.patch | 102 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 package/lcdproc/0002-musl.patch

diff --git a/package/lcdproc/0002-musl.patch b/package/lcdproc/0002-musl.patch
new file mode 100644
index 0000000..d0425fd
--- /dev/null
+++ b/package/lcdproc/0002-musl.patch
@@ -0,0 +1,102 @@
+Fix musl build
+
+Partly downloaded from
+http://lists.omnipotent.net/pipermail/lcdproc/2015-November/014291.html
+http://lists.omnipotent.net/pipermail/lcdproc/2015-November/014281.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr lcdproc-0.5.7.org/clients/lcdproc/machine.h lcdproc-0.5.7/clients/lcdproc/machine.h
+--- lcdproc-0.5.7.org/clients/lcdproc/machine.h	2012-08-19 16:29:07.000000000 +0200
++++ lcdproc-0.5.7/clients/lcdproc/machine.h	2016-01-30 14:07:33.641802847 +0100
+@@ -12,6 +12,7 @@
+ #ifndef _lcdproc_machine_h_
+ #define _lcdproc_machine_h_
+ 
++#include <time.h>
+ #include "shared/LL.h"
+ 
+ #ifndef LOADAVG_NSTATS
+diff -uNr lcdproc-0.5.7.org/server/drivers/hd44780-pifacecad.c lcdproc-0.5.7/server/drivers/hd44780-pifacecad.c
+--- lcdproc-0.5.7.org/server/drivers/hd44780-pifacecad.c	2014-03-23 11:22:09.000000000 +0100
++++ lcdproc-0.5.7/server/drivers/hd44780-pifacecad.c	2016-01-30 14:12:03.521279729 +0100
+@@ -54,6 +54,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <stdint.h>
+ #include <linux/spi/spidev.h>
+ 
+diff -uNr lcdproc-0.5.7.org/server/drivers/hd44780-rpi.c lcdproc-0.5.7/server/drivers/hd44780-rpi.c
+--- lcdproc-0.5.7.org/server/drivers/hd44780-rpi.c	2014-03-23 11:22:09.000000000 +0100
++++ lcdproc-0.5.7/server/drivers/hd44780-rpi.c	2016-01-30 14:04:10.288112853 +0100
+@@ -285,7 +285,7 @@
+ 
+ 	/* Unmap and free memory */
+ 	if (gpio_map != NULL)
+-		munmap((caddr_t) gpio_map, GPIO_BLOCK_SIZE);
++		munmap((void *) gpio_map, GPIO_BLOCK_SIZE);
+ 	if (p->rpi_gpio != NULL)
+ 		free(p->rpi_gpio);
+ 	p->rpi_gpio = NULL;
+diff -uNr lcdproc-0.5.7.org/server/drivers/hd44780-spi.c lcdproc-0.5.7/server/drivers/hd44780-spi.c
+--- lcdproc-0.5.7.org/server/drivers/hd44780-spi.c	2014-03-23 11:22:09.000000000 +0100
++++ lcdproc-0.5.7/server/drivers/hd44780-spi.c	2016-01-30 14:11:11.604763500 +0100
+@@ -29,6 +29,7 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
++#include <linux/ioctl.h>
+ #include <stdint.h>
+ #include <linux/spi/spidev.h>
+ 
+diff -uNr lcdproc-0.5.7.org/server/drivers/mtc_s16209x.c lcdproc-0.5.7/server/drivers/mtc_s16209x.c
+--- lcdproc-0.5.7.org/server/drivers/mtc_s16209x.c	2011-08-14 14:29:16.000000000 +0200
++++ lcdproc-0.5.7/server/drivers/mtc_s16209x.c	2016-01-30 14:13:10.691122839 +0100
+@@ -49,6 +49,7 @@
+ #include <fcntl.h>
+ #include <string.h>
+ #include <errno.h>
++#include <sys/file.h>
+ 
+ #ifdef HAVE_CONFIG_H
+ # include "config.h"
+diff -uNr lcdproc-0.5.7.org/server/drivers/rawserial.c lcdproc-0.5.7/server/drivers/rawserial.c
+--- lcdproc-0.5.7.org/server/drivers/rawserial.c	2014-03-23 11:22:10.000000000 +0100
++++ lcdproc-0.5.7/server/drivers/rawserial.c	2016-01-30 14:03:43.465779507 +0100
+@@ -60,13 +60,13 @@
+ 	/** \name Event loop timing. refresh_time and refresh_delta form the
+ 	 * event loop timing mechanism for configurable update rates.
+ 	 *@{*/
+-	uint refresh_time;		/**< time at the last screen update */
+-	uint refresh_delta;		/**< time step to next screen update */
++	unsigned int refresh_time;		/**< time@the last screen update */
++	unsigned int refresh_delta;		/**< time step to next screen update */
+ 	/**@}*/
+ } PrivateData;
+ 
+ /* Local prototypes */
+-static uint get_millisecond_time(void);
++static unsigned int get_millisecond_time(void);
+ 
+ 
+ /* Vars for the server core */
+@@ -303,7 +303,7 @@
+ 	PrivateData *p = drvthis->private_data;
+ 	char out[LCD_MAX_WIDTH * LCD_MAX_HEIGHT];
+ 
+-	uint currentTime = get_millisecond_time();
++	unsigned int currentTime = get_millisecond_time();
+ 	int t_delta = currentTime - p->refresh_time;
+ 
+ 	/*
+@@ -415,7 +415,7 @@
+  *
+  * \return  int with current millisecond time.
+  */
+-static uint
++static unsigned int
+ get_millisecond_time(void)
+ {
+ 	struct timeval ts;
-- 
2.7.0.rc3
