From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 11 Nov 2020 20:34:14 +1300
Subject: [Buildroot] [PATCH 1/2] package/coremark: new package
Message-ID: <20201111073415.814-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CoreMark is a simple, yet sophisticated benchmark that is designed
specifically to test the functionality of a processor core. Running
CoreMark produces a single-number score allowing users to make quick
comparisons between processors.

https://www.eembc.org/coremark/

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/coremark/Config.in     |  8 ++++++++
 package/coremark/coremark.hash |  3 +++
 package/coremark/coremark.mk   | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/coremark/Config.in
 create mode 100644 package/coremark/coremark.hash
 create mode 100644 package/coremark/coremark.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 43cc1b55ae..ff823a2e3d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -490,6 +490,7 @@ F:	configs/olimex_a13_olinuxino_defconfig
 F:	configs/orangepi_plus_defconfig
 
 N:	Chris Packham <judge.packham@gmail.com>
+F:	package/coremark/
 F:	package/gstreamer1/gst1-shark/
 F:	package/micropython/
 F:	package/micropython-lib/
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..16fd95fe38 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -87,6 +87,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
 	source "package/clinfo/Config.in"
+	source "package/coremark/Config.in"
 	source "package/dacapo/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
diff --git a/package/coremark/Config.in b/package/coremark/Config.in
new file mode 100644
index 0000000000..f0e13eda63
--- /dev/null
+++ b/package/coremark/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_COREMARK
+	bool "coremark"
+	help
+	  CoreMark is a benchmark that measures the performance of
+	  microcontrollers (MCUs) and central processing units (CPUs)
+	  used in embedded systems
+
+	  https://www.eembc.org/coremark/
diff --git a/package/coremark/coremark.hash b/package/coremark/coremark.hash
new file mode 100644
index 0000000000..57da3e998c
--- /dev/null
+++ b/package/coremark/coremark.hash
@@ -0,0 +1,3 @@
+#locally computed
+sha256  99c5a6d63af85a281b4e4d6ccb522c446653c435dfec9455ad73ef9e71f28bde  coremark-1.01.tar.gz
+sha256  d72094a3cb629dc7712ae09b7b777416903c6670930928b5530f2ddfb2296888  LICENSE.md
diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
new file mode 100644
index 0000000000..418fd5c8d3
--- /dev/null
+++ b/package/coremark/coremark.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# CoreMark
+#
+################################################################################
+
+COREMARK_VERSION = 1.01
+COREMARK_SITE = $(call github,eembc,coremark,v$(COREMARK_VERSION))
+COREMARK_LICENSE = Apache-2.0
+COREMARK_LICENSE_FILES = LICENSE.md
+
+define COREMARK_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
+		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
+endef
+
+define COREMARK_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
+endef
+
+$(eval $(generic-package))
-- 
2.29.2
