From: Eric Limpens <limpens@gmail.com>
Date: Thu, 19 Jun 2014 22:44:55 +0200
Subject: [Buildroot] [PATCH 1/1] Adding pifmrds package
Message-ID: <1403210695-7526-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/Config.in             |  1 +
 package/pifmrds/Config.in     |  9 +++++++++
 package/pifmrds/pifmrds.mk    | 18 ++++++++++++++++++
 package/pifmrds/pifmrds.patch | 25 +++++++++++++++++++++++++
 4 files changed, 53 insertions(+)
 create mode 100644 package/pifmrds/Config.in
 create mode 100644 package/pifmrds/pifmrds.mk
 create mode 100644 package/pifmrds/pifmrds.patch

diff --git a/package/Config.in b/package/Config.in
index f43e985..f5084fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -337,6 +337,7 @@ endif
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
 	source "package/picocom/Config.in"
+	source "package/pifmrds/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
diff --git a/package/pifmrds/Config.in b/package/pifmrds/Config.in
new file mode 100644
index 0000000..4667977
--- /dev/null
+++ b/package/pifmrds/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PIFMRDS
+	bool "pifmrds"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_LIBSNDFILE
+	help
+	pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM
+
+	comment "pifmrds requires libsndfile"
+	depends on !BR2_PACKAGE_LIBSNDFILE
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
new file mode 100644
index 0000000..5a91089
--- /dev/null
+++ b/package/pifmrds/pifmrds.mk
@@ -0,0 +1,18 @@
+PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
+PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
+PIFMRDS_INSTALL_TARGET = YES
+PIFMRDS_AUTORECONF = YES
+PIFMRDS_DEPENDENCIES += libsndfile
+
+define PIFMRDS_BUILD_CMDS
+	$(MAKE) -C $(@D)/src CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -c"
+endef
+ 
+define PIFMRDS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/pi_fm_rds $(TARGET_DIR)/usr/bin/pi_fm_rds
+	$(INSTALL) -D -m 0755 $(@D)/src/rds_wav $(TARGET_DIR)/usr/bin/rds_wav
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/pifmrds/
+	$(INSTALL) -D -m 0644 $(@D)/src/*.wav	$(TARGET_DIR)/usr/share/pifmrds/
+endef
+ 
+$(eval $(generic-package))
diff --git a/package/pifmrds/pifmrds.patch b/package/pifmrds/pifmrds.patch
new file mode 100644
index 0000000..8b8cd49
--- /dev/null
+++ b/package/pifmrds/pifmrds.patch
@@ -0,0 +1,25 @@
+diff -purN PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
+--- PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-05-04 18:21:40.000000000 +0200
++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-19 21:21:14.220328601 +0200
+@@ -1,20 +1,8 @@
+-CC = gcc
+-STD_CFLAGS = -Wall -std=gnu99 -c -g -O3
+-
+-# Enable ARM-specific options only on ARM, and compilation of the app only on ARM
+-UNAME := $(shell uname -m)
+-
+-ifeq ($(UNAME), armv6l)
+-	CFLAGS = $(STD_CFLAGS) -march=armv6 -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -ffast-math
++all:	app rds_wav
+ 
+ app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
+ 	$(CC) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
+ 
+-else
+-	CFLAGS = $(STD_CFLAGS)
+-endif
+-
+-
+ rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
+ 	$(CC) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
+ 
-- 
1.9.1
