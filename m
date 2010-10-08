From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 08 Oct 2010 12:26:20 +0200
Subject: [Buildroot] [PATCH] New package: nuttcp
Message-ID: <4CAEF1CC.507@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new TCP/UDP network testing tool, that provides some advanced
features compared to ttcp.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Index: b/package/Config.in
===================================================================
--- a/package/Config.in	2010-10-08 11:40:33.000000000 +0200
+++ b/package/Config.in	2010-10-08 11:48:04.000000000 +0200
@@ -28,6 +28,7 @@
 source "package/oprofile/Config.in"
 source "package/strace/Config.in"
 source "package/valgrind/Config.in"
+source "package/nuttcp/Config.in"
 endmenu
 
 menu "Development tools"
Index: b/package/nuttcp/Config.in
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/nuttcp/Config.in	2010-10-08 11:48:04.000000000 +0200
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_NUTTCP
+	bool "nuttcp"
+	help
+	  nuttcp is a TCP/UDP network testing tool, much like iperf
+
Index: b/package/nuttcp/nuttcp.mk
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ b/package/nuttcp/nuttcp.mk	2010-10-08 12:19:08.000000000 +0200
@@ -0,0 +1,29 @@
+#############################################################
+#
+# nuttcp
+#
+#############################################################
+
+NUTTCP_VERSION = 6.1.2
+NUTTCP_SITE = http://www.lcp.nrl.navy.mil/nuttcp/
+NUTTCP_SOURCE = nuttcp-$(NUTTCP_VERSION).tar.bz2
+
+define NUTTCP_CONFIGURE_CMDS
+	touch $(@D)/.stamp_configured
+endef
+
+define NUTTCP_BUILD_CMDS
+	$(MAKE1) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
+endef
+
+define NUTTCP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/nuttcp-$(NUTTCP_VERSION) \
+		$(TARGET_DIR)/usr/bin/nuttcp
+endef
+
+define NUTTCP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/nuttcp
+endef
+
+$(eval $(call GENTARGETS,package,nuttcp))
+
