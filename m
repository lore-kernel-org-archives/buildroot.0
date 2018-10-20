From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 01:50:35 +0200
Subject: [Buildroot] [git commit] nss-mdns: drop nsswitch.conf installation
 logic
Message-ID: <20181020234904.EC51288085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ce567033001345799153da819e08e5a2ad1a71e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the nsswitch.conf installation logic moved to the post-install-install
hook of the toolchain package, it is guaranteed to be available when
nss-mdns is run - So drop the logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/nss-mdns.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index ee666c76a0..63f40e718a 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -10,9 +10,6 @@ NSS_MDNS_LICENSE = LGPL-2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
 define NSS_MDNS_INSTALL_CONFIG
-	if [ ! -f "$(TARGET_DIR)/etc/nsswitch.conf" ]; then \
-		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
-	fi
 	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
