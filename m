From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  4 Jul 2020 01:49:23 +0200
Subject: [Buildroot] [PATCH v3] package/systemd: register NSS plugins in
 nsswitch.conf
Message-ID: <20200703234923.174320-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This supports 4 plugins, each will be added at the right
spot if enabled, based on the template coming with systemd.

The sed replacements are carefully written to be idempotent,
and to be robust enough to be combined with the other
available packages (nss_mdns4) in any installation order.

nss-systemd is used for the DynamicUser features,
which is a defacto necessity for systemd.
It handles transient users/groups without
touching the /etc/{passwd,group} files on disk.

nss-myhostname allows resolving the hostname,
again without touching files in /etc.

nss-mymachines adds name resolution from containers
supported by machined.
users from the containers might end up in system groups,
so groups should be merged.

nss-resolve is part of resolved, and required for
consistent dns lookups.

we anchor nss_resolve to appear after files, if mymachines is also
used, remove that first (and add it back later). Other packages
(mdns4) move around the dns entry, so replacing that is not a
good option.

if mdns4 is installed aswell, then resolved will take precedence
for host lookups.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v3:
*   basically a rewrite
*   tested together with nss_mdns4 replacements
---
 package/systemd/systemd.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8e01a0db5b..2e6c81bd75 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -473,7 +473,27 @@ define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
 
+# anchor nss_resolve after files, if mymachines is also used, remove that first
+# and add it back. this is necessary as other packages (mdns) move around
+# the dns entry.
+
+define SYSTEMD_ADD_NSSCONFIG_HOOK
+	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
+		-e '/^group:/ {/systemd/! s/$$/ systemd/}' \
+		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
+			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
+			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
+		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
+			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
+		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
+			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
+			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines [SUCCESS=merge]/}' \
+			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
+		$(TARGET_DIR)/etc/nsswitch.conf
+endef
+
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
+	SYSTEMD_ADD_NSSCONFIG_HOOK \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
-- 
2.27.0
