From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 23:05:22 +0200
Subject: [Buildroot] [git commit] ipmitool: Add option to enable usb
	interface
Message-ID: <20170720210132.4907581F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd4979288666d3dc852d34c4b5d22d78f0221d0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since ipmitool v1.8.17 usb support is turned off by default. Add a
config option to enable support for the usb interface.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipmitool/Config.in   | 6 ++++++
 package/ipmitool/ipmitool.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
index 1da0ace..554a12c 100644
--- a/package/ipmitool/Config.in
+++ b/package/ipmitool/Config.in
@@ -18,6 +18,12 @@ config BR2_PACKAGE_IPMITOOL_LANPLUS
 	  device using the OpenIPMI ipmi_si kernel module, or if using the
 	  legacy IPMI v1.5 RMCP LAN interface.
 
+config BR2_PACKAGE_IPMITOOL_USB
+	bool "enable usb interface"
+	help
+	  Enables the IPMI USB interface typically used to send inband
+	  IPMI commands to the BMC of a server.
+
 config BR2_PACKAGE_IPMITOOL_IPMIEVD
 	bool "ipmievd"
 	help
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index b47209d..5254668 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -17,6 +17,12 @@ else
 IPMITOOL_CONF_OPTS += --disable-intf-lanplus
 endif
 
+ifeq ($(BR2_PACKAGE_IPMITOOL_USB),y)
+IPMITOOL_CONF_OPTS += --enable-intf-usb
+else
+IPMITOOL_CONF_OPTS += --disable-intf-usb
+endif
+
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
 IPMITOOL_DEPENDENCIES += ncurses readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
