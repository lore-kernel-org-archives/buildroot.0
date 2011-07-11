From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Jul 2011 23:23:17 +0200
Subject: [Buildroot] [git commit] ebtables: new package
Message-ID: <20110711212520.06EA68A47B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a8041c0973528f4ef15e1a67cc1d3baf08261b4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add ipv6 dependency]
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/ebtables/Config.in   |   10 ++++++++++
 package/ebtables/ebtables.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 package/ebtables/Config.in
 create mode 100644 package/ebtables/ebtables.mk

diff --git a/package/Config.in b/package/Config.in
index e58254b..d87dcd8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -394,6 +394,7 @@ endif
 source "package/dhcpdump/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
+source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
 source "package/ifplugd/Config.in"
diff --git a/package/ebtables/Config.in b/package/ebtables/Config.in
new file mode 100644
index 0000000..40bc45c
--- /dev/null
+++ b/package/ebtables/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_EBTABLES
+	bool "ebtables"
+	depends on BR2_INET_IPV6
+	help
+	  Ethernet bridge frame table administration
+
+	  http://ebtables.sourceforge.net
+
+comment "ebtables requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
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
1.7.3.4
