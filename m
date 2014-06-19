From: Eric Limpens <limpens@gmail.com>
Date: Fri, 20 Jun 2014 00:00:22 +0200
Subject: [Buildroot] [PATCH 1/2] Add pifmrds package
Message-ID: <1403215223-10871-1-git-send-email-limpens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Limpens <limpens@gmail.com>
---
 package/Config.in          |  1 +
 package/pifmrds/Config.in  |  9 +++++++++
 package/pifmrds/pifmrds.mk | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/pifmrds/Config.in
 create mode 100644 package/pifmrds/pifmrds.mk

diff --git a/package/Config.in b/package/Config.in
index f43e985..0cefbc0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -336,6 +336,7 @@ endif
 	source "package/owl-linux/Config.in"
 	source "package/parted/Config.in"
 	source "package/pciutils/Config.in"
+	source "package/pifmrds/Config.in"
 	source "package/picocom/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
diff --git a/package/pifmrds/Config.in b/package/pifmrds/Config.in
new file mode 100644
index 0000000..1269d64
--- /dev/null
+++ b/package/pifmrds/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PIFMRDS
+	bool "pifmrds"
+	depends on BR2_arm
+	depends on BR2_LARGEFILE #libsndfile
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  pifmrds, FM-RDS transmitter using the Raspberry Pi's PWM
+
+	  https://github.com/ChristopheJacquet/PiFmRds
diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
new file mode 100644
index 0000000..9365424
--- /dev/null
+++ b/package/pifmrds/pifmrds.mk
@@ -0,0 +1,19 @@
+PIFMRDS_VERSION = c67306ea9b8d827f45e0d90279d367e97119bcb1
+PIFMRDS_SITE = $(call github,ChristopheJacquet,PiFmRds,$(PIFMRDS_VERSION))
+PIFMRDS_INSTALL_TARGET = YES
+PIFMRDS_AUTORECONF = YES
+PIFMRDS_DEPENDENCIES += libsndfile
+PIFMRDS_LICENSE = GPLv3+
+PIFMRDS_LICENSE_FILES = LICENSE
+
+define PIFMRDS_BUILD_CMDS
+	$(MAKE) -C $(@D)/src CC=$(TARGET_CC) LDFLAGS="$(TARGET_LDFLAGS)" CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -c"
+endef
+ 
+define PIFMRDS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/pi_fm_rds $(TARGET_DIR)/usr/bin/pi_fm_rds
+	$(INSTALL) -D -m 0755 $(@D)/src/rds_wav $(TARGET_DIR)/usr/bin/rds_wav
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/pifmrds/
+endef
+ 
+$(eval $(generic-package))
-- 
1.9.1
