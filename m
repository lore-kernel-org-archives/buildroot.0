From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat,  9 Aug 2014 23:22:38 +0200
Subject: [Buildroot] [PATCH 1/1] ipmitool: new package
Message-ID: <1407619358-31535-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds ipmitool, a command-line interface to IPMI-enabled devices.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/Config.in            |  1 +
 package/ipmitool/Config.in   | 16 ++++++++++++++++
 package/ipmitool/ipmitool.mk | 25 +++++++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/ipmitool/Config.in
 create mode 100644 package/ipmitool/ipmitool.mk

diff --git a/package/Config.in b/package/Config.in
index 7bb8fc0..4982396 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -984,6 +984,7 @@ endif
 	source "package/igmpproxy/Config.in"
 	source "package/inadyn/Config.in"
 	source "package/iperf/Config.in"
+	source "package/ipmitool/Config.in"
 	source "package/iproute2/Config.in"
 	source "package/ipsec-tools/Config.in"
 	source "package/ipset/Config.in"
diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
new file mode 100644
index 0000000..febe9f2
--- /dev/null
+++ b/package/ipmitool/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_IPMITOOL
+	bool "ipmitool"
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
