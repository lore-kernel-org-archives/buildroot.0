From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Jun 2013 08:45:47 +0200
Subject: [Buildroot] [git commit] dhcpcd: new package
Message-ID: <20130618065043.5C1859AF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=69a0a1e1d369fc2312b741f009bcecaf1ee33798
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dhcpcd is an RFC2131 compliant DHCP client.

[Peter: needs ipv6, fix whitespace/file header]
Signed-off-by: John Stile <john@stilen.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/dhcpcd/Config.in |   10 ++++++++++
 package/dhcpcd/dhcpcd.mk |   42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index bcc3470..5b066dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -703,6 +703,7 @@ source "package/hplip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
 endif
+source "package/dhcpcd/Config.in"
 source "package/dhcpdump/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
new file mode 100644
index 0000000..a06a973
--- /dev/null
+++ b/package/dhcpcd/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DHCPCD
+	depends on BR2_INET_IPV6
+	bool "dhcpcd"
+	help
+	  An RFC2131 compliant DHCP client
+
+	  http://roy.marples.name/downloads/dhcpcd
+
+comment "dhcpcd requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
new file mode 100644
index 0000000..9d4a72b
--- /dev/null
+++ b/package/dhcpcd/dhcpcd.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# dhcpcd
+#
+################################################################################
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
