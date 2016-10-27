From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Wed, 26 Oct 2016 20:08:07 -0400
Subject: [Buildroot] [PATCH 2/2] ts4600-tshwctl: add ts4600-tshwctl package
In-Reply-To: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
References: <20161027000807.20206-1-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20161027000807.20206-3-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package is required to access the FPGA registers and configure some
controllers of the TS-4600 board.

It comes with two init script to properly configure the watchdog and the
ethernet PHY at boot time.

This tool has no repository for this board and the sources are taken
from the Technologic System ftp in the TS-7600 subdirectory which are
compatible with the TS-4600:
ftp://ftp.embeddedarm.com/ts-arm-sbc/ts-7600-linux/sources/

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 configs/ts4600_defconfig                 |    1 +
 package/Config.in                        |    1 +
 package/ts4600-tshwctl/Config.in         |    8 +
 package/ts4600-tshwctl/S00watchdogd      |   30 +
 package/ts4600-tshwctl/S01ethswitch      |   21 +
 package/ts4600-tshwctl/src/Makefile      |   16 +
 package/ts4600-tshwctl/src/i2c-dev.h     |  335 +++
 package/ts4600-tshwctl/src/ispspi.c      |  132 ++
 package/ts4600-tshwctl/src/ispvm.c       | 3408 ++++++++++++++++++++++++++++++
 package/ts4600-tshwctl/src/tshwctl.c     | 2904 +++++++++++++++++++++++++
 package/ts4600-tshwctl/src/vmopcode.h    |  192 ++
 package/ts4600-tshwctl/ts4600-tshwctl.mk |   23 +
 12 files changed, 7071 insertions(+)
 create mode 100644 package/ts4600-tshwctl/Config.in
 create mode 100644 package/ts4600-tshwctl/S00watchdogd
 create mode 100644 package/ts4600-tshwctl/S01ethswitch
 create mode 100644 package/ts4600-tshwctl/src/Makefile
 create mode 100644 package/ts4600-tshwctl/src/i2c-dev.h
 create mode 100644 package/ts4600-tshwctl/src/ispspi.c
 create mode 100644 package/ts4600-tshwctl/src/ispvm.c
 create mode 100644 package/ts4600-tshwctl/src/tshwctl.c
 create mode 100644 package/ts4600-tshwctl/src/vmopcode.h
 create mode 100644 package/ts4600-tshwctl/ts4600-tshwctl.mk

diff --git a/configs/ts4600_defconfig b/configs/ts4600_defconfig
index 21f5d7f..d97d065 100644
--- a/configs/ts4600_defconfig
+++ b/configs/ts4600_defconfig
@@ -18,3 +18,4 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_TARGET_TS4600_BOOTROM=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_TS4600_TSHWCTL=y
diff --git a/package/Config.in b/package/Config.in
index 0f6260b..c17face 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -468,6 +468,7 @@ endmenu
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
 	source "package/triggerhappy/Config.in"
+	source "package/ts4600-tshwctl/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/ubus/Config.in"
 	source "package/udev/Config.in"
