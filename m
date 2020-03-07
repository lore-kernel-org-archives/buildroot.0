From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:46:36 +0100
Subject: [Buildroot] [git commit branch/next] package/connman: add
 iptables/nftables selection
Message-ID: <20200307213520.8462D8FC5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba0c0e52810d1449f76dc7f75277c0381f6e135c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This allows to use nftables instead of the default iptables.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/connman/Config.in  | 22 +++++++++++++++++++++-
 package/connman/connman.mk |  8 ++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 30eae23c96..ac012dda54 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_CONNMAN
 	depends on !BR2_TOOLCHAIN_USES_MUSL # missing res_ninit()
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_IPTABLES
 	help
 	  The Connection Manager (ConnMan) project provides a daemon
 	  for managing internet connections within embedded devices
@@ -18,6 +17,27 @@ config BR2_PACKAGE_CONNMAN
 
 if BR2_PACKAGE_CONNMAN
 
+choice
+	prompt "Firewall type"
+	default BR2_PACKAGE_CONNMAN_IPTABLES
+	help
+	  Select which firewall type is used.
+
+config BR2_PACKAGE_CONNMAN_IPTABLES
+	bool "iptables"
+	select BR2_PACKAGE_IPTABLES
+	help
+	  Use iptables as firewall.
+
+config BR2_PACKAGE_CONNMAN_NFTABLES
+	bool "nftables"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_PACKAGE_NFTABLES
+	help
+	  Use nftables as firewall.
+endchoice
+
 config BR2_PACKAGE_CONNMAN_ETHERNET
 	bool "enable Ethernet support"
 	default y
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 7ea52f012a..701be8b59d 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -36,6 +36,14 @@ else
 CONNMAN_CONF_OPTS += --disable-ethernet
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_IPTABLES),y)
+CONNMAN_CONF_OPTS += --with-firewall=iptables
+CONNMAN_DEPENDENCIES += iptables
+else ifeq ($(BR2_PACKAGE_CONNMAN_NFTABLES),y)
+CONNMAN_CONF_OPTS += --with-firewall=nftables
+CONNMAN_DEPENDENCIES += nftables
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
 CONNMAN_CONF_OPTS += --enable-loopback
 else
