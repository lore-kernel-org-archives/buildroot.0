From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Jul 2013 00:38:57 +0200
Subject: [Buildroot] [git commit] package/nss-mdns: do not overwrite user's
	nsswitch.conf
Message-ID: <20130718224318.6C9739A2E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2e610da5a8dfd37ec4a963f0c99496a304d0b26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of over-writing the nsswitch.conf file (which may already contain
user's specific configuration if it comes from a custom skeleton), just
replace the 'hosts' line.

Remove now-useless custom nsswitch.conf file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nss-mdns/nss-mdns.mk   |    3 ++-
 package/nss-mdns/nsswitch.conf |   15 ---------------
 2 files changed, 2 insertions(+), 16 deletions(-)

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
