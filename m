From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 18:33:22 +0100
Subject: [Buildroot] [git commit] package/connman: adapt to systemctl
 preset-all
Message-ID: <20191218172934.657918806D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7869ef30f0194ee5ce5db5ba49239bc2e1b9725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

connman has two services
* connman.service which is the real daemon
* connman-wait-online.service which is a sync point for network-online.target

Only the first one was enabled. This adaptation enables both.

Not enabling connman-wait-online.service is probably a bug

Signed-off-by: J??r??my Rosen <jeremy.rosen@smile.fr>
[yann.morin.1998 at free.fr: fix check-package errors]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/connman/connman.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 7ca49726dd..2cbf3fe752 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -32,12 +32,6 @@ define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
 
-define CONNMAN_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/connman.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
-endef
-
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_LICENSE += , GPL-2.0+ (client)
 CONNMAN_CONF_OPTS += --enable-client
