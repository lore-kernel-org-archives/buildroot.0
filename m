From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun,  8 Mar 2020 14:53:01 -0600
Subject: [Buildroot] [PATCH 1/1] package/connman: add missing libmnl
 dependency for nftables
Message-ID: <20200308205301.62180-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building with nftables support requires libmnl.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/connman/Config.in  | 1 +
 package/connman/connman.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index ac012dda54..48a2ee421c 100644
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
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 701be8b59d..1ebfe9cf14 100644
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
-- 
2.20.1
