From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2020 09:39:12 +0200
Subject: [Buildroot] [git commit] package/systemd: register NSS plugins in
 nsswitch.conf
Message-ID: <20200718073742.336DE86C9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f5fa423f4f7e0c9968b311c58fa61f2535a122f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This supports 4 plugins, each will be added at the right spot if
enabled, based on the template coming with systemd.

The sed replacements are carefully written to be idempotent, and to
be robust enough to be combined with the other available packages
(nss_mdns4) in any installation order.

nss-systemd is used for the DynamicUser features, which is a defacto
necessity for systemd. It handles transient users/groups without
touching the /etc/{passwd,group} files on disk. To support the
'SupplementaryGroups' feature, groups should be merged.

nss-myhostname allows resolving the hostname, again without touching
files in /etc.

nss-mymachines adds name resolution from containers supported by
machined. Users from the containers might end up in system groups, so
groups should be merged.

nss-resolve, part of resolved, is required for consistent dns lookups.
As per the documentation (nss-resolve(8)), DNS queries shall not
continue past the resolve service, unless the service is not available.

We anchor nss_resolve to appear after files, if mymachines is also used,
remove that first (and add it back later). Other packages (mdns4) move
around the dns entry, so replacing that is not a good option.

If mdns4 is installed aswell, then resolved will take precedence for
host lookups.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[yann.morin.1998 at free.fr:
  - exp[lain why 'host: resolve' uses !UNAVAIL=return
  - rewrap commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8e01a0db5b..1a8eb86e53 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -494,6 +494,23 @@ define SYSTEMD_USERS
 	$(SYSTEMD_TIMESYNCD_USER)
 endef
 
+define SYSTEMD_INSTALL_NSSCONFIG_HOOK
+	$(SED) '/^passwd:/ {/systemd/! s/$$/ systemd/}' \
+		-e '/^group:/ {/systemd/! s/$$/ [SUCCESS=merge] systemd/}' \
+		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
+			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
+			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
+		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
+			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
+		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
+			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
+			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
+			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
+		$(TARGET_DIR)/etc/nsswitch.conf
+endef
+
+SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_INSTALL_NSSCONFIG_HOOK
+
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # systemd provides multiple units to autospawn getty as neede
 # * getty at .service to start a getty on normal TTY
