From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  2 Nov 2013 08:49:54 -0300
Subject: [Buildroot] [PATCH] p910nd: new package
Message-ID: <1383392994-23498-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in        |  1 +
 package/p910nd/Config.in |  9 +++++++++
 package/p910nd/p910nd.mk | 21 +++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/p910nd/Config.in
 create mode 100644 package/p910nd/p910nd.mk

diff --git a/package/Config.in b/package/Config.in
index eb667a6..cc19708 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -856,6 +856,7 @@ source "package/openobex/Config.in"
 source "package/openssh/Config.in"
 source "package/openswan/Config.in"
 source "package/openvpn/Config.in"
+source "package/p910nd/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
diff --git a/package/p910nd/Config.in b/package/p910nd/Config.in
new file mode 100644
index 0000000..33f6cf8
--- /dev/null
+++ b/package/p910nd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_P910ND
+	bool "p910nd"
+	depends on BR2_USE_MMU # fork()
+	help
+	  p910nd is a small printer daemon intended for diskless
+	  workstations. Using ports 9100-9102, it accepts
+	  print jobs and passes them directly to a USB printer.
+
+	  http://p910nd.sourceforge.net/
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
new file mode 100644
index 0000000..48bb7e1
--- /dev/null
+++ b/package/p910nd/p910nd.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# p910nd
+#
+################################################################################
+
+P910ND_VERSION = 0.95
+P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
+P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
+P910ND_LICENSE = GPLv2
+P910ND_LICENSE_FILES = COPYING
+
+define P910ND_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define P910ND_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.5
