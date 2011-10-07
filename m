From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Oct 2011 19:39:01 -0300
Subject: [Buildroot] [PATCH] noip: new package
Message-ID: <1318027141-1026-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in      |    1 +
 package/noip/Config.in |    6 ++++++
 package/noip/noip.mk   |   30 ++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 package/noip/Config.in
 create mode 100644 package/noip/noip.mk

diff --git a/package/Config.in b/package/Config.in
index 6cd3796..9e27ff8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
+source "package/noip/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
diff --git a/package/noip/Config.in b/package/noip/Config.in
new file mode 100644
index 0000000..02039dd
--- /dev/null
+++ b/package/noip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NOIP
+	bool "noip"
+	help
+	  Dynamic DNS update client for no-ip.com
+
+	  http://www.no-ip.com/downloads.php
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
new file mode 100644
index 0000000..0ac3368
--- /dev/null
+++ b/package/noip/noip.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# noip
+#
+#############################################################
+
+NOIP_VERSION = 2.1.9
+NOIP_SITE = http://www.no-ip.com/client/linux
+NOIP_SOURCE = noip-duc-linux.tar.gz
+
+define NOIP_BUILD_CMDS
+	sed -i -e "s:\(#define CONFIG_FILENAME\).*:\1 \"/etc/no-ip2.conf\":" \
+		$(@D)/noip2.c
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		PREFIX=/usr CONFDIR=/etc
+endef
+
+define NOIP_INSTALL_TARGET_CMDS
+	$(INSTALL) $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
+endef
+
+define NOIP_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/sbin/noip2"
+endef
+
+define NOIP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
