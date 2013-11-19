From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Nov 2013 10:02:03 -0300
Subject: [Buildroot] [PATCH 1/2] dbus: only install initscript for sysV
	targets
Message-ID: <1384866124-23665-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e241247..560f63e 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -75,11 +75,15 @@ define DBUS_INSTALL_TARGET_FIXUP
 	mkdir -p $(TARGET_DIR)/var/lib
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
-	$(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
 endef
 
 DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP
 
+define DBUS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/dbus/S30dbus \
+		$(TARGET_DIR)/etc/init.d/S30dbus
+endef
+
 HOST_DBUS_DEPENDENCIES = host-pkgconf host-expat
 HOST_DBUS_CONF_OPT = \
 		--with-dbus-user=dbus \
-- 
1.8.3.2