diff --git a/package/ts4600-tshwctl/Config.in b/package/ts4600-tshwctl/Config.in
new file mode 100644
index 0000000..8b4c933
--- /dev/null
+++ b/package/ts4600-tshwctl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_TS4600_TSHWCTL
+	bool "ts4600-tshwctl"
+	depends on BR2_arm
+	help
+	  Technologic System TS-4600 manipulation tool.
+
+	  This tool is mainly used to access the FPGA registers, daemonize the
+	  watchdog, and configure the ethernet PHY of the TS-4600 board.
diff --git a/package/ts4600-tshwctl/S00watchdogd b/package/ts4600-tshwctl/S00watchdogd
new file mode 100644
index 0000000..4cbd638
--- /dev/null
+++ b/package/ts4600-tshwctl/S00watchdogd
@@ -0,0 +1,30 @@
+#!/bin/sh
+#
+# This script activate the watchdog daemon which feed the watchdog
+# in the TS4600 FPGA.
+#
+# Author: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
+
+case "$1" in
+  start)
+	echo "Starting the watchdog daemon..."
+	# start the watchdog daemon
+	tshwctl -W
+	# autofeed the watchdog with 10 seconds timeout
+	echo a2 > /dev/watchdog
+	# clean led
+	tshwctl --greenledon --redledoff
+	;;
+  stop)
+	echo "Stoping the watchdog daemon..."
+	killall -9 tshwctl
+	;;
+  restart|reload)
+	"$0" stop
+	"$0" start
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+	;;
+esac
diff --git a/package/ts4600-tshwctl/S01ethswitch b/package/ts4600-tshwctl/S01ethswitch
new file mode 100644
index 0000000..85c6c15
--- /dev/null
+++ b/package/ts4600-tshwctl/S01ethswitch
@@ -0,0 +1,21 @@
+#!/bin/sh
+#
+# This script bring up the ethernet phy and set it in switch mode.
+#
+# Author: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
+
+case "$1" in
+  start)
+	# wake up interface
+	ifconfig eth0 up
+	# set the ethernet port in switch mode
+	tshwctl --ethswitch
+	;;
+  stop)
+	exit 0
+	;;
+  *)
+	echo "Usage: $0 {start}"
+	exit 1
+	;;
+esac
diff --git a/package/ts4600-tshwctl/src/Makefile b/package/ts4600-tshwctl/src/Makefile
new file mode 100644
index 0000000..7e022d3
--- /dev/null
+++ b/package/ts4600-tshwctl/src/Makefile
@@ -0,0 +1,16 @@
+CFLAGS=-Wall -O0 -fno-tree-cselim
+SOURCES=$(shell ls *.c)
+OBJECTS=$(SOURCES:.c=.o)
+
+.PHONY: all
+all: tshwctl
+
+%.o: %.c
+	$(CROSS_COMPILE)$(CC) $(CFLAGS) $(INCLUDES) -c $<
+
+tshwctl: $(OBJECTS)
+	$(CROSS_COMPILE)$(CC) -o $@ $(OBJECTS) $(LDFLAGS)
+
+.PHONY: clean
+clean:
+	rm -f *.o tshwctl
diff --git a/package/ts4600-tshwctl/src/i2c-dev.h b/package/ts4600-tshwctl/src/i2c-dev.h
new file mode 100644
index 0000000..dbe8b40
--- /dev/null
+++ b/package/ts4600-tshwctl/src/i2c-dev.h
@@ -0,0 +1,335 @@
+/*
+    i2c-dev.h - i2c-bus driver, char device interface
+
+    Copyright (C) 1995-97 Simon G. Vogl
+    Copyright (C) 1998-99 Frodo Looijaard <frodol@dds.nl>
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
+    MA 02110-1301 USA.
+*/
+
+/* $Id: i2c-dev.h 5894 2010-12-12 13:22:29Z khali $ */
+
+#ifndef LIB_I2CDEV_H
+#define LIB_I2CDEV_H
+
+#include <linux/types.h>
+#include <sys/ioctl.h>
+
+
+/* -- i2c.h -- */
+
+
+/*
+ * I2C Message - used for pure i2c transaction, also from /dev interface
+ */
+struct i2c_msg {
+	__u16 addr;	/* slave address			*/
+	unsigned short flags;		
+#define I2C_M_TEN	0x10	/* we have a ten bit chip address	*/
+#define I2C_M_RD	0x01
+#define I2C_M_NOSTART	0x4000
+#define I2C_M_REV_DIR_ADDR	0x2000
+#define I2C_M_IGNORE_NAK	0x1000
+#define I2C_M_NO_RD_ACK		0x0800
+	short len;		/* msg length				*/
+	char *buf;		/* pointer to msg data			*/
+};
+
+/* To determine what functionality is present */
+
+#define I2C_FUNC_I2C			0x00000001
+#define I2C_FUNC_10BIT_ADDR		0x00000002
+#define I2C_FUNC_PROTOCOL_MANGLING	0x00000004 /* I2C_M_{REV_DIR_ADDR,NOSTART,..} */
+#define I2C_FUNC_SMBUS_PEC		0x00000008
+#define I2C_FUNC_SMBUS_BLOCK_PROC_CALL	0x00008000 /* SMBus 2.0 */
+#define I2C_FUNC_SMBUS_QUICK		0x00010000 
+#define I2C_FUNC_SMBUS_READ_BYTE	0x00020000 
+#define I2C_FUNC_SMBUS_WRITE_BYTE	0x00040000 
+#define I2C_FUNC_SMBUS_READ_BYTE_DATA	0x00080000 
+#define I2C_FUNC_SMBUS_WRITE_BYTE_DATA	0x00100000 
+#define I2C_FUNC_SMBUS_READ_WORD_DATA	0x00200000 
+#define I2C_FUNC_SMBUS_WRITE_WORD_DATA	0x00400000 
+#define I2C_FUNC_SMBUS_PROC_CALL	0x00800000 
+#define I2C_FUNC_SMBUS_READ_BLOCK_DATA	0x01000000 
+#define I2C_FUNC_SMBUS_WRITE_BLOCK_DATA 0x02000000 
+#define I2C_FUNC_SMBUS_READ_I2C_BLOCK	0x04000000 /* I2C-like block xfer  */
+#define I2C_FUNC_SMBUS_WRITE_I2C_BLOCK	0x08000000 /* w/ 1-byte reg. addr. */
+
+#define I2C_FUNC_SMBUS_BYTE (I2C_FUNC_SMBUS_READ_BYTE | \
+                             I2C_FUNC_SMBUS_WRITE_BYTE)
+#define I2C_FUNC_SMBUS_BYTE_DATA (I2C_FUNC_SMBUS_READ_BYTE_DATA | \
+                                  I2C_FUNC_SMBUS_WRITE_BYTE_DATA)
+#define I2C_FUNC_SMBUS_WORD_DATA (I2C_FUNC_SMBUS_READ_WORD_DATA | \
+                                  I2C_FUNC_SMBUS_WRITE_WORD_DATA)
+#define I2C_FUNC_SMBUS_BLOCK_DATA (I2C_FUNC_SMBUS_READ_BLOCK_DATA | \
+                                   I2C_FUNC_SMBUS_WRITE_BLOCK_DATA)
+#define I2C_FUNC_SMBUS_I2C_BLOCK (I2C_FUNC_SMBUS_READ_I2C_BLOCK | \
+                                  I2C_FUNC_SMBUS_WRITE_I2C_BLOCK)
+
+/* Old name, for compatibility */
+#define I2C_FUNC_SMBUS_HWPEC_CALC	I2C_FUNC_SMBUS_PEC
+
+/* 
+ * Data for SMBus Messages 
+ */
+#define I2C_SMBUS_BLOCK_MAX	32	/* As specified in SMBus standard */	
+#define I2C_SMBUS_I2C_BLOCK_MAX	32	/* Not specified but we use same structure */
+union i2c_smbus_data {
+	__u8 byte;
+	__u16 word;
+	__u8 block[I2C_SMBUS_BLOCK_MAX + 2]; /* block[0] is used for length */
+	                                            /* and one more for PEC */
+};
+
+/* smbus_access read or write markers */
+#define I2C_SMBUS_READ	1
+#define I2C_SMBUS_WRITE	0
+
+/* SMBus transaction types (size parameter in the above functions) 
+   Note: these no longer correspond to the (arbitrary) PIIX4 internal codes! */
+#define I2C_SMBUS_QUICK		    0
+#define I2C_SMBUS_BYTE		    1
+#define I2C_SMBUS_BYTE_DATA	    2 
+#define I2C_SMBUS_WORD_DATA	    3
+#define I2C_SMBUS_PROC_CALL	    4
+#define I2C_SMBUS_BLOCK_DATA	    5
+#define I2C_SMBUS_I2C_BLOCK_BROKEN  6
+#define I2C_SMBUS_BLOCK_PROC_CALL   7		/* SMBus 2.0 */
+#define I2C_SMBUS_I2C_BLOCK_DATA    8
+
+
+/* ----- commands for the ioctl like i2c_command call:
+ * note that additional calls are defined in the algorithm and hw 
+ *	dependent layers - these can be listed here, or see the 
+ *	corresponding header files.
+ */
+				/* -> bit-adapter specific ioctls	*/
+#define I2C_RETRIES	0x0701	/* number of times a device address      */
+				/* should be polled when not            */
+                                /* acknowledging 			*/
+#define I2C_TIMEOUT	0x0702	/* set timeout - call with int 		*/
+
+
+/* this is for i2c-dev.c	*/
+#define I2C_SLAVE	0x0703	/* Change slave address			*/
+				/* Attn.: Slave address is 7 or 10 bits */
+#define I2C_SLAVE_FORCE	0x0706	/* Change slave address			*/
+				/* Attn.: Slave address is 7 or 10 bits */
+				/* This changes the address, even if it */
+				/* is already taken!			*/
+#define I2C_TENBIT	0x0704	/* 0 for 7 bit addrs, != 0 for 10 bit	*/
+
+#define I2C_FUNCS	0x0705	/* Get the adapter functionality */
+#define I2C_RDWR	0x0707	/* Combined R/W transfer (one stop only)*/
+#define I2C_PEC		0x0708	/* != 0 for SMBus PEC                   */
+
+#define I2C_SMBUS	0x0720	/* SMBus-level access */
+
+/* -- i2c.h -- */
+
+
+/* Note: 10-bit addresses are NOT supported! */
+
+/* This is the structure as used in the I2C_SMBUS ioctl call */
+struct i2c_smbus_ioctl_data {
+	char read_write;
+	__u8 command;
+	int size;
+	union i2c_smbus_data *data;
+};
+
+/* This is the structure as used in the I2C_RDWR ioctl call */
+struct i2c_rdwr_ioctl_data {
+	struct i2c_msg *msgs;	/* pointers to i2c_msgs */
+	int nmsgs;		/* number of i2c_msgs */
+};
+
+
+static inline __s32 i2c_smbus_access(int file, char read_write, __u8 command, 
+                                     int size, union i2c_smbus_data *data)
+{
+	struct i2c_smbus_ioctl_data args;
+
+	args.read_write = read_write;
+	args.command = command;
+	args.size = size;
+	args.data = data;
+	return ioctl(file,I2C_SMBUS,&args);
+}
+
+
+static inline __s32 i2c_smbus_write_quick(int file, __u8 value)
+{
+	return i2c_smbus_access(file,value,0,I2C_SMBUS_QUICK,0);
+}
+	
+static inline __s32 i2c_smbus_read_byte(int file)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,0,I2C_SMBUS_BYTE,&data))
+		return -1;
+	else
+		return 0x0FF & data.byte;
+}
+
+static inline __s32 i2c_smbus_write_byte(int file, __u8 value)
+{
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,value,
+	                        I2C_SMBUS_BYTE,0);
+}
+
+static inline __s32 i2c_smbus_read_byte_data(int file, __u8 command)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     I2C_SMBUS_BYTE_DATA,&data))
+		return -1;
+	else
+		return 0x0FF & data.byte;
+}
+
+static inline __s32 i2c_smbus_write_byte_data(int file, __u8 command, 
+                                              __u8 value)
+{
+	union i2c_smbus_data data;
+	data.byte = value;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_BYTE_DATA, &data);
+}
+
+static inline __s32 i2c_smbus_read_word_data(int file, __u8 command)
+{
+	union i2c_smbus_data data;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     I2C_SMBUS_WORD_DATA,&data))
+		return -1;
+	else
+		return 0x0FFFF & data.word;
+}
+
+static inline __s32 i2c_smbus_write_word_data(int file, __u8 command, 
+                                              __u16 value)
+{
+	union i2c_smbus_data data;
+	data.word = value;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_WORD_DATA, &data);
+}
+
+static inline __s32 i2c_smbus_process_call(int file, __u8 command, __u16 value)
+{
+	union i2c_smbus_data data;
+	data.word = value;
+	if (i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                     I2C_SMBUS_PROC_CALL,&data))
+		return -1;
+	else
+		return 0x0FFFF & data.word;
+}
+
+
+/* Returns the number of read bytes */
+static inline __s32 i2c_smbus_read_block_data(int file, __u8 command, 
+                                              __u8 *values)
+{
+	union i2c_smbus_data data;
+	int i;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     I2C_SMBUS_BLOCK_DATA,&data))
+		return -1;
+	else {
+		for (i = 1; i <= data.block[0]; i++)
+			values[i-1] = data.block[i];
+		return data.block[0];
+	}
+}
+
+static inline __s32 i2c_smbus_write_block_data(int file, __u8 command, 
+                                               __u8 length, const __u8 *values)
+{
+	union i2c_smbus_data data;
+	int i;
+	if (length > 32)
+		length = 32;
+	for (i = 1; i <= length; i++)
+		data.block[i] = values[i-1];
+	data.block[0] = length;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_BLOCK_DATA, &data);
+}
+
+/* Returns the number of read bytes */
+/* Until kernel 2.6.22, the length is hardcoded to 32 bytes. If you
+   ask for less than 32 bytes, your code will only work with kernels
+   2.6.23 and later. */
+static inline __s32 i2c_smbus_read_i2c_block_data(int file, __u8 command,
+                                                  __u8 length, __u8 *values)
+{
+	union i2c_smbus_data data;
+	int i;
+
+	if (length > 32)
+		length = 32;
+	data.block[0] = length;
+	if (i2c_smbus_access(file,I2C_SMBUS_READ,command,
+	                     length == 32 ? I2C_SMBUS_I2C_BLOCK_BROKEN :
+	                      I2C_SMBUS_I2C_BLOCK_DATA,&data))
+		return -1;
+	else {
+		for (i = 1; i <= data.block[0]; i++)
+			values[i-1] = data.block[i];
+		return data.block[0];
+	}
+}
+
+static inline __s32 i2c_smbus_write_i2c_block_data(int file, __u8 command,
+                                                   __u8 length,
+                                                   const __u8 *values)
+{
+	union i2c_smbus_data data;
+	int i;
+	if (length > 32)
+		length = 32;
+	for (i = 1; i <= length; i++)
+		data.block[i] = values[i-1];
+	data.block[0] = length;
+	return i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                        I2C_SMBUS_I2C_BLOCK_BROKEN, &data);
+}
+
+/* Returns the number of read bytes */
+static inline __s32 i2c_smbus_block_process_call(int file, __u8 command,
+                                                 __u8 length, __u8 *values)
+{
+	union i2c_smbus_data data;
+	int i;
+	if (length > 32)
+		length = 32;
+	for (i = 1; i <= length; i++)
+		data.block[i] = values[i-1];
+	data.block[0] = length;
+	if (i2c_smbus_access(file,I2C_SMBUS_WRITE,command,
+	                     I2C_SMBUS_BLOCK_PROC_CALL,&data))
+		return -1;
+	else {
+		for (i = 1; i <= data.block[0]; i++)
+			values[i-1] = data.block[i];
+		return data.block[0];
+	}
+}
+
+
+#endif /* LIB_I2CDEV_H */
diff --git a/package/ts4600-tshwctl/src/ispspi.c b/package/ts4600-tshwctl/src/ispspi.c
new file mode 100644
index 0000000..236c599
--- /dev/null
+++ b/package/ts4600-tshwctl/src/ispspi.c
@@ -0,0 +1,132 @@
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sched.h>
+#include <assert.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <linux/spi/spidev.h>
+
+extern volatile unsigned int *mxgpioregs;
+extern void nbuslock(void);
+
+static FILE *xopen(const char *f) {
+	int l = strlen(f);
+	char b[512];
+	struct stat s;
+
+	if (strcmp("-", f) == 0) return stdin;
+
+	if (stat(f, &s) != 0) return NULL;
+
+	if (strcmp(".jed.gz", &f[l-7]) == 0 ||
+	  strcmp(".jed.bz2", &f[l-8]) == 0 ||
+	  strcmp(".jed", &f[l-4]) == 0) {
+		snprintf(b, 512, "exec jed2vme '%s'", f);
+		return popen(b, "r");
+	} else if (strcmp(".bin.gz", &f[l-7]) == 0) {
+		snprintf(b, 512, "exec gunzip -c '%s'", f);
+		return popen(b, "r");
+	} else if (strcmp(".bin.bz2", &f[l-8]) == 0) {
+		snprintf(b, 512, "exec bunzip2 -c '%s'", f);
+		return popen(b, "r");
+	} else return fopen(f, "r");
+}
+
+static unsigned char *memstore_buf;
+static int memstore_len;
+static int memstore_idx;
+
+static void memstore(FILE *f) {
+	int sz = 0x10000;
+	int rem = sz;
+	int i;
+	unsigned char *b, *t;
+
+	if (memstore_buf) free(memstore_buf);
+	b = memstore_buf = malloc(sz);
+	assert(b != NULL);
+
+	while (!feof(f)) {
+		if (rem == 0) {
+			sz += 0x10000;
+			rem = 0x10000;
+			t = realloc(memstore_buf, sz);
+			assert (t != NULL);
+			b = t + (b - memstore_buf);
+			memstore_buf = t;
+		}
+
+		i = fread(b, 1, rem, f);
+		rem -= i;
+		b += i;
+	}
+
+	memstore_idx = 0;
+	memstore_len = sz - rem;
+	assert(memstore_len > 0);
+	memstore_buf = realloc(memstore_buf, memstore_len);
+	assert(memstore_buf != NULL);
+}
+
+signed char ispSPI(const char *filename, int nvcm_prog) {
+	FILE *file = NULL;
+	int spidev = open("/dev/spidev1.0" , O_RDWR), ret;
+	char mode = SPI_CPOL | SPI_CPHA;
+	struct spi_ioc_transfer tr = {
+		//.tx_buf = memstore_buf,
+		//.rx_buf = NULL,
+		.len = 0,
+		.delay_usecs = 0,
+		.speed_hz = 25000000,
+		.bits_per_word = 8,
+	};
+
+	assert(spidev > 0);
+
+	/* Set up iCE40 to be ready to be programmed */
+	mxgpioregs[0x718/4] = 0x60000; //CS and reset low
+	mxgpioregs[0x724/4] = 0x10000; //clk high
+	usleep(1);
+	mxgpioregs[0x714/4] = 0x20000; //reset high
+	usleep(201);                   
+	mxgpioregs[0x158/4] = 0x3; //Set clk back to SPI
+
+	file = xopen(filename);
+	if(!file) return -2;
+
+	memstore(file);
+	if (pclose(file) == -1) fclose(file);
+	file = NULL;
+	
+	ret = ioctl(spidev, SPI_IOC_WR_MODE, &mode);
+	if(ret == -1) return ret;
+	ret = ioctl(spidev, SPI_IOC_RD_MODE, &mode);
+	if(ret == -1) return ret;
+	tr.tx_buf = (unsigned long)memstore_buf;
+
+	nbuslock();
+	for(;memstore_len > 0;) {
+		tr.tx_buf += tr.len;
+		if(memstore_len < 2048) tr.len = memstore_len;
+		else tr.len = 2048;
+
+		memstore_len -= tr.len;
+				
+		ret = ioctl(spidev, SPI_IOC_MESSAGE(1), &tr);
+		if(ret < 1) return ret;
+	}
+
+	if(!(mxgpioregs[0x930/4] & 0x4)) return -1;
+
+	tr.len = 49;
+	ret = ioctl(spidev, SPI_IOC_MESSAGE(1), &tr);
+	if(ret < 1) return ret;
+
+	return 0;
+
+	
+}
diff --git a/package/ts4600-tshwctl/src/ispvm.c b/package/ts4600-tshwctl/src/ispvm.c
new file mode 100644
index 0000000..7d73730
--- /dev/null
+++ b/package/ts4600-tshwctl/src/ispvm.c
@@ -0,0 +1,3408 @@
+/***************************************************************
+*
+* Lattice Semiconductor Corp. Copyright 2008
+*
+* ispVME Embedded allows programming of Lattice's suite of FPGA
+* devices on embedded systems through the JTAG port.  The software
+* is distributed in source code form and is open to re - distribution
+* and modification where applicable.
+*
+* Revision History of ivm_core.c module:
+* 4/25/06 ht   Change some variables from unsigned short or int
+*              to long int to make the code compiler independent.
+* 5/24/06 ht   Support using RESET (TRST) pin as a special purpose				
+*              control pin such as triggering the loading of known 				
+*              state exit. 
+* 3/6/07 ht added functions to support output to terminals
+* 
+* 09/24/07 NN Type cast mismatch variables
+*		   Moved the sclock() function to hardware.c
+***************************************************************/
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sched.h>
+#include <assert.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include "vmopcode.h"
+
+#define SLOWISPVMSEND
+
+static unsigned int gpiostate;
+extern volatile unsigned int *mxgpioregs;
+
+/***************************************************************
+*
+* Global variables used to specify the flow control and data type.
+*
+*	g_usFlowControl:	flow control register. Each bit in the
+*                               register can potentially change the
+*                               personality of the embedded engine.
+*	g_usDataType:		holds the data type of the current row.
+*
+***************************************************************/
+
+static unsigned short g_usFlowControl	= 0x0000;
+static unsigned short g_usDataType		= 0x0000;
+
+/***************************************************************
+*
+* Global variables used to specify the ENDDR and ENDIR.
+*
+*	g_ucEndDR:		the state that the device goes to after SDR.
+*	g_ucEndIR:		the state that the device goes to after SIR.
+*
+***************************************************************/
+
+static unsigned char g_ucEndDR = DRPAUSE;
+static unsigned char g_ucEndIR = IRPAUSE;
+
+/***************************************************************
+*
+* Global variables used to support header/trailer.
+*
+*	g_usHeadDR:		the number of lead devices in bypass.
+*	g_usHeadIR:		the sum of IR length of lead devices.
+*	g_usTailDR:		the number of tail devices in bypass.
+*	g_usTailIR:		the sum of IR length of tail devices.
+*
+***************************************************************/
+
+static unsigned short g_usHeadDR = 0;
+static unsigned short g_usHeadIR = 0;
+static unsigned short g_usTailDR = 0;
+static unsigned short g_usTailIR = 0;
+
+/***************************************************************
+*
+* Global variable to store the number of bits of data or instruction
+* to be shifted into or out from the device.
+*
+***************************************************************/
+
+static unsigned short g_usiDataSize = 0;
+
+/***************************************************************
+*
+* Stores the frequency. Default to 1 MHz.
+*
+***************************************************************/
+
+static int g_iFrequency = 1000;
+
+/***************************************************************
+*
+* Stores the maximum amount of ram needed to hold a row of data.
+*
+***************************************************************/
+
+static unsigned short g_usMaxSize = 0;
+
+/***************************************************************
+*
+* Stores the LSH or RSH value.
+*
+***************************************************************/
+
+static unsigned short g_usShiftValue = 0;
+
+/***************************************************************
+*
+* Stores the current repeat loop value.
+*
+***************************************************************/
+
+static unsigned short g_usRepeatLoops = 0;
+
+/***************************************************************
+*
+* Stores the current vendor.
+*
+***************************************************************/
+
+static signed char g_cVendor = LATTICE;
+
+/***************************************************************
+*
+* Stores the VME file CRC.
+*
+***************************************************************/
+
+static unsigned short g_usCalculatedCRC = 0;
+
+/***************************************************************
+*
+* Stores the current state of the JTAG state machine.
+*
+***************************************************************/
+
+static signed char g_cCurrentJTAGState = 0;
+
+/***************************************************************
+*
+* Global variables used to support looping.
+*
+*	g_pucHeapMemory:	holds the entire repeat loop.
+*	g_iHeapCounter:		points to the current byte in the repeat loop.
+*	g_iHEAPSize:		the current size of the repeat in bytes.
+*
+***************************************************************/
+
+static unsigned char * g_pucHeapMemory		= NULL;
+static unsigned short g_iHeapCounter		= 0;
+static unsigned short g_iHEAPSize          = 0;
+
+/***************************************************************
+*
+* Global variables used to support intelligent programming.
+*
+*	g_usIntelDataIndex:     points to the current byte of the
+*                               intelligent buffer.
+*	g_usIntelBufferSize:	holds the size of the intelligent
+*                               buffer.
+*
+***************************************************************/
+
+static unsigned short g_usIntelDataIndex	= 0;
+static unsigned short g_usIntelBufferSize	= 0;
+
+/****************************************************************************
+*
+* Holds the maximum size of each respective buffer. These variables are used
+* to write the HEX files when converting VME to HEX.
+*
+*****************************************************************************/
+
+static unsigned short g_usTDOSize      = 0;
+static unsigned short g_usMASKSize		= 0;
+static unsigned short g_usTDISize		= 0;
+static unsigned short g_usDMASKSize    = 0;
+static unsigned short g_usLCOUNTSize   = 0;
+static unsigned short g_usHDRSize		= 0;
+static unsigned short g_usTDRSize		= 0;
+static unsigned short g_usHIRSize		= 0;
+static unsigned short g_usTIRSize		= 0;
+static unsigned short g_usHeapSize		= 0;
+
+/***************************************************************
+*
+* Global variables used to store data.
+*
+*   g_pucOutMaskData:		local RAM to hold one row of MASK data.
+*   g_pucInData:			local RAM to hold one row of TDI data.
+*	g_pucOutData:			local RAM to hold one row of TDO data.
+*	g_pucHIRData:			local RAM to hold the current SIR header.
+*	g_pucTIRData:			local RAM to hold the current SIR trailer.
+*	g_pucHDRData:			local RAM to hold the current SDR header.
+*	g_pucTDRData:			local RAM to hold the current SDR trailer.
+*	g_pucIntelBuffer:		local RAM to hold the current intelligent buffer.
+*   g_pucOutDMaskData:		local RAM to hold one row of DMASK data.
+*
+***************************************************************/
+
+static unsigned char * g_pucOutMaskData	= NULL,
+              * g_pucInData         = NULL,
+              * g_pucOutData		= NULL,
+              * g_pucHIRData		= NULL,
+              * g_pucTIRData		= NULL,
+              * g_pucHDRData		= NULL,
+              * g_pucTDRData		= NULL,
+              * g_pucIntelBuffer	= NULL,
+              * g_pucOutDMaskData	= NULL;
+
+/***************************************************************
+*
+* JTAG state machine transition table.
+*
+***************************************************************/
+
+struct {
+	 unsigned char  CurState;  /* From this state */
+	 unsigned char  NextState; /* Step to this state */
+	 unsigned char  Pattern;   /* The tragetory of TMS */
+	 unsigned char  Pulses;    /* The number of steps */
+} g_JTAGTransistions[ 25 ] = {
+{ RESET,	RESET,		0xFC, 6 },	/* Transitions from RESET */
+{ RESET,	IDLE,		0x00, 1 },
+{ RESET,	DRPAUSE,	0x50, 5 },   
+{ RESET,	IRPAUSE,	0x68, 6 },   
+{ IDLE,		RESET,		0xE0, 3 },	/* Transitions from IDLE */
+{ IDLE,		DRPAUSE,	0xA0, 4 },
+{ IDLE,		IRPAUSE,	0xD0, 5 },
+{ DRPAUSE,	RESET,		0xF8, 5 },	/* Transitions from DRPAUSE */
+{ DRPAUSE,	IDLE,		0xC0, 3 },
+{ DRPAUSE,	IRPAUSE,	0xF4, 7 },
+{ DRPAUSE,	DRPAUSE,	0xE8, 6 },  /* 06/14/06 Support POLING STATUS LOOP*/
+{ IRPAUSE,	RESET,		0xF8, 5 },	/* Transitions from IRPAUSE */
+{ IRPAUSE,	IDLE,		0xC0, 3 },
+{ IRPAUSE,	DRPAUSE,	0xE8, 6 },
+{ DRPAUSE,	SHIFTDR,	0x80, 2 },  /* Extra transitions using SHIFTDR */
+{ IRPAUSE,	SHIFTDR,	0xE0, 5 },
+{ SHIFTDR,	DRPAUSE,	0x80, 2 },
+{ SHIFTDR,	IDLE,		0xC0, 3 },
+{ IRPAUSE,	SHIFTIR,	0x80, 2 },	/* Extra transitions using SHIFTIR */
+{ SHIFTIR,	IRPAUSE,	0x80, 2 },
+{ SHIFTIR,	IDLE,		0xC0, 3 },
+{ DRPAUSE,	DRCAPTURE,	0xE0, 4 }, /* 11/15/05 Support DRCAPTURE*/
+{ DRCAPTURE, DRPAUSE,	0x80, 2 },
+{ IDLE,     DRCAPTURE,	0x80, 2 },
+{ IRPAUSE,  DRCAPTURE, 	0xE0, 4 }
+};
+
+/***************************************************************
+*
+* List to hold all LVDS pairs.
+*
+***************************************************************/
+
+static LVDSPair * g_pLVDSList           = NULL;
+static unsigned short g_usLVDSPairCount = 0;
+
+/***************************************************************
+*
+* Function prototypes.
+*
+***************************************************************/
+
+static signed char ispVMCode();
+static signed char ispVMDataCode();
+static long int ispVMDataSize();
+static void ispVMData( unsigned char * Data );
+static signed char ispVMShift( signed char Code );
+static signed char ispVMAmble( signed char Code );
+static signed char ispVMLoop( unsigned short a_usLoopCount );
+static signed char ispVMBitShift( signed char mode, unsigned short bits );
+static void ispVMComment( unsigned short a_usCommentSize );
+static void ispVMHeader( unsigned short a_usHeaderSize );
+static signed char ispVMLCOUNT( unsigned short a_usCountSize );
+static void ispVMClocks( unsigned short Clocks );
+static void ispVMBypass( signed char ScanType, unsigned short Bits );
+static void ispVMStateMachine( signed char NextState );
+static void ispVMStart();
+static void ispVMEnd();
+static signed char ispVMSend(unsigned short int);
+static signed char ispVMRead(unsigned short int);
+static signed char ispVMReadandSave(unsigned short int);
+static signed char ispVMProcessLVDS( unsigned short a_usLVDSCount );
+static void hardware_init(void);
+
+
+/***************************************************************
+*
+* External variables and functions in ispvm_ui.c module
+*
+***************************************************************/
+static unsigned char GetByte();
+static void ispVMMemManager( signed char types, unsigned short size );
+
+/***************************************************************
+*
+* External variables and functions in hardware.c module
+*
+***************************************************************/
+static void ispVMDelay( unsigned short int a_usMicroSecondDelay );
+static inline int readPort();
+static inline void writePort( int pins, int value );
+static inline void sclock();
+static signed char g_cCurrentJTAGState;
+static const unsigned int g_ucPinTDI;
+static const unsigned int g_ucPinTCK;
+static const unsigned int g_ucPinTMS;
+static const unsigned int g_ucPinENABLE;
+static const unsigned int g_ucPinTRST;
+static const unsigned int g_ucPinTDO;
+
+#ifdef VME_DEBUG
+
+/***************************************************************
+*
+* GetState
+*
+* Returns the state as a string based on the opcode. Only used
+* for debugging purposes.
+*
+***************************************************************/
+
+static const char * GetState( unsigned char a_ucState )
+{
+	switch( a_ucState ) {
+	case RESET:
+		return( "RESET" );
+	case IDLE:
+		return( "IDLE" );
+	case IRPAUSE:
+		return( "IRPAUSE" );
+	case DRPAUSE:
+		return( "DRPAUSE" );
+	case SHIFTIR:
+		return( "SHIFTIR" );
+	case SHIFTDR:
+		return( "SHIFTDR" );
+	case DRCAPTURE:/* 11/15/05 support DRCAPTURE*/
+		return( "DRCAPTURE" );
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/***************************************************************
+*
+* PrintData
+*
+* Prints the data. Only used for debugging purposes.
+*
+***************************************************************/
+
+static void PrintData( unsigned short a_iDataSize, unsigned char * a_pucData )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short usByteSize  = 0;
+	unsigned short usBitIndex  = 0;
+	unsigned short usByteIndex = 0;
+	unsigned char ucByte       = 0;
+	unsigned char ucFlipByte   = 0;
+
+	if ( a_iDataSize % 8 ) {
+		//09/11/07 NN Type cast mismatch variables
+		usByteSize = (unsigned short)(a_iDataSize / 8 + 1);
+	}
+	else {
+		//09/11/07 NN Type cast mismatch variables
+		usByteSize = (unsigned short)(a_iDataSize / 8);
+	}
+	printf( "(" );
+	//09/11/07 NN Type cast mismatch variables
+	for ( usByteIndex = (unsigned short)(usByteSize - 1); usByteIndex >= 0; usByteIndex-- ) {
+		ucByte = a_pucData[ usByteIndex ];
+		ucFlipByte = 0x00;
+
+		/***************************************************************
+		*
+		* Flip each byte.
+		*
+		***************************************************************/
+
+		for ( usBitIndex = 0; usBitIndex < 8; usBitIndex++ ) {
+			ucFlipByte <<= 1;
+			if ( ucByte & 0x1) {
+				ucFlipByte |= 0x1;
+			}
+
+			ucByte >>= 1;
+		}
+
+		/***************************************************************
+		*
+		* Print the flipped byte.
+		*
+		***************************************************************/
+
+		printf( "%.02X", ucFlipByte );
+		if ( ( usByteSize - usByteIndex ) % 40 == 39 ) {
+			printf( "\n\t\t" );
+		}
+	}
+	printf( ")" );
+}
+#endif //VME_DEBUG
+
+/***************************************************************
+*
+* ispVMDataSize
+*
+* Returns a VME-encoded number, usually used to indicate the
+* bit length of an SIR/SDR command.
+*
+***************************************************************/
+
+static long int ispVMDataSize()
+{
+	//09/11/07 NN added local variables initialization
+	long int iSize           = 0;
+	signed char cCurrentByte = 0;
+	signed char cIndex       = 0;
+	cIndex = 0;
+	while ( ( cCurrentByte = GetByte() ) & 0x80 ) {
+		iSize |= ( ( long int ) ( cCurrentByte & 0x7F ) ) << cIndex;
+		cIndex += 7;
+	}
+	iSize |= ( ( long int ) ( cCurrentByte & 0x7F ) ) << cIndex;
+	return iSize;
+}
+
+/***************************************************************
+*
+* ispVMCode
+*
+* This is the heart of the embedded engine. All the high-level opcodes
+* are extracted here. Once they have been identified, then it
+* will call other functions to handle the processing.
+*
+***************************************************************/
+
+static signed char ispVMCode()
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short iRepeatSize = 0;
+	signed char cOpcode		   = 0;
+	signed char cRetCode       = 0;
+	unsigned char ucState      = 0;
+	unsigned short usDelay     = 0;
+	unsigned short usToggle    = 0;
+	unsigned char usByte       = 0;
+
+	/***************************************************************
+	*
+	* Check the compression flag only if this is the first time
+	* this function is entered. Do not check the compression flag if
+	* it is being called recursively from other functions within
+	* the embedded engine.
+	*
+	***************************************************************/
+
+	if ( !( g_usDataType & LHEAP_IN ) && !( g_usDataType & HEAP_IN ) ) {
+		usByte = GetByte();
+		if ( usByte == 0xf1 ) {
+			g_usDataType |= COMPRESS;
+		}
+		else if ( usByte == 0xf2 ) {
+			g_usDataType &= ~COMPRESS;
+		}
+		else {
+			return VME_INVALID_FILE;
+		}
+	}
+	
+	/***************************************************************
+	*
+	* Begin looping through all the VME opcodes.
+	*
+	***************************************************************/
+
+	while ( ( cOpcode = GetByte() ) >= 0 ) {
+
+		switch ( cOpcode ) {
+		case STATE:
+
+			/***************************************************************
+			*
+			* Step the JTAG state machine.
+			*
+			***************************************************************/
+
+			ucState = GetByte();
+
+			/***************************************************************
+			*
+			* Step the JTAG state machine to DRCAPTURE to support Looping.
+			*
+			***************************************************************/
+
+			if ( (g_usDataType & LHEAP_IN) &&
+				 (ucState == DRPAUSE ) &&
+				 ( g_cCurrentJTAGState == ucState ))
+			{
+				ispVMStateMachine( DRCAPTURE );
+			}
+
+			ispVMStateMachine( ucState );
+
+#ifdef VME_DEBUG
+			if ( g_usDataType & LHEAP_IN ) {
+				printf( "LDELAY %s ", GetState( ucState ) );
+			}
+			else {
+				printf( "STATE %s;\n", GetState( ucState ) );
+			}
+#endif //VME_DEBUG
+			break;
+		case SIR:
+		case SDR:
+		case XSDR:
+
+#ifdef VME_DEBUG
+			switch( cOpcode ) {
+			case SIR:
+				printf( "SIR " );
+				break;
+			case SDR:
+			case XSDR:
+				if ( g_usDataType & LHEAP_IN ) {
+					printf( "LSDR " );
+				}
+				else {
+					printf( "SDR " );
+				}
+				break;
+			}
+#endif //VME_DEBUG
+			/***************************************************************
+			*
+			* Shift in data into the device.
+			*
+			***************************************************************/
+
+			cRetCode = ispVMShift( cOpcode );
+			if ( cRetCode != 0 ) {
+				return ( cRetCode );
+			}
+			break;
+		case WAIT:
+
+			/***************************************************************
+			*
+			* Observe delay.
+			*
+			***************************************************************/
+
+			//09/11/07 NN Type cast mismatch variables
+			usDelay = (unsigned short) ispVMDataSize();
+			ispVMDelay( usDelay );
+
+#ifdef VME_DEBUG
+			if ( usDelay & 0x8000 ) {
+
+				/***************************************************************
+				*
+				* Since MSB is set, the delay time must be decoded to 
+				* millisecond. The SVF2VME encodes the MSB to represent 
+				* millisecond.
+				*
+				***************************************************************/
+
+				usDelay &= ~0x8000;
+				if ( g_usDataType & LHEAP_IN ) {
+					printf( "%.2E SEC;\n", ( float ) usDelay / 1000 );
+				}
+				else {
+					printf( "RUNTEST %.2E SEC;\n", ( float ) usDelay / 1000 );
+				}
+			}
+			else {                       
+				
+				/***************************************************************
+				*
+				* Since MSB is not set, the delay time is given as microseconds.
+				*
+				***************************************************************/
+
+				if ( g_usDataType & LHEAP_IN ) {
+					printf( "%.2E SEC;\n", ( float ) usDelay / 1000000 );
+				}
+				else {
+					printf( "RUNTEST %.2E SEC;\n", ( float ) usDelay / 1000000 );
+				}
+			}
+#endif //VME_DEBUG
+			break;
+		case TCK:
+
+			/***************************************************************
+			*
+			* Issue clock toggles.
+			*
+			***************************************************************/
+
+			//09/11/07 NN Type cast mismatch variables
+			usToggle = (unsigned short) ispVMDataSize();
+			ispVMClocks( usToggle );
+
+#ifdef VME_DEBUG
+			printf( "RUNTEST %d TCK;\n", usToggle );
+#endif //VME_DEBUG
+			break;
+		case ENDDR:
+
+			/***************************************************************
+			*
+			* Set the ENDDR.
+			*
+			***************************************************************/
+
+			g_ucEndDR = GetByte();
+
+#ifdef VME_DEBUG
+			printf( "ENDDR %s;\n", GetState( g_ucEndDR ) );
+#endif //VME_DEBUG
+			break;
+		case ENDIR:
+
+			/***************************************************************
+			*
+			* Set the ENDIR.
+			*
+			***************************************************************/
+
+			g_ucEndIR = GetByte();
+
+#ifdef VME_DEBUG
+			printf( "ENDIR %s;\n", GetState( g_ucEndIR ) );
+#endif //VME_DEBUG
+			break;
+		case HIR:
+		case TIR:
+		case HDR:
+		case TDR:
+
+#ifdef VME_DEBUG
+			switch( cOpcode ) {
+			case HIR:
+				printf( "HIR " );
+				break;
+			case TIR:
+				printf( "TIR " );
+				break;
+			case HDR:
+				printf( "HDR " );
+				break;
+			case TDR:
+				printf( "TDR " );
+				break;
+			}
+#endif //VME_DEBUG
+			
+			/***************************************************************
+			*
+			* Set the header/trailer of the device in order to bypass
+			* successfully.
+			*
+			***************************************************************/
+
+			cRetCode = ispVMAmble( cOpcode );
+			if ( cRetCode != 0 ) {
+				return ( cRetCode );
+			}
+
+#ifdef VME_DEBUG
+			printf( ";\n" );
+#endif //VME_DEBUG
+			break;
+		case MEM:
+
+			/***************************************************************
+			*
+			* The maximum RAM required to support processing one row of the
+			* VME file.
+			*
+			***************************************************************/
+
+			//09/11/07 NN Type cast mismatch variables
+			g_usMaxSize = (unsigned short) ispVMDataSize();
+
+#ifdef VME_DEBUG
+			printf( "// MEMSIZE %d\n", g_usMaxSize );
+#endif //VME_DEBUG
+			break;
+		case VENDOR:
+
+			/***************************************************************
+			*
+			* Set the VENDOR type.
+			*
+			***************************************************************/
+
+			cOpcode = GetByte();
+			switch ( cOpcode ) {
+			case LATTICE:
+#ifdef VME_DEBUG
+				printf( "// VENDOR LATTICE\n" );
+#endif //VME_DEBUG
+				g_cVendor = LATTICE;
+				break;
+			case ALTERA:
+#ifdef VME_DEBUG
+				printf( "// VENDOR ALTERA\n" );
+#endif //VME_DEBUG
+				g_cVendor = ALTERA;
+				break;
+			case XILINX:
+#ifdef VME_DEBUG
+				printf( "// VENDOR XILINX\n" );
+#endif //VME_DEBUG
+				g_cVendor = XILINX;
+				break;
+			default:
+				break;
+			}
+			break;
+		case SETFLOW:
+
+			/***************************************************************
+			*
+			* Set the flow control. Flow control determines the personality
+			* of the embedded engine.
+			*
+			***************************************************************/
+
+			//09/11/07 NN Type cast mismatch variables
+			g_usFlowControl |= (unsigned short) ispVMDataSize();
+			break;
+		case RESETFLOW:
+
+			/***************************************************************
+			*
+			* Unset the flow control.
+			*
+			***************************************************************/
+
+			//09/11/07 NN Type cast mismatch variables
+			g_usFlowControl &= (unsigned short) ~( ispVMDataSize() );
+			break;
+		case HEAP:
+
+			/***************************************************************
+			*
+			* Allocate heap size to store loops.
+			*
+			***************************************************************/
+
+			cRetCode = GetByte();
+			if ( cRetCode != SECUREHEAP ) {
+				return VME_INVALID_FILE;
+			}
+			//09/11/07 NN Type cast mismatch variables
+			g_iHEAPSize = (unsigned short) ispVMDataSize();
+
+			/****************************************************************************
+			*
+			* Store the maximum size of the HEAP buffer. Used to convert VME to HEX.
+			*
+			*****************************************************************************/
+
+			if ( g_iHEAPSize > g_usHeapSize ) {
+				g_usHeapSize = g_iHEAPSize;
+			}
+
+			ispVMMemManager( HEAP, ( unsigned short ) g_iHEAPSize );
+			break;
+		case REPEAT:
+
+			/***************************************************************
+			*
+			* Execute loops.
+			*
+			***************************************************************/
+
+			g_usRepeatLoops = 0;
+
+			//09/11/07 NN Type cast mismatch variables
+			iRepeatSize = (unsigned short) ispVMDataSize();
+			
+			cRetCode = ispVMLoop( ( unsigned short ) iRepeatSize );
+			if ( cRetCode != 0 ) {
+				return ( cRetCode );
+			}
+			break;
+		case ENDLOOP:
+
+			/***************************************************************
+			*
+			* Exit point from processing loops.
+			*
+			***************************************************************/
+
+			return ( cRetCode );
+		case ENDVME:
+
+			/***************************************************************
+			*
+			* The only valid exit point that indicates end of programming.
+			*
+			***************************************************************/
+
+			return ( cRetCode );
+		case SHR:
+
+			/***************************************************************
+			*
+			* Right-shift address.
+			*
+			***************************************************************/
+
+			g_usFlowControl |= SHIFTRIGHT;
+
+			//09/11/07 NN Type cast mismatch variables
+			g_usShiftValue = (unsigned short) (g_usRepeatLoops * (unsigned short)GetByte());
+			break;
+		case SHL:
+
+			/***************************************************************
+			*
+			* Left-shift address.
+			*
+			***************************************************************/
+
+			g_usFlowControl |= SHIFTLEFT;
+
+			//09/11/07 NN Type cast mismatch variables
+			g_usShiftValue = (unsigned short)(g_usRepeatLoops * (unsigned short)GetByte());
+			break;
+		case FREQUENCY:
+
+			/***************************************************************
+			*
+			* Set the frequency.
+			*
+			***************************************************************/
+
+			//09/11/07 NN Type cast mismatch variables
+			g_iFrequency = (int) (ispVMDataSize() / 1000);
+			//06/27/06 Added to make the frequency compatibles with version 10
+			if(g_iFrequency == 1)
+				g_iFrequency = 1000;
+
+#ifdef VME_DEBUG
+			printf( "FREQUENCY %.2E HZ;\n", ( float ) g_iFrequency * 1000 );
+#endif //VME_DEBUG
+			break;
+		case LCOUNT:
+
+			/***************************************************************
+			*
+			* Process LCOUNT command.
+			*
+			***************************************************************/
+
+			cRetCode = ispVMLCOUNT( ( unsigned short ) ispVMDataSize() );
+			if ( cRetCode != 0 ) {
+				return ( cRetCode );
+			}
+			break;
+		case VUES:
+
+			/***************************************************************
+			*
+			* Set the flow control to verify USERCODE.
+			*
+			***************************************************************/
+
+			g_usFlowControl |= VERIFYUES;
+			break;
+		case COMMENT:
+
+			/***************************************************************
+			*
+			* Display comment.
+			*
+			***************************************************************/
+
+			ispVMComment( ( unsigned short ) ispVMDataSize() );
+			break;
+		case LVDS:
+
+			/***************************************************************
+			*
+			* Process LVDS command.
+			*
+			***************************************************************/
+
+			ispVMProcessLVDS( ( unsigned short ) ispVMDataSize() );
+			break;
+		case HEADER:
+
+			/***************************************************************
+			*
+			* Discard header.
+			*
+			***************************************************************/
+
+			ispVMHeader( ( unsigned short ) ispVMDataSize() );
+			break;
+		/* 03/14/06 Support Toggle ispENABLE signal*/
+		case ispEN:
+			ucState = GetByte();
+			if((ucState == ON)||(ucState == 0x01))
+				writePort( g_ucPinENABLE, 0x01 );
+			else
+				writePort( g_ucPinENABLE, 0x00 );
+			ispVMDelay( 1 );
+			break;	
+        /* 05/24/06 support Toggle TRST pin*/
+		case TRST:
+			ucState = GetByte();
+			if(ucState == 0x01)
+				writePort( g_ucPinTRST, 0x01 );
+			else
+				writePort( g_ucPinTRST, 0x00 );
+			ispVMDelay( 1 );
+			break;	                
+		default:
+
+			/***************************************************************
+			*
+			* Invalid opcode encountered.
+			*
+			***************************************************************/
+
+#ifdef VME_DEBUG
+			printf( "\nINVALID OPCODE: 0x%.2X\n", cOpcode );
+#endif //VME_DEBUG
+
+			return VME_INVALID_FILE;
+		}
+	}
+	
+	/***************************************************************
+	*
+	* Invalid exit point. Processing the token 'ENDVME' is the only
+	* valid way to exit the embedded engine.
+	*
+	***************************************************************/
+
+	return ( VME_INVALID_FILE ); 
+}
+
+/***************************************************************
+*
+* ispVMDataCode
+*
+* Processes the TDI/TDO/MASK/DMASK etc of an SIR/SDR command.
+*
+***************************************************************/
+
+static signed char ispVMDataCode()
+{
+	//09/11/07 NN added local variables initialization
+	signed char cDataByte    = 0;
+	signed char siDataSource = 0;  /*source of data from file by default*/
+	
+	if ( g_usDataType & HEAP_IN ) {
+		siDataSource = 1;  /*the source of data from memory*/
+	}
+	
+	/****************************************************************************
+	*
+	* Clear the data type register.
+	*
+	*****************************************************************************/
+
+	g_usDataType &= ~( MASK_DATA + TDI_DATA + TDO_DATA + DMASK_DATA );
+	
+	/****************************************************************************
+	*
+	* Iterate through SIR/SDR command and look for TDI, TDO, MASK, etc.
+	*
+	*****************************************************************************/
+
+	while ( ( cDataByte = GetByte() ) >= 0 ) { 
+
+			ispVMMemManager( cDataByte, g_usMaxSize );
+			switch ( cDataByte ) {
+			case TDI:
+
+				/****************************************************************************
+				*
+				* Store the maximum size of the TDI buffer. Used to convert VME to HEX.
+				*
+				*****************************************************************************/
+
+				if ( g_usiDataSize > g_usTDISize ) {
+					g_usTDISize = g_usiDataSize;
+				}
+				/****************************************************************************
+				*
+				* Updated data type register to indicate that TDI data is currently being
+				* used. Process the data in the VME file into the TDI buffer.
+				*
+				*****************************************************************************/
+
+				g_usDataType |= TDI_DATA;
+				ispVMData( g_pucInData );
+				break;
+			case XTDO:
+
+				/****************************************************************************
+				*
+				* Store the maximum size of the TDO buffer. Used to convert VME to HEX.
+				*
+				*****************************************************************************/
+
+				if ( g_usiDataSize > g_usTDOSize ) {
+					g_usTDOSize = g_usiDataSize;
+				}
+
+				/****************************************************************************
+				*
+				* Updated data type register to indicate that TDO data is currently being
+				* used.
+				*
+				*****************************************************************************/
+
+				g_usDataType |= TDO_DATA;
+				break;
+            case TDO:
+
+				/****************************************************************************
+				*
+				* Store the maximum size of the TDO buffer. Used to convert VME to HEX.
+				*
+				*****************************************************************************/
+
+				if ( g_usiDataSize > g_usTDOSize ) {
+					g_usTDOSize = g_usiDataSize;
+				}
+
+				/****************************************************************************
+				*
+				* Updated data type register to indicate that TDO data is currently being
+				* used. Process the data in the VME file into the TDO buffer.
+				*
+				*****************************************************************************/
+
+				g_usDataType |= TDO_DATA;
+				ispVMData( g_pucOutData );
+				break;
+            case MASK:
+
+				/****************************************************************************
+				*
+				* Store the maximum size of the MASK buffer. Used to convert VME to HEX.
+				*
+				*****************************************************************************/
+
+				if ( g_usiDataSize > g_usMASKSize ) {
+					g_usMASKSize = g_usiDataSize;
+				}
+
+				/****************************************************************************
+				*
+				* Updated data type register to indicate that MASK data is currently being
+				* used. Process the data in the VME file into the MASK buffer.
+				*
+				*****************************************************************************/
+
+				g_usDataType |= MASK_DATA;
+				ispVMData( g_pucOutMaskData );
+				break;
+			case DMASK:
+
+				/****************************************************************************
+				*
+				* Store the maximum size of the DMASK buffer. Used to convert VME to HEX.
+				*
+				*****************************************************************************/
+
+				if ( g_usiDataSize > g_usDMASKSize ) {
+					g_usDMASKSize = g_usiDataSize;
+				}
+
+				/****************************************************************************
+				*
+				* Updated data type register to indicate that DMASK data is currently being
+				* used. Process the data in the VME file into the DMASK buffer.
+				*
+				*****************************************************************************/
+
+				g_usDataType |= DMASK_DATA;
+				ispVMData( g_pucOutDMaskData );
+				break;
+			case CONTINUE:
+				return ( 0 );
+			default:      
+				
+				/****************************************************************************
+				*
+				* Encountered invalid opcode.
+				*
+				*****************************************************************************/
+
+				return ( VME_INVALID_FILE );
+			}
+			
+			switch ( cDataByte ) {
+			case TDI:
+
+				/****************************************************************************
+				*
+				* Left bit shift. Used when performing algorithm looping.
+				*
+				*****************************************************************************/
+
+				if ( g_usFlowControl & SHIFTLEFT ) {
+					ispVMBitShift( SHL, g_usShiftValue );
+					g_usFlowControl &= ~SHIFTLEFT;
+				}
+
+				/****************************************************************************
+				*
+				* Right bit shift. Used when performing algorithm looping.
+				*
+				*****************************************************************************/
+
+				if ( g_usFlowControl & SHIFTRIGHT ) {
+					ispVMBitShift( SHR, g_usShiftValue );
+					g_usFlowControl &= ~SHIFTRIGHT;
+				}               
+			default:
+				break;
+			}
+			
+			if ( siDataSource ) {
+				g_usDataType |= HEAP_IN;  /*restore data from memory*/
+			}
+	}
+	
+	if ( siDataSource ) {  /*fetch data from heap memory upon return*/
+		g_usDataType |= HEAP_IN;
+	}
+
+	if ( cDataByte < 0 ) {
+
+		/****************************************************************************
+		*
+		* Encountered invalid opcode.
+		*
+		*****************************************************************************/
+
+		return ( VME_INVALID_FILE );
+	}
+	else {
+		return ( 0 );
+	}
+}
+
+/***************************************************************
+*
+* ispVMData
+* Extract one row of data operand from the current data type opcode. Perform
+* the decompression if necessary. Extra RAM is not required for the
+* decompression process. The decompression scheme employed in this module
+* is on row by row basis. The format of the data stream:
+* [compression code][compressed data stream]
+* 0x00    --No compression
+* 0x01    --Compress by 0x00.
+*           Example:
+*           Original stream:   0x000000000000000000000001
+*           Compressed stream: 0x01000901
+*           Detail:            0x01 is the code, 0x00 is the key, 
+*                              0x09 is the count of 0x00 bytes,
+*                              0x01 is the uncompressed byte.
+* 0x02    --Compress by 0xFF.
+*           Example:
+*           Original stream:   0xFFFFFFFFFFFFFFFFFFFFFF01
+*           Compressed stream: 0x02FF0901
+*           Detail:            0x02 is the code, 0xFF is the key, 
+*                              0x09 is the count of 0xFF bytes,
+*                              0x01 is the uncompressed byte.
+* 0x03
+* : :
+* 0xFE   -- Compress by nibble blocks.
+*           Example:
+*           Original stream:   0x84210842108421084210
+*           Compressed stream: 0x0584210
+*           Detail:            0x05 is the code, means 5 nibbles block.
+*                              0x84210 is the 5 nibble blocks.
+*                              The whole row is 80 bits given by g_usiDataSize.
+*                              The number of times the block repeat itself
+*                              is found by g_usiDataSize/(4*0x05) which is 4.
+* 0xFF   -- Compress by the most frequently happen byte.
+*           Example:
+*           Original stream:   0x04020401030904040404
+*           Compressed stream: 0xFF04(0,1,0x02,0,1,0x01,1,0x03,1,0x09,0,0,0)
+*                          or: 0xFF044090181C240
+*           Detail:            0xFF is the code, 0x04 is the key.
+*                              a bit of 0 represent the key shall be put into
+*                              the current bit position and a bit of 1
+*                              represent copying the next of 8 bits of data
+*                              in.
+*
+***************************************************************/
+
+static void ispVMData( unsigned char * ByteData )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short size               = 0;
+	unsigned short i, j, m, getData   = 0;
+	unsigned char cDataByte           = 0;
+	unsigned char compress            = 0;
+	unsigned short FFcount            = 0;
+	unsigned char compr_char          = 0xFF; 
+	unsigned short index              = 0;
+	signed char compression           = 0;
+	
+	/*convert number in bits to bytes*/
+	if (g_usiDataSize%8>0) {
+		//09/11/07 NN Type cast mismatch variables
+		size = (unsigned short)(g_usiDataSize/8 + 1);
+	}
+	else {
+		//09/11/07 NN Type cast mismatch variables
+		size = (unsigned short)(g_usiDataSize/8);
+	}
+	
+	/* If there is compression, then check if compress by key of 0x00 or 0xFF
+	   or by other keys or by nibble blocks*/
+	
+	if ( g_usDataType & COMPRESS ) {
+		compression = 1;
+		if ( ( ( compress = GetByte() ) == VAR ) && ( g_usDataType & HEAP_IN ) ) {
+			getData = 1;
+			g_usDataType &= ~(HEAP_IN);
+			compress = GetByte();
+		}
+		
+		switch (compress){
+		case 0x00:  
+			/* No compression */
+			compression = 0; 
+			break;            
+		case 0x01:  
+			/* Compress by byte 0x00 */
+			compr_char = 0x00;
+			break;
+		case 0x02: 
+			/* Compress by byte 0xFF */
+			compr_char = 0xFF;  
+			break;
+		case 0xFF: 
+			/* Huffman encoding */
+			compr_char = GetByte();
+			i = 8;
+			for ( index = 0; index < size; index++ ) {
+				ByteData[ index ] = 0x00;
+				if ( i > 7 ) {
+					cDataByte = GetByte(); 
+					i = 0;
+				}
+				if ((cDataByte << i++) & 0x80) 
+					m = 8;
+				else {
+					ByteData[index] = compr_char;
+					m = 0;
+				}
+				
+				for (j = 0; j < m; j++) {
+					if (i > 7) {
+						cDataByte = GetByte(); 
+						i = 0;
+					}
+					ByteData[index] |=((cDataByte << i++)&0x80) >> j;
+				} 
+			}     
+			size = 0;
+			break;
+		default:   
+			for (index = 0; index < size; index++) 
+				ByteData[index] = 0x00;
+			for (index = 0; index < compress; index++) {
+				if (index%2 == 0) 
+					cDataByte = GetByte();
+				for (i = 0; i < size*2/compress; i++){
+					//09/11/07 NN Type cast mismatch variables
+					j = (unsigned short)(index + (i*(unsigned short)compress));
+					/*clear the nibble to zero first*/
+					if (j%2) {
+						if (index%2) 
+							ByteData[j/2] |= cDataByte & 0x0F;
+						else 
+							ByteData[j/2] |= cDataByte >> 4;
+					}
+					else {
+						if (index%2) 
+							ByteData[j/2] |= cDataByte << 4;
+						else 
+							ByteData[j/2] |= cDataByte & 0xF0;
+					}
+				}
+			}
+			size = 0;
+			break;
+		}
+	}
+	
+	FFcount = 0;
+
+	/* Decompress by byte 0x00 or 0xFF */
+	for (index = 0; index < size; index++) {
+		if (FFcount <= 0) {
+			cDataByte = GetByte();
+			if ((cDataByte == VAR) && (g_usDataType&HEAP_IN) && !getData && !(g_usDataType&COMPRESS)) {
+				getData = 1;
+				g_usDataType &= ~(HEAP_IN);
+				cDataByte = GetByte();
+			}
+			ByteData[index] = cDataByte; 
+			if ((compression) &&(cDataByte == compr_char)) /*decompression is on*/
+				//09/11/07 NN Type cast mismatch variables
+				FFcount = (unsigned short) ispVMDataSize();     /*The number of 0xFF or 0x00 bytes*/
+		}
+		else {
+			FFcount--; /*Use up the 0xFF chain first*/
+			ByteData[index] = compr_char;
+		}
+	}
+	
+	if (getData) {
+		g_usDataType |= HEAP_IN;
+		getData = 0;
+	}
+}
+
+/***************************************************************
+*
+* ispVMShift
+*
+* Processes the SDR/XSDR/SIR commands.
+*
+***************************************************************/
+
+static signed char ispVMShift( signed char a_cCode )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short iDataIndex  = 0;
+	unsigned short iReadLoop   = 0;
+	signed char cRetCode       = 0;
+	
+	cRetCode=0;
+	//09/11/07 NN Type cast mismatch variables
+	g_usiDataSize = (unsigned short) ispVMDataSize();
+
+	g_usDataType &= ~( SIR_DATA + EXPRESS + SDR_DATA );   /*clear the flags first*/
+	switch ( a_cCode ) {
+	case SIR:
+		g_usDataType |= SIR_DATA;
+		/* 1/15/04 If performing cascading, then go directly to SHIFTIR.  Else, 
+		   go to IRPAUSE before going to SHIFTIR */
+		if ( g_usFlowControl & CASCADE ) {
+			ispVMStateMachine( SHIFTIR );
+		}
+		else {
+			ispVMStateMachine( IRPAUSE );
+			ispVMStateMachine( SHIFTIR );
+			if ( g_usHeadIR > 0 ){ 
+				ispVMBypass( HIR, g_usHeadIR );
+				sclock();
+			}
+		}
+		break;
+	case XSDR:  
+		g_usDataType |= EXPRESS; /*mark simultaneous in and out*/
+    case SDR:
+		g_usDataType |= SDR_DATA;
+		/* 1/15/04 If already in SHIFTDR, then do not move state or shift in header.  
+		   This would imply that the previously shifted frame was a cascaded frame.  */
+		if ( g_cCurrentJTAGState != SHIFTDR ) {
+			/* 1/15/04 If performing cascading, then go directly to SHIFTDR.  Else, 
+		       go to DRPAUSE before going to SHIFTDR */
+			if ( g_usFlowControl & CASCADE ) {
+				if ( g_cCurrentJTAGState == DRPAUSE ) {
+					ispVMStateMachine( SHIFTDR );
+					/* 1/15/04 If cascade flag has been set and the current state is 
+					   DRPAUSE, this implies that the first cascaded frame is about to
+					   be shifted in.  The header must be shifted prior to shifting
+					   the first cascaded frame. */
+					if ( g_usHeadDR > 0 ) {
+						ispVMBypass( HDR, g_usHeadDR );
+						sclock();
+					}
+				}
+				else {
+					ispVMStateMachine( SHIFTDR );
+				}
+			}
+			else {
+				ispVMStateMachine( DRPAUSE );
+				ispVMStateMachine( SHIFTDR );
+				if ( g_usHeadDR > 0 ) {
+					ispVMBypass( HDR, g_usHeadDR );
+					sclock();
+				}
+			}
+		}
+		break;
+	default:
+		return ( VME_INVALID_FILE );
+	}
+
+	cRetCode = ispVMDataCode();
+	
+	if ( cRetCode != 0 ) {
+		return ( VME_INVALID_FILE );
+	}
+
+#ifdef VME_DEBUG
+	printf( "%d ", g_usiDataSize );
+
+	if ( g_usDataType & TDI_DATA ) {
+		printf( "TDI " );
+		PrintData( g_usiDataSize, g_pucInData );
+	}
+
+	if ( g_usDataType & TDO_DATA ) {
+		printf( "\n\t\tTDO " );
+		PrintData( g_usiDataSize, g_pucOutData );
+	}
+
+	if ( g_usDataType & MASK_DATA ) {
+		printf( "\n\t\tMASK " );
+		PrintData( g_usiDataSize, g_pucOutMaskData );
+	}
+
+	if ( g_usDataType & DMASK_DATA ) {
+		printf( "\n\t\tDMASK " );
+		PrintData( g_usiDataSize, g_pucOutDMaskData );
+	}
+
+	printf( ";\n" );
+#endif //VME_DEBUG
+	
+	if ( g_usDataType & TDO_DATA || g_usDataType & DMASK_DATA ) {
+		if(g_usDataType & DMASK_DATA){
+			cRetCode = ispVMReadandSave( g_usiDataSize );
+			if(!cRetCode){
+				if ( g_usTailDR > 0 ) {
+					sclock();
+					ispVMBypass( TDR, g_usTailDR ); 
+				}
+				ispVMStateMachine( DRPAUSE );
+				ispVMStateMachine( SHIFTDR );
+				if( g_usHeadDR > 0 ){
+					ispVMBypass( HDR, g_usHeadDR );
+					sclock();
+				}
+				for ( iDataIndex=0; iDataIndex < g_usiDataSize / 8 + 1; iDataIndex++ )
+					g_pucInData[ iDataIndex ] = g_pucOutData[ iDataIndex ];
+				g_usDataType &= ~( TDO_DATA+ DMASK_DATA );	
+				cRetCode = ispVMSend( g_usiDataSize );
+			}
+		}
+		else{
+			cRetCode = ispVMRead( g_usiDataSize );
+			if ( cRetCode == -1 && g_cVendor == XILINX ) {
+				for( iReadLoop = 0; iReadLoop < 30; iReadLoop++ ){
+					cRetCode = ispVMRead( g_usiDataSize );
+					if( !cRetCode ) {
+						break;
+					}
+					else {
+						ispVMStateMachine( DRPAUSE ); /*Always DRPAUSE*/
+						/*Bypass other devices when appropriate*/
+						ispVMBypass( TDR, g_usTailDR );
+						ispVMStateMachine( g_ucEndDR );
+						ispVMStateMachine( IDLE );
+						ispVMDelay( 1000 );
+					}
+				}
+			}
+		}
+	}
+	else { /*TDI only*/
+		cRetCode = ispVMSend( g_usiDataSize );
+	}
+	
+	/*transfer the input data to the output buffer for the next verify*/
+	if ( ( g_usDataType & EXPRESS ) || ( a_cCode == SDR ) ) {
+		if ( g_pucOutData ) {
+			for ( iDataIndex=0; iDataIndex < g_usiDataSize / 8 + 1; iDataIndex++ )
+				g_pucOutData[ iDataIndex ] = g_pucInData[ iDataIndex ];
+		}
+	}
+	
+	switch( a_cCode ) {
+	case SIR:
+		/* 1/15/04 If not performing cascading, then shift ENDIR */
+		if ( !( g_usFlowControl & CASCADE ) ) {
+			if ( g_usTailIR > 0 ) {
+				sclock();
+				ispVMBypass( TIR, g_usTailIR );
+			}
+			ispVMStateMachine( g_ucEndIR );
+		}
+		break;
+    case XSDR:
+    case SDR: 
+		/* 1/15/04 If not performing cascading, then shift ENDDR */
+		if ( !( g_usFlowControl & CASCADE ) ) {
+			if ( g_usTailDR > 0 ) {
+				sclock();
+				ispVMBypass( TDR, g_usTailDR );
+			}
+			ispVMStateMachine( g_ucEndDR );
+		}
+		break;
+    default:
+		break;
+	}
+	
+	return ( cRetCode );
+}
+
+/***************************************************************
+*
+* ispVMAmble
+*
+* This routine is to extract Header and Trailer parameter for SIR and 
+* SDR operations.
+*
+* The Header and Trailer parameter are the pre-amble and post-amble bit
+* stream need to be shifted into TDI or out of TDO of the devices. Mostly
+* is for the purpose of bypassing the leading or trailing devices. ispVM
+* supports only shifting data into TDI to bypass the devices. 
+*
+* For a single device, the header and trailer parameters are all set to 0
+* as default by ispVM. If it is for multiple devices, the header and trailer
+* value will change as specified by the VME file.
+*
+***************************************************************/
+
+static signed char ispVMAmble( signed char Code )
+{
+	signed char compress = 0;
+	//09/11/07 NN Type cast mismatch variables
+	g_usiDataSize = (unsigned short)ispVMDataSize();
+	
+#ifdef VME_DEBUG
+	printf( "%d", g_usiDataSize );
+#endif //VME_DEBUG
+
+	if ( g_usiDataSize ) {
+
+		/****************************************************************************
+		*
+		* Discard the TDI byte and set the compression bit in the data type register
+		* to false if compression is set because TDI data after HIR/HDR/TIR/TDR is not
+		* compressed.
+		*
+		*****************************************************************************/
+
+		GetByte();
+		if ( g_usDataType & COMPRESS ) {
+			g_usDataType &= ~( COMPRESS );
+			compress = 1;
+		}
+	}
+	
+	switch ( Code ) {
+	case HIR:
+
+		/****************************************************************************
+		*
+		* Store the maximum size of the HIR buffer. Used to convert VME to HEX.
+		*
+		*****************************************************************************/
+
+		if ( g_usiDataSize > g_usHIRSize ) {
+			g_usHIRSize = g_usiDataSize;
+		}
+		
+		/****************************************************************************
+		*
+		* Assign the HIR value and allocate memory.
+		*
+		*****************************************************************************/
+
+		g_usHeadIR = g_usiDataSize;
+		if ( g_usHeadIR ) {
+			ispVMMemManager( HIR, g_usHeadIR );
+			ispVMData( g_pucHIRData );
+
+#ifdef VME_DEBUG
+			printf( " TDI " );
+			PrintData( g_usHeadIR, g_pucHIRData );
+#endif //VME_DEBUG
+		}
+		break;
+	case TIR:
+
+		/****************************************************************************
+		*
+		* Store the maximum size of the TIR buffer. Used to convert VME to HEX.
+		*
+		*****************************************************************************/
+
+		if ( g_usiDataSize > g_usTIRSize ) {
+			g_usTIRSize = g_usiDataSize;
+		}
+		
+		/****************************************************************************
+		*
+		* Assign the TIR value and allocate memory.
+		*
+		*****************************************************************************/
+
+		g_usTailIR = g_usiDataSize;
+		if ( g_usTailIR ) {
+			ispVMMemManager( TIR, g_usTailIR );
+			ispVMData( g_pucTIRData );
+
+#ifdef VME_DEBUG
+			printf( " TDI " );
+			PrintData( g_usTailIR, g_pucTIRData );
+#endif //VME_DEBUG
+		}
+		break;
+	case HDR:
+
+		/****************************************************************************
+		*
+		* Store the maximum size of the HDR buffer. Used to convert VME to HEX.
+		*
+		*****************************************************************************/
+
+		if ( g_usiDataSize > g_usHDRSize ) {
+			g_usHDRSize = g_usiDataSize;
+		}
+		
+		/****************************************************************************
+		*
+		* Assign the HDR value and allocate memory.
+		*
+		*****************************************************************************/
+
+		g_usHeadDR = g_usiDataSize;
+		if ( g_usHeadDR ) {
+			ispVMMemManager( HDR, g_usHeadDR );
+			ispVMData( g_pucHDRData );
+
+#ifdef VME_DEBUG
+			printf( " TDI " );
+			PrintData( g_usHeadDR, g_pucHDRData );
+#endif //VME_DEBUG
+		}
+		break;
+	case TDR:
+
+		/****************************************************************************
+		*
+		* Store the maximum size of the TDR buffer. Used to convert VME to HEX.
+		*
+		*****************************************************************************/
+
+		if ( g_usiDataSize > g_usTDRSize ) {
+			g_usTDRSize = g_usiDataSize;
+		}
+		
+		/****************************************************************************
+		*
+		* Assign the TDR value and allocate memory.
+		*
+		*****************************************************************************/
+
+		g_usTailDR = g_usiDataSize;
+		if ( g_usTailDR ) {
+			ispVMMemManager( TDR, g_usTailDR );
+			ispVMData( g_pucTDRData );
+
+#ifdef VME_DEBUG
+			printf( " TDI " );
+			PrintData( g_usTailDR, g_pucTDRData );
+#endif //VME_DEBUG
+		}
+		break;
+	default:
+		break;
+	}
+
+	/****************************************************************************
+	*
+	* Re-enable compression if it was previously set.
+	*
+	*****************************************************************************/
+
+	if ( compress ) {
+		g_usDataType |= COMPRESS;
+	}
+
+	if ( g_usiDataSize ) {
+		Code = GetByte();
+		if ( Code == CONTINUE ) {
+			return 0;
+		}
+		else {
+
+			/****************************************************************************
+			*
+			* Encountered invalid opcode.
+			*
+			*****************************************************************************/
+
+			return VME_INVALID_FILE; 
+		}
+	}
+
+	return 0;
+}
+
+/***************************************************************
+*
+* ispVMLoop
+*
+* Perform the function call upon by the REPEAT opcode.
+* Memory is to be allocated to store the entire loop from REPEAT to ENDLOOP.
+* After the loop is stored then execution begin. The REPEATLOOP flag is set
+* on the g_usFlowControl register to indicate the repeat loop is in session
+* and therefore fetch opcode from the memory instead of from the file.
+*
+***************************************************************/
+
+static signed char ispVMLoop(unsigned short a_usLoopCount)
+{
+	//09/11/07 NN added local variables initialization
+	signed char cRetCode      = 0;
+	unsigned short iHeapIndex = 0;
+	unsigned short iLoopIndex = 0;
+	
+	g_usShiftValue = 0;
+	for ( iHeapIndex = 0; iHeapIndex < g_iHEAPSize; iHeapIndex++ ) {
+		g_pucHeapMemory[ iHeapIndex ] = GetByte();
+	}
+	
+	if ( g_pucHeapMemory[ iHeapIndex - 1 ] != ENDLOOP ) {
+		return( VME_INVALID_FILE );
+	}
+	
+	g_usFlowControl |= REPEATLOOP;
+	g_usDataType |= HEAP_IN; 
+	
+	for ( iLoopIndex = 0; iLoopIndex < a_usLoopCount; iLoopIndex++ ) {
+		g_iHeapCounter = 0;
+		cRetCode = ispVMCode();
+		g_usRepeatLoops++;
+		if ( cRetCode < 0 ) {
+			break;
+		}
+	}
+
+	g_usDataType &= ~( HEAP_IN );
+	g_usFlowControl &= ~( REPEATLOOP );
+	return ( cRetCode );
+}
+
+/***************************************************************
+*
+* ispVMBitShift
+*
+* Shift the TDI stream left or right by the number of bits. The data in 
+* *g_pucInData is of the VME format, so the actual shifting is the reverse of
+* IEEE 1532 or SVF format.                 
+*
+***************************************************************/
+
+static signed char ispVMBitShift(signed char mode, unsigned short bits)
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short i       = 0;
+	unsigned short size    = 0;
+	unsigned short tmpbits = 0;
+
+	if (g_usiDataSize%8>0) {
+		//09/11/07 NN Type cast mismatch variables
+		size = (unsigned short)(g_usiDataSize/8 + 1);
+	}
+	else {
+		//09/11/07 NN Type cast mismatch variables
+		size = (unsigned short)(g_usiDataSize/8);
+	}
+
+	switch(mode) {
+	case SHR:
+		for (i = 0; i < size; i++) {
+			if (g_pucInData[i] != 0) {			
+				tmpbits = bits;
+				while (tmpbits > 0) {
+					g_pucInData[i] <<= 1;
+					if (g_pucInData[i] == 0) {
+						i--;
+						g_pucInData[i] = 1;
+					}
+					tmpbits--;
+				}
+			}
+		}
+		break;
+	case SHL:
+		for (i = 0; i < size; i++) {
+			if (g_pucInData[i] != 0) {			
+				tmpbits = bits;
+				while (tmpbits > 0) {
+					g_pucInData[i] >>= 1;
+					if (g_pucInData[i] == 0) {
+						i--;
+						g_pucInData[i] = 8;
+					}
+					tmpbits--;
+				}
+			}
+		}
+		break;
+	default: 
+		return ( VME_INVALID_FILE );
+	}
+
+	return (0);
+}
+
+/***************************************************************
+*
+* ispVMComment
+*
+* Displays the SVF comments.
+*
+***************************************************************/
+
+static void ispVMComment( unsigned short a_usCommentSize )
+{
+	for ( ; a_usCommentSize > 0; a_usCommentSize-- ) {
+		/****************************************************************************
+		*
+		* Print character to the terminal.
+		*
+		*****************************************************************************/
+		GetByte();
+//		vme_out_char( cCurByte );
+	}
+//	cCurByte = '\n';
+//	vme_out_char(cCurByte );
+}
+
+/***************************************************************
+*
+* ispVMHeader
+*
+* Iterate the length of the header and discard it.
+*
+***************************************************************/
+
+static void ispVMHeader( unsigned short a_usHeaderSize )
+{
+	for ( ; a_usHeaderSize > 0; a_usHeaderSize-- ) {
+		GetByte();
+	}
+}
+
+
+/***************************************************************
+*
+* ispVMLCOUNT
+*
+* Process the intelligent programming loops.
+*
+***************************************************************/
+
+static signed char ispVMLCOUNT( unsigned short a_usCountSize )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short usIntelBufferIndex = 0;
+	unsigned short usCountIndex       = 0;
+	signed char cRetCode              = 0;
+	signed char cRepeatHeap           = 0;
+
+	//09/11/07 NN Type cast mismatch variables
+	g_usIntelBufferSize = (unsigned short) ispVMDataSize();
+
+	/****************************************************************************
+	*
+	* Allocate memory for intel buffer.
+	*
+	*****************************************************************************/
+
+	ispVMMemManager( LHEAP, g_usIntelBufferSize );
+
+	/****************************************************************************
+	*
+	* Store the maximum size of the intelligent buffer. Used to convert VME to HEX.
+	*
+	*****************************************************************************/
+
+	if ( g_usIntelBufferSize > g_usLCOUNTSize ) {
+		g_usLCOUNTSize = g_usIntelBufferSize;
+	}
+
+	/****************************************************************************
+	*
+	* Copy intel data to the buffer.
+	*
+	*****************************************************************************/
+
+	for ( usIntelBufferIndex = 0; usIntelBufferIndex < g_usIntelBufferSize; usIntelBufferIndex++ ) {
+		g_pucIntelBuffer[ usIntelBufferIndex ] = GetByte();
+	}
+
+	/****************************************************************************
+	*
+	* Set the data type register to get data from the intelligent data buffer.
+	*
+	*****************************************************************************/
+
+	g_usDataType |= LHEAP_IN;
+
+	/****************************************************************************
+	*
+	* If the HEAP_IN flag is set, temporarily unset the flag so data will be
+	* retrieved from the status buffer.
+	*
+	*****************************************************************************/
+
+	if ( g_usDataType & HEAP_IN ) {
+		g_usDataType &= ~HEAP_IN;
+		cRepeatHeap = 1;
+	}
+
+#ifdef VME_DEBUG
+	printf( "LCOUNT %d;\n", a_usCountSize );
+#endif //VME_DEBUG
+
+	/****************************************************************************
+	*
+	* Iterate through the intelligent programming command.
+	*
+	*****************************************************************************/
+	
+	for ( usCountIndex = 0; usCountIndex < a_usCountSize; usCountIndex++ ) {
+
+		/****************************************************************************
+		*
+		* Initialize the intel data index to 0 before each iteration.
+		*
+		*****************************************************************************/
+
+		g_usIntelDataIndex = 0;
+
+		/****************************************************************************
+		*
+		* Make recursive call to process the intelligent programming commands.
+		*
+		*****************************************************************************/
+
+		cRetCode = ispVMCode();
+		if ( cRetCode >= 0 ) {
+
+			/****************************************************************************
+			*
+			* Break if intelligent programming is successful.
+			*
+			*****************************************************************************/
+
+			break;
+		}
+	}
+
+	/****************************************************************************
+	*
+	* If HEAP_IN flag was temporarily disabled, re-enable it before exiting.
+	*
+	*****************************************************************************/
+
+	if ( cRepeatHeap ) {
+		g_usDataType |= HEAP_IN;
+	}
+
+	/****************************************************************************
+	*
+	* Set the data type register to not get data from the intelligent data buffer.
+	*
+	*****************************************************************************/
+
+	g_usDataType &= ~LHEAP_IN;
+	return cRetCode;
+}
+
+/***************************************************************
+*
+* ispVMClocks
+*
+* Applies the specified number of pulses to TCK.
+*
+***************************************************************/
+
+static void ispVMClocks( unsigned short Clocks )
+{
+	unsigned short iClockIndex = 0;
+	for ( iClockIndex = 0; iClockIndex < Clocks; iClockIndex++ ) {
+		sclock();
+	}
+}
+
+/***************************************************************
+*
+* ispVMBypass
+*
+* This procedure takes care of the HIR, HDR, TIR, TDR for the
+* purpose of putting the other devices into Bypass mode. The 
+* current state is checked to find out if it is at DRPAUSE or 
+* IRPAUSE. If it is at DRPAUSE, perform bypass register scan.
+* If it is@IRPAUSE, scan into instruction registers the bypass
+* instruction.
+*
+***************************************************************/
+
+static void ispVMBypass( signed char ScanType, unsigned short Bits )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short iIndex       = 0;
+	unsigned short iSourceIndex = 0;
+	unsigned char cBitState     = 0;
+	unsigned char cCurByte      = 0;   
+	unsigned char * pcSource    = NULL;
+	
+	if ( Bits <= 0 ) {
+		return;
+	}
+
+	switch ( ScanType ) {
+	case HIR:
+		pcSource = g_pucHIRData;
+		break;
+	case TIR:
+		pcSource = g_pucTIRData;
+		break;
+	case HDR:
+		pcSource = g_pucHDRData;
+		break;
+	case TDR:
+		pcSource = g_pucTDRData;
+		break;
+	default:
+		break;
+	}
+	
+	iSourceIndex = 0;
+	cBitState = 0;
+	for ( iIndex = 0; iIndex < Bits - 1; iIndex++ ) {
+		/* Scan instruction or bypass register */
+		if ( iIndex % 8 == 0 ) {
+			cCurByte = pcSource[ iSourceIndex++ ];
+		}
+		cBitState = ( unsigned char ) ( ( ( cCurByte << iIndex % 8 ) & 0x80 ) ? 0x01 : 0x00 );
+		writePort( g_ucPinTDI, cBitState );
+		sclock();
+	}   
+
+	if ( iIndex % 8 == 0 )  {
+		cCurByte = pcSource[ iSourceIndex++ ];
+	}
+
+	cBitState = ( unsigned char ) ( ( ( cCurByte << iIndex % 8 ) & 0x80 ) ? 0x01 : 0x00 );
+	writePort( g_ucPinTDI, cBitState );
+}
+
+/***************************************************************
+*
+* ispVMStateMachine
+*
+* This procedure steps all devices in the daisy chain from a given
+* JTAG state to the next desirable state. If the next state is TLR,
+* the JTAG state machine is brute forced into TLR by driving TMS
+* high and pulse TCK 6 times.
+*
+***************************************************************/
+
+static void ispVMStateMachine( signed char cNextJTAGState )
+{
+	//09/11/07 NN added local variables initialization
+	signed char cPathIndex  = 0;
+	signed char cStateIndex = 0;
+	
+	if ( ( g_cCurrentJTAGState == cNextJTAGState ) && ( cNextJTAGState != RESET ) ) {
+		return;
+	}
+	
+	for ( cStateIndex = 0; cStateIndex < 25; cStateIndex++ ) {
+		if ( ( g_cCurrentJTAGState == g_JTAGTransistions[ cStateIndex ].CurState ) && ( cNextJTAGState == g_JTAGTransistions[cStateIndex].NextState ) ) {
+			break;
+		}
+	}
+
+	g_cCurrentJTAGState = cNextJTAGState;
+	for ( cPathIndex = 0; cPathIndex < g_JTAGTransistions[ cStateIndex ].Pulses; cPathIndex++ ) {
+		if ( ( g_JTAGTransistions[ cStateIndex ].Pattern << cPathIndex ) & 0x80 ) {
+			writePort( g_ucPinTMS, ( unsigned char ) 0x01 );
+		}
+		else {
+			writePort( g_ucPinTMS, ( unsigned char ) 0x00 );
+		}
+		sclock();
+	}
+	
+	writePort( g_ucPinTDI, 0x00 );
+	writePort( g_ucPinTMS, 0x00 );
+}
+
+/***************************************************************
+*
+* ispVMStart
+*
+* Enable the port to the device and set the state to RESET (TLR).
+*
+***************************************************************/
+
+static void ispVMStart()
+{
+#ifdef VME_DEBUG
+	printf( "// ISPVM EMBEDDED ADDED\n" );
+	printf( "STATE RESET;\n" );
+#endif
+
+	ispVMStateMachine( RESET );    /*step devices to RESET state*/
+}
+
+/***************************************************************
+*
+* ispVMEnd
+*
+* Set the state of devices to RESET to enable the devices and disable 
+* the port.
+*
+***************************************************************/
+
+static void ispVMEnd()
+{
+#ifdef VME_DEBUG
+	printf( "// ISPVM EMBEDDED ADDED\n" );
+	printf( "STATE RESET;\n" );
+	printf( "RUNTEST 1.00E-001 SEC;\n" );
+#endif
+
+	ispVMStateMachine( RESET );   /*step devices to RESET state */
+	ispVMDelay( 1000 );              /*wake up devices*/
+}
+
+/***************************************************************
+*
+* ispVMSend
+*
+* Send the TDI data stream to devices. The data stream can be
+* instructions or data.
+*
+***************************************************************/
+
+#ifdef SLOWISPVMSEND
+static signed char ispVMSend( unsigned short a_usiDataSize )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short iIndex       = 0;
+	unsigned short iInDataIndex = 0;
+	unsigned char cCurByte      = 0;
+	unsigned char cBitState     = 0;
+	
+	for ( iIndex = 0; iIndex < a_usiDataSize - 1; iIndex++ ) { 
+		if ( iIndex % 8 == 0 ) { 
+			cCurByte = g_pucInData[ iInDataIndex++ ];
+		}
+		cBitState = ( unsigned char ) ( ( ( cCurByte << iIndex % 8 ) & 0x80 ) ? 0x01 : 0x00 );
+		writePort( g_ucPinTDI, cBitState );
+		sclock();
+	}
+
+	if ( iIndex % 8 == 0 ) {
+		/* Take care of the last bit */
+		cCurByte = g_pucInData[ iInDataIndex ]; 
+	}
+
+	cBitState = ( unsigned char ) ( ( ( cCurByte << iIndex % 8 ) & 0x80 ) ? 0x01 : 0x00 );
+
+	writePort( g_ucPinTDI, cBitState );
+	if ( g_usFlowControl & CASCADE ) {
+		/* 1/15/04 Clock in last bit for the first n-1 cascaded frames */
+		sclock();
+	}
+
+	return 0;
+}
+#else
+#define writePort_fast(a_ucPins, a_ucValue, pins)	\
+do {							\
+	unsigned int v = (pins);			\
+	unsigned int ov = v;				\
+							\
+	if ((a_ucValue)) v |= (a_ucPins);		\
+	else v &= ~(a_ucPins);				\
+							\
+	if (v != ov) *cvgpioregs = v;			\
+	(pins) = v;					\
+} while(0)
+
+#define sclock_fast(pins) 				\
+do {							\
+	volatile unsigned int *r = cvgpioregs;		\
+	unsigned int v = (pins);			\
+	*r = v | g_ucPinTCK;				\
+	*r = v;						\
+} while(0)
+
+static signed char ispVMSend( unsigned short a_usiDataSize )
+{
+	unsigned int iIndex;
+	unsigned char cCurByte, *ptr;
+	unsigned int pins = gpiostate;
+
+	ptr = g_pucInData;
+	
+	for ( iIndex = 0; iIndex < a_usiDataSize - 1; iIndex++ ) { 
+		unsigned int x = iIndex & 0x7;
+		if ( x == 0 ) { 
+			cCurByte = *ptr++;
+		}
+		writePort_fast( g_ucPinTDI, (cCurByte & 0x80), pins );
+		cCurByte = cCurByte << 1;
+		sclock_fast( pins );
+	}
+
+	if ( (iIndex & 0x7) == 0 ) {
+		/* Take care of the last bit */
+		cCurByte = *ptr; 
+	}
+
+	writePort_fast( g_ucPinTDI, (cCurByte & 0x80), pins );
+	if ( g_usFlowControl & CASCADE ) {
+		/* 1/15/04 Clock in last bit for the first n-1 cascaded frames */
+		sclock_fast( pins );
+	}
+
+	gpiostate = pins;
+	return 0;
+}
+#endif
+
+/***************************************************************
+*
+* ispVMRead
+*
+* Read the data stream from devices and verify.
+*
+***************************************************************/
+
+static signed char ispVMRead( unsigned short a_usiDataSize )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short usDataSizeIndex    = 0;
+	unsigned short usErrorCount       = 0;
+	unsigned short usLastBitIndex     = 0;
+	unsigned char cDataByte           = 0;
+	unsigned char cMaskByte           = 0;
+	unsigned char cInDataByte         = 0;
+	unsigned char cCurBit             = 0;
+	unsigned char cByteIndex          = 0;
+	unsigned short usBufferIndex      = 0;
+	unsigned char ucDisplayByte       = 0x00;
+	unsigned char ucDisplayFlag       = 0x01;
+
+	//09/11/07 NN Type cast mismatch variables
+	usLastBitIndex = (unsigned short)(a_usiDataSize - 1);
+	
+#ifndef VME_DEBUG
+	/****************************************************************************
+	*
+	* If mask is not all zeros, then set the display flag to 0x00, otherwise
+	* it shall be set to 0x01 to indicate that data read from the device shall
+	* be displayed. If VME_DEBUG is defined, always display data.
+	*
+	*****************************************************************************/
+
+	for ( usDataSizeIndex = 0; usDataSizeIndex < ( a_usiDataSize + 7 ) / 8; usDataSizeIndex++ ) {
+		if ( g_usDataType & MASK_DATA ) {
+			if ( g_pucOutMaskData[ usDataSizeIndex ] != 0x00 ) {
+				ucDisplayFlag = 0x00;
+				break;
+			}
+		}
+		else {
+			ucDisplayFlag = 0x00;
+			break;
+		}
+	}
+#endif //VME_DEBUG
+	
+	/****************************************************************************
+	*
+	* Begin shifting data in and out of the device.
+	*
+	*****************************************************************************/
+
+	for ( usDataSizeIndex = 0; usDataSizeIndex < a_usiDataSize; usDataSizeIndex++ ) { 
+		if ( cByteIndex == 0 ) {
+
+			/***************************************************************
+			*
+			* Grab byte from TDO buffer.
+			*
+			***************************************************************/
+
+			if ( g_usDataType & TDO_DATA ) {
+				cDataByte = g_pucOutData[ usBufferIndex ];
+			}
+			
+			/***************************************************************
+			*
+			* Grab byte from MASK buffer.
+			*
+			***************************************************************/
+
+			if ( g_usDataType & MASK_DATA ) {
+				cMaskByte = g_pucOutMaskData[ usBufferIndex ];
+			}
+			else { 
+				cMaskByte = 0xFF;
+			}
+          
+			/***************************************************************
+			*
+			* Grab byte from TDI buffer.
+			*
+			***************************************************************/
+
+			if ( g_usDataType & TDI_DATA ) {
+				cInDataByte = g_pucInData[ usBufferIndex ];
+			}
+			
+			usBufferIndex++;
+		}
+		
+		cCurBit = readPort();
+
+		if ( ucDisplayFlag ) {
+			ucDisplayByte <<= 1;
+			ucDisplayByte |= cCurBit;
+		}
+
+		/****************************************************************************
+		*
+		* Check if data read from port matches with expected TDO.
+		*
+		*****************************************************************************/
+
+		if ( g_usDataType & TDO_DATA ) {
+			if ( ( ( ( cMaskByte << cByteIndex ) & 0x80 ) ? 0x01 : 0x00 ) ) {	
+				if ( cCurBit != ( unsigned char ) ( ( ( cDataByte << cByteIndex ) & 0x80 ) ? 0x01 : 0x00 ) ) {
+					usErrorCount++;  
+				}
+			}
+		}
+
+		/****************************************************************************
+		*
+		* Write TDI data to the port.
+		*
+		*****************************************************************************/
+		
+		writePort( g_ucPinTDI, ( unsigned char ) ( ( ( cInDataByte << cByteIndex ) & 0x80 ) ? 0x01 : 0x00 ) );
+		
+		if ( usDataSizeIndex < usLastBitIndex ) {
+
+			/****************************************************************************
+			*
+			* Clock data out from the data shift register.
+			*
+			*****************************************************************************/
+
+			sclock();
+		}
+		else if ( g_usFlowControl & CASCADE ) {
+			
+			/****************************************************************************
+			*
+			* Clock in last bit for the first N - 1 cascaded frames.
+			*
+			*****************************************************************************/
+
+			sclock();
+		}
+
+		/***************************************************************
+		*
+		* Increment the byte index. If it exceeds 7, then reset it back
+		* to zero.
+		*
+		***************************************************************/
+
+		cByteIndex++;
+		if ( cByteIndex >= 8 ) {
+			if ( ucDisplayFlag ) {
+
+				/***************************************************************
+				*
+				* Store displayed data in the TDO buffer. By reusing the TDO
+				* buffer to store displayed data, there is no need to allocate
+				* a buffer simply to hold display data. This will not cause any
+				* false verification errors because the true TDO byte has already
+				* been consumed.
+				*
+				***************************************************************/
+
+				g_pucOutData[ usBufferIndex - 1 ] = ucDisplayByte;
+				ucDisplayByte = 0;
+			}
+
+			cByteIndex = 0;
+		}
+		//09/12/07 Nguyen changed to display the 1 bit expected data
+		else if(a_usiDataSize == 1)
+		{
+			if ( ucDisplayFlag ) {
+
+				/***************************************************************
+				*
+				* Store displayed data in the TDO buffer. By reusing the TDO
+				* buffer to store displayed data, there is no need to allocate
+				* a buffer simply to hold display data. This will not cause any
+				* false verification errors because the true TDO byte has already
+				* been consumed.
+				*
+				***************************************************************/
+
+				/****************************************************************************
+				*
+				* Flip ucDisplayByte and store it in cDataByte.
+				*
+				*****************************************************************************/
+				cDataByte = 0x00;
+				for ( usBufferIndex = 0; usBufferIndex < 8; usBufferIndex++ ) {
+					cDataByte <<= 1;
+					if ( ucDisplayByte & 0x01 ) {
+						cDataByte |= 0x01;
+					}
+					ucDisplayByte >>= 1;
+				}
+				g_pucOutData[ 0 ] = cDataByte;
+				ucDisplayByte = 0;
+			}
+
+			cByteIndex = 0;
+		}
+	}
+
+
+	if ( usErrorCount > 0 ) {
+		if ( g_usFlowControl & VERIFYUES ) {
+			//vme_out_string( "USERCODE verification failed.  Continue programming......\n\n" );
+			g_usFlowControl &= ~( VERIFYUES );
+			return 0;
+		}
+		else {
+
+#ifdef VME_DEBUG
+			printf( "TOTAL ERRORS: %d\n", usErrorCount );
+#endif //VME_DEBUG
+
+			return VME_VERIFICATION_FAILURE;
+		}
+	}
+	else {
+		if ( g_usFlowControl & VERIFYUES ) {
+			//vme_out_string( "USERCODE verification passed.  Programming aborted. \n\n" );
+			g_usFlowControl &= ~( VERIFYUES );
+			return 1;
+		}
+		else {
+			return 0;
+		}
+	}
+}
+
+/***************************************************************
+*
+* ispVMReadandSave
+*
+* Support dynamic I/O.
+*
+***************************************************************/
+
+static signed char ispVMReadandSave( unsigned short int a_usiDataSize )
+{
+	//09/11/07 NN added local variables initialization
+	unsigned short int usDataSizeIndex = 0;
+	unsigned short int usLastBitIndex  = 0;
+	unsigned short int usBufferIndex   = 0;
+	unsigned short int usOutBitIndex   = 0;
+	unsigned short int usLVDSIndex     = 0;
+	unsigned char cDataByte            = 0;
+	unsigned char cDMASKByte           = 0;
+	unsigned char cInDataByte          = 0;
+	unsigned char cCurBit              = 0;
+	unsigned char cByteIndex           = 0;
+	signed char cLVDSByteIndex         = 0;
+
+	//09/11/07 NN Type cast mismatch variables
+	usLastBitIndex = (unsigned short) (a_usiDataSize - 1);
+	
+	/***************************************************************
+	*
+	* Iterate through the data bits.
+	*
+	***************************************************************/
+
+	for ( usDataSizeIndex = 0; usDataSizeIndex < a_usiDataSize; usDataSizeIndex++ ) {
+		if ( cByteIndex == 0 ) {
+
+			/***************************************************************
+			*
+			* Grab byte from DMASK buffer.
+			*
+			***************************************************************/
+
+			if ( g_usDataType & DMASK_DATA ) {
+				cDMASKByte = g_pucOutDMaskData[ usBufferIndex ];
+			}
+			else { 
+				cDMASKByte = 0x00;
+			}
+          
+			/***************************************************************
+			*
+			* Grab byte from TDI buffer.
+			*
+			***************************************************************/
+
+			if ( g_usDataType & TDI_DATA ) {
+				cInDataByte = g_pucInData[ usBufferIndex ];
+			}
+
+			usBufferIndex++;
+		}
+		
+		cCurBit = readPort();
+		cDataByte = ( unsigned char ) ( ( ( cInDataByte << cByteIndex ) & 0x80 ) ? 0x01 : 0x00 );
+
+		/***************************************************************
+		*
+		* Initialize the byte to be zero.
+		*
+		***************************************************************/
+
+		if ( usOutBitIndex % 8 == 0 ) {
+			g_pucOutData[ usOutBitIndex / 8 ] = 0x00;
+		}
+
+		/***************************************************************
+		*
+		* Use TDI, DMASK, and device TDO to create new TDI (actually
+		* stored in g_pucOutData).
+		*
+		***************************************************************/
+
+		if ( ( ( ( cDMASKByte << cByteIndex ) & 0x80 ) ? 0x01 : 0x00 ) ) {
+
+			if ( g_pLVDSList ) {
+				for ( usLVDSIndex = 0; usLVDSIndex < g_usLVDSPairCount; usLVDSIndex++ ) {
+					if ( g_pLVDSList[ usLVDSIndex ].usNegativeIndex == usDataSizeIndex ) {
+						g_pLVDSList[ usLVDSIndex ].ucUpdate = 0x01;
+						break;
+					}
+				}
+			}
+
+			/***************************************************************
+			*
+			* DMASK bit is 1, use TDI.
+			*
+			***************************************************************/
+
+			g_pucOutData[ usOutBitIndex / 8 ] |= ( unsigned char ) ( ( ( cDataByte & 0x1 ) ? 0x01 : 0x00 ) << ( 7 - usOutBitIndex % 8 ) );
+		}
+		else {
+
+			/***************************************************************
+			*
+			* DMASK bit is 0, use device TDO.
+			*
+			***************************************************************/
+
+			g_pucOutData[ usOutBitIndex / 8 ] |= ( unsigned char ) ( ( ( cCurBit & 0x1 ) ? 0x01 : 0x00 ) << ( 7 - usOutBitIndex % 8 ) );
+		}
+
+		/***************************************************************
+		*
+		* Shift in TDI in order to get TDO out.
+		*
+		***************************************************************/
+
+		usOutBitIndex++;
+		writePort( g_ucPinTDI, cDataByte );
+		if ( usDataSizeIndex < usLastBitIndex ) {
+			sclock();
+		}
+
+		/***************************************************************
+		*
+		* Increment the byte index. If it exceeds 7, then reset it back
+		* to zero.
+		*
+		***************************************************************/
+
+		cByteIndex++;
+		if ( cByteIndex >= 8 ) {
+			cByteIndex = 0;
+		}
+	}
+
+	/***************************************************************
+	*
+	* If g_pLVDSList exists and pairs need updating, then update
+	* the negative-pair to receive the flipped positive-pair value.
+	*
+	***************************************************************/
+
+	if ( g_pLVDSList ) {
+		for ( usLVDSIndex = 0; usLVDSIndex < g_usLVDSPairCount; usLVDSIndex++ ) {
+			if ( g_pLVDSList[ usLVDSIndex ].ucUpdate ) {
+				
+				/***************************************************************
+				*
+				* Read the positive value and flip it.
+				*
+				***************************************************************/
+
+				cDataByte = ( unsigned char ) ( ( ( g_pucOutData[ g_pLVDSList[ usLVDSIndex ].usPositiveIndex / 8 ] << ( g_pLVDSList[ usLVDSIndex ].usPositiveIndex % 8 ) ) & 0x80 ) ? 0x01 : 0x00 );
+				//09/11/07 NN Type cast mismatch variables
+				cDataByte = ( unsigned char ) (!cDataByte);
+
+				/***************************************************************
+				*
+				* Get the byte that needs modification.
+				*
+				***************************************************************/
+
+				cInDataByte = g_pucOutData[ g_pLVDSList[ usLVDSIndex ].usNegativeIndex / 8 ];
+
+				if ( cDataByte ) {
+
+					/***************************************************************
+					*
+					* Copy over the current byte and set the negative bit to 1.
+					*
+					***************************************************************/
+
+					cDataByte = 0x00;
+					for ( cLVDSByteIndex = 7; cLVDSByteIndex >= 0; cLVDSByteIndex-- ) {
+						cDataByte <<= 1;
+						if ( 7 - ( g_pLVDSList[ usLVDSIndex ].usNegativeIndex % 8 ) == cLVDSByteIndex ) {
+
+							/***************************************************************
+							*
+							* Set negative bit to 1.
+							*
+							***************************************************************/
+
+							cDataByte |= 0x01;
+						}
+						else if ( cInDataByte & 0x80 ) {
+							cDataByte |= 0x01;
+						}
+
+						cInDataByte <<= 1;
+					}
+
+					/***************************************************************
+					*
+					* Store the modified byte.
+					*
+					***************************************************************/
+
+					g_pucOutData[ g_pLVDSList[ usLVDSIndex ].usNegativeIndex / 8 ] = cDataByte;
+				}
+				else {
+
+					/***************************************************************
+					*
+					* Copy over the current byte and set the negative bit to 0.
+					*
+					***************************************************************/
+
+					cDataByte = 0x00;
+					for ( cLVDSByteIndex = 7; cLVDSByteIndex >= 0; cLVDSByteIndex-- ) {
+						cDataByte <<= 1;
+						if ( 7 - ( g_pLVDSList[ usLVDSIndex ].usNegativeIndex % 8 ) == cLVDSByteIndex ) {
+
+							/***************************************************************
+							*
+							* Set negative bit to 0.
+							*
+							***************************************************************/
+
+							cDataByte |= 0x00;
+						}
+						else if ( cInDataByte & 0x80 ) {
+							cDataByte |= 0x01;
+						}
+
+						cInDataByte <<= 1;
+					}
+
+					/***************************************************************
+					*
+					* Store the modified byte.
+					*
+					***************************************************************/
+
+					g_pucOutData[ g_pLVDSList[ usLVDSIndex ].usNegativeIndex / 8 ] = cDataByte;
+				}
+				
+				break;
+			}
+		}
+	}
+
+	return( 0 );
+}
+
+static signed char ispVMProcessLVDS( unsigned short a_usLVDSCount )
+{
+	unsigned short usLVDSIndex = 0;
+	
+	/***************************************************************
+	*
+	* Allocate memory to hold LVDS pairs.
+	*
+	***************************************************************/
+
+	ispVMMemManager( LVDS, a_usLVDSCount );
+	g_usLVDSPairCount = a_usLVDSCount;
+
+#ifdef VME_DEBUG
+	printf( "LVDS %d (", a_usLVDSCount );
+#endif //VME_DEBUG
+
+	/***************************************************************
+	*
+	* Iterate through each given LVDS pair.
+	*
+	***************************************************************/
+
+	for ( usLVDSIndex = 0; usLVDSIndex < g_usLVDSPairCount; usLVDSIndex++ ) {
+
+		/***************************************************************
+		*
+		* Assign the positive and negative indices of the LVDS pair.
+		*
+		***************************************************************/
+
+		//09/11/07 NN Type cast mismatch variables
+		g_pLVDSList[ usLVDSIndex ].usPositiveIndex = (unsigned short) ispVMDataSize();
+		//09/11/07 NN Type cast mismatch variables
+		g_pLVDSList[ usLVDSIndex ].usNegativeIndex = (unsigned short)ispVMDataSize();
+
+#ifdef VME_DEBUG
+		if ( usLVDSIndex < g_usLVDSPairCount - 1 ) {
+			printf( "%d:%d, ", g_pLVDSList[ usLVDSIndex ].usPositiveIndex, g_pLVDSList[ usLVDSIndex ].usNegativeIndex );
+		}
+		else {
+			printf( "%d:%d", g_pLVDSList[ usLVDSIndex ].usPositiveIndex, g_pLVDSList[ usLVDSIndex ].usNegativeIndex );
+		}
+#endif //VME_DEBUG
+
+	}
+
+#ifdef VME_DEBUG
+	printf( ");\n", a_usLVDSCount );
+#endif //VME_DEBUG
+
+	return( 0 );
+}
+
+/**************************************************************
+*
+* Lattice Semiconductor Corp. Copyright 2008
+* 
+* ispVME Embedded allows programming of Lattice's suite of FPGA
+* devices on embedded systems through the JTAG port.  The software
+* is distributed in source code form and is open to re - distribution
+* and modification where applicable.
+*
+* ispVME Embedded C Source comprised with 3 modules:
+* ispvm_ui.c is the module provides input and output support.
+* ivm_core.c is the module interpret the VME file(s).
+* hardware.c is the module access the JTAG port of the device(s).                 
+*
+* The optional module cable.c is for supporting Lattice's parallel 
+* port ispDOWNLOAD cable on DOS and Windows 95/98 O/S. It can be 
+* requested from Lattice's ispVMSupport.
+*
+***************************************************************/
+
+
+/**************************************************************
+* 
+* Revision History of ispvm_ui.c
+* 
+* 3/6/07 ht Added functions vme_out_char(),vme_out_hex(), 
+*           vme_out_string() to provide output resources.
+*           Consolidate all printf() calls into the added output 
+*           functions.	
+*
+* 09/11/07 NN Added Global variables initialization
+* 09/24/07 NN Added a switch allowing users to do calibration.
+* Calibration will help to determine the system clock frequency
+* and the count value for one micro-second delay of the target 
+* specific hardware.
+* Removed Delay Percent support
+* 11/15/07  NN moved the checking of the File CRC to the end of processing
+***************************************************************/
+
+/***************************************************************
+*
+* File pointer to the VME file.
+*
+***************************************************************/
+
+static FILE * g_pVMEFile = NULL;
+
+/***************************************************************
+*
+* Functions declared in this ispvm_ui.c module
+*
+***************************************************************/
+static unsigned char GetByte(void);
+static void ispVMMemManager( signed char cTarget, unsigned short usSize );
+static void ispVMFreeMem(void);
+signed char ispVM( const char * a_pszFilename );
+
+/***************************************************************
+*
+* Global variables.
+*
+***************************************************************/
+static unsigned short g_usPreviousSize = 0;
+static unsigned short g_usExpectedCRC = 0;
+
+/***************************************************************
+*
+* Supported VME versions.
+*
+***************************************************************/
+
+static const char * const g_szSupportedVersions[] = { "__VME2.0", "__VME3.0", "____12.0", "____12.1", 0 };
+
+static unsigned char *memstore_buf;
+static int memstore_len;
+static int memstore_idx;
+
+static void memstore(FILE *f) {
+	int sz = 0x10000;
+	int rem = sz;
+	int i;
+	unsigned char *b, *t;
+
+	if (memstore_buf) free(memstore_buf);
+	b = memstore_buf = malloc(sz);
+	assert(b != NULL);
+
+	while (!feof(f)) {
+		if (rem == 0) {
+			sz += 0x10000;
+			rem = 0x10000;
+			t = realloc(memstore_buf, sz);
+			assert (t != NULL);
+			b = t + (b - memstore_buf);
+			memstore_buf = t;
+		}
+			
+		i = fread(b, 1, rem, f); 
+		rem -= i;
+		b += i;
+	}
+	
+	memstore_idx = 0;
+	memstore_len = sz - rem;
+	assert(memstore_len > 0);
+	memstore_buf = realloc(memstore_buf, memstore_len);
+	assert(memstore_buf != NULL);
+}
+
+static FILE *xopen(const char *f) {
+	int l = strlen(f);
+	char b[512];
+	struct stat s;
+
+	if (strcmp("-", f) == 0) return stdin;
+
+	if (stat(f, &s) != 0) return NULL;
+
+	if (strcmp(".jed.gz", &f[l-7]) == 0 || 
+	  strcmp(".jed.bz2", &f[l-8]) == 0 ||
+	  strcmp(".jed", &f[l-4]) == 0) {
+		snprintf(b, 512, "exec jed2vme '%s'", f);
+		return popen(b, "r");
+	} else if (strcmp(".vme.gz", &f[l-7]) == 0) {
+		snprintf(b, 512, "exec gunzip -c '%s'", f);
+		return popen(b, "r");
+	} else if (strcmp(".vme.bz2", &f[l-8]) == 0) {
+		snprintf(b, 512, "exec bunzip2 -c '%s'", f);
+		return popen(b, "r");
+	} else return fopen(f, "r");
+}
+
+/***************************************************************
+*
+* GetByte
+*
+* Returns a byte to the caller. The returned byte depends on the
+* g_usDataType register. If the HEAP_IN bit is set, then the byte
+* is returned from the HEAP. If the LHEAP_IN bit is set, then
+* the byte is returned from the intelligent buffer. Otherwise,
+* the byte is returned directly from the VME file.
+*
+***************************************************************/
+
+static unsigned char GetByte()
+{
+	unsigned char ucData = 0;
+	
+	if ( g_usDataType & HEAP_IN ) {
+
+		/***************************************************************
+		*
+		* Get data from repeat buffer.
+		*
+		***************************************************************/
+
+		if ( g_iHeapCounter > g_iHEAPSize ) {
+
+			/***************************************************************
+			*
+			* Data over-run.
+			*
+			***************************************************************/
+
+			return 0xFF;
+		}
+
+		ucData = g_pucHeapMemory[ g_iHeapCounter++ ];
+	}
+	else if ( g_usDataType & LHEAP_IN ) {
+
+		/***************************************************************
+		*
+		* Get data from intel buffer.
+		*
+		***************************************************************/
+
+		if ( g_usIntelDataIndex >= g_usIntelBufferSize ) {
+
+			/***************************************************************
+			*
+			* Data over-run.
+			*
+			***************************************************************/
+
+			return 0xFF;
+		}
+
+		ucData = g_pucIntelBuffer[ g_usIntelDataIndex++ ];
+	}
+	else {
+
+		/***************************************************************
+		*
+		* Get data from file.
+		*
+		***************************************************************/
+
+
+		if ( memstore_idx >= memstore_len ) {
+			/***************************************************************
+			*
+			* Reached EOF.
+			*
+			***************************************************************/
+
+			if (memstore_buf) free(memstore_buf);
+			memstore_buf = NULL;
+			return 0xFF;
+		} else ucData = memstore_buf[memstore_idx++];
+	}
+	
+	return ( ucData );
+}
+
+/***************************************************************
+*
+* ispVMMemManager
+*
+* Allocate memory based on cTarget. The memory size is specified
+* by usSize.
+*
+***************************************************************/
+
+static void ispVMMemManager( signed char cTarget, unsigned short usSize )
+{
+	switch ( cTarget ) {
+	case XTDI:
+    case TDI:  
+		if ( g_pucInData != NULL ) {
+			if ( g_usPreviousSize == usSize ) {/*memory exist*/
+				break;
+			}
+			else {
+				free( g_pucInData );
+				g_pucInData = NULL;
+			}
+		}
+		g_pucInData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		g_usPreviousSize = usSize;
+    case XTDO:
+    case TDO:
+		if ( g_pucOutData!= NULL ) { 
+			if ( g_usPreviousSize == usSize ) { /*already exist*/
+				break;
+			}
+			else {
+				free( g_pucOutData );
+				g_pucOutData = NULL;
+			}
+		}
+		g_pucOutData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		g_usPreviousSize = usSize;
+		break;
+    case MASK:
+		if ( g_pucOutMaskData != NULL ) {
+			if ( g_usPreviousSize == usSize ) {/*already allocated*/
+				break;
+			}
+			else {
+				free( g_pucOutMaskData ); 
+				g_pucOutMaskData = NULL;
+			}
+		}
+		g_pucOutMaskData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		g_usPreviousSize = usSize;
+		break;
+    case HIR:
+		if ( g_pucHIRData != NULL ) {
+			free( g_pucHIRData );
+			g_pucHIRData = NULL;
+		}
+		g_pucHIRData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		break;
+    case TIR:
+		if ( g_pucTIRData != NULL ) {
+			free( g_pucTIRData );
+			g_pucTIRData = NULL;
+		}
+		g_pucTIRData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		break;
+    case HDR:
+		if ( g_pucHDRData != NULL ) {
+			free( g_pucHDRData );
+			g_pucHDRData = NULL;
+		}
+		g_pucHDRData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		break;
+    case TDR:
+		if ( g_pucTDRData != NULL ) {
+			free( g_pucTDRData );
+			g_pucTDRData = NULL;
+		}
+		g_pucTDRData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		break;
+    case HEAP:
+		if ( g_pucHeapMemory != NULL ) {
+			free( g_pucHeapMemory );
+			g_pucHeapMemory = NULL;
+		}
+		g_pucHeapMemory = ( unsigned char * ) malloc( usSize + 2 );
+		break;
+	case DMASK: 
+		if ( g_pucOutDMaskData != NULL ) {
+			if ( g_usPreviousSize == usSize ) { /*already allocated*/
+				break;
+			}
+			else {
+				free( g_pucOutDMaskData ); 
+				g_pucOutDMaskData = NULL;
+			}
+		}
+		g_pucOutDMaskData = ( unsigned char * ) malloc( usSize / 8 + 2 );
+		g_usPreviousSize = usSize;
+		break;
+	case LHEAP:
+		if ( g_pucIntelBuffer != NULL ) {
+			free( g_pucIntelBuffer );
+			g_pucIntelBuffer = NULL;
+		}
+		g_pucIntelBuffer = ( unsigned char * ) malloc( usSize + 2 );
+		break;
+	case LVDS:
+		if ( g_pLVDSList != NULL ) {
+			free( g_pLVDSList );
+			g_pLVDSList = NULL;
+		}
+		g_pLVDSList = ( LVDSPair * ) calloc( usSize, sizeof( LVDSPair ) );
+		break;
+	default:
+		return;
+    }
+}
+
+/***************************************************************
+*
+* ispVMFreeMem
+*
+* Free memory that were dynamically allocated.
+*
+***************************************************************/
+
+static void ispVMFreeMem()
+{
+	if ( g_pucHeapMemory != NULL ) {
+		free( g_pucHeapMemory ); 
+		g_pucHeapMemory = NULL;
+	}
+
+	if ( g_pucOutMaskData != NULL ) {
+		free( g_pucOutMaskData );
+		g_pucOutMaskData = NULL;
+	}
+	
+	if ( g_pucInData != NULL ) {
+		free( g_pucInData );
+		g_pucInData = NULL;
+	}
+	
+	if ( g_pucOutData != NULL ) {
+		free( g_pucOutData );
+		g_pucOutData = NULL;
+	}
+	
+	if ( g_pucHIRData != NULL ) {
+		free( g_pucHIRData );
+		g_pucHIRData = NULL;
+	}
+	
+	if ( g_pucTIRData != NULL ) {
+		free( g_pucTIRData );
+		g_pucTIRData = NULL;
+	}
+	
+	if ( g_pucHDRData != NULL ) {
+		free( g_pucHDRData );
+		g_pucHDRData = NULL;
+	}
+	
+	if ( g_pucTDRData != NULL ) {
+		free( g_pucTDRData );
+		g_pucTDRData = NULL;
+	}
+	
+	if ( g_pucOutDMaskData != NULL ) {
+		free( g_pucOutDMaskData );
+		g_pucOutDMaskData = NULL;
+	}
+	
+	if ( g_pucIntelBuffer != NULL ) {
+		free( g_pucIntelBuffer );
+		g_pucIntelBuffer = NULL;
+	}
+
+	if ( g_pLVDSList != NULL ) {
+		free( g_pLVDSList );
+		g_pLVDSList = NULL;
+	}
+} 
+
+/***************************************************************
+*
+* ispVM
+*
+* The entry point of the ispVM embedded. If the version and CRC
+* are verified, then the VME will be processed.
+*
+***************************************************************/
+
+signed char ispVM( const char * a_pszFilename )
+{
+	char szFileVersion[ 9 ]      = { 0 };
+	signed char cRetCode         = 0;
+	signed char cIndex           = 0;
+	signed char cVersionIndex    = 0;
+	unsigned char ucReadByte     = 0;
+	
+	/***************************************************************
+	*
+	* Global variables initialization.
+	*
+	* 09/11/07 NN Added
+	***************************************************************/
+	g_pucHeapMemory		= NULL;
+	g_iHeapCounter		= 0;
+	g_iHEAPSize			= 0;
+	g_usIntelDataIndex	= 0;
+	g_usIntelBufferSize	= 0;
+	g_usPreviousSize     = 0;
+
+	/***************************************************************
+	*
+	* Open a file pointer to the VME file.
+	*
+	***************************************************************/
+
+	if ( ( g_pVMEFile = xopen( a_pszFilename ) ) == NULL ) {
+		return VME_FILE_READ_FAILURE;
+	}
+	memstore(g_pVMEFile);
+    	if (pclose(g_pVMEFile) == -1) fclose(g_pVMEFile);
+	g_pVMEFile = NULL;
+	hardware_init();
+
+	g_usCalculatedCRC = 0;
+	g_usExpectedCRC   = 0;
+	ucReadByte = GetByte();
+	switch( ucReadByte ) {
+	case FILE_CRC:
+
+		/***************************************************************
+		*
+		* Read and store the expected CRC to do the comparison at the end.  
+		* Only versions 3.0 and higher support CRC protection.
+		*
+		***************************************************************/
+
+		g_usExpectedCRC = (unsigned char ) memstore_buf[memstore_idx++];
+		g_usExpectedCRC <<= 8;
+		g_usExpectedCRC |= memstore_buf[memstore_idx++];
+		
+
+		/***************************************************************
+		*
+		* Read and store the version of the VME file.
+		*
+		***************************************************************/
+
+		for ( cIndex = 0; cIndex < 8; cIndex++ ) {
+			szFileVersion[ cIndex ] = GetByte();
+		}
+
+		break;
+	default:
+
+		/***************************************************************
+		*
+		* Read and store the version of the VME file.  Must be version 2.0.
+		*
+		***************************************************************/
+
+		szFileVersion[ 0 ] = ( signed char ) ucReadByte;
+		for ( cIndex = 1; cIndex < 8; cIndex++ ) {
+			szFileVersion[ cIndex ] = GetByte();
+		}
+
+		break;
+	}
+
+	/***************************************************************
+	*
+	* Compare the VME file version against the supported version.
+	*
+	***************************************************************/
+
+	for ( cVersionIndex = 0; g_szSupportedVersions[ cVersionIndex ] != 0; cVersionIndex++ ) {
+		for ( cIndex = 0; cIndex < 8; cIndex++ ) {
+			if ( szFileVersion[ cIndex ] != g_szSupportedVersions[ cVersionIndex ][ cIndex ] ) {
+				cRetCode = VME_VERSION_FAILURE;
+				break;
+			}	
+			cRetCode = 0;
+		}
+
+		if ( cRetCode == 0 ) {
+
+			/***************************************************************
+			*
+			* Found matching version, break.
+			*
+			***************************************************************/
+
+			break;
+		}
+	}
+
+	if ( cRetCode < 0 ) {
+
+		/***************************************************************
+		*
+		* VME file version failed to match the supported versions.
+		*
+		***************************************************************/
+
+		return VME_VERSION_FAILURE;
+	}
+
+	/***************************************************************
+	*
+	* Enable the JTAG port to communicate with the device.
+    * Set the JTAG state machine to the Test-Logic/Reset State.
+	*
+	***************************************************************/
+
+    ispVMStart();
+
+	/***************************************************************
+	*
+	* Process the VME file.
+	*
+	***************************************************************/
+
+    cRetCode = ispVMCode();
+
+	/***************************************************************
+	*
+	* Set the JTAG State Machine to Test-Logic/Reset state then disable
+    * the communication with the JTAG port.
+	*
+	***************************************************************/
+
+    ispVMEnd();
+                   
+
+
+	ispVMFreeMem();
+
+	
+    return ( cRetCode );
+}
+
+
+static const unsigned int g_ucPinTDI          = 1<<0;    /* Bit address of TDI */
+static const unsigned int g_ucPinTCK          = 1<<3;    /* Bit address of TCK */
+static const unsigned int g_ucPinTMS          = 1<<2;    /* Bit address of TMS */
+static const unsigned int g_ucPinENABLE       = 0;    /* Bit address of ENABLE */
+static const unsigned int g_ucPinTRST         = 0;    /* Bit address of TRST */
+static const unsigned int g_ucPinTDO          = 1<<1;    /* Bit address of TDO*/
+
+
+extern unsigned int *mxtimerregs;
+extern void nbuslock(void);
+
+static void hardware_init(void) {
+	nbuslock();
+}
+
+static inline void writePort(int pins, int val) {
+	if (val) gpiostate |= pins;
+	else gpiostate &= ~pins;
+
+	mxgpioregs[0x730/4] = gpiostate;
+}
+
+static inline int readPort() {
+	return (mxgpioregs[0x930/4] >> 1) & 1;
+} 
+
+static inline void sclock() {	
+	assert((gpiostate & (1<<3)) == 0);
+	mxgpioregs[0x730/4] = gpiostate | (g_ucPinTCK);
+	mxgpioregs[0x730/4] = gpiostate;
+}
+
+static inline void udelay(unsigned int us) {
+	volatile unsigned int *t = &mxtimerregs[0x30/4];
+	unsigned int i, j, s;
+	i = *t;
+	if (us >= 10000) usleep(us);
+	else {
+		sched_yield();
+		s = us / 50;
+		j = i - s;
+		if (i >= j) while (*t > j);
+		else while ((i - *t) < s);
+	}
+}
+
+/* MSB of arg determines whether units in uS or mS */
+static void ispVMDelay(unsigned short delay) {
+	if (delay & 0x8000) udelay((delay & ~0x8000) * 1000);
+	else udelay(delay & ~0x8000);
+}
diff --git a/package/ts4600-tshwctl/src/tshwctl.c b/package/ts4600-tshwctl/src/tshwctl.c
new file mode 100644
index 0000000..c4b2682
--- /dev/null
+++ b/package/ts4600-tshwctl/src/tshwctl.c
@@ -0,0 +1,2904 @@
+/*  Copyright 2004-2012, Unpublished Work of Technologic Systems
+*  All Rights Reserved.
+*
+*  THIS WORK IS AN UNPUBLISHED WORK AND CONTAINS CONFIDENTIAL,
+*  PROPRIETARY AND TRADE SECRET INFORMATION OF TECHNOLOGIC SYSTEMS.
+*  ACCESS TO THIS WORK IS RESTRICTED TO (I) TECHNOLOGIC SYSTEMS EMPLOYEES
+*  WHO HAVE A NEED TO KNOW TO PERFORM TASKS WITHIN THE SCOPE OF THEIR
+*  ASSIGNMENTS  AND (II) ENTITIES OTHER THAN TECHNOLOGIC SYSTEMS WHO
+*  HAVE ENTERED INTO  APPROPRIATE LICENSE AGREEMENTS.  NO PART OF THIS
+*  WORK MAY BE USED, PRACTICED, PERFORMED, COPIED, DISTRIBUTED, REVISED,
+*  MODIFIED, TRANSLATED, ABRIDGED, CONDENSED, EXPANDED, COLLECTED,
+*  COMPILED,LINKED,RECAST, TRANSFORMED, ADAPTED IN ANY FORM OR BY ANY
+*  MEANS,MANUAL, MECHANICAL, CHEMICAL, ELECTRICAL, ELECTRONIC, OPTICAL,
+*  BIOLOGICAL, OR OTHERWISE WITHOUT THE PRIOR WRITTEN PERMISSION AND
+*  CONSENT OF TECHNOLOGIC SYSTEMS . ANY USE OR EXPLOITATION OF THIS WORK
+*  WITHOUT THE PRIOR WRITTEN CONSENT OF TECHNOLOGIC SYSTEMS  COULD
+*  SUBJECT THE PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.
+*/
+/* To compile tshwctl, use the appropriate cross compiler and run the
+* command:
+*
+*  gcc -fno-tree-cselim -Wall -O0 -mcpu=arm9 -o tshwctl tshwctl.c ispvm.c \
+    ispspi.c
+*
+* You need ispvm.c and vmopcode.h in the same directory as tshwctl to
+* compile.
+*
+* On uclibc based initrd's, the following additional gcc options are
+* necessary: -Wl,--rpath,/slib -Wl,-dynamic-linker,/slib/ld-uClibc.so.0
+*
+* If you want --loadfpga to work with .jed files, the executable "jed2vme"
+* should be in the $PATH during runtime.
+*/
+
+const char copyright[] = "Copyright (c) Technologic Systems - " __DATE__ ;
+
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <libgen.h>
+#include <limits.h>
+#include "i2c-dev.h"
+#include <linux/unistd.h>
+#include <netdb.h>
+#include <net/if.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/ipc.h>
+#include <sys/mman.h>
+#include <sys/sem.h>
+#include <sys/shm.h>
+#include <sys/socket.h>
+#include <sys/select.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+#include <sys/times.h>
+#include <sys/timex.h>
+#include <sys/types.h>
+#include <time.h>
+#include <time.h>
+#include <unistd.h>
+
+#ifndef TEMP_FAILURE_RETRY
+# define TEMP_FAILURE_RETRY(expression) \
+  (__extension__                                                              \
+    ({ long int __result;                                                     \
+      do __result = (long int) (expression);                                 \
+      while (__result == -1L && errno == EINTR);                             \
+      __result; }))
+#endif
+
+#define DIOMASK 0x33ffffffffffc3dfULL
+
+volatile unsigned int *mxspiregs, *mxgpioregs, *mxtwiregs;
+volatile unsigned int *mxmiscregs, *mxtimerregs;
+volatile unsigned int *mxgpioregs;
+unsigned int gpio_state[4];
+int long_tagmem = 0;
+static int nbuslocked = 0;
+
+extern signed char ispVM(char *);
+extern signed char ispSPI(char *);
+void nbuslock(void);
+void nbusunlock(void);
+void nbuspreempt(void);
+void nbus_poke16(unsigned char, unsigned short);
+unsigned short nbus_peek16(unsigned char);
+//int i2c_write(int chip, int addr, int count, char *buf);
+
+volatile unsigned int *fe_base;
+
+struct vtu {
+	int v, vid;
+	unsigned char tags[7];
+	unsigned char forceVID[7];
+};                                
+
+static unsigned short model;
+static int cpu_port;
+#define FE_BASE_PHYSICAL 0xC0800000                          
+#define SMI_RDVALID     (1 << 27)                            
+#define SMI_BUSY        (1 << 28)                            
+                                                             
+#define GLOBAL_REGS_1   0x1f                                 
+#define GLOBAL_REGS_2   0x17                                 
+                                                             
+#define VTU_OPS_REGISTER  0x05  /* offset in GLOBAL_REGS_1 */
+#define VTU_OP_FLUSHALL          (1 << 12)                   
+#define VTU_OP_LOAD              (3 << 12)                   
+#define VTU_OP_GET_NEXT          (4 << 12)                   
+#define VTU_OP_GET_CLR_VIOLATION (7 << 12)                   
+                                                             
+#define VTU_VID_REG     0x06  /* offset in GLOBAL_REGS_1 */  
+#define FPGA_SYSCON_PHYSICAL    0x80004000
+#define DIO27  1                          
+#define DIO42  (1<<15)                    
+#define MDIO   DIO27                      
+#define MDC    DIO42 
+
+static unsigned int has_switch(void) __attribute__((pure));
+static unsigned int has_switch(void) {
+	switch(model) {
+	  case 0x4600:
+	  case 0x7680:
+		return 1;
+		break;
+	  default:
+		return 0;
+		break;
+	}
+}
+
+static unsigned int is_7400(void) __attribute__((pure));
+static unsigned int is_7400(void) {
+	FILE *cpuinfo;
+	char buf[4096];
+	static unsigned int checked = 0;
+	static unsigned int is7400 = 0;
+
+	if(!checked) {
+		cpuinfo = fopen("/proc/cpuinfo", "r");
+		if(cpuinfo == NULL) {
+			perror("/proc/cpuinfo");
+			exit(4);
+		}
+		bzero(buf, 4096);
+		fread(buf, 1, 4095, cpuinfo);
+		fclose(cpuinfo);
+		if(strstr(buf, "TS-7400")) is7400 = 1;
+		checked = 1;
+
+		if(is7400) {
+			cpuinfo = fopen("/dev/tsmodel", "r");
+			if(cpuinfo == NULL) {
+				perror("/dev/tsmodel");
+				exit(4);
+			}
+			bzero(buf, 4096);
+			fread(buf, 1, 4095, cpuinfo);
+			fclose(cpuinfo);
+			model = strtoul(buf, NULL, 16);
+		}
+	}
+	return is7400;
+}
+
+/*XXX: DO NOT USE THESE ROUTINES IN A CUSTOMER APPLICATION UNLESS YOU FULLY
+* UNDERSTAND HOW THEY ARE USED AND WHAT THEY DO! See nbus.c from our FTP site
+* for the API intended for customer use!
+*/
+void poke16(unsigned char adr, unsigned short dat)
+{
+	int x;
+	
+	mxgpioregs[0x708/4] = (1 << 16) | (1 << 25) | (0xff); 
+	mxgpioregs[0x704/4] = (1 << 24) | (1 << 26) | adr ;
+	mxgpioregs[0x704/4] = (1 << 25);
+
+	for(x = 1; x >= 0; x--) {
+		mxgpioregs[0x708/4] = (1 << 26) | (1 << 25) | (0xff);
+		mxgpioregs[0x704/4] = (unsigned char)(dat >> (x*8));
+		mxgpioregs[0x704/4] = (1 << 25);
+	}
+	mxgpioregs[0x704/4] = (1 << 16);
+
+	while(mxgpioregs[0x900/4] & (1 << 21)) {
+		mxgpioregs[0x708/4] = (1 << 16);
+		mxgpioregs[0x704/4] = (1 << 16);
+	}
+}
+
+unsigned short peek16(unsigned char adr)
+{
+	int x;
+	unsigned short ret;
+
+	mxgpioregs[0x708/4] = (1 << 16) | (1 << 25) | (1 << 24) | (0xff);
+	mxgpioregs[0x704/4] = ((1 << 26) | adr);
+	mxgpioregs[0x704/4] = (1 << 25);
+	mxgpioregs[0xb08/4] = 0xff;
+
+	do {
+		ret = 0;
+		for(x = 1; x >= 0; x--) {
+			mxgpioregs[0x708/4] = (1 << 26) | (1 << 25) | (0xff);
+			mxgpioregs[0x704/4] = (1 << 25);
+			ret |= ((mxgpioregs[0x900/4] & 0xff) << (x*8));
+		}
+		mxgpioregs[0x704/4] = (1 << 16);
+	} while(mxgpioregs[0x900/4] & (1 << 21));
+
+	mxgpioregs[0xb04/4] = 0xff;
+
+	return ret;
+}
+
+static int semid = -1;
+void nbuslock(void)
+{
+	int r;
+	struct sembuf sop;
+
+	if (semid == -1) {
+		key_t semkey;
+		semkey = 0x75000000;
+		semid = semget(semkey, 1, IPC_CREAT|IPC_EXCL|0777);
+		if (semid != -1) {
+			sop.sem_num = 0;
+			sop.sem_op = 1;
+			sop.sem_flg = 0;
+			r = semop(semid, &sop, 1);
+			assert (r != -1);
+		} else semid = semget(semkey, 1, 0777);
+		assert (semid != -1);
+	}
+	sop.sem_num = 0;
+	sop.sem_op = -1;
+	sop.sem_flg = SEM_UNDO;
+
+
+	/*Wrapper added to retry in case of EINTR*/
+	r = TEMP_FAILURE_RETRY(semop(semid, &sop, 1));
+	assert(r == 0);
+
+	nbuslocked = 1;
+}
+
+void nbusunlock(void) 
+{
+	struct sembuf sop = { 0, 1, SEM_UNDO};
+	int r;
+	if(nbuslocked) {
+		r = semop(semid, &sop, 1);
+		assert(r == 0);
+		nbuslocked = 0;
+	}
+}
+
+void nbuspreempt(void)
+{
+	int r;
+	r = semctl(semid, 0, GETNCNT);
+	assert(r != -1);
+	if(r) {
+		nbusunlock();
+		sched_yield();
+		nbuslock();
+	}
+}
+
+void sspi_cmd(unsigned int cmd) {
+	unsigned int i;
+	unsigned int s = peek16(0x6) & 0xfff0;
+	
+	// pulse CS#
+	poke16(0x6, s | 0x2);
+	poke16(0x6, s | 0x0);
+
+	for (i = 0; i < 32; i++, cmd <<= 1) {
+		if (cmd & 0x80) {
+			poke16(0x6, s | 0x4);
+			poke16(0x6, s | 0xc);
+		} else {
+			poke16(0x6, s | 0x0);
+			poke16(0x6, s | 0x8);
+		}
+	}
+}
+
+
+int read_tagmem(unsigned int *tagmem) {
+	int i, j, len;
+	unsigned int ret;
+	unsigned int s = peek16(0x6) & 0xfff0;
+
+	sspi_cmd(0xac); // X_PROGRAM_EN
+	sspi_cmd(0x4e); // READ_TAG
+
+	if(long_tagmem) len = 24;
+	else len = 20;
+	
+	for (j = 0; j < len; j++) {
+		for (ret = 0x0, i = 0; i < 32; i++) {
+			poke16(0x6, s | 0x0);
+			poke16(0x6, s | 0x8);
+			ret = ret << 1 | (peek16(0x6) & 0x1);
+		}
+		tagmem[j] = ret;
+	}
+	
+	sspi_cmd(0x78); // PROGRAM_DIS
+	
+	poke16(0x6, s | 0x2);
+	return 1;
+}
+
+
+int write_tagmem(unsigned int *tagmem) {
+	int i, j, len;
+	unsigned int s = peek16(0x6) & 0xfff0;
+	
+	sspi_cmd(0xac); // X_PROGRAM_EN
+	sspi_cmd(0x8e); // WRITE_TAG
+
+	if(long_tagmem) len = 24;
+	else len = 20;
+	
+	for (j = 0; j < len; j++) {
+		unsigned int x = tagmem[j];
+		for (i = 0; i < 32; i++, x <<= 1) {
+			if (x & 0x80000000UL) {
+				poke16(0x6, s | 0x4);
+				poke16(0x6, s | 0xc);
+			} else {
+				poke16(0x6, s | 0x0);
+				poke16(0x6, s | 0x8);
+			}
+			if (!long_tagmem && i == 23 && j == 19) break;
+		}
+	}
+	
+	for (i = 0; i < 8; i++) {
+		poke16(0x6, s | 0x2);
+		poke16(0x6, s | 0xa);
+	}
+	poke16(0x6, s | 0x2);
+	nbusunlock();
+	usleep(25000);
+	nbuslock();
+	return 1;
+}
+
+
+int erase_tagmem() {
+	int i;
+	unsigned int s = peek16(0x6) & 0xfff0;
+
+	sspi_cmd(0xac); // X_PROGRAM_EN
+	sspi_cmd(0xe); // ERASE_TAG
+
+	for (i = 0; i < 8; i++) {
+		poke16(0x6, s | 0x2);
+		poke16(0x6, s | 0xa);
+	}
+	poke16(0x6, s | 0x2);
+	nbusunlock();
+	usleep(1000000);
+	nbuslock();
+	return 1;
+}
+
+#define e2_read(r, b, c) i2c_op((0x50|((r&0x300)>>8)), b, r, 0x6, c)
+#define e2_write(r, b, c) i2c_op((0x50|((r&0x300)>>8)), b, r, 0x7, c)
+#define fpga_read(reg, buf, count) i2c_op(0x28, buf, reg, 0x4, count)
+#define fpga_write(reg, buf, count) i2c_op(0x28, buf, reg, 0x5, count)
+#define rtc_read(reg, buf, count) i2c_op(0x6f, buf, reg, 0x2, count)
+#define rtc_write(reg, buf, count) i2c_op(0x6f, buf, reg, 0x3, count)
+#define nvram_read(reg, buf, count) i2c_op(0x57, buf, reg, 0x2, count)
+#define nvram_write(reg, buf, count) i2c_op(0x57, buf, reg, 0x3, count)
+#define m0_read(buf,count) i2c_op(0x78, buf, 0, 0, count)
+#define m0_write(buf, count) i2c_op(0x78, buf, 0, 0x1, count)
+
+int i2c_op(char adr, void *buf, short reg, short mode, char count)
+{
+	int i2cfd;
+	int i;
+	char adrbuf[3];
+
+	if(mode >= 0x4 && mode <= 0x7) {
+		i2cfd = open("/dev/i2c-1", O_RDWR);//FPGA is on different bus
+		adrbuf[0] = ((reg >> 8) & 0xFF);
+		adrbuf[1] = (reg & 0xFF);
+	} else {
+		i2cfd = open("/dev/i2c-0", O_RDWR);
+	}
+
+	assert(i2cfd != -1);
+
+	ioctl(i2cfd, I2C_SLAVE, adr);
+
+	switch(mode) {
+	  case 0x0: //adr, count
+		i = read(i2cfd, buf, count);
+		break;
+	  case 0x1: //adr, count
+		i = write(i2cfd, buf, count);
+		break;
+	  case 0x2: //adr, reg, count
+	  case 0x6:
+		for(i = 0; i < count; i++) {
+			*(char *)(buf+i) = i2c_smbus_read_byte_data(i2cfd,
+			  (unsigned char)(reg+i));
+		}
+		break;
+	  case 0x3: //adr, reg, count
+	  case 0x7:
+		for(i = 0; i < count; i++) {
+			i2c_smbus_write_byte_data(i2cfd, (unsigned char)(reg+i),
+	        	  *(char *)(buf+i));
+		}
+		break;
+	  case 0x4:
+		write(i2cfd, &adrbuf , 2); //Write 2 byte reg address
+		i = read(i2cfd, buf, count); //read back count bytes
+		break;
+	  case 0x5: /*Linux lacks a good way to handle this */
+		for(i = 0; i < count; i++) {
+			adrbuf[2] = *(char *)(buf+i);
+			write(i2cfd, &adrbuf, 3);
+			adrbuf[0] = ((++reg >> 8) & 0xFF);
+			adrbuf[1] = (reg & 0xFF);
+		}
+		break;
+
+	}
+
+	close(i2cfd);
+
+	return i;
+}
+
+#define SBC_MDIO_RD  ((mxgpioregs[0x940/4] >> 1) & 0x1)
+#define SBC_MDC_RD  ((mxgpioregs[0x940/4] >> 0) & 0x1)
+#define SBC_MDIO_OUT  mxgpioregs[0xb44/4] = 0x2
+#define SBC_MDIO_IN  mxgpioregs[0xb48/4] = 0x2
+#define SBC_MDC_OUT  mxgpioregs[0xb44/4] = 0x1
+#define SBC_MDC_IN  mxgpioregs[0xb48/4] = 0x1
+#define SBC_MDIO_HI  mxgpioregs[0x744/4] = 0x2
+#define SBC_MDIO_LO  mxgpioregs[0x748/4] = 0x2
+#define SBC_MDC_HI  mxgpioregs[0x744/4] = 0x1
+#define SBC_MDC_LO  mxgpioregs[0x748/4] = 0x1
+
+#define BB_MDIO_RD  ((peek16(0xe) >> 14) & 0x1)
+#define BB_MDC_RD  ((peek16(0xe) >> 13) & 0x1)
+#define BB_MDIO_OUT  poke16(0x28, (0x80 | 30))
+#define BB_MDIO_IN  poke16(0x28, 30)
+#define BB_MDC_OUT  poke16(0x28, (0x80 | 29))
+#define BB_MDC_IN  poke16(0x28, 29)
+#define BB_MDIO_HI  poke16(0x26, (0x80 | 30))
+#define BB_MDIO_LO  poke16(0x26, 30)
+#define BB_MDC_HI  poke16(0x26, (0x80 | 29))
+#define BB_MDC_LO poke16(0x26, 29)
+
+int opt_ethbb = 0;
+static int inline MDIO_RD(void) {
+	if(!opt_ethbb) return SBC_MDIO_RD;
+	else return BB_MDIO_RD;
+}
+static int inline MDC_RD(void) {
+	if(!opt_ethbb) return SBC_MDC_RD;
+	else return BB_MDC_RD;
+}
+static void inline MDIO_OUT(void) {
+	if(!opt_ethbb) SBC_MDIO_OUT;
+	else BB_MDIO_OUT;
+}
+static void inline MDIO_IN(void) {
+	if(!opt_ethbb) SBC_MDIO_IN;
+	else BB_MDIO_IN;
+}
+static void inline MDC_OUT(void) {
+	if(!opt_ethbb) SBC_MDC_OUT;
+	else BB_MDC_OUT;
+}
+static void inline MDC_IN(void) {
+	if(!opt_ethbb) SBC_MDC_IN;
+	else SBC_MDC_IN;
+}
+static void inline MDIO_HI(void) {
+	if(!opt_ethbb) SBC_MDIO_HI;
+	else BB_MDIO_HI;
+}
+static void inline MDIO_LO(void) {
+	if(!opt_ethbb) SBC_MDIO_LO;
+	else BB_MDIO_LO;
+}
+static void inline MDC_HI(void) {
+	if(!opt_ethbb) SBC_MDC_HI;
+	else BB_MDC_HI;
+}
+static void inline MDC_LO(void) {
+	if(!opt_ethbb) SBC_MDC_LO;
+	else BB_MDC_LO;
+}
+
+static int phy_write(unsigned long phy, unsigned long reg, unsigned short data) {
+	int x;
+	unsigned int b;
+
+	if(opt_ethbb) nbuslock();
+
+	MDIO_OUT();
+	MDC_OUT();
+
+	MDC_LO();
+	MDIO_HI();
+
+	/* preamble, toggle clock high then low */
+	for(x=0; x < 32; x++) {
+		MDC_HI();
+		MDC_LO();
+	}
+	/* preamble ends with MDIO high and MDC low */
+
+	/* start bit followed by write bit */
+	for(x=0; x < 2; x++) {
+		MDIO_LO();
+		MDC_HI();
+		MDC_LO();
+		MDIO_HI();
+		MDC_HI();
+		MDC_LO();
+	}
+	/* ends with MDIO high and MDC low */
+
+	/* send the PHY address, starting with MSB */
+	b = 0x10;
+	for(x=0; x < 5; x++) {
+		if (phy & b)
+		  {MDIO_HI();}
+		else
+		  {MDIO_LO();}
+
+		MDC_HI();
+		MDC_LO();
+
+		b >>= 1;
+	}
+	/* ends with MDC low, MDIO indeterminate */
+
+	/* send the register address, starting with MSB */
+	b = 0x10;
+	for(x=0; x < 5; x++) {
+		if (reg & b)
+		  {MDIO_HI();}
+		else
+		  {MDIO_LO();}
+
+		MDC_HI();
+		MDC_LO();
+
+		b >>= 1;
+	}
+
+	/* ends with MDC low, MDIO indeterminate */
+
+	/* clock a one, then clock a zero */
+	MDIO_HI();
+	MDC_HI();
+	MDC_LO();
+
+	MDIO_LO();
+	MDC_HI();
+	MDC_LO();
+
+	/* send the data, starting with MSB */
+	b = 0x8000;
+	for(x=0; x < 16; x++) {
+		if (data & b)
+		 { MDIO_HI();}
+		else
+		  {MDIO_LO();}
+
+		MDC_HI();
+		MDC_LO();
+
+		b >>= 1;
+	}
+
+	MDIO_IN();
+	MDC_IN();
+
+	if(opt_ethbb) nbusunlock();
+	return 0;
+}
+
+static int phy_read(unsigned long phy, unsigned long reg,
+  volatile unsigned short *data) {
+	int x, d;
+	unsigned int a,b;
+
+	d = 0;
+
+	if(opt_ethbb) nbuslock();
+	MDC_OUT();
+	MDIO_OUT();
+
+	MDC_LO();
+	MDIO_HI();
+
+	/* preamble, toggle clock high then low */
+	for(x=0; x < 32; x++) {
+		MDC_HI();
+		MDC_LO();
+	}
+	/* preamble ends with MDIO high and MDC low */
+
+	/* start bit */
+	MDIO_LO(); MDC_HI(); MDC_LO();
+	MDIO_HI(); MDC_HI(); MDC_LO();
+	MDC_HI();  MDC_LO();
+	MDIO_LO(); MDC_HI(); MDC_LO();
+
+	/* send the PHY address, starting with MSB */
+	b = 0x10;
+	for(x=0; x < 5; x++) {
+		if (phy & b)
+		  {MDIO_HI();}
+		else
+		  {MDIO_LO();}
+
+		MDC_HI();
+		MDC_LO();
+
+		b >>= 1;
+		}
+		/* ends with MDC low, MDIO indeterminate */
+
+	/* send the register address, starting with MSB */
+	b = 0x10;
+	for(x=0; x < 5; x++) {
+		if (reg & b)
+		  {MDIO_HI();}
+		else
+		  {MDIO_LO();}
+
+		MDC_HI();
+		MDC_LO();
+
+		b >>= 1;
+	}
+
+	MDIO_IN();
+	/* ends with MDC low, MDIO indeterminate */
+
+	/* another clock */
+	MDC_HI();
+	MDC_LO();
+
+	/* read the data, starting with MSB */
+	b = 0x8000;
+	for(x=0; x < 16; x++) {
+		MDC_HI();
+		a = MDIO_RD();
+
+		if (a & 1)
+		d |= b;
+
+		MDC_LO();
+
+		b >>= 1;
+	}
+
+	MDIO_IN();
+	MDC_IN();
+
+	*data = d;
+	if(opt_ethbb) nbusunlock();
+	return 0;
+}
+
+static uint16_t vtu_readwait(unsigned long reg) {
+	volatile unsigned short x;
+	do {
+		if(phy_read(GLOBAL_REGS_1, reg, &x) < 0) 
+		  fprintf(stderr, "VTU_Read Timeout to 0x%lX\n", reg);
+	} while (x & (1 << 15));
+
+	return x;
+}
+
+static const char *MemberTagString(int tag) {
+	switch(tag) {
+		case 0: return "unmodified";
+		case 1: return "untagged";
+		case 2: return "tagged";
+		default: return "unknown";
+	}
+}
+
+inline void switch_errata_3_1(unsigned int n) {  
+   volatile unsigned short smicmd, x;
+   
+   /* Write 0x0003 to PHY register 13 */
+   do {
+      phy_read(0x17, 0x18, &x); 
+   } while (x & (1 << 15));
+   smicmd = 0x960D | n;
+	phy_write(0x17, 0x19, 0x0003);   /* smi data */		
+	phy_write(0x17, 0x18, smicmd);
+	
+	/* Write 0x0000 to PHY register 14 */
+	do {
+	   phy_read(0x17, 0x18, &x); 
+   } while (x & (1 << 15));
+	smicmd = 0x960E | n;
+	phy_write(0x17, 0x19, 0);   /* smi data */		
+	phy_write(0x17, 0x18, smicmd);
+	
+	/* Write 0x4003 to PHY register 13 */
+	do {
+	   phy_read(0x17, 0x18, &x); 
+   } while (x & (1 << 15));
+   smicmd = 0x960D | n;
+	phy_write(0x17, 0x19, 0x4003);   /* smi data */		
+	phy_write(0x17, 0x18, smicmd);
+	
+	/* Write 0x0000 to PHY register 14 */
+	do {
+	   phy_read(0x17, 0x18, &x); 
+   } while (x & (1 << 15));
+	smicmd = 0x960E | n;
+	phy_write(0x17, 0x19, 0);   /* smi data */		
+	phy_write(0x17, 0x18, smicmd);
+}
+
+inline void switch_enphy(unsigned long phy) {
+   volatile unsigned short x;
+   do {
+	   phy_read(0x17, 0x18, &x); 
+   } while (x & (1 << 15));
+	phy_write(0x17, 0x19, 0xb300);
+	phy_write(0x17, 0x18, phy);
+}
+
+inline void switch_enflood(unsigned long port) {
+	volatile unsigned short data;
+	phy_read(port, 0x04, &data);
+	phy_write(port, 0x04, data | 0xf);
+}
+
+inline void switch_enbcastflood(unsigned long port) {
+	phy_write(port, 0x04, 0x7f);
+}
+
+inline void switch_forcelink(unsigned long port) {
+	volatile unsigned short data;
+	phy_read(port, 0x01, &data);
+	phy_write(port, 0x01, data | 0x30);
+}
+
+static int vtu_add_entry(struct vtu *entry) {
+	int i, j, p;
+	volatile unsigned short x, r7, r8;
+	unsigned short r6[7];
+
+	while(1) {
+		if (phy_read(GLOBAL_REGS_1, VTU_OPS_REGISTER, &x) < 0) {
+			fprintf(stderr, "Timeout %s %d\n", __FILE__, __LINE__);
+			return -1;
+		}
+
+		if (! (x & (1 << 15)))  /* wait for VB=0 in Global Reg 0x05 */
+		break;
+	}
+
+	phy_write(GLOBAL_REGS_1, VTU_VID_REG, (1 << 12) | entry->vid);
+
+	r7 = entry->tags[0] | (entry->tags[1] << 4) | (entry->tags[2] << 8) |
+	  (entry->tags[3] << 12);
+	r8 = entry->tags[4] | (entry->tags[5] << 4) | (entry->tags[6] << 8);
+
+	phy_write(GLOBAL_REGS_1, 0x07, r7);
+	phy_write(GLOBAL_REGS_1, 0x08, r8);
+	phy_write(GLOBAL_REGS_1, VTU_OPS_REGISTER, 0xb000);   /* start the load */
+
+	/* Next, we take care of the VLAN map, which is a per-port
+	bitfield@offset 6 */
+
+	while(1) {
+		if (phy_read(GLOBAL_REGS_1, VTU_OPS_REGISTER, &x) < 0) {
+			fprintf(stderr, "Timeout %s %d\n", __FILE__, __LINE__);
+			return -1;
+		}
+
+		if (! (x & (1 << 15)))  /* wait for VB=0 in Global Reg 0x05 */
+		break;
+	}
+
+	phy_write(GLOBAL_REGS_1, VTU_VID_REG, 0xFFF);
+
+	i=j=0;
+	memset(&r6, 0, sizeof(r6));
+
+	while(1) {
+		x = 0;
+		phy_write(GLOBAL_REGS_1, VTU_OPS_REGISTER, (1 << 15) | VTU_OP_GET_NEXT);
+
+		while(1) {
+			if (phy_read(GLOBAL_REGS_1, VTU_OPS_REGISTER, &x) < 0) {
+				fprintf(stderr, "Timeout %s %d\n", __FILE__, __LINE__);
+				return -1;
+			}
+
+			if (! (x & (1 << 15)))  /* wait for VB=0 in Global Reg 0x05 */
+			break;
+		}
+
+		if (phy_read(GLOBAL_REGS_1, VTU_VID_REG, &x) < 0) {
+			fprintf(stderr, "Timeout %s %d\n", __FILE__, __LINE__);
+			return -1;
+		}
+
+		if ((x & 0xFFF) == 0xFFF)
+		break;
+
+		j++;
+
+		if (phy_read(GLOBAL_REGS_1, 0x07, &r7) < 0) {
+			fprintf(stderr, "Timeout %s %d\n", __FILE__, __LINE__);
+			return -1;
+		}
+
+		if (phy_read(GLOBAL_REGS_1, 0x08, &r8) < 0) {
+			fprintf(stderr, "Timeout %s %d\n", __FILE__, __LINE__);
+			return -1;
+		}
+
+		for(p=0; p < 7; p++) {
+			switch(p) {
+			  case 0: if ((r7 & 0x3) != 0x3)  goto L1; break;
+			  case 1: if ((r7 & 0x30) != 0x30)  goto L1; break;
+			  case 2: if ((r7 & 0x300) != 0x300)  goto L1; break;
+			  case 3: if ((r7 & 0x3000) != 0x3000)  goto L1; break;
+			  case 4: if ((r8 & 0x3) != 0x3)  goto L1; break;
+			  case 5: if ((r8 & 0x30) != 0x30)  goto L1; break;
+			  case 6: if ((r8 & 0x300) != 0x300)  goto L1; break;
+			}
+
+			continue;
+
+L1:
+			for(i=0; i < 7; i++) {
+				if (i != p) {  /* don't set "our" bit in "our" mask register */
+					switch(i) {
+					  case 0: if ((r7 & 0x3) != 0x3) { r6[p] |= (1 << i);  } break;
+					  case 1: if ((r7 & 0x30) != 0x30) { r6[p] |= (1 << i); } break;
+					  case 2: if ((r7 & 0x300) != 0x300) { r6[p] |= (1 << i); } break;
+					  case 3: if ((r7 & 0x3000) != 0x3000) { r6[p] |= (1 << i);  }  break;
+					  case 4: if ((r8 & 0x3) != 0x3) { r6[p] |= (1 << i);  } break;
+					  case 5: if ((r8 & 0x30) != 0x30) { r6[p] |= (1 << i); } break;
+					  case 6: if ((r8 & 0x300) != 0x300) { r6[p] |= (1 << i); } break;
+					}
+				}
+				else if (p != cpu_port) {
+					if (entry->tags[p] != 3) {
+						if (entry->forceVID[p])
+						phy_write(0x18 + p, 0x7, 0x1000 | entry->vid);
+						else
+						phy_write(0x18 + p, 0x7, entry->vid);
+					}
+				}
+			}
+		}
+	}
+
+	for(p=0; p < 7; p++) {
+		phy_write(0x18 + p, 0x6, r6[p]);
+
+		if (entry->tags[p] != 3)
+		phy_write(0x18 + p, 0x8, 0x480);
+	}
+
+	return 0;
+}
+
+static void usage(char **argv) {
+	fprintf(stderr, "Usage: %s [OPTION] ...\n"
+	  "Technologic Systems TS-76xx/TS-46xx/TS-74xx manipulation.\n"
+	  "\n"
+	  "General options:\n"
+	  "  -g, --getmac            Display ethernet MAC address\n"
+	  "  -s, --setmac=MAC        Set ethernet MAC address\n"
+	  "  -R, --reboot            Reboot the board\n"
+	  "  -t, --getrtc            Set system time from RTC\n"
+	  "  -S, --setrtc            Set RTC time from system\n"
+	  "  -o, --rtcinfo           Print RTC info, batt, temp, etc.\n"
+	  "  -v, --nvram             Get/Set RTC NVRAM\n"
+	  "  -i, --info              Display board info\n"
+	  "  -e, --greenledon        Turn green LED on\n"
+	  "  -b, --greenledoff       Turn green LED off\n"
+	  "  -c, --redledon          Turn red LED on\n"
+	  "  -d, --redledoff         Turn red LED off\n"
+	  "  -X, --resetswitchon     Enable reset switch\n"
+	  "  -Y, --resetswitchoff    Disable reset switch\n"
+	  "  -D, --setdio=<pin>      Sets DDR and sets specified pin(s)\n"
+	  "  -O, --clrdio=<pin>      Sets DDR and clears specified pin(s)\n"
+	  "  -G, --getdio=<pin>      Clears DDR and gets DIO pin(s) input value\n"
+	  "  -W, --watchdog          Daemonize and set up /dev/watchdog\n"
+	  "  -q, --cputemp           Print CPU internal and external temperature\n"
+	  "  -h, --help              This help\n",
+	  argv[0]
+	);
+	
+	if(model == 0x7600) {
+		fprintf(stderr,
+		  "  -N, --canon             Enable CAN on DIO pins\n"
+		  "  -f, --canoff            Set CAN pins to DIO mode\n"
+		);  
+	}
+
+	if(!is_7400()) {
+		fprintf(stderr,
+		  "  -a, --address=<adr>     8bit address to use with peek16/poke16\n"
+		  "  -r, --peek16            Read 16bit register at <adr>\n"
+		  "  -w, --poke16=<dat>      Write 16bit <dat> to <adr>\n"
+		  "  -U, --removejp=JP       Remove soft jumper numbered JP (1-8)\n"
+		  "  -J, --setjp=JP          Set soft jumper numbered JP (1-8)\n"
+		  "  -k, --txenon=XUART(s)   Enables the TX Enable for an XUART\n"
+		  "  -K, --txenoff=XUART(s)  Disables a specified TX Enable\n"
+		  "  -x, --random            Get 16-bit hardware random number\n"
+		  "  -n, --setrng            Seed the kernel random number generator\n"
+	 	  "  -l, --loadfpga=FILE     Load FPGA bitstream from FILE\n"
+		);
+	} else {
+		fprintf(stderr,
+		  "  -M, --timewkup=<time>   Time in seconds to wake up after\n"
+		  "  -m, --resetswitchwkup   Wake up at reset switch is press\n"
+		  "  -F, --standby           Standby CPU, must specify -M|-m to wkup\n"
+		  "  -L, --sleep             Sleep CPU, must specify -M|-m to wkup\n"
+		  "  -N, --canon             Enable CAN transcievers\n"
+		  "  -f, --canoff            Disable CAN transcievers\n"
+		  "  -V, --cpuadc            Read and print CPU LRADC values\n"
+		);
+		if(model == 0x7670) {
+		fprintf(stderr, 
+		  "  -4, --485speed=<baud>   Baud rate, required for RS-485HD to function\n"
+		  "  -1, --modbuspoweron     Enable VIN to modbus port\n"
+		  "  -Z, --mosbuspoweroff    Turn off VIN to modbus port\n"
+		  "  -2, --232on             Enable RS-232 transciever\n"
+		  "  -3, --232off            Disable RS-232 transciever to save power\n"
+		);
+		}
+		if(model == 0x7680) {
+		fprintf(stderr,
+		  "  -8, --485_0speed=<baud> Baud rate for RS-485 port 0 (UART 2)\n"
+		  "  -9, --485_1speed=<baud> Baud rate for RS-485 port 1 (UART 3)\n"
+		  "  -1, --modbuspoweron     Enable VIN to modbus port\n"
+		  "  -Z, --mosbuspoweroff    Turn off VIN to modbus port\n"
+		  "  -a, --address=<adr>     8bit address to use with peek16/poke16\n"
+		  "  -r, --peek16            Read 16bit data at <adr> in EEPROM\n"
+		  "  -w, --poke16=<dat>      Write 16bit <dat> to <adr> in EEPROM\n"
+		  "  -6, --peekf             Read 8bit data at <adr> in FPGA\n"
+		  "  -7, --pokef=<dat>       Write 8bit <dat> to <adr> in FPGA\n"
+		);
+		}
+	}
+
+	if(model == 0x4600) {
+		fprintf(stderr,
+		  "  -j, --bbclkon           Enables a 12.5MHz clock on DIO 3\n"
+		  "  -E, --bbclk2on          Enables a 25MHz clock on DIO 37\n"
+		  "  -I, --bbclk3on          Enables a 14.28MHz clock on DIO 3\n"
+		  "  -H, --bbclkoff          Disables all baseboard clocks\n"
+		  "  -u, --touchon           Turns the touchscreen controller on\n"
+		  "  -T, --touchoff          Turns the touchscreen controller off\n"
+		  "  -B, --baseboard         Display baseboard ID\n"
+		  "  -A, --adc               Display MCP3428 ADC readings in millivolts\n"
+		  "  -P, --ethvlan           Set each switch port to its own VLAN\n"
+		  "  -y, --ethswitch         Set all switch ports to switch mode\n"
+		  "  -5, --ethwlan           Sets port A on VLAN, other ports to switch mode\n"
+		  "  -C, --ethinfo           Retrieves info on the onboard switch\n"
+		  "  -Q  --ethbb             --eth* flags above are issued to baseboard switch\n"
+		  );
+	}
+}
+
+static inline
+unsigned char tobcd(unsigned int n) {
+	unsigned char ret;
+	ret = (n / 10) << 4;
+	ret |= n % 10;
+	return ret;
+}
+
+static inline unsigned int frombcd(unsigned char x) {
+	unsigned int ret;
+	ret = (x >> 4) * 10;
+	ret += x & 0xf;
+	return ret;
+}
+
+int main(int argc, char **argv) {
+	int devmem, i, c;
+	unsigned int tagmem[24];
+	unsigned int baseboard = 0;
+	volatile unsigned short swmod;
+	int opt_peek16 = 0, opt_address = 0, opt_poke16 = 0, opt_pokeval = 0;
+	int opt_getmac = 0, opt_setmac = 0, opt_reboot = 0, opt_getrtc = 0;
+	int opt_setrtc = 0, opt_info = 0, opt_greenledon = 0;
+	int opt_greenledoff = 0, opt_redledon = 0, opt_redledoff = 0;
+	int opt_setdio = 0, opt_clrdio = 0, opt_getdio = 0;
+	int opt_watchdog = 0, opt_resetswitchon = 0, opt_resetswitchoff = 0;
+	int opt_cputemp = 0, opt_random = 0, opt_setrng = 0;
+	int opt_removejp = 0, opt_setjp = 0, opt_232 = 0;
+	int opt_rtcinfo = 0, opt_nvram = 0;
+	int opt_touchon = 0, opt_touchoff = 0;
+	int opt_bbclkon = 0, opt_bbclkoff = 0, opt_bbclk2on=0, opt_bbclk3on=0;
+	int opt_txenoff = 0, opt_txenon = 0, opt_can = 0;
+	int opt_ethvlan = 0, opt_ethswitch = 0, opt_ethinfo = 0, opt_ethwlan=0;
+	int opt_sleepmode = 0, opt_resetswitchwkup = 0;
+	int opt_extwkup = 0, opt_timewkup = 0, opt_485speed = 0;
+	int opt_baseboard = 0, opt_adc = 0, opt_modbuspoweron = 0;
+	int opt_modbuspoweroff = 0, opt_cpuadc = 0;
+	int opt_pokef = 0, opt_peekf = 0, opt_485_0speed = 0, opt_485_1speed = 0;
+	int opt_dac0 = 0, opt_dac1 = 0, opt_dac2 = 0, opt_dac3 = 0;
+	char *setdio = NULL, *clrdio = NULL, *getdio = NULL, *txen_on = NULL;
+	char *txen_off = NULL;
+	char *opt_mac = NULL, *opt_loadfpga = NULL;
+	static struct option long_options[] = {
+	  { "modbuspoweron", 0, 0, '1'},
+	  { "modbuspoweroff", 0, 0, 'Z'},
+	  { "485speed", 1, 0, '4'},
+	  { "232en", 0, 0, '2'},
+	  { "232dis", 0, 0, '3'},
+	  { "232on", 0, 0, '2'},
+	  { "232off", 0, 0, '3'},
+	  { "sleep", 0, 0, 'L' },
+	  { "standby", 0, 0, 'F' },
+	  { "resetswitchwkup", 0, 0, 'm' },
+	  { "cpuadc", 0, 0, 'V' },
+	  { "timewkup", 1, 0, 'M' },
+	  { "help", 0, 0, 'h' },
+	  { "peek16", 0, 0, 'r' },
+	  { "poke16", 1, 0, 'w' },
+	  { "address", 1, 0, 'a' },
+	  { "getmac", 0, 0, 'g' },
+	  { "setmac", 1, 0, 's' },
+	  { "reboot", 0, 0, 'R' },
+	  { "getrtc", 0, 0, 't' },
+	  { "setrtc", 0, 0, 'S' },
+	  { "rtcinfo", 0, 0, 'o' },
+	  { "greenledon", 0, 0, 'e'},
+	  { "greenledoff", 0, 0, 'b'},
+	  { "redledon", 0, 0, 'c'},
+	  { "redledoff", 0, 0, 'd'},
+	  { "setdio", 1, 0, 'D'},
+	  { "clrdio", 1, 0, 'O'},
+	  { "getdio", 1, 0, 'G'},
+	  { "info", 0, 0, 'i' },
+	  { "baseboard", 0, 0, 'B'},
+	  { "random", 0, 0, 'x' },
+	  { "watchdog", 0, 0, 'W' },
+	  { "setrng", 0, 0, 'n' },
+	  { "resetswitchon", 0, 0, 'X' },
+	  { "resetswitchoff", 0, 0, 'Y' },
+	  { "loadfpga", 1, 0, 'l' },
+	  { "cputemp", 0, 0, 'q' },
+	  { "removejp", 1, 0, 'U' },
+	  { "setjp", 1, 0, 'J' },
+	  { "nvram", 0, 0, 'v' },
+	  { "touchon", 0, 0, 'u' },
+	  { "touchoff", 0, 0, 'T' },
+	  { "bbclkon", 0, 0, 'j' },
+	  { "bbclk2on", 0, 0, 'E' },
+	  { "bbclk3on", 0, 0, 'I' },
+	  { "bbclkoff", 0, 0, 'H' },
+	  { "txenon", 1, 0, 'k' },
+	  { "txenoff", 1, 0, 'K' },
+	  { "canon", 0, 0, 'N' },
+	  { "canoff", 0, 0, 'f' },
+	  { "ethvlan", 0, 0, 'P' },
+	  { "ethswitch", 0, 0, 'y' },
+	  { "ethinfo", 0, 0, 'C' },
+	  { "ethwlan", 0, 0, '5' },
+	  { "adc", 0, 0, 'A' },
+	  { "ethbb", 0, 0, 'Q' },
+	  { "peekf", 0, 0, '6' },
+	  { "pokef", 1, 0, '7' },
+	  { "485_0speed", 1, 0, '8' },
+	  { "485_1speed", 1, 0, '9' },
+	  { "dac0", 1, 0, 0 },
+	  { "dac1", 1, 0, 1 },
+	  { "dac2", 1, 0, 2 },
+	  { "dac3", 1, 0, 3 },
+	  { 0, 0, 0, 0 }
+	};
+
+	devmem = open("/dev/mem", O_RDWR|O_SYNC);
+	assert(devmem != -1);
+	mxgpioregs = mmap(0, getpagesize(), PROT_READ|PROT_WRITE, MAP_SHARED,
+	  devmem, 0x80018000);
+
+	if(!is_7400()) {
+		
+		nbuslock();
+		mxgpioregs[0x104/4] = 0x0000ffff; //Set pinmux to GPIO
+		mxgpioregs[0x114/4] = 0x003f0c03; //Set pinmux to GPIO
+		mxgpioregs[0x704/4] = 0x070100ff; //Set to logic high
+		mxgpioregs[0xb00/4] = 0x070100ff; //Set to output
+	
+		model = peek16(0);
+		nbusunlock();
+	}
+
+	while((c = getopt_long(argc, argv,
+	  "1234:567:8:9:ABCD:EFG:HIJ:K:LM:N:O:PQ:RSTU:VWXYZa:bcdef:ghijk:l:mnoqrs:tuvw:xy",
+	  long_options, NULL)) != -1) {
+		switch (c) {
+		case 0:
+			opt_dac0 = ((strtoul(optarg, NULL, 0) & 0xfff) << 1) | 0x1;
+			break;
+		case 1: 
+			opt_dac1 = ((strtoul(optarg, NULL, 0) & 0xfff) << 1) | 0x1;
+			break;
+		case 2:
+			opt_dac2 = ((strtoul(optarg, NULL, 0) & 0xfff) << 1) | 0x1;
+			break;
+		case 3: 
+			opt_dac3 = ((strtoul(optarg, NULL, 0) & 0xfff) << 1) | 0x1;
+			break;
+		case '2':
+			opt_232 = 1;
+			break;
+		case '3':
+			opt_232 = 2;
+			break;
+		case '4':
+			opt_485speed = strtoul(optarg, NULL, 0);
+			break;
+		case '6':
+			opt_peekf = 1;
+			break;
+		case '7':
+			opt_pokef = 1;
+			opt_pokeval = strtoul(optarg, NULL, 0);
+			break;
+		case '8':
+			opt_485_0speed = strtoul(optarg, NULL, 0);
+			break;
+		case '9':
+			opt_485_1speed = strtoul(optarg, NULL, 0);
+			break;
+		case '1':
+			opt_modbuspoweron = 1;
+			break;
+		case 'Z':
+			opt_modbuspoweroff = 1;
+			break;
+		case 'M':
+			opt_timewkup = strtoul(optarg, NULL, 0);
+			break;
+		case 'm':
+			opt_resetswitchwkup = 1;
+			break;
+		case 'V':
+			opt_cpuadc = 1;
+			break;
+		case 'F':
+			opt_sleepmode = 2;
+			break;
+		case 'L':
+			opt_sleepmode = 1;
+			break;
+		case 'v':
+			opt_nvram = 1;
+			break;
+		case 'q':
+			opt_cputemp = 1;
+			break;
+		case 'n':
+			opt_setrng = 1;
+			break;
+		case 'l':
+			opt_loadfpga = strdup(optarg);
+			break;
+		case 'X':
+			opt_resetswitchon = 1;
+			break;
+		case 'Y':
+			opt_resetswitchoff = 1;
+			break;
+		case 'W':
+			opt_watchdog = 1;
+			break;
+		case 'D':
+			opt_setdio = 1;	
+			setdio = strdup(optarg);
+			break;
+		case 'O':
+			opt_clrdio = 1;
+			clrdio = strdup(optarg);
+			break;
+		case 'G':
+			opt_getdio = 1;
+			getdio = strdup(optarg);
+			break;
+		case 'e':
+			opt_greenledon = 1;
+			break;
+		case 'b':
+			opt_greenledoff = 1;
+			break;
+		case 'c':
+			opt_redledon = 1;
+			break;
+		case 'd':
+			opt_redledoff = 1;
+			break;
+		case 'i':
+			opt_info = 1;
+			break;
+		case 'B':
+			opt_baseboard = 1;
+			break;
+		case 'S':
+			opt_setrtc = 1;
+			break;
+		case 'r':
+			opt_peek16 = 1;
+			break;
+		case 'a':
+			opt_address = strtoul(optarg, NULL, 0);
+			break;
+		case 'w':
+			opt_poke16 = 1;
+			opt_pokeval = strtoul(optarg, NULL, 0);
+			break;
+		case 'g':
+			opt_getmac = 1;
+			break;
+		case 's':
+			opt_setmac = 1;
+			opt_mac = strdup(optarg);
+			break;
+		case 'R':
+			opt_reboot = 1;
+			break;
+		case 't':
+			opt_getrtc = 1;
+			break;
+		case 'o':
+			opt_rtcinfo = 1;
+			break;
+		case 'x':
+			opt_random = 1;
+			break;
+		case 'U':
+			opt_removejp = strtoull(optarg, NULL, 0);
+			break;
+		case 'J':
+			opt_setjp = strtoull(optarg, NULL, 0);
+			break;
+		case 'T':
+			opt_touchoff = 1;
+			break;
+		case 'u':
+			opt_touchoff = 1;
+			opt_touchon = 1;
+			opt_baseboard = 1;
+			break;
+		case 'j':
+			opt_bbclkon = 1;
+			opt_bbclkoff = 1;
+			break;
+		case 'E':
+			opt_bbclk2on = 1;
+			opt_bbclkoff = 1;
+			break;
+		case 'I':
+			opt_bbclk3on = 1;
+			opt_bbclkoff = 1;
+			break;
+		case 'H':
+			opt_bbclkoff = 1;
+			break;
+		case 'k':
+			opt_txenon = 1;
+			txen_on = strdup(optarg);
+			break;
+		case 'K':
+			opt_txenoff = 1;
+			txen_off = strdup(optarg);
+			break;
+		case 'N':
+			opt_can = 1;
+			break;
+		case 'f':
+			opt_can = 2;
+			break;
+		case 'P':
+			opt_ethvlan = 1;
+			break;
+		case 'y':
+			opt_ethswitch = 1;
+			break;
+		case 'C':
+			opt_ethinfo = 1;
+			break;
+		case '5':
+			opt_ethwlan = 1;
+			break;
+		case 'A':
+			opt_baseboard = 1;
+			opt_adc = 1;
+			break;
+		case 'Q':
+			opt_ethbb = 1;
+			break;
+		case 'h':
+		default:
+			usage(argv);
+			return(1);
+		}
+	}
+	
+	if (opt_loadfpga) {
+		unsigned int prev_gpio_en, prev_gpio_ddr, prev_gpio_mux;
+		signed char x;
+		const char * ispvmerr[] = { "pass", "verification fail",
+		  "can't find the file", "wrong file type", "file error",
+		  "option error", "crc verification error" };
+		
+		if(model == 0x7680) {
+			/* Switch SPI pins to SPI mode */
+			prev_gpio_mux = mxgpioregs[0x150/4];
+			prev_gpio_en = mxgpioregs[0x720/4];
+			prev_gpio_ddr = mxgpioregs[0xb20/4];
+
+			/* Put most SPI pins to SPI mode */
+			//mosi, miso, ss0
+			mxgpioregs[0x158/4] = 0xff;
+			//clk stay as GPIO for now
+			mxgpioregs[0x154/4] = 0x3;
+			mxgpioregs[0xb24/4] = 0x10000; //set clk output
+			/* Leave SPI_RESET and CS in GPIO mode */
+			//mxgpioregs[0x154/4] = 0xf00;
+			//Set reset, done, and CS to gpio, even though they already should be
+			mxgpioregs[0x134/4] = 0x3f;
+			/* Set FPGA_DONE pin as input, reset and CS as output */
+			mxgpioregs[0xb18/4] = 0x10000;
+			mxgpioregs[0xb14/4] = 0x60000;
+
+			/* The iCE40 chip needs to have the following done to
+			 * put it in the mode for us to program it:
+			 *
+			 * CS pulled low
+			 * FPGA_RESET pulled low
+			 * SPI_CLK pulled high
+			 * Wait at least 200ns
+			 * FPGA_RESET pulled high
+			 * Wait@least 200us
+
+			 * Start sending data, MSB, falling edge, 1MHz to 25MHz
+			 * Send minimum of 49 additional clocks
+			 * Check FPGA_DONE, 1 == done
+			 *
+			 * Manual notes in bold and multiple times, that the
+			 * SPI data stream must be uninterrupted, no idea what
+			 * that actually means...
+			 */
+
+			x = ispSPI(opt_loadfpga);
+			nbusunlock();
+			if(x == 0) {
+				printf("loadfpga_ok=1\n");
+			} else {
+				printf("loadfpga_ok=0\n");
+				printf("loadfpga_error=\"%s\"\n", ispvmerr[-x]);
+			}
+
+			mxgpioregs[0xb20/4] = prev_gpio_ddr;
+			mxgpioregs[0x720/4] = prev_gpio_en;
+			mxgpioregs[0x150/4] = prev_gpio_mux;
+
+		} else if(!is_7400()) {
+
+			mxtimerregs = (unsigned int *) mmap(0, getpagesize(),
+			  PROT_READ | PROT_WRITE, MAP_SHARED, devmem, 0x80068000);
+			prev_gpio_mux = mxgpioregs[0x160/4];
+			prev_gpio_en = mxgpioregs[0x730/4];
+			prev_gpio_ddr = mxgpioregs[0xb30/4];
+			/* switch JTAG pins into GPIO mode */
+			mxgpioregs[0x160/4] |= 0xF;
+			/* Set dout, clk, tms as outputs */
+			mxgpioregs[0xb30/4] |= 0xD;
+			mxgpioregs[0xb30/4] &= ~(0x2); /* Din as inputs */
+	
+			x = ispVM(opt_loadfpga);
+			nbusunlock();
+			if (x == 0) {
+				printf("loadfpga_ok=1\n");
+			} else {
+				assert(x < 0);
+				printf("loadfpga_ok=0\n");
+				printf("loadfpga_error=\"%s\"\n", ispvmerr[-x]);
+			}
+	
+			mxgpioregs[0xb30/4] = prev_gpio_ddr;
+			mxgpioregs[0x730/4] = prev_gpio_en;
+			mxgpioregs[0x160/4] = prev_gpio_mux;
+		}
+	}
+	nbuslock();
+
+	if (opt_cputemp) {
+		signed int temp[2] = {0,0}, x;
+		volatile unsigned int *mxlradcregs;
+
+		nbusunlock();
+		mxlradcregs = (unsigned int *) mmap(0, getpagesize(),
+		  PROT_READ | PROT_WRITE, MAP_SHARED, devmem, 0x80050000);
+
+		if(!is_7400()) {
+			mxlradcregs[0x148/4] = 0xf;
+			mxlradcregs[0x144/4] = 0x0; //Set LRDAC0 to channel 0
+			mxlradcregs[0x50/4] = 0x0; //Clear ch0 reg
+			for(x = 0; x < 20; x++) {
+				/*
+				 * Clear interrupt
+				 * Set to 20uA or 300uA mode and enable current source
+				 * Start conversion
+				 * Poll for sample completion
+				 * Pull out samples
+				 */
+				mxlradcregs[0x18/4] = 0x1;
+				if(x < 10) mxlradcregs[0x20/4] = 0x8101;
+				else mxlradcregs[0x20/4] = 0x810F;
+				mxlradcregs[0x04/4] = 0x1;
+				while(!(mxlradcregs[0x10/4] & 0x1));
+				if(x < 10) temp[0] += (mxlradcregs[0x50/4] & 0xffff);
+				else temp[1] += (mxlradcregs[0x50/4] & 0xffff);
+			}	
+			mxlradcregs[0x28/4] = 0x8100;
+			temp[0] = (((temp[1] - temp[0])*1104)-2730000) + 30000;
+			//+30000 is for compensation of wire impedence
+			printf("external_temp=%d.%d\n", temp[0] / 10000,
+			  abs(temp[0] % 10000));
+		}
+		
+		mxlradcregs[0x148/4] = 0xFF;
+		mxlradcregs[0x144/4] = 0x98; //Set to temp sense mode
+		mxlradcregs[0x28/4] = 0x8300; //Enable temp sense block
+		mxlradcregs[0x50/4] = 0x0; //Clear ch0 reg
+		mxlradcregs[0x60/4] = 0x0; //Clear ch1 reg
+		temp[0] = temp[1] = 0;
+
+		for(x = 0; x < 10; x++) {
+			/* Clear interrupts
+			 * Schedule readings
+			 * Poll for sample completion
+			 * Pull out samples*/
+			mxlradcregs[0x18/4] = 0x3;
+			mxlradcregs[0x4/4] = 0x3;
+			while(!((mxlradcregs[0x10/4] & 0x3) == 0x3)) ;
+			temp[0] += mxlradcregs[0x60/4] & 0xFFFF;
+			temp[1] += mxlradcregs[0x50/4] & 0xFFFF;
+		}
+		temp[0] = (((temp[0] - temp[1]) * (1012/4)) - 2730000);
+		printf("internal_temp=%d.%d\n",temp[0] / 10000,
+		  abs(temp[0] % 10000));
+		nbuslock();
+	}
+
+	if(opt_poke16 && !is_7400()) {
+		poke16(opt_address, opt_pokeval);
+	}
+
+	if(opt_peek16 && !is_7400()) {
+		i = peek16(opt_address);
+		nbusunlock();
+		printf("0x%x\n", i);
+		nbuslock();
+	}
+
+	if (opt_setmac) {
+		/* This uses one time programmable memory. */
+		unsigned int a, b, c;
+		int r;
+		volatile unsigned int *mxocotpregs;
+		nbusunlock();
+
+		r = sscanf(opt_mac, "%*x:%*x:%*x:%x:%x:%x",  &a,&b,&c);
+		assert(r == 3); /* XXX: user arg problem */
+
+		mxocotpregs = (unsigned int *) mmap(0, getpagesize(),
+		  PROT_READ | PROT_WRITE, MAP_SHARED, devmem, 0x8002C000);
+
+		mxocotpregs[0x08/4] = 0x200;
+		mxocotpregs[0x0/4] = 0x1000;
+		while(mxocotpregs[0x0/4] & 0x100) ; //check busy flag
+		if(mxocotpregs[0x20/4] & (0xFFFFFF)) {
+			printf("MAC address previously set, cannot set\n");
+		} else {
+			assert(a < 0x100);
+			assert(b < 0x100);
+			assert(c < 0x100);
+			mxocotpregs[0x0/4] = 0x3E770000;
+			mxocotpregs[0x10/4] = (a<<16|b<<8|c);
+		}
+		mxocotpregs[0x0/4] = 0x0;
+		nbuslock();
+	}
+
+	if (opt_getmac) {
+		unsigned char a, b, c;
+		unsigned int mac, i;
+		volatile unsigned int *mxocotpregs;
+		mxocotpregs = (unsigned int *) mmap(0, getpagesize(),
+		  PROT_READ | PROT_WRITE, MAP_SHARED, devmem, 0x8002C000);
+
+		mxocotpregs[0x08/4] = 0x200;
+		mxocotpregs[0x0/4] = 0x1000;
+		while(mxocotpregs[0x0/4] & 0x100) ; //check busy flag
+		mac = mxocotpregs[0x20/4] & 0xFFFFFF;
+		if(!mac) {
+			mxocotpregs[0x0/4] = 0x0; //Close the reg first
+			mxocotpregs[0x08/4] = 0x200;
+			mxocotpregs[0x0/4] = 0x1013;
+			while(mxocotpregs[0x0/4] & 0x100) ; //check busy flag
+			mac = (unsigned short) mxocotpregs[0x150/4];
+			mac |= 0x4f0000;
+		}
+		mxocotpregs[0x0/4] = 0x0;
+
+		a = mac >> 16;
+		b = mac >> 8;
+		c = mac;
+		
+		if(!is_7400()) {
+			read_tagmem(tagmem);
+		}
+		nbusunlock();
+		printf("mac=00:d0:69:%02x:%02x:%02x\n", a, b, c);
+		printf("shortmac=%02x%02x%02x\n", a, b, c);
+		printf("model=0x%x\n", model);
+
+		if(!is_7400()) {
+			for (i = 0; i < 8; i++) printf("jp%d=%c\n", i + 1,
+			  ((tagmem[0] & (1<<i)) ? '0' : '1'));
+		} else {
+			for (i = 0; i < 8; i++) printf("jp%d=%c\n", i + 1,
+			  '0');
+		}
+		nbuslock();
+	}
+
+	if ((opt_setjp || opt_removejp) && !is_7400()) {
+		unsigned int origtag[24];
+	        read_tagmem(origtag);
+		memcpy(tagmem, origtag, 24 * sizeof (int));
+
+	        if (opt_setjp) tagmem[0] &= (char)~(1<<(opt_setjp-1));
+	        else tagmem[0] |= (char)(1<<(opt_removejp-1));
+		if(memcmp(origtag, tagmem, 24 * sizeof (int))) {
+	        	erase_tagmem();
+		        write_tagmem(tagmem);
+		}
+	}
+	
+	if(opt_rtcinfo) {
+		unsigned char rtcdat[11];
+
+		rtc_read(0x28, &rtcdat, 2);
+		nbusunlock();
+		printf("rtctemp_millicelsius=%d\n",
+		  ((rtcdat[0]|(rtcdat[1]<<8))*500)-273000);
+		nbuslock();
+		rtc_read(0x7, &rtcdat, 1);
+		rtc_read(0x16, &rtcdat[1], 5);
+		rtc_read(0x1b, &rtcdat[6], 5);
+
+		nbusunlock();
+		printf("rtcinfo_oscillator_ok=%d\n",
+		  ((rtcdat[0] & 0x41) ? 0 : 1));
+		printf("rtcinfo_batt_low=%d\n",
+		  ((rtcdat[0] & 4) >> 2));
+		printf("rtcinfo_batt_crit=%d\n",
+		  ((rtcdat[0] & 2) >> 1));
+		printf("rtcinfo_firstpoweroff=%02x%02x%02x%02x%02x\n",
+		  rtcdat[5], rtcdat[4], (rtcdat[3] & 0x7f), rtcdat[2],
+		  rtcdat[1]);
+		printf("rtcinfo_lastpoweron=%02x%02x%02x%02x%02x\n",
+		  rtcdat[10], rtcdat[9], (rtcdat[8] & 0x7f), rtcdat[7],
+		  rtcdat[6]);
+		nbuslock();
+		rtcdat[0] = 0x80;
+		rtc_write(0x9, &rtcdat, 1);
+	}
+
+			
+	if (opt_setrtc) {
+		unsigned char rtcdat[7];
+		time_t now = time(NULL);
+		struct tm *tm;
+
+		rtc_read(0xd, &rtcdat, 1);
+		rtcdat[0] = (0xc0 | (rtcdat[0] & 0x1f));
+		rtcdat[1] = 0x51;
+		rtcdat[2] = 0x0;
+		rtcdat[3] = 0x24;
+		
+		rtc_write(0x8, &rtcdat[1], 3);
+		rtc_write(0xd, &rtcdat[0], 1);
+		
+		nbusunlock();
+
+		tm = gmtime(&now);
+		rtcdat[0] = tobcd((tm->tm_sec)+2);
+		rtcdat[1] = tobcd(tm->tm_min);
+		rtcdat[2] = tobcd(tm->tm_hour) | 0x80; //24 hour bit
+		rtcdat[3] = tobcd(tm->tm_mday);
+		rtcdat[4] = tobcd(tm->tm_mon + 1);
+		assert(tm->tm_year >= 100);
+		rtcdat[5] = tobcd(tm->tm_year % 100);
+		rtcdat[6] = tm->tm_wday + 1;
+
+		nbuslock();
+		
+		rtc_write(0x0, &rtcdat, 7);
+	}
+
+	if (opt_getrtc) {
+	        unsigned char rtcdat[8];
+	        time_t now;
+	        struct tm tm;
+	        struct timeval tv;
+	
+		rtc_read(0x0, &rtcdat, 8);
+
+		nbusunlock();
+		printf("rtc_oscillator_ok=%d\n", rtcdat[7] & 1 ? 0 : 1);
+	        if (!(rtcdat[7] & 1)) {
+	                tm.tm_sec = frombcd(rtcdat[0] & 0x7f);
+	                tm.tm_min = frombcd(rtcdat[1] & 0x7f);
+	                tm.tm_hour = frombcd(rtcdat[2] & 0x3f);
+	                tm.tm_mday = frombcd(rtcdat[3] & 0x3f);
+	                tm.tm_mon = frombcd(rtcdat[4] & 0x1f) - 1;
+	                tm.tm_year = frombcd(rtcdat[5]) + 100;
+	                setenv("TZ", "UTC", 1);
+	                now = mktime(&tm);
+	                tv.tv_sec = now;
+	                tv.tv_usec = 0;
+	                settimeofday(&tv, NULL);
+	        }
+		nbuslock();
+	}
+	if (opt_nvram) {
+		unsigned int dat[32], x;
+	        unsigned char *cdat = (unsigned char *)dat;
+		char *e, var[8];
+	
+		nvram_read(0x0, cdat, 128);
+	        for (i = 0; i < 32; i++) {
+	                sprintf(var, "nvram%d", i);
+	                e = getenv(var);
+	                if (e) {
+	                        x = strtoul(e, NULL, 0);
+				nvram_write(i<<2, &x, 4);
+	                }
+	        }
+		nbusunlock();
+	        for (i = 0; i < 32; i++) printf("nvram%d=0x%x\n", i, dat[i]);
+		nbuslock();
+	}
+
+
+	if(opt_resetswitchon && !is_7400()) {
+		unsigned short x;
+		x = peek16(0x2);
+		poke16(0x2, (x | (1 << 11)));
+	} else if(opt_resetswitchoff && !is_7400()) {
+		unsigned short x;
+		x = peek16(0x2);
+		poke16(0x2, (x & ~(1 << 11)));
+	}
+
+	if(opt_resetswitchon && is_7400()) {
+		unsigned char dat = 0x42;
+		m0_write(&dat, 1);
+	} else if(opt_resetswitchoff && is_7400()) {
+		unsigned char dat = 0x40;
+		m0_write(&dat, 1);
+	}
+
+	if(opt_info && !is_7400()) {
+		unsigned short x, y;
+		x = peek16(0x0);
+		y = peek16(0x2);
+		nbusunlock();
+		printf("model=0x%x\n", x);
+		printf("submodel=0x%x\n", (y >> 4) & 0xf);
+		printf("revision=0x%x\n", (y & 0xf));
+		printf("bootmode=0x%x\n", (y >> 8) & 0x1);
+		//printf("bootdev=0x%x\n", (y >> 12) & 0x3);
+		printf("fpga_pn=LFXP25E\n");
+		printf("resetsw_en=0x%x\n", (y >> 11) & 0x1);
+		nbuslock();
+	} else if(opt_info && is_7400()) {
+		unsigned char dat[18];
+		m0_read(&dat, 17);
+		if(model == 0x7680) fpga_read(0x3f, &dat[17], 1);
+		nbusunlock();
+		printf("model=0x%x\n", model);
+		printf("bootmode=0x%x\n", (dat[15] >> 3) & 0x1);
+		printf("revision=0x%x\n", (dat[16] >> 4) & 0xf);
+		if(model == 0x7680) printf("fpga_revision=0x%x\n", dat[17]);
+		printf("reboot_source=");
+		switch(dat[15] & 0x7) {
+		  case 0:
+			printf("poweron\n");
+			break;
+		  case 1:
+			printf("WDT\n");
+			break;
+		  case 2:
+			printf("resetswitch\n");
+			break;
+		  case 3:
+			printf("sleep\n");
+			break;
+		  case 4:
+			printf("uart_break\n");
+			break;
+		}
+		nbuslock();
+	}
+
+	if(opt_sleepmode) {
+		unsigned char dat[4] = {0};
+
+		dat[0]=(0x1 | (opt_resetswitchwkup << 1) | (opt_extwkup << 2) |
+		  ((opt_sleepmode-1) << 4) | 1 << 6);
+		dat[3] = (opt_timewkup & 0xff);
+		dat[2] = ((opt_timewkup >> 8) & 0xff);
+		dat[1] = ((opt_timewkup >> 16) & 0xff);
+		m0_write(&dat, 4);
+	}
+
+	if (opt_reboot) {
+		struct sched_param sched;
+		unsigned char dat[3] = {0, 0, 0};
+		sync();
+		if(is_7400()) {
+			m0_write(&dat, 3);
+		} else poke16(0x2a, 0);
+		sched.sched_priority = 99;
+		sched_setscheduler(0, SCHED_FIFO, &sched);
+		while(1);
+	}
+
+	if(opt_setdio && !is_7400()) {
+		int j = 0, sz = strlen(setdio);
+		char *st = 0, *en = 0;
+		for(st = setdio; j < sz; st = en + 1) {
+			int dio = strtoul(st, &en, 0);
+			j += (en - st) + 1;
+			poke16(0x26, (0x80 | dio));
+			poke16(0x28, (0x80 | dio));
+		}
+	} else if(opt_setdio && is_7400()) {
+		int pin, bank, reg, muxpin;
+		char *en = 0, buf[1] = {0x3}; //OE and val
+		
+
+		setdio = strtok(setdio, ",");
+		while(setdio != NULL) {
+			bank = strtoul(setdio, &en, 0);
+			if(*en != '_' && model == 0x7680) {
+				if(bank >= 23 && bank <= 35) {
+					bank -= 14;
+					if(bank == 9) bank = 10;
+					fpga_write(bank, &buf, 1);
+				}
+			} else {
+				nbusunlock();
+				assert(bank < 5 && bank >= 0);
+				nbuslock();
+				pin = strtol((en+1), 0, 0);
+				if(pin > 15) {
+					reg = 1;
+					muxpin = pin - 16;
+				} else {
+					reg = 0;
+					muxpin = pin;
+				}
+				/* Set pin as GPIO */
+				mxgpioregs[((0x100) + (0x20 * bank) + (0x10 * reg) +
+				  (0x4))/4] = (0x3 << (muxpin * 2)); 
+				/* Set data */
+				mxgpioregs[((0x700) + (0x10 * bank) + (0x4))/4] =
+				  (0x1 << pin);
+				/* Set pin to output */
+				mxgpioregs[((0xB00) + (0x10 * bank) + (0x4))/4] =
+				  (0x1 << pin);
+			}
+			setdio = strtok(NULL, ",");
+		}
+	}
+
+	if(opt_clrdio && !is_7400()) {
+		int j = 0, sz = strlen(clrdio);
+		char *st = 0, *en = 0;
+		for(st = clrdio; j < sz; st = en + 1) {
+			int dio = strtoul(st, &en, 0);
+			j += (en - st) + 1;
+			poke16(0x26, (~0x80 & dio));
+			poke16(0x28, (0x80 | dio));
+		}
+	} else if(opt_clrdio && is_7400()) {
+		int pin, bank, reg, muxpin;
+		char *en = 0, buf[1] = {0x1}; //OE and val
+
+		clrdio = strtok(clrdio, ",");
+		while(clrdio != NULL) {
+			bank = strtoul(clrdio, &en, 0);
+			if(*en != '_' && model == 0x7680) {
+				if(bank >= 23 && bank <= 35) {
+					bank -= 14;
+					if(bank == 9) bank = 10;
+					fpga_write(bank, &buf, 1);
+				} else if(bank >= 0 && bank <= 2) {
+					bank++;
+					fpga_write(bank, &buf, 1);
+				}
+			} else {
+				nbusunlock();
+				assert(bank < 5 && bank >= 0);
+				nbuslock();
+				pin = strtol((en+1), 0, 0);
+				if(pin > 15) {
+					reg = 1;
+					muxpin = pin - 16;
+				} else {
+					reg = 0;
+					muxpin = pin;
+				}
+				/* Set pin as GPIO */
+				mxgpioregs[((0x100) + (0x20 * bank) + (0x10 * reg) +
+				   (0x4))/4] = (0x3 << (muxpin * 2)); 
+				/* Clr data */
+				mxgpioregs[((0x700) + (0x10 * bank) + (0x8))/4] =
+				  (0x1 << pin);
+				/* Set pin to output */
+				mxgpioregs[((0xB00) + (0x10 * bank) + (0x4))/4] =
+				  (0x1 << pin);
+			}
+			clrdio = strtok(NULL, ",");
+		}
+	}
+
+	if(opt_getdio && !is_7400()) {
+		int j = 0, sz = strlen(getdio);
+		char *st = 0, *en = 0;
+		for(st = getdio; j < sz; st = en + 1) {
+			int dio = strtoul(st, &en, 0);
+			int value = -1;
+			j += (en - st) + 1;
+			poke16(0x28, (~0x80 & dio));
+			if(dio < 16)
+			  value = (peek16(0x08) >> (dio));
+			else if (dio < 32)
+			  value = (peek16(0x0e) >> (dio - 16));
+			else if (dio < 48)
+			  value = (peek16(0x14) >> (dio - 32));
+			else if (dio < 64)
+			  value = (peek16(0x1a) >> (dio - 48));
+			else if (dio < 70)
+			  value = (peek16(0x20) >> (dio - 64));
+			nbusunlock();
+			printf("dio%d=%d\n", dio, value & 0x1);
+			nbuslock();
+		}
+	} else if(opt_getdio && is_7400()) {
+		int pin, bank, reg, muxpin, dio;
+		char *en = 0, buf[2] = {0x0, 0x0}; //OE and val
+
+		getdio = strtok(getdio, ",");
+		while(getdio != NULL) {
+			bank = strtoul(getdio, &en, 0);
+			if(*en != '_' && model == 0x7680) {
+				dio = bank;
+				if(bank >= 23 && bank <= 35) {
+					bank -= 14;
+					if(bank == 9) bank = 10;
+					fpga_write(bank, &buf[0], 1);
+					fpga_read(bank, &buf[1], 1);
+					nbusunlock();
+					printf("dio%d=%d\n", dio, ((buf[1] >> 2) & 0x1));
+					nbuslock();
+				} else if(bank >= 0 && bank <= 2) {
+					bank++;
+					fpga_write(bank, &buf, 1);
+					bank = 22;
+					fpga_read(bank, &buf[1], 1);
+					nbusunlock();
+					printf("dio%d=%d\n", dio, ((buf[1] >> dio) & 0x1));
+					nbuslock();
+				}
+			} else {
+				nbusunlock();
+				assert(bank < 5 && bank >= 0);
+				pin = strtol((en+1), 0, 0);
+				if(pin > 15) {
+					reg = 1;
+					muxpin = pin - 16;
+				} else {
+					reg = 0;
+					muxpin = pin;
+				}
+				/* Set pin as GPIO */
+				mxgpioregs[((0x100) + (0x20 * bank) + (0x10 * reg) +
+				   (0x4))/4] = (0x3 << (muxpin * 2));
+				/* Set pin to input */
+				mxgpioregs[((0xB00) + (0x10 * bank) + (0x8))/4] =
+				  (0x1 << pin);
+				printf("dio%d_%d=%d\n", bank, pin,
+				  (((mxgpioregs[((0x900) + (0x10 * bank))/4]) >> pin) &
+				  0x1));
+				nbuslock();
+			}
+			getdio = strtok(NULL, ",");
+		}
+	}
+
+	if(opt_232 && model == 0x7670) {
+		mxgpioregs[(0x134)/4] = (0x3 << 9); 
+		if(opt_232 == 1)
+		  mxgpioregs[(0x714)/4] = (0x1 << 25);
+		else
+		  mxgpioregs[(0x718)/4] = (0x1 << 25);
+		mxgpioregs[(0xB14)/4] = (0x1 << 25);
+	}
+
+	if(opt_can && is_7400()) {
+		mxgpioregs[(0x174)/4] = (0x3 << 28); 
+		if(opt_can == 1)
+		  mxgpioregs[(0x738)/4] = (0x1 << 30);
+		else
+		  mxgpioregs[(0x734)/4] = (0x1 << 30);
+		mxgpioregs[(0xB34)/4] = (0x1 << 30);
+	}
+
+	if(opt_can && model == 0x7600) {
+		if(opt_can == 1) 
+		  poke16(0x2, (peek16(0x2) | (1 << 10)));
+		else
+		  poke16(0x2, (peek16(0x2) & ~(1 << 10)));
+	}
+
+	if(opt_random && !is_7400()) {
+		unsigned short rand = peek16(0x4);
+		nbusunlock();
+		printf("random=0x%x\n", rand);
+		nbuslock();
+	}
+
+	if (opt_setrng && !is_7400()) {
+		FILE *urandom = NULL;
+		unsigned int rng;
+		rng = peek16(0x4);
+		nbusunlock();
+		urandom = fopen("/dev/urandom", "w");
+		assert(urandom != NULL);
+		fwrite(&rng, 2, 1, urandom);
+		fclose(urandom);
+		nbuslock();
+	}
+
+	if (opt_baseboard && model == 0x4600) {
+		unsigned short prev1, prev2, prev3, prev4;
+		unsigned int i, x, rev;
+		int bb_fd = 0;
+		char buf[5] = {0};
+
+		bb_fd = open("/dev/tsbaseboardid", O_RDONLY);
+		if(bb_fd > 0) {
+			read(bb_fd, &buf, 4);
+			buf[4] = '\0';
+			baseboard = strtoul(buf, NULL, 0);
+		} else {
+			prev1 = peek16(0x2);
+			prev2 = peek16(0x12);
+			prev3 = peek16(0x10);
+			prev4 = peek16(0xc);
+			poke16(0x12, prev2 | 0x10);
+			poke16(0xc, prev4 & ~0x20);
+			for(i = 0; i < 8; i++) {
+				x = prev1 & ~0xc000;
+				if(!(i & 1)) x |= 0x4000;
+				if(!(i & 2)) x |= 0x8000;
+				if(i & 4) poke16(0x26, 20 | 0x80);
+				else poke16(0x26, 20);
+				poke16(0x2, x);
+				usleep(1);
+				baseboard = (baseboard >> 1);
+				if(peek16(0x8) & 0x20) baseboard |= 0x80;
+			}
+			poke16(0x2, prev1);
+			poke16(0x12, prev2);
+			poke16(0x10, prev3);
+			poke16(0xc, prev4);
+		}
+
+		rev = (baseboard & 0xc0) >> 6;
+		baseboard &= ~0xc0;
+		nbusunlock();
+		printf("baseboard_model=0x%x\n", baseboard);
+		switch (baseboard) {
+		  /* The TS-8200 can ID as 63 on early production boards
+		   * we do not want to ID by that as well as 63 could
+		   * (more likely) be a custom baseboard
+		   */
+		  case 0:
+			printf("baseboard=8200\n");
+			break;
+		  case 2:
+			printf("baseboard=8390\n");
+			break;
+		  case 4:
+			printf("baseboard=8500\n");
+			break;
+		  case 5:
+			printf("baseboard=8400\n");
+			break;
+		  case 6:
+			printf("baseboard=8160\n");
+			break;
+		  case 7:
+			printf("baseboard=8100\n");
+			break;
+		  case 8:
+			printf("baseboard=8820\n");
+			break;
+		  case 9:
+			printf("baseboard=8150\n");
+			break;
+		  case 10:
+			printf("baseboard=8900\n");
+			break;
+		  case 11:
+			printf("baseboard=8290\n");
+			break;
+		  case 13:
+			printf("baseboard=8700\n");
+			break;
+		  case 14:
+			printf("baseboard=8280\n");
+			break;
+		  case 15:
+			printf("baseboard=8380\n");
+			break;
+		  case 16:
+			printf("baseboard=an20\n");
+			break;
+		}
+		printf("baseboard_rev=%c\n", rev + 65);
+		nbuslock();
+	}
+
+	if(opt_touchoff && model == 0x4600) poke16(0x2e, (peek16(0x2e) & ~0xc000));
+	if(opt_touchon && model == 0x4600) {
+		/* The TS-8380 is a little special and has different SPI pins */
+		if(baseboard == 15) poke16(0x2e, (peek16(0x2e) | 0x8000));
+		else poke16(0x2e, (peek16(0x2e) | 0x4000));
+	}
+
+	if (opt_cpuadc) {
+		volatile unsigned int *mxlradcregs;
+		volatile unsigned int *mxhsadcregs;
+		volatile unsigned int *mxclkctrlregs;
+		int x, chan[8] = {0,0,0,0,0,0,0,0};
+		signed int bivolt;
+		int i;
+
+		mxlradcregs = (unsigned int *) mmap(0, getpagesize(),
+		  PROT_READ | PROT_WRITE, MAP_SHARED, devmem, 0x80050000);
+
+		mxlradcregs[0x148/4] = 0xfffffff; //Clear LRADC6:0 assignments
+		mxlradcregs[0x144/4] = 0x6543210; //Set LRDAC6:0 to channel 6,5:0
+		mxlradcregs[0x28/4] = 0xff000000; //Set 1.8v range
+		for(x = 0; x < 7; x++)
+		  mxlradcregs[(0x50+(x * 0x10))/4] = 0x0; //Clear LRADCx reg
+
+		for(x = 0; x < 10; x++) {
+			mxlradcregs[0x18/4] = 0x7f; //Clear interrupt ready
+			mxlradcregs[0x4/4] = 0x7f; //Schedule conversaion of chan 6:0
+			while(!((mxlradcregs[0x10/4] & 0x7f) == 0x7f)); //Wait
+			for(i = 0; i < 7; i++)
+			  chan[i] += (mxlradcregs[(0x50+(i * 0x10))/4] & 0xffff);
+		}
+
+		mxhsadcregs = mmap(0, getpagesize(), PROT_READ|PROT_WRITE, MAP_SHARED,
+		  devmem, 0x80002000);
+		mxclkctrlregs = mmap(0, getpagesize(), PROT_READ|PROT_WRITE, MAP_SHARED,
+		  devmem, 0x80040000);
+
+		//Lets see if we need to bring the HSADC out of reset
+		if(mxhsadcregs[0x0/4] & 0xC0000000) {
+			mxclkctrlregs[0x154/4] = 0x70000000;
+			mxclkctrlregs[0x1c8/4] = 0x8000;
+			//ENGR116296 errata workaround
+			mxhsadcregs[0x8/4] = 0x80000000;
+			mxhsadcregs[0x0/4] = ((mxhsadcregs[0x0/4] | 0x80000000) & (~0x40000000));
+			mxhsadcregs[0x4/4] = 0x40000000;
+			mxhsadcregs[0x8/4] = 0x40000000;
+			mxhsadcregs[0x4/4] = 0x40000000;
+
+			usleep(10);
+			mxhsadcregs[0x8/4] = 0xc0000000;
+		}
+
+		mxhsadcregs[0x28/4] = 0x2000; //Clear powerdown
+		mxhsadcregs[0x24/4] = 0x31; //Set precharge and SH bypass
+		mxhsadcregs[0x30/4] = 0xa; //Set sample num
+		mxhsadcregs[0x40/4] = 0x1; //Set seq num
+		mxhsadcregs[0x4/4] = 0x40000; //12bit mode
+
+		while(!(mxhsadcregs[0x10/4] & 0x20)) {
+			mxhsadcregs[0x50/4]; //Empty FIFO
+		}
+
+		mxhsadcregs[0x50/4]; //An extra read is necessary
+
+		mxhsadcregs[0x14/4] = 0xfc000000; //Clr interrupts
+		mxhsadcregs[0x4/4] = 0x1; //Set HS_RUN
+		usleep(10);
+		mxhsadcregs[0x4/4] = 0x08000000; //Start conversion
+		while(!(mxhsadcregs[0x10/4] & 0x1)) ; //Wait for interrupt
+
+		for(i = 0; i < 5; i++) {
+			x = mxhsadcregs[0x50/4];
+			chan[7] += ((x & 0xfff) + ((x >> 16) & 0xfff));
+		}
+
+
+		nbusunlock();
+		for(x = 0; x < 7; x++) {
+			/* Multiply by 1000 to get mV, divide by 10 samples
+			 * Analog dividers are divide by two on ADC 1-4,
+			 * 6 is divide by 3. 45177 is the value of 
+			 * (1.85/4095)x10^8 so we deal with ints
+			 *
+			 * Calibration offsets should be added here */		
+			if(model == 0x7680) {
+			  switch(x) {
+				case 0:
+				case 1:
+				case 2:
+				case 3:
+				  chan[x] = ((((chan[x]/10)*45177)/1000000)*62);
+				  printf("LRADC_ADC%d_millivolts=%d\n", x, chan[x]);
+				  break;
+				case 4:
+				case 5:
+				  /* This is done in two steps to clean up code
+				   * The first step gets the mV vale read from
+				   * ADC, and the second step applies Millman's
+				   * theorem for the input circuit, simplified
+				   * as much as possible.
+				   */
+				  bivolt=(((chan[x]/10)*45177)/100000);
+				  bivolt=(((3*(((435937*bivolt)/1000)-412000))
+				    /197));
+				  printf("LRADC_ADC%d_millivolts=%d\n", x, bivolt);
+				  break;
+			  }
+			} else {
+			  switch(x) {
+				case 1:
+				case 2:
+				case 3:
+				case 4:
+				  chan[x] = ((((chan[x]/10)*45177)/100000)*2);
+				  printf("LRADC_ADC%d_millivolts=%d\n", x, chan[x]);
+				  break;
+				case 6:
+				  chan[x] = ((((chan[x]/10)*45177)/1000000)*33);
+				  printf("LRADC_ADC%d_millivolts=%d\n", x, chan[x]);
+				  break;
+			  }
+			}			
+				  
+		}
+		if(model != 0x7680) {
+			printf("HSADC_millivolts=%d\n", 
+			  ((((chan[7]/10)*45177)/100000)*2));
+		}
+		nbuslock();
+	}
+
+	if (opt_adc && model == 0x4600) {
+		int x;
+		// configure ADC:
+		switch (baseboard) {
+		  case 2:
+			poke16(0x30, 0x28);
+			break;
+		  case 6:
+		  case 7:
+			poke16(0x30, 0x18);
+			break;
+		  default: // if unknown baseboard, uses no an_sel
+			// but assumes ADC is there
+			poke16(0x30, 0x08);
+			break;
+		}
+		poke16(0x32, 0x3f); // enable all 6 channels
+		usleep(500000); // allow time for conversions
+		for (i = 1; i <= 6; i++) {
+			x = (signed short)peek16(0x32 + 2*i);
+			if (i > 2) x = (x * 1006)/200;
+			x = (x * 2048)/0x8000;
+			printf("adc%d=%d\n", i, x);
+		}
+	}
+
+	if ((opt_ethswitch || opt_ethinfo || opt_ethvlan || opt_ethwlan) && has_switch()) {
+
+		nbusunlock();
+		mxgpioregs[0x184/4] = 0xf;
+
+		if(phy_read(0x18, 0x03, &swmod) == -1) {
+			printf("switch_model=none\n");
+			opt_ethvlan = 0;
+			opt_ethwlan = 0;
+			opt_ethswitch = 0;
+		} else {
+			swmod &= 0xFFF0;
+			if(swmod == 512){
+				printf("switch_model=88E6020\n");
+			}else if (swmod == 1792) {
+				printf("switch_model=88E6070\n");
+			} else if(swmod == 1808) {
+				printf("switch_model=88E6071\n");
+				fprintf(stderr, "Unsupported switch\n");
+			} else if(swmod == 8704) {
+				printf("switch_model=88E6220\n");
+				fprintf(stderr, "Unsupported switch\n");
+			} else if(swmod == 9472) {
+				printf("switch_model=88E6251\n");
+				fprintf(stderr, "Unsupported switch\n");
+			} else {
+				printf("switch_model=unknown\n");
+			}
+		}
+		nbuslock();
+	}
+
+	if ((opt_ethswitch || opt_ethvlan || opt_ethwlan) && has_switch()) {
+		nbusunlock();
+		if(swmod == 512) { // Marvell 88E6020 Network Switch
+			// this chip has 2 PHYs and 2 RMII ports
+			// Apply Marvell 88E60x0 Errata 3.1 for PHY 0 and 1.
+			switch_errata_3_1(0);
+			switch_errata_3_1(1<<5);
+			// enable both PHYs
+			switch_enphy(0x9600);
+			switch_enphy(0x9620);
+
+			// enable port flood on all ports
+			if(opt_ethswitch) {
+				switch_enflood(0x18);
+				switch_enflood(0x19);
+				switch_enflood(0x1d);
+			} else if (opt_ethvlan || opt_ethwlan) {
+				switch_enbcastflood(0x18);
+				switch_enbcastflood(0x19);
+				switch_enbcastflood(0x1d);
+			}
+
+			// Force link up on P5, the CPU port
+			switch_forcelink(0x1d);
+
+			// With this chip ethvlan and wlan switch are the same since
+			// we only have 2 ports
+			if(opt_ethvlan || opt_ethwlan) {
+				struct vtu entry;
+				// Configure P5
+				phy_write(0x1d, 0x05, 0x0);
+				phy_write(0x1d, 0x06, 0x5f);
+				phy_write(0x1d, 0x07, 0x1);
+				phy_write(0x1d, 0x08, 0x480);
+
+				for(i=0; i < 7; i++) {
+					entry.tags[i] = 3; // leave the port alone by default
+					entry.forceVID[i] = 0;
+				}
+
+				// Set up VLAN #1 on P0 and P5
+				entry.v = 1;
+				entry.vid = 1;
+				entry.tags[5] = 2; // TS-4712 CPU port is always egress tagged
+				entry.tags[0] = 1; // External Port A egress untagged
+				vtu_add_entry(&entry);
+				entry.tags[0] = 3; // Do not configure port A again
+
+				// Setup VLAN #2 on P1 and P5
+				entry.vid = 2;
+				entry.tags[1] = 1; // External PORT B egress untagged
+				vtu_add_entry(&entry);
+			}
+		} else if (swmod == 1792) { // Marvell 88E6070 Network Switch
+			// Used on the TS-8700
+			// enable all PHYs
+			
+			switch_errata_3_1(0);
+			switch_errata_3_1(1<<5);
+			switch_errata_3_1(2<<5);
+			switch_errata_3_1(3<<5);
+			switch_errata_3_1(4<<5);
+			
+			switch_enphy(0x9600);
+			switch_enphy(0x9620);
+			switch_enphy(0x9640);
+			switch_enphy(0x9660);
+			switch_enphy(0x9680);
+
+			switch_enflood(0x18);
+			switch_enflood(0x19);
+			switch_enflood(0x1a);
+			switch_enflood(0x1b);
+			switch_enflood(0x1c);
+			if(opt_ethvlan) {
+				struct vtu entry;
+				for(i=0; i < 7; i++) {
+					entry.tags[i] = 3; // leave the port alone by default
+					entry.forceVID[i] = 0;
+				}
+				entry.v = 1;
+
+				// Set up VLAN #1 on P0 and P1
+				entry.vid = 1;
+				entry.tags[0] = 2; // TS-4710 CPU port is always egress tagged
+				entry.tags[1] = 1; // External Port A egress untagged
+				vtu_add_entry(&entry);
+				entry.tags[1] = 3; // Do not configure port A again
+
+				// Setup VLAN #2 on P0 and P2
+				entry.vid = 2;
+				entry.tags[2] = 1; // External PORT B egress untagged
+				vtu_add_entry(&entry);
+				entry.tags[2] = 3; // Do not configure port B again
+
+				// Setup VLAN #2 on P0 and P3
+				entry.vid = 3;
+				entry.tags[3] = 1; // External PORT C egress untagged
+				vtu_add_entry(&entry);
+				entry.tags[3] = 3; // Do not configure port C again
+
+				// Setup VLAN #2 on P0 and P4
+				entry.vid = 4;
+				entry.tags[4] = 1; // External PORT D egress untagged
+				vtu_add_entry(&entry);
+			} else if (opt_ethwlan) {
+				struct vtu entry;
+				for(i=0; i < 7; i++) {
+					entry.tags[i] = 3; // leave the port alone by default
+					entry.forceVID[i] = 0;
+				}
+				entry.v = 1;
+
+				// Set up VLAN #1 with P0 and P1
+				entry.vid = 1;
+				entry.tags[0] = 2; // TS-4710 CPU port is always egress tagged
+				entry.tags[1] = 1; // External Port A egress untagged
+				vtu_add_entry(&entry);
+				entry.tags[1] = 3; // Do not configure port A again
+
+				// Set up VLAN #1 with P0, P2, P3, and P4
+				entry.vid = 2;
+				entry.tags[0] = 2; // TS-4710 CPU port is always egress tagged
+				entry.tags[2] = 1; // External Port B egress untagged
+				entry.tags[3] = 1; // External Port C egress untagged
+				entry.tags[4] = 1; // External Port D egress untagged
+				vtu_add_entry(&entry);
+			}
+		} else {
+			fprintf(stderr, "Switch not configured\n");
+		}
+		nbuslock();
+	}
+
+	if (opt_ethinfo && has_switch()) {
+		int ports = 0, i = 0, port, vtu = 0;
+		int phy[8] = {0,0,0,0,0,0,0,0};
+		volatile unsigned short x, r7;
+		
+		nbusunlock();
+
+		if(swmod == 512){ // 4712
+			ports = 2;
+			phy[0] = 0x18;
+			phy[1] = 0x19;
+		} else if (swmod == 1792) { // 8700
+			ports = 4;
+			phy[0] = 0x19;
+			phy[1] = 0x1a;
+			phy[2] = 0x1b;
+			phy[3] = 0x1c;
+		} else {
+			printf("Unknown switch: %d\n", swmod);
+			return 1;
+		}
+		printf("switch_ports=\"");
+		for (i = 0; i < ports; i++) {
+			printf("%c", 97 + i);
+			if (i != ports - 1)
+			  printf(" ");
+		}
+		printf("\"\n");
+
+		for (i = 0; i < ports; i++) {
+			volatile unsigned short dat;
+			phy_read(phy[i], 0x0, &dat);
+			printf("switchport%c_link=%d\n", 97 + i,
+			  dat & 0x1000 ? 1 : 0);
+			printf("switchport%c_speed=", 97 + i);
+			dat = (dat & 0xf00) >> 8;
+			if(dat == 0x8)
+			  printf("10HD\n");
+			else if (dat == 0x9)
+			  printf("100HD\n");
+			else if (dat == 0xa)
+			  printf("10FD\n");
+			else if (dat == 0xb)
+			  printf("100FD\n");
+		}
+
+		x = vtu_readwait(VTU_OPS_REGISTER);
+		phy_write(GLOBAL_REGS_1, VTU_VID_REG, 0xFFF);
+		while(1) {
+			phy_write(GLOBAL_REGS_1, VTU_OPS_REGISTER, (1 << 15) | VTU_OP_GET_NEXT);
+			vtu_readwait(VTU_OPS_REGISTER);
+			phy_read(GLOBAL_REGS_1, VTU_VID_REG, &x);
+
+			// No more VTU entries
+			if ((x & 0xFFF) == 0xFFF) {
+				printf("vtu_total=%d\n", vtu);
+				break;
+			}
+			vtu++;
+			printf("vtu%d_vid=%d\n", vtu, x & 0xfff);
+			for (port = 0; port < 7; port++) {
+				phy_read(0x18 + port, 7, &r7);
+				if(port == 0)
+				  phy_read(GLOBAL_REGS_1, 0x07, &x);
+				else if (port == 4)
+				  phy_read(GLOBAL_REGS_1, 0x08, &x);
+
+
+				switch(port) {
+				  case 0:
+					if ((x & 0x0003) != 0x0003) {
+						printf("vtu%d_port0=1\n"
+						  "vtu%d_port0_forcevid=%c\n"
+						  "vtu%d_port0_egress=%s\n"
+						  "vtu%d_port0_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString(x & 3),
+						  vtu, !opt_ethbb ? "a":"cpu");
+					}
+					break;
+				  case 1:
+					if ((x & 0x0030) != 0x0030) {
+						printf("vtu%d_port1=1\n"
+						  "vtu%d_port1_forcevid=%c\n"
+						  "vtu%d_port1_egress=%s\n"
+						  "vtu%d_port1_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString((x>>4)&3),
+						  vtu, !opt_ethbb ? "b":"a");
+					}
+					break;
+				  case 2:
+					if ((x & 0x0300) != 0x0300) {
+						printf("vtu%d_port2=1\n"
+						  "vtu%d_port2_forcevid=%c\n"
+						  "vtu%d_port2_egress=%s\n"
+						  "vtu%d_port2_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString((x>>8)&3),
+						  vtu, !opt_ethbb ? "unused":"b");
+					}
+					break;
+				  case 3:
+					if ((x & 0x3000) != 0x3000) {
+						printf("vtu%d_port3=1\n"
+						  "vtu%d_port3_forcevid=%c\n"
+						  "vtu%d_port3_egress=%s\n"
+						  "vtu%d_port3_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString((x>>12)&3),
+						  vtu, !opt_ethbb ? "unused":"c");
+					}
+					break;
+				  case 4:
+					if ((x & 0x0003) != 0x0003) {
+						printf("vtu%d_port4=1\n"
+						  "vtu%d_port4_forcevid=%c\n"
+						  "vtu%d_port4_egress=%s\n"
+						  "vtu%d_port4_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString(x & 3),
+						  vtu, !opt_ethbb ? "b":"d");
+					}
+					break;
+				  case 5:
+					if ((x & 0x0030) != 0x0030) {
+						printf("vtu%d_port5=1\n"
+						  "vtu%d_port5_forcevid=%c\n"
+						  "vtu%d_port5_egress=%s\n"
+						  "vtu%d_port5_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString((x>>4)&3),
+						  vtu, !opt_ethbb ? "cpu":"unused");
+					}
+					break;
+				  case 6:
+					if ((x & 0x0300) != 0x0300) {
+						printf("vtu%d_port6=1\n"
+						  "vtu%d_port6_forcevid=%c\n"
+						  "vtu%d_port6_egress=%s\n"
+						  "vtu%d_port6_alias=%s\n",
+						  vtu,
+						  vtu, r7 & 0x1000? 'Y':'N',
+						  vtu, MemberTagString(x & 3),
+						  vtu, "unused");
+					}
+					break;
+				}
+			}
+		}
+		nbuslock();
+	}
+
+	if(opt_greenledon && !is_7400()) poke16(0x2, (peek16(0x2) | 0x8000));
+	if(opt_greenledoff && !is_7400()) poke16(0x2, (peek16(0x2) & ~0x8000));
+	if((opt_greenledon || opt_greenledoff) && is_7400()) {
+		/*Green LED is 0_28 */
+		mxgpioregs[(0x114)/4] = (0x3 << 24); 
+		if(opt_greenledon)
+		  mxgpioregs[(0x708)/4] = (0x1 << 28);
+		if(opt_greenledoff)
+		  mxgpioregs[(0x704)/4] = (0x1 << 28);
+		mxgpioregs[(0xB04)/4] = (0x1 << 28);
+	}
+
+	if(opt_redledon && !is_7400()) poke16(0x2, (peek16(0x2) | 0x4000));
+	if(opt_redledoff && !is_7400()) poke16(0x2, (peek16(0x2) & ~0x4000));
+	if((opt_redledon || opt_redledoff) && is_7400()) {
+		/*Green LED is 0_17 */
+		mxgpioregs[(0x114)/4] = (0x3 << 2); 
+		if(opt_redledon)
+		  mxgpioregs[(0x708)/4] = (0x1 << 17);
+		if(opt_redledoff)
+		  mxgpioregs[(0x704)/4] = (0x1 << 17);
+		mxgpioregs[(0xB04)/4] = (0x1 << 17);
+	}
+
+	if(opt_txenon && !is_7400()) {
+		int j = 0, sz = strlen(txen_on);
+		char *st = 0, *en = 0;
+		for(st = txen_on; j < sz; st = en + 1) {
+			int xu = strtoul(st, &en, 0);
+			j += (en - st) + 1;
+			if(xu >= 0 && xu <= 7)
+			  poke16(0x2e, (peek16(0x2e) | (1 << xu)));
+		}
+	}
+	if(opt_txenoff && !is_7400()) {
+		int j = 0, sz = strlen(txen_off);
+		char *st = 0, *en = 0;
+		for(st = txen_off; j < sz; st = en + 1) {
+			int xu = strtoul(st, &en, 0);
+			j += (en - st) + 1;
+			if(xu >= 0 && xu <= 7)
+			  poke16(0x2e, (peek16(0x2e) & ~(1 << xu)));
+		}
+	}
+
+	if(opt_bbclkoff && model == 0x4600)
+	  poke16(0x2e, (peek16(0x2e) & ~(0x300)));
+	if(opt_bbclkon && model == 0x4600)
+	  poke16(0x2e, (peek16(0x2e) | (0x100)));
+	if(opt_bbclk2on && model == 0x4600)
+	  poke16(0x2e, (peek16(0x2e) | (0x300)));
+	if(opt_bbclk3on && model == 0x4600) poke16(0x2e, (peek16(0x2e) | (0x200)));
+
+	if(opt_485speed && model == 0x7670) {
+		unsigned int *mxpwmregs = NULL;
+		unsigned short speed;
+		mxpwmregs = mmap(0, getpagesize(), PROT_READ|PROT_WRITE,
+		  MAP_SHARED, devmem, 0x80064000);
+		//3_18
+		mxgpioregs[0x178/4] = 0x3 << 4;
+
+		speed = (24000000/((opt_485speed*1.275)-1));
+		mxpwmregs[0x8/4] = 0x3<<30;
+		mxpwmregs[0x4/4] = 1<<2;
+		mxpwmregs[0x50/4] = (((speed/2)<<16));
+		mxpwmregs[0x60/4] = (0x2<<18) | (0x3<<16) | speed;
+	}
+
+	if(opt_modbuspoweron && (model == 0x7670 || model == 0x7680)) {
+		mxgpioregs[0x718/4] = 1 << 15;
+		mxgpioregs[0xb14/4] = 1 << 15;
+		mxgpioregs[0xb18/4] = 1 << 14;
+		usleep(10000);
+		if(((mxgpioregs[0x910/4] >> 14) & 0x1)) {
+			mxgpioregs[0x714/4] = 1 << 15;
+			printf("modbuspoweron=0\n");
+		} else {
+			mxgpioregs[0x714/4] = 1 << 15;
+			mxgpioregs[0x714/4] = 1 << 13;
+			mxgpioregs[0xb14/4] = 1 << 13;
+			printf("modbuspoweron=1\n");
+		}
+	}
+	if(opt_modbuspoweroff && (model == 0x7670 || model == 0x7680)) {
+		mxgpioregs[0x718/4] = (1 << 13);
+		mxgpioregs[0x714/4] = (1 << 15);
+	}
+
+	if(opt_poke16 && model == 0x7680) {
+		e2_write(opt_address, &opt_pokeval, 2);
+	}
+
+	if(opt_peek16 && model == 0x7680) {
+		unsigned short buf;
+		e2_read(opt_address, &buf, 2);
+		nbusunlock();
+		printf("0x%x\n", buf);
+		nbuslock();
+	}
+
+	if(opt_pokef && model == 0x7680) {
+		fpga_write(opt_address, &opt_pokeval, 1);
+	}
+
+	if(opt_peekf && model == 0x7680) {
+		unsigned char buf;
+		fpga_read(opt_address, &buf, 1);
+		nbusunlock();
+		printf("0x%x\n", buf);
+		nbuslock();
+	}
+
+	if(opt_485_0speed && model == 0x7680) {
+		char buf[3];
+		unsigned int tempvar;
+		tempvar = (25000000/(opt_485_0speed/9.5));
+		buf[0] = ((tempvar >> 16) & 0xFF);
+		buf[1] = ((tempvar >> 8) & 0xFF);
+		buf[2] = (tempvar & 0xFF);
+		fpga_write(32, &buf, 3);
+
+		tempvar = (25000000/(opt_485_0speed/0.5));
+		buf[0] = ((tempvar >> 16) & 0xFF);
+		buf[1] = ((tempvar >> 8) & 0xFF);
+		buf[2] = (tempvar & 0xFF);
+		fpga_write(35, &buf, 3);
+	}
+	if(opt_485_1speed && model == 0x7680) {
+		char buf[3];
+		unsigned int tempvar;
+		tempvar = (25000000/(opt_485_1speed/9.5));
+		buf[0] = ((tempvar >> 16) & 0xFF);
+		buf[1] = ((tempvar >> 8) & 0xFF);
+		buf[2] = (tempvar & 0xFF);
+		fpga_write(38, &buf, 3);
+
+		tempvar = (25000000/(opt_485_1speed/0.5));
+		buf[0] = ((tempvar >> 16) & 0xFF);
+		buf[1] = ((tempvar >> 8) & 0xFF);
+		buf[2] = (tempvar & 0xFF);
+		fpga_write(41, &buf, 3);
+	}
+
+	//NOTE: opt_dacX is << by 1
+	if(opt_dac0 && model == 0x7680) {
+		char buf[2];
+		buf[0] = ((opt_dac0 >> 9) & 0xf);
+		buf[1] = ((opt_dac0 >> 1) & 0xff);
+		fpga_write(23, &buf, 2);
+	}
+	if(opt_dac1 && model == 0x7680) {
+		char buf[2];
+		buf[0] = ((opt_dac1 >> 9) & 0xf);
+		buf[1] = ((opt_dac1 >> 1) & 0xff);
+		fpga_write(25, &buf, 2);
+	}
+	if(opt_dac2 && model == 0x7680) {
+		char buf[2];
+		buf[0] = ((opt_dac2 >> 9) & 0xf);
+		buf[1] = ((opt_dac2 >> 1) & 0xff);
+		fpga_write(27, &buf, 2);
+	}
+	if(opt_dac3 && model == 0x7680) {
+		char buf[2];
+		buf[0] = ((opt_dac3 >> 9) & 0xf);
+		buf[1] = ((opt_dac3 >> 1) & 0xff);
+		fpga_write(29, &buf, 2);
+	}
+
+
+
+
+	/* Should be last! */
+	if (opt_watchdog) {
+		struct sched_param sched;
+		int fd, r, grain = 0, mode, t;
+		char c, time = 3;
+		unsigned char dat[3] = {0x0};
+		unsigned short x = 0;
+		fd_set rfds;
+		struct timeval tv_now, tv_wait, tv_exp;
+		nbusunlock();
+
+#define FEED0 338000
+#define FEED1 2706000
+#define FEED2 10824000
+		/* Single character writes to /dev/watchdog keep it fed */
+		/* XXX: DO NOT RUN MULTIPLE INSTANCES OF THIS! IT WILL 
+		 * RESULT IN UNDEFINED BEHAVIOR!
+		 */
+		/* New /dev/watchdog interface:
+		 * - Still supports the standard interface that expects
+		 *   '0' '1' '2' or '3'.
+		 * - Most other characters are still treated as 3.
+		 * - 'f' (for feed) is a special character used to create
+		 *   automatic feeds.
+		 * - 'f' is expected to be followed by three digits, eg "f100".
+		 * - Those digits are interpreted as a 3 digit number, which
+		 *   is then divided by 10.  For example, "f456" feeds the
+		 *   watchdog for 45.6 seconds.
+		 * - 'a' (for autofeed) is a special character used to 
+		 *   create an autofeed situation
+		 * - In order to guarantee timeout, 'a' is expected to be
+		 *   followed by a single number, 0 through 3, eg "a1"
+		 * - This single number is the standard WDT interface
+		 *   and is not real world time
+		 * - An extended feed is canceled by any new write to
+		 *   /dev/watchdog.
+		 * - If 'f' is not followed by 3 digits, the behavior is
+		 *   undefined, but in practice you typically just fed the
+		 *   wdt for a long time.
+		 * - If 'a' is not followed by a single digit, the behavior 
+		 *   is undefined.
+		 */
+
+		/* We need to make sure we create the pipe before daemonizing
+		 * so that as soon as the call to tshwctl -W completes we can
+		 * write to the pipe.  The write side of the pipe NEEDS to be 
+		 * opened with O_WRONLY and !O_NONBLOCK in order to ensure
+		 * that any immediate writes will block until we open the 
+		 * pipe here 
+		 *
+		 * bash redirects open the file with O_WRONLY and !O_NONBLOCK
+		 */
+		mknod("/dev/watchdog", S_IFIFO|0666, 0);
+		daemon(0, 0);
+		sched.sched_priority = 98;
+		sched_setscheduler(0, SCHED_FIFO, &sched);
+		mode = 0; // mode 1 == processing a multi-feed write
+		while(1) {
+			fd = open("/dev/watchdog", O_RDONLY | O_NONBLOCK);
+			assert (fd != -1);
+			FD_ZERO(&rfds);
+			FD_SET(fd, &rfds);
+			if (mode)
+				select(fd + 1, &rfds, NULL, NULL, &tv_wait);
+			else
+				select(fd + 1, &rfds, NULL, NULL, NULL);
+			r = 0;
+			if (FD_ISSET(fd, &rfds)) r = read(fd, &c, 1);
+			if (r) { // data coming in /dev/watchdog
+				if (c == 'f') { // new style feed
+					read(fd, &c, 1);
+					t = (c - '0') * 100;
+					read(fd, &c, 1);
+					t += (c - '0') * 10;
+					read(fd, &c, 1);
+					t += (c - '0');
+					if(is_7400()) {
+						dat[1] = ((t >> 8) & 0xff);
+						dat[2] = (t & 0xff);
+						nbuslock();
+						m0_write(&dat, 3);
+						nbusunlock();
+						mode = 0;
+					} else {
+						t = t * 100000;
+						x = 0;
+						if (t > FEED1) x = 1;
+						if (t > FEED2) x = 2;
+						nbuslock();
+						poke16(0x2a, x);
+						nbusunlock();
+						switch (x) {
+							case 0: grain = FEED0; break;
+							case 1: grain = FEED1; break;
+							case 2: grain = FEED2; break;
+						}
+						mode = 1;
+						gettimeofday(&tv_exp, NULL);
+						t += tv_exp.tv_usec;
+						tv_exp.tv_usec = t % 1000000;
+						tv_exp.tv_sec += t / 1000000;
+					}
+				/*XXX: This is needed because close() is not
+				 * guaranteed to have closed and flushed the
+				 * pipe by the time we re-open and read again
+				 */ 
+				} else if(c == '\n') { 
+				} else { // old style feed
+					mode = 0;
+					if(c == 'a') {
+						mode = 2;
+						read(fd, &c, 1);
+					}
+					if (c > '3' || c < '0') c = '3';
+					nbuslock();
+					if(is_7400()) {
+						dat[1] = 0;
+						dat[2] = c - '0';
+						m0_write(&dat, 3);
+					} else poke16(0x2a, c - '0');
+					nbusunlock();
+					if(c == '3') mode = 0;
+					/* See XXX: above */
+					time = (c - '0');
+				}
+			}
+			if (mode == 1) {
+				// if in mode 1, we feed wdt and calculate
+				// how long to sleep
+				nbuslock();
+				poke16(0x2a, x);
+				nbusunlock();
+				gettimeofday(&tv_now, NULL);
+				t = tv_exp.tv_sec - tv_now.tv_sec;
+				t *= 1000000;
+				t += tv_exp.tv_usec;
+				t -= tv_now.tv_usec;
+				if (t <= grain) mode = 0;
+				else if (t <= 3*grain/2) t -= grain;
+				else t = grain/2;
+				tv_wait.tv_sec = t / 1000000;
+				tv_wait.tv_usec = t % 1000000;
+			}
+			if(mode == 2) {
+				nbuslock();
+				if(is_7400()) {
+					dat[1] = 0;
+					dat[2] = time;
+					m0_write(&dat, 3);
+				} else poke16(0x2a, time);
+				nbusunlock();
+				switch (time) {
+					case 0: 
+					  tv_wait.tv_sec = (FEED0 / 2) / 1000000;
+					  tv_wait.tv_usec = (FEED0 / 2) % 1000000;
+					  break;
+					case 1:
+					  tv_wait.tv_sec = (FEED1 / 2) / 1000000;
+					  tv_wait.tv_usec = (FEED1 / 2) % 1000000;
+					  break;
+					case 2:
+					  tv_wait.tv_sec = (FEED2 / 2) / 1000000;
+					  tv_wait.tv_usec = (FEED2 / 2) % 1000000;
+					  break;
+				}
+			}
+			// if mode was 0 and no character was read, don't do
+			// anything, just go back to waiting for a character
+			close(fd);
+		} // end forever loop
+	}
+
+	nbusunlock();
+	return 0;
+}
diff --git a/package/ts4600-tshwctl/src/vmopcode.h b/package/ts4600-tshwctl/src/vmopcode.h
new file mode 100644
index 0000000..2a1919d
--- /dev/null
+++ b/package/ts4600-tshwctl/src/vmopcode.h
@@ -0,0 +1,192 @@
+/***************************************************************
+*
+* This is the include file for Lattice Semiconductor's ispVM
+* Embedded software application.
+*
+***************************************************************/
+
+/***************************************************************
+*
+* VME version.
+*
+* History:
+* 
+***************************************************************/
+
+#define VME_VERSION_NUMBER "12.1"
+
+/***************************************************************
+*
+* Maximum declarations.
+*
+***************************************************************/
+
+#define VMEHEXMAX   60000L  /* The hex file is split 60K per file. */
+#define SCANMAX     64000L  /* The maximum SDR/SIR burst. */
+
+/***************************************************************
+*
+* Supported JTAG state transitions.
+*
+***************************************************************/
+
+#define RESET      0x00
+#define IDLE       0x01
+#define IRPAUSE    0x02
+#define DRPAUSE    0x03
+#define SHIFTIR    0x04
+#define SHIFTDR    0x05
+/* 11/15/05 Nguyen changed to support DRCAPTURE*/
+#define DRCAPTURE  0x06
+
+/***************************************************************
+*
+* Flow control register bit definitions.  A set bit indicates 
+* that the register currently exhibits the corresponding mode.
+*
+***************************************************************/
+
+#define INTEL_PRGM 0x0001    /* Intelligent programming is in effect. */
+#define CASCADE    0x0002    /* Currently splitting large SDR. */
+#define REPEATLOOP 0x0008    /* Currently executing a repeat loop. */
+#define SHIFTRIGHT 0x0080    /* The next data stream needs a right shift. */
+#define SHIFTLEFT  0x0100    /* The next data stream needs a left shift. */
+#define VERIFYUES  0x0200    /* Continue if fail is in effect. */
+
+/***************************************************************
+*
+* DataType register bit definitions.  A set bit indicates
+* that the register currently holds the corresponding type of data.
+*
+***************************************************************/
+
+#define EXPRESS    0x0001    /* Simultaneous program and verify. */
+#define SIR_DATA   0x0002    /* SIR is the active SVF command. */
+#define SDR_DATA   0x0004    /* SDR is the active SVF command. */
+#define COMPRESS   0x0008    /* Data is compressed. */
+#define TDI_DATA   0x0010    /* TDI data is present. */
+#define TDO_DATA   0x0020    /* TDO data is present. */
+#define MASK_DATA  0x0040    /* MASK data is present. */
+#define HEAP_IN    0x0080    /* Data is from the heap. */
+#define LHEAP_IN   0x0200    /* Data is from intel data buffer. */
+#define VARIABLE   0x0400    /* Data is from a declared variable. */
+#define CRC_DATA   0x0800	 /* CRC data is pressent. */
+#define CMASK_DATA 0x1000    /* CMASK data is pressent. */
+#define RMASK_DATA 0x2000	 /* RMASK data is pressent. */
+#define READ_DATA  0x4000    /* READ data is pressent. */
+#define DMASK_DATA 0x8000	 /* DMASK data is pressent. */
+
+/***************************************************************
+*
+* Pin opcodes.
+*
+***************************************************************/
+
+#define signalENABLE  0x1C    /* ispENABLE pin. */
+#define signalTMS     0x1D    /* TMS pin. */
+#define signalTCK     0x1E    /* TCK pin. */
+#define signalTDI     0x1F    /* TDI pin. */
+#define signalTRST    0x20    /* TRST pin. */
+
+/***************************************************************
+*
+* Supported vendors.
+*
+***************************************************************/
+
+#define VENDOR		0x56
+#define LATTICE		0x01
+#define ALTERA		0x02
+#define XILINX		0x03
+
+/***************************************************************
+*
+* Opcode definitions.
+*
+* Note: opcodes must be unique.
+*
+***************************************************************/
+
+#define ENDDATA    0x00    /* The end of the current SDR data stream. */
+#define RUNTEST    0x01    /* The duration to stay@the stable state. */
+#define ENDDR      0x02    /* The stable state after SDR. */
+#define ENDIR      0x03    /* The stable state after SIR. */
+#define ENDSTATE   0x04    /* The stable state after RUNTEST. */
+#define TRST       0x05    /* Assert the TRST pin. */
+#define HIR        0x06    /* The sum of the IR bits of the leading devices. */
+#define TIR        0x07    /* The sum of the IR bits of the trailing devices. */
+#define HDR        0x08    /* The number of leading devices. */
+#define TDR        0x09    /* The number of trailing devices. */
+#define ispEN      0x0A    /* Assert the ispEN pin. */
+#define FREQUENCY  0x0B    /* The maximum clock rate to run the JTAG state machine. */
+#define STATE      0x10    /* Move to the next stable state. */
+#define SIR        0x11    /* The instruction stream follows. */
+#define SDR        0x12    /* The data stream follows. */
+#define TDI        0x13    /* The following data stream feeds into the device. */
+#define TDO        0x14    /* The following data stream is compared against the device. */
+#define MASK       0x15    /* The following data stream is used as mask. */
+#define XSDR       0x16    /* The following data stream is for simultaneous program and verify. */
+#define XTDI       0x17    /* The following data stream is for shift in only. It must be stored for the next XSDR. */
+#define XTDO       0x18    /* There is not data stream.  The data stream was stored from the previous XTDI. */
+#define MEM        0x19    /* The maximum memory needed to allocate in order hold one row of data. */
+#define WAIT       0x1A    /* The duration of delay to observe. */
+#define TCK        0x1B    /* The number of TCK pulses. */
+#define SHR        0x23    /* Set the flow control register for right shift. */
+#define SHL        0x24    /* Set the flow control register for left shift. */
+#define HEAP       0x32    /* The memory size needed to hold one loop. */
+#define REPEAT     0x33    /* The beginning of the loop. */
+#define LEFTPAREN  0x35    /* The beginning of data following the loop. */
+#define VAR		   0x55	   /* Plac holder for loop data. */
+#define SEC        0x1C    /* The delay time in seconds that must be observed. */
+#define SMASK      0x1D    /* The mask for TDI data. */
+#define MAX        0x1E    /* The absolute maximum wait time. */
+#define ON         0x1F    /* Assert the targeted pin. */
+#define OFF        0x20    /* Dis-assert the targeted pin. */
+#define SETFLOW    0x30    /* Change the flow control register. */
+#define RESETFLOW  0x31    /* Clear the flow control register. */
+#define CRC		   0x47    /* The following data stream is used for CRC calculation. */
+#define CMASK	   0x48	   /* The following data stream is used as mask for CRC calculation. */
+#define RMASK      0x49    /* The following data stream is used as mask for read and save. */
+#define READ	   0x50    /* The following data stream is used for read and save. */
+#define ENDLOOP    0x59    /* The end of the repeat loop. */
+#define SECUREHEAP 0x60    /* Used to secure the HEAP opcode. */
+#define VUES       0x61	   /* Support continue if fail. */
+#define DMASK      0x62    /* The following data stream is used for dynamic I/O. */
+#define COMMENT	   0x63    /* Support SVF comments in the VME file. */
+#define HEADER     0x64    /* Support header in VME file. */
+#define FILE_CRC   0x65    /* Support crc-protected VME file. */
+#define LCOUNT     0x66    /* Support intelligent programming. */
+#define LDELAY     0x67    /* Support intelligent programming. */
+#define LSDR       0x68    /* Support intelligent programming. */
+#define LHEAP      0x69    /* Memory needed to hold intelligent data buffer */
+#define CONTINUE   0x70    /* Allow continuation. */
+#define LVDS	   0x71	   /* Support LVDS. */
+#define ENDVME     0x7F    /* End of the VME file. */
+#define ENDFILE    0xFF    /* End of file. */
+
+/***************************************************************
+*
+* ispVM Embedded Return Codes.
+*
+***************************************************************/
+
+#define VME_VERIFICATION_FAILURE		-1
+#define VME_FILE_READ_FAILURE			-2
+#define VME_VERSION_FAILURE				-3
+#define VME_INVALID_FILE				-4
+#define VME_ARGUMENT_FAILURE			-5
+#define VME_CRC_FAILURE					-6
+
+/***************************************************************
+*
+* Type definitions.
+*
+***************************************************************/
+
+/* Support LVDS */
+typedef struct {
+	unsigned short usPositiveIndex;
+	unsigned short usNegativeIndex;
+	unsigned char  ucUpdate;
+} LVDSPair;
+
diff --git a/package/ts4600-tshwctl/ts4600-tshwctl.mk b/package/ts4600-tshwctl/ts4600-tshwctl.mk
new file mode 100644
index 0000000..f75d2db
--- /dev/null
+++ b/package/ts4600-tshwctl/ts4600-tshwctl.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# ts4600-tshwctl
+#
+################################################################################
+
+TS4600_TSHWCTL_SITE = $(TOPDIR)/package/ts4600-tshwctl/src
+TS4600_TSHWCTL_SITE_METHOD = local
+TS4600_TSHWCTL_REDISTRIBUTE = NO
+
+define TS4600_TSHWCTL_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define TS4600_TSHWCTL_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	mkdir -p $(TARGET_DIR)/usr/sbin
+	$(INSTALL) -m 0755 package/ts4600-tshwctl/S00watchdogd $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 package/ts4600-tshwctl/S01ethswitch $(TARGET_DIR)/etc/init.d
+	$(INSTALL) -m 0755 $(@D)/tshwctl $(TARGET_DIR)/usr/sbin
+endef
+
+$(eval $(generic-package))
-- 
2.10.0
