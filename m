From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 21:57:03 +0200
Subject: [Buildroot] [git commit] ipmitool: new package
Message-ID: <20140913200105.6CE889CF0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2900d48ab8dd182e32db4282b10ebbebc0a77029
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds ipmitool, a command-line interface to IPMI-enabled devices.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/ipmitool/Config.in   |   26 ++++++++++++++++++++++++++
 package/ipmitool/ipmitool.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 0 deletions(-)

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
index 0000000..e9b5374
--- /dev/null
+++ b/package/ipmitool/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_IPMITOOL
+	bool "ipmitool"
+	depends on BR2_USE_MMU # fork()
+	help
+	  IPMItool provides a simple command-line interface to IPMI-enabled devices.
+
+	  http://sourceforge.net/projects/ipmitool/
+
+if BR2_PACKAGE_IPMITOOL
+
+config BR2_PACKAGE_IPMITOOL_LANPLUS
+	bool "enable lanplus interface"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Enables the IPMI v2.0 RMCP+ LAN interface typically used to send IPMI
+	  commands to the BMC of a remote server.
+	  Not needed if you only want to communicate with the local BMC of your
+	  device using the OpenIPMI ipmi_si kernel module, or if using the
+	  legacy IPMI v1.5 RMCP LAN interface.
+
+config BR2_PACKAGE_IPMITOOL_IPMIEVD
+	bool "ipmievd"
+	help
+	  IPMI event daemon for sending events to syslog
+
+endif
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
new file mode 100644
index 0000000..85be883
--- /dev/null
+++ b/package/ipmitool/ipmitool.mk
@@ -0,0 +1,30 @@
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
+
+ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
+IPMITOOL_DEPENDENCIES += openssl
+else
+IPMITOOL_CONF_OPT += --disable-intf-lanplus
+endif
+
+ifeq ($(BR2_PACKAGE_READLINE),y)
+IPMITOOL_DEPENDENCIES += readline
+endif
+
+ifeq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),)
+define IPMITOOL_REMOVE_IPMIEVD
+	$(RM) -f $(TARGET_DIR)/usr/sbin/ipmievd
+endef
+IPMITOOL_POST_INSTALL_TARGET_HOOKS += IPMITOOL_REMOVE_IPMIEVD
+endif
+
+$(eval $(autotools-package))
