From: John Stile <john@stilen.com>
Date: Sun, 10 Mar 2013 18:23:14 -0700
Subject: [Buildroot] [PATCH] dhcpcd: new package
Message-ID: <1362964994-32042-1-git-send-email-john@stilen.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Stile <johns@msli.com>

Dhcpcd is an RFC2131 compliant DHCP client.

Signed-off-by: John Stile <john@stilen.com>
---
 package/Config.in        |  1 +
 package/dhcpcd/Config.in |  7 +++++++
 package/dhcpcd/dhcpcd.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 package/dhcpcd/Config.in
 create mode 100644 package/dhcpcd/dhcpcd.mk

diff --git a/package/Config.in b/package/Config.in
index 0ba7762..4bfa1e7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -634,6 +634,7 @@ source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
+source "package/dhcpcd/Config.in"
 source "package/dhcpdump/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
new file mode 100644
index 0000000..152d7f3
--- /dev/null
+++ b/package/dhcpcd/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DHCPCD
+	bool "dhcpcd"
+	help
+	  An RFC2131 compliant DHCP client
+	  NOTE: If uClibc, depends on  UCLIBC_SUPPORT_AI_ADDRCONFIG=y
+
+	  http://roy.marples.name/downloads/dhcpcd
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
new file mode 100644
index 0000000..cab7a9e
--- /dev/null
+++ b/package/dhcpcd/dhcpcd.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# dhcpcd
+#
+#############################################################
+
+DHCPCD_VERSION = 5.6.7
+DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
+DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
+DHCPCD_LICENSE = BSD-2c
+
+ifeq ($(BR2_USE_MMU),)
+	DHCPCD_CONFIG_OPT += --disable-fork
+endif 
+
+define DHCPCD_CONFIGURE_CMDS
+	(cd $(@D); \
+	./configure \
+		--target=$(BR2_GCC_TARGET_ARCH) \
+		--os=linux \
+		$(DHCPCD_CONFIG_OPT) )
+endef
+
+define DHCPCD_BUILD_CMDS
+	$(MAKE) \
+		$(TARGET_CONFIGURE_OPTS) \
+		-C $(@D) all
+endef
+
+define DHCPCD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
+		$(TARGET_DIR)/usr/bin/dhcpcd
+	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
+		$(TARGET_DIR)/etc/dhcpcd.conf
+	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
+		$(TARGET_DIR)/libexec/dhcpcd-run-hooks
+endef
+
+# NOTE: Even though this package has a configure script, it is not generated
+# using the autotools, so we have to use the generic package infrastructure.
+
+$(eval $(call generic-package))
+
-- 
1.7.12.4
