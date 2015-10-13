From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 13 Oct 2015 10:45:38 -0400
Subject: [Buildroot] [PATCH] connman: add missing dbus system bus
	configuration
In-Reply-To: <1444747538-2996-1-git-send-email-mike@mikebwilliams.com>
References: <1444747538-2996-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1444747538-2996-2-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/connman/connman.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 87d81ce..9d85493 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -37,6 +37,11 @@ define CONNMAN_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
 endef
 
+define CONNMAN_INSTALL_DBUS_CONF
+	$(INSTALL) -m 0644 -D $(@D)/src/connman-dbus.conf \
+		$(TARGET_DIR)/etc/dbus-1/system.d/
+endef
+
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_CONF_OPTS += --enable-client
 CONNMAN_DEPENDENCIES += readline
@@ -50,4 +55,6 @@ else
 CONNMAN_CONF_OPTS += --disable-client
 endif
 
+CONNMAN_POST_INSTALL_TARGET_HOOKS += CONNMAN_INSTALL_DBUS_CONF
+
 $(eval $(autotools-package))
-- 
2.1.4
