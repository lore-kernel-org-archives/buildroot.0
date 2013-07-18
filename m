From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2013 23:24:14 +0200
Subject: [Buildroot] [PATCH 3/4] package/nss-mdns: do not overwrite user's
	nsswitch.conf
In-Reply-To: <cover.1374182572.git.yann.morin.1998@free.fr>
References: <cover.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <30a72c128f8850ae5ee21e06365bc89e37c6e9ab.1374182572.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Instead of over-writing the nsswitch.conf file (which may already
contain user's specific configuration if it comes from a rootfs
overlay, or a custom skeleton), just replace the 'hosts' line.

Remove now-useless custom nsswitch.conf file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/nss-mdns/nss-mdns.mk   |  3 ++-
 package/nss-mdns/nsswitch.conf | 15 ---------------
 2 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100644 package/nss-mdns/nsswitch.conf

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 4d36633..83d9a2a 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -10,7 +10,8 @@ NSS_MDNS_SITE=http://0pointer.de/lennart/projects/nss-mdns
 NSS_MDNS_CONF_OPT += --localstatedir=/var
 
 define NSS_MDNS_INSTALL_CONFIG
-	$(INSTALL) -D -m 0664 package/nss-mdns/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf
+	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
+	    $(TARGET_DIR)/etc/nsswitch.conf
 endef
 
 NSS_MDNS_POST_INSTALL_TARGET_HOOKS += NSS_MDNS_INSTALL_CONFIG
diff --git a/package/nss-mdns/nsswitch.conf b/package/nss-mdns/nsswitch.conf
deleted file mode 100644
index 94174e0..0000000
--- a/package/nss-mdns/nsswitch.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-# /etc/nsswitch.conf
-
-passwd:         compat
-group:          compat
-shadow:         compat
-
-hosts:          files mdns4_minimal [NOTFOUND=return] dns mdns4
-networks:       files
-
-protocols:      db files
-services:       db files
-ethers:         db files
-rpc:            db files
-
-netgroup:       nis
-- 
1.8.1.2
