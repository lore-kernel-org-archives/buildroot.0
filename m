From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Thu, 12 Dec 2019 08:53:53 +0100
Subject: [Buildroot] [PATCH v4 06/13] package/connman: adapt to preset-all
In-Reply-To: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
Message-ID: <20191212075400.1499536-7-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

connman has two services
* connman.service which is the real daemon
* connman-wait-online.service which is a sync point for network-online.target

Only the first one was enabled. This adaptation enables both.

Not enabling connman-wait-online.service is probably a bug

Signed-off-by:J?r?my Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yann E.MORIN <yann.morin.1998@free.fr>
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
-- 
2.24.0
