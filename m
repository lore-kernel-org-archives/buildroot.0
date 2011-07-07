From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  7 Jul 2011 16:42:01 +0300
Subject: [Buildroot] [PATCH] ebtables: new package
Message-ID: <f2408a31cec10972f6f2a4a5fc885b4cc6704eb8.1310046029.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/Config.in            |    1 +
 package/ebtables/Config.in   |    6 ++++++
 package/ebtables/ebtables.mk |   24 ++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/ebtables/Config.in
 create mode 100644 package/ebtables/ebtables.mk

diff --git a/package/Config.in b/package/Config.in
index 40f523d..853194f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ endif
 source "package/dhcpdump/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
+source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
new file mode 100644
index 0000000..73af12a
--- /dev/null
+++ b/package/ebtables/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_EBTABLES
+	bool "ebtables"
+	help
+	  Ethernet bridge frame table administration
+
+	  http://ebtables.sourceforge.net
diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
new file mode 100644
index 0000000..553bbb7
--- /dev/null
+++ b/package/ebtables/ebtables.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# ebtables
+#
+#############################################################
+EBTABLES_VERSION = 2.0.9-2
+EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
+EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
+
+define EBTABLES_BUILD_CMDS
+	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) LIBDIR=/lib/ebtables -C $(@D)
+endef
+
+define EBTABLES_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/ebtables
+	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/extensions/*.so \
+		$(TARGET_DIR)/lib/ebtables
+	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/*.so \
+		$(TARGET_DIR)/lib/ebtables
+	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
+		$(TARGET_DIR)/sbin/ebtables
+endef
+
+$(eval $(call GENTARGETS,package,ebtables))
-- 
1.7.5.4
