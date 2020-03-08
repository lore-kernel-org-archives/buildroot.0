From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 00:07:41 -0700
Subject: [Buildroot] [PATCH 1/1] package/connman: enable wireguard
Message-ID: <20200308070741.42542-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We also need to select libmnl when building with wireguard support or
with nftables.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/connman/Config.in  | 5 +++++
 package/connman/connman.mk | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index ac012dda54..614b826f96 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_NFTABLES
 	bool "nftables"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_NFTABLES
 	help
 	  Use nftables as firewall.
@@ -51,6 +52,10 @@ config BR2_PACKAGE_CONNMAN_WIFI
 	  setup). ConnMan detects the start of wpa_supplicant
 	  automatically.
 
+config BR2_PACKAGE_CONNMAN_WIREGUARD
+	bool "enable wireguard support"
+	select BR2_PACKAGE_LIBMNL
+
 config BR2_PACKAGE_CONNMAN_WISPR
 	bool "enable WISPr support"
 	depends on !BR2_STATIC_LIBS # gnutls
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 701be8b59d..23e7cb7797 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -41,7 +41,7 @@ CONNMAN_CONF_OPTS += --with-firewall=iptables
 CONNMAN_DEPENDENCIES += iptables
 else ifeq ($(BR2_PACKAGE_CONNMAN_NFTABLES),y)
 CONNMAN_CONF_OPTS += --with-firewall=nftables
-CONNMAN_DEPENDENCIES += nftables
+CONNMAN_DEPENDENCIES += libmnl nftables
 endif
 
 ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
@@ -70,6 +70,13 @@ else
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
2.20.1
