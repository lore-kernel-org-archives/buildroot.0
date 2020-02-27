From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 00:29:55 +0100
Subject: [Buildroot] [PATCH v3 4/4] package/connman: add option to
 enable/disable WireGuard
In-Reply-To: <20200227232955.16610-1-petr.vorel@gmail.com>
References: <20200227232955.16610-1-petr.vorel@gmail.com>
Message-ID: <20200227232955.16610-4-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* New commit (each logical change should be in a separate commit).

 package/connman/Config.in  | 7 +++++++
 package/connman/connman.mk | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 68ea037b90..801957968a 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -42,6 +42,13 @@ config BR2_PACKAGE_CONNMAN_ETHERNET
 	bool "enable Ethernet support"
 	default y
 
+config BR2_PACKAGE_CONNMAN_WIREGUARD
+	bool "enable WireGuard support"
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_WIREGUARD_TOOLS
+	help
+	  Enable WireGuard support.
+
 config BR2_PACKAGE_CONNMAN_WIFI
 	bool "enable WiFi support"
 	select BR2_PACKAGE_WPA_SUPPLICANT # runtime
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index fc88ce899e..c154d179cf 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -72,6 +72,13 @@ else
 CONNMAN_CONF_OPTS += --disable-wifi
 endif
 
+ifeq ($(BR2_PACKAGE_CONNMAN_WIREGUARD),y)
+CONNMAN_CONF_OPTS += --enable-wireguard
+CONNMAN_DEPENDENCIES += libmnl
+else
+CONNMAN_CONF_OPTS += --disable-wireguard
+endif
+
 ifeq ($(BR2_PACKAGE_CONNMAN_WISPR),y)
 CONNMAN_CONF_OPTS += --enable-wispr
 CONNMAN_DEPENDENCIES += gnutls
-- 
2.25.1
