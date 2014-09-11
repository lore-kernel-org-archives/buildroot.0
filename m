From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu, 11 Sep 2014 15:49:26 +0200
Subject: [Buildroot] [PATCH 1/1] Adds ipmitool,
	a command-line interface to IPMI-enabled devices.
Message-ID: <1410443366-22146-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

---
v2:

- ipmitool needs MMU (David Bachelart)
- moved package from "networking applications" to "hardware handling"
  (used "networking applications" originally, because ipmitool can
  be used to send commands to the BMC of a remote server,
  e.g. telling it to reboot the system.
  However another use of ipmitool is to configure the local BMC
  and "hardware handling" might be a better match for both.)
---
 package/Config.in            |  1 +
 package/ipmitool/Config.in   | 17 +++++++++++++++++
 package/ipmitool/ipmitool.mk | 25 +++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 package/ipmitool/Config.in
 create mode 100644 package/ipmitool/ipmitool.mk

diff --git a/package/Config.in b/package/Config.in
index 883dd66..302a638 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -321,6 +321,7 @@ endif
 	source "package/input-tools/Config.in"
 	source "package/intel-microcode/Config.in"
 	source "package/iostat/Config.in"
+	source "package/ipmitool/Config.in"
 	source "package/irda-utils/Config.in"
 	source "package/iucode-tool/Config.in"
 	source "package/kbd/Config.in"
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
new file mode 100644
index 0000000..300a553
--- /dev/null
+++ b/package/ipmitool/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_IPMITOOL
+	bool "ipmitool"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_OPENSSL
+	help
+	  IPMItool provides a simple command-line interface to IPMI-enabled devices.
+
+	  http://sourceforge.net/projects/ipmitool/
+
+if BR2_PACKAGE_IPMITOOL
+
+config BR2_PACKAGE_IPMITOOL_IPMIEVD
+	bool "ipmievd"
+	help
+	  IPMI event daemon for sending events to syslog
+
+endif
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
new file mode 100644
index 0000000..2d96549
--- /dev/null
+++ b/package/ipmitool/ipmitool.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# ipmitool
+#
+################################################################################
+
+IPMITOOL_VERSION = 1.8.14
+IPMITOOL_SOURCE = ipmitool-$(IPMITOOL_VERSION).tar.bz2
+IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPMITOOL_VERSION)
+IPMITOOL_LICENSE = BSD-3c
+IPMITOOL_LICENSE_FILES = COPYING
+IPMITOOL_DEPENDENCIES = openssl
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+IPMITOOL_DEPENDENCIES += readline
+endif
+
+ifneq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),y)
+define IPMITOOL_REMOVE_IPMIEVD
+	$(RM) -f $(TARGET_DIR)/usr/sbin/ipmievd
+endef
+IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.2
