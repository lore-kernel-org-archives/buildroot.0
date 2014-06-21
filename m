From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 21 Jun 2014 22:50:53 +0200
Subject: [Buildroot] [Patch v2 1/1] systemd: rework network/tty units
	installation
Message-ID: <1403383853-7490-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installation of the network.service and serial-getty.service unit
files are now performed via the <pkg>_INIT_SYSTEMD mechanism instead of
an installation hook.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index f3874db..1a606cd 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -101,6 +101,13 @@ ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),y)
 SYSTEMD_CONF_OPT += --enable-networkd
 else
 SYSTEMD_CONF_OPT += --disable-networkd
+define SYSTEMD_INSTALL_SERVICE_NETWORK
+	$(INSTALL) -D -m 644 package/systemd/network.service \
+		$(TARGET_DIR)/etc/systemd/system/network.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../network.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
@@ -131,11 +138,6 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
 endef
 
-define SYSTEMD_INSTALL_TTY_HOOK
-	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
-	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
-endef
-
 define SYSTEMD_INSTALL_MACHINEID_HOOK
 	touch $(TARGET_DIR)/etc/machine-id
 endef
@@ -145,28 +147,26 @@ define SYSTEMD_SANITIZE_PATH_IN_UNITS
 		-exec $(SED) 's,$(HOST_DIR),,g' {} \;
 endef
 
-define SYSTEMD_INSTALL_NETWORK_HOOK
-	$(INSTALL) -D -m 644 package/systemd/network.service \
-		$(TARGET_DIR)/etc/systemd/system/network.service
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../network.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/network.service
-endef
-
 SYSTEMD_POST_INSTALL_TARGET_HOOKS += \
 	SYSTEMD_INSTALL_INIT_HOOK \
 	SYSTEMD_INSTALL_TTY_HOOK \
 	SYSTEMD_INSTALL_MACHINEID_HOOK \
 	SYSTEMD_SANITIZE_PATH_IN_UNITS
 
-ifeq ($(BR2_PACKAGE_SYSTEMD_NETWORKD),)
-SYSTEMD_POST_INSTALL_TARGET_HOOKS += SYSTEMD_INSTALL_NETWORK_HOOK
-endif
-
 define SYSTEMD_USERS
 	systemd-journal -1 systemd-journal -1 * /var/log/journal - - Journal
 	systemd-journal-gateway -1 systemd-journal-gateway -1 * /var/log/journal - - Journal Gateway
 	$(SYSTEMD_USER_TIMESYNC)
 endef
 
+define SYSTEMD_INSTALL_SERVICE_TTY
+	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
+	ln -fs ../../../../lib/systemd/system/serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
+endef
+
+define SYSTEMD_INSTALL_INIT_SYSTEMD
+	$(SYSTEMD_INSTALL_SERVICE_TTY)
+	$(SYSTEMD_INSTALL_SERVICE_NETWORK)
+endef
+
 $(eval $(autotools-package))
-- 
1.9.3
