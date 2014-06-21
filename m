From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Jun 2014 17:58:20 +0200
Subject: [Buildroot] [PATCH v3] package/pifmrds: new package
Message-ID: <1403366300-29035-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Eric Limpens <limpens@gmail.com>

We needs three little patches:
  - one to make the existing Makefile cross-compile friendly
  - one to pass the LDFLAGS at link time
  - one to add a missing include

Signed-off-by: Eric Limpens <limpens@gmail.com>
[yann.morin.1998 at free.fr: add .mk header; cleanup and split the
 Makefile patch, add missing include; add comments to all patches]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |  1 +
 package/pifmrds/Config.in                          | 12 +++++++
 ...mrds-0000-Makefile-cross-compile-friendly.patch | 37 ++++++++++++++++++++++
 .../pifmrds-0001-Makefile-use-LDFLAGS.patch        | 20 ++++++++++++
 package/pifmrds/pifmrds-0002-rds_wav-strcmp.patch  | 17 ++++++++++
 package/pifmrds/pifmrds.mk                         | 24 ++++++++++++++
 6 files changed, 111 insertions(+)
 create mode 100644 package/pifmrds/Config.in
 create mode 100644 package/pifmrds/pifmrds-0000-Makefile-cross-compile-friendly.patch
 create mode 100644 package/pifmrds/pifmrds-0001-Makefile-use-LDFLAGS.patch
 create mode 100644 package/pifmrds/pifmrds-0002-rds_wav-strcmp.patch
 create mode 100644 package/pifmrds/pifmrds.mk

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
index 0000000..60d01b1
--- /dev/null
+++ b/package/pifmrds/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PIFMRDS
+	bool "pifmrds"
+	depends on BR2_arm
+	depends on BR2_LARGEFILE #libsndfile
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM
+
+	  https://github.com/ChristopheJacquet/PiFmRds
+
+comment "pifmrds needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
diff --git a/package/pifmrds/pifmrds-0000-Makefile-cross-compile-friendly.patch b/package/pifmrds/pifmrds-0000-Makefile-cross-compile-friendly.patch
new file mode 100644
index 0000000..414d97c
--- /dev/null
+++ b/package/pifmrds/pifmrds-0000-Makefile-cross-compile-friendly.patch
@@ -0,0 +1,37 @@
+Makefile: make it cross-compile (and Buildroot) friendly.
+
+The current Makefile makes heavy assumptions that it is doing native
+compilation on the RPi, as it checks that `uname -m` is an ARM machine.
+
+This is wrong in the cross-compilation case.
+
+Remove the conditional altogether, and do not override the CFLAGS
+as passed in the environment (Buildroot passes proper CFLAGS).
+
+[intial patch by: Eric Limpens <limpens@gmail.com>]
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
+--- pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/Makefile	2014-05-04 18:21:40.000000000 +0200
++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-21 16:38:31.971804343 +0200
+@@ -1,20 +1,8 @@
+ CC = gcc
+-STD_CFLAGS = -Wall -std=gnu99 -c -g -O3
+ 
+-# Enable ARM-specific options only on ARM, and compilation of the app only on ARM
+-UNAME := $(shell uname -m)
+-
+-ifeq ($(UNAME), armv6l)
+-	CFLAGS = $(STD_CFLAGS) -march=armv6 -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -ffast-math
+-
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
diff --git a/package/pifmrds/pifmrds-0001-Makefile-use-LDFLAGS.patch b/package/pifmrds/pifmrds-0001-Makefile-use-LDFLAGS.patch
new file mode 100644
index 0000000..54c1427
--- /dev/null
+++ b/package/pifmrds/pifmrds-0001-Makefile-use-LDFLAGS.patch
@@ -0,0 +1,20 @@
+Makefile: use LDFLAGS when linking
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
+--- pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/Makefile	2014-06-21 16:46:49.101118754 +0200
++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-21 16:47:47.801745683 +0200
+@@ -1,10 +1,10 @@
+ CC = gcc
+ 
+ app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
+-	$(CC) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
++	$(CC) $(LDFLAGS) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
+ 
+ rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
+-	$(CC) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
++	$(CC) $(LDFLAGS) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
+ 
+ rds.o: rds.c waveforms.h
+ 	$(CC) $(CFLAGS) rds.c
diff --git a/package/pifmrds/pifmrds-0002-rds_wav-strcmp.patch b/package/pifmrds/pifmrds-0002-rds_wav-strcmp.patch
new file mode 100644
index 0000000..faf7ee5
--- /dev/null
+++ b/package/pifmrds/pifmrds-0002-rds_wav-strcmp.patch
@@ -0,0 +1,17 @@
+rds_wav: add missign include for strcmp()
+
+strcmp() is declared in string.h, so include it.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/rds_wav.c pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/rds_wav.c
+--- pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1.orig/src/rds_wav.c	2014-05-04 18:21:40.000000000 +0200
++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/rds_wav.c	2014-06-21 17:39:22.999128453 +0200
+@@ -26,6 +26,7 @@
+ #include <stdlib.h>
+ #include <math.h>
+ #include <sndfile.h>
++#include <string.h>
+ 
+ #include "rds.h"
+ #include "fm_mpx.h"
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
new file mode 100644
index 0000000..0f27fce
--- /dev/null
+++ b/package/pifmrds/pifmrds.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# pifmrds
+#
+################################################################################
+
+PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
+PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
+PIFMRDS_DEPENDENCIES = libsndfile
+PIFMRDS_LICENSE = GPLv3+
+PIFMRDS_LICENSE_FILES = LICENSE
+
+define PIFMRDS_BUILD_CMDS
+	$(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
+		app rds_wav
+endef
+
+define PIFMRDS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/pi_fm_rds $(TARGET_DIR)/usr/bin/pi_fm_rds
+	$(INSTALL) -D -m 0755 $(@D)/src/rds_wav $(TARGET_DIR)/usr/bin/rds_wav
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
