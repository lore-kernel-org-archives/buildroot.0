From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 00:29:54 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/connman: add iptables/nftables
 selection
In-Reply-To: <20200227232955.16610-1-petr.vorel@gmail.com>
References: <20200227232955.16610-1-petr.vorel@gmail.com>
Message-ID: <20200227232955.16610-3-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows to use nftables instead of the default iptables.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* New commit (each logical change should be in a separate commit).

 package/connman/Config.in  | 22 +++++++++++++++++++++-
 package/connman/connman.mk | 10 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 30eae23c96..68ea037b90 100644
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
+	select BR2_PACKAGE_NFTABLES
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	help
+	  Use nftables as firewall.
+endchoice
+
 config BR2_PACKAGE_CONNMAN_ETHERNET
 	bool "enable Ethernet support"
 	default y
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 7ea52f012a..fc88ce899e 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -36,6 +36,11 @@ else
 CONNMAN_CONF_OPTS += --disable-ethernet
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_IPTABLES),y)
+CONNMAN_CONF_OPTS += --with-firewall=iptables
+CONNMAN_DEPENDENCIES += iptables
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
 CONNMAN_CONF_OPTS += --enable-loopback
 else
@@ -49,6 +54,11 @@ else
 CONNMAN_CONF_OPTS += --disable-neard
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_NFTABLES),y)
+CONNMAN_CONF_OPTS += --with-firewall=nftables
+CONNMAN_DEPENDENCIES += nftables
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_OFONO),y)
 CONNMAN_CONF_OPTS += --enable-ofono
 CONNMAN_DEPENDENCIES += ofono
-- 
2.25.1
