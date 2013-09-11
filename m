From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Wed, 11 Sep 2013 17:07:57 +0200
Subject: [Buildroot] [PATCH] tcping: new package
Message-ID: <1378912077-8707-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tcping does a TCP connect to the given ip/port combination. The user can
specify a timeout in seconds. This is useful in shell scripts running in
firewalled environments. Often SYNs are just being dropped by firewalls,
thus connection establishment will be retried several times (for
minutes) until a TCP timeout is reached. With tcping it is possible to
check first if the desired port is reachable and then start connection
establishment.

http://www.linuxco.de/tcping/tcping.html
Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 package/Config.in        |  1 +
 package/tcping/Config.in |  7 +++++++
 package/tcping/tcping.mk | 27 +++++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 package/tcping/Config.in
 create mode 100644 package/tcping/tcping.mk

diff --git a/package/Config.in b/package/Config.in
index 2351839..fc1ec87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ source "package/squid/Config.in"
 source "package/strongswan/Config.in"
 source "package/stunnel/Config.in"
 source "package/tcpdump/Config.in"
+source "package/tcping/Config.in"
 source "package/tcpreplay/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/tftpd/Config.in"
diff --git a/package/tcping/Config.in b/package/tcping/Config.in
new file mode 100644
index 0000000..d440c56
--- /dev/null
+++ b/package/tcping/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TCPING
+	bool "tcping"
+	help
+	  tcping does a TCP connect to the given ip/port combination. 
+
+	  http://www.linuxco.de/tcping/tcping.html
+
diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
new file mode 100644
index 0000000..67bb30a
--- /dev/null
+++ b/package/tcping/tcping.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# tcping
+#
+#############################################################
+TCPING_VERSION = 1.3.5
+TCPING_SOURCE = tcping-$(TCPING_VERSION).tar.gz
+TCPING_SITE = http://www.linuxco.de/tcping
+TCPING_LICENSE = GPLv3+
+
+define TCPING_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)" -C $(@D) tcping.linux
+endef
+
+define TCPING_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/tcping $(TARGET_DIR)/usr/bin/tcping
+endef
+
+define TCPING_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/tcping
+endef
+
+define TCPING_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
-- 
1.8.4.rc3
