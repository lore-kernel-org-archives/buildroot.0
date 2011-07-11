From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jul 2011 17:33:31 +0300
Subject: [Buildroot] [PATCHv2] ebtables: new package
Message-ID: <4b82d4fbde55720d5d6e0a34b51e4b1b3f80e48d.1310394628.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

Changes in v2:
	* Update to version 2.0.10-1
	* Use target file name in $(INSTALL)
	* Add uninstall

 package/Config.in            |    1 +
 package/ebtables/Config.in   |    6 ++++++
 package/ebtables/ebtables.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)
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
index 0000000..67c0d92
--- /dev/null
+++ b/package/ebtables/ebtables.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# ebtables
+#
+#############################################################
+EBTABLES_VERSION = 2.0.10-1
+EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
+EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables
+
+define EBTABLES_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LIBDIR=/lib/ebtables -C $(@D)
+endef
+
+define EBTABLES_INSTALL_TARGET_CMDS
+	for so in $(@D)/$(EBTABLES_SUBDIR)/*.so \
+		$(@D)/$(EBTABLES_SUBDIR)/extensions/*.so; \
+		do \
+		$(INSTALL) -m 0755 -D $${so} \
+			$(TARGET_DIR)/lib/ebtables/`basename $${so}`; \
+	done
+	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables \
+		$(TARGET_DIR)/sbin/ebtables
+endef
+
+define EBTABLES_UNINSTALL_TARGET_CMDS
+	rm -rf $(TARGET_DIR)/lib/ebtables
+	rm -f $(TARGET_DIR)/sbin/ebtables
+endef
+
+$(eval $(call GENTARGETS,package,ebtables))
-- 
1.7.5.4
