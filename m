From: Alexandre Leblanc <alexandre.leblanc@savoirfairelinux.com>
Date: Tue, 25 Apr 2017 09:58:14 -0400
Subject: [Buildroot] [PATCH] cukinia: new package
Message-ID: <20170425135814.8787-1-alexandre.leblanc@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cukinia is designed to help Linux-based embedded firmware developers
run simple validation tests on their firmware. For basic usage it
requires no dependencies other than busybox.

Cukinia can run tests at boot time which is why we are using SZZcukinia
since it would possibly be the last script to be executed in 'init.d'.

Signed-off-by: Alexandre Leblanc <alexandre.leblanc@savoirfairelinux.com>
---
 package/Config.in            |  1 +
 package/cukinia/Config.in    | 12 ++++++++++++
 package/cukinia/SZZcukinia   |  7 +++++++
 package/cukinia/cukinia.conf |  1 +
 package/cukinia/cukinia.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/cukinia/Config.in
 create mode 100644 package/cukinia/SZZcukinia
 create mode 100644 package/cukinia/cukinia.conf
 create mode 100644 package/cukinia/cukinia.mk

diff --git a/package/Config.in b/package/Config.in
index 4eaa95b..e3f8ce4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -73,6 +73,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/blktrace/Config.in"
 	source "package/bonnie/Config.in"
 	source "package/cache-calibrator/Config.in"
+	source "package/cukinia/Config.in"
 	source "package/dhrystone/Config.in"
 	source "package/dieharder/Config.in"
 	source "package/dmalloc/Config.in"
diff --git a/package/cukinia/Config.in b/package/cukinia/Config.in
new file mode 100644
index 0000000..2588bb6
--- /dev/null
+++ b/package/cukinia/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CUKINIA
+	bool "cukinia"
+	help
+	  Cukinia is designed to help Linux-based embedded firmware
+	  developers run simple validation tests on their firmware.
+
+	  https://github.com/savoirfairelinux/cukinia
+
+config BR2_PACKAGE_CUKINIA_BOOT
+	bool "run at boot time"
+	depends on BR2_PACKAGE_CUKINIA && (BR2_INIT_SYSV || BR2_INIT_BUSYBOX)
+
diff --git a/package/cukinia/SZZcukinia b/package/cukinia/SZZcukinia
new file mode 100644
index 0000000..d9dc144
--- /dev/null
+++ b/package/cukinia/SZZcukinia
@@ -0,0 +1,7 @@
+#!/bin/sh
+#
+# Run cukinia
+#
+
+[ "$1" == "start"] || exit 0
+/usr/bin/cukinia
diff --git a/package/cukinia/cukinia.conf b/package/cukinia/cukinia.conf
new file mode 100644
index 0000000..0593662
--- /dev/null
+++ b/package/cukinia/cukinia.conf
@@ -0,0 +1 @@
+cukinia_user root
diff --git a/package/cukinia/cukinia.mk b/package/cukinia/cukinia.mk
new file mode 100644
index 0000000..d507e33
--- /dev/null
+++ b/package/cukinia/cukinia.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# cukinia
+#
+################################################################################
+
+CUKINIA_VERSION = 152d4965dd1024a3f345a9ee1df6cf663a5775ed
+CUKINIA_SITE = $(call github,savoirfairelinux,cukinia,$(CUKINIA_VERSION))
+CUKINIA_LICENSE = Apache-2.0 or GPLv3
+
+define CUKINIA_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/cukinia \
+		$(TARGET_DIR)/usr/bin/cukinia
+
+	$(INSTALL) -D -m 0644 $(CUKINIA_PKGDIR)/cukinia.conf \
+		$(TARGET_DIR)/etc/cukinia/cukinia.conf
+endef
+
+ifeq ($(BR2_PACKAGE_CUKINIA_BOOT),y)
+define CUKINIA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 $(CUKINIA_PKGDIR)/SZZcukinia \
+		$(TARGET_DIR)/etc/init.d/SZZcukinia
+endef
+endif
+
+$(eval $(generic-package))
-- 
2.9.3
