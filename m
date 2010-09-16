From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] dbus: convert old-style hook to
	new-style hook
Message-ID: <20100916113831.6DF598AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3dbdbda0b8aca70f5bed1e249b6709a2611160f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk |   37 +++++++++++++++++++++++--------------
 1 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index e93738e..141cf69 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -49,6 +49,29 @@ else
 DBUS_CONF_OPT += --without-x
 endif
 
+# fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
+define DBUS_REMOVE_VAR_LIB_DBUS
+	rm -rf $(TARGET_DIR)/var/lib/dbus
+endef
+
+DBUS_POST_BUILD_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
+
+define DBUS_REMOVE_DEVFILES
+	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
+endef
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
+endif
+
+define DBUS_INSTALL_TARGET_FIXUP
+	rm -rf $(TARGET_DIR)/var/lib/dbus
+	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
+	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
+endef
+
+DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_INSTALL_TARGET_FIXUP
+
 HOST_DBUS_DEPENDENCIES = host-pkg-config host-expat
 HOST_DBUS_CONF_OPT = \
 		--with-dbus-user=dbus \
@@ -73,17 +96,3 @@ HOST_DBUS_POST_INSTALL_HOOKS += HOST_DBUS_GEN_INTROSPECT
 
 $(eval $(call AUTOTARGETS,package,dbus))
 $(eval $(call AUTOTARGETS,package,dbus,host))
-
-# fix rebuild (dbus makefile errors out if /var/lib/dbus is a symlink)
-$(DBUS_HOOK_POST_BUILD): $(DBUS_TARGET_BUILD)
-	rm -rf $(TARGET_DIR)/var/lib/dbus
-	touch $@
-
-$(DBUS_HOOK_POST_INSTALL): $(DBUS_TARGET_INSTALL_TARGET)
-ifneq ($(BR2_HAVE_DEVFILES),y)
-	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
-endif
-	rm -rf $(TARGET_DIR)/var/lib/dbus
-	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
-	$(INSTALL) -m 0755 package/dbus/S30dbus $(TARGET_DIR)/etc/init.d
-	touch $@
-- 
1.7.1
