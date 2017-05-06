From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri,  5 May 2017 20:51:18 -0400
Subject: [Buildroot] [PATCH 1/1] dbus: fix dbus symlink removal
Message-ID: <1494031878-2982-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was already a post-build hook to delete the /var/lib/dbus symlink
created by buildroot after the package's own installation, to prevent
a dbus installation error during "make dbus-rebuild".  However, this
misses the case for when one might delete the .stamp_target_installed
file manually, outside of dbus-rebuild.  This can be fixed by changing
the post-build hook to a pre-install hook.  This seems appropriate,
since it is really addressing an installation issue, not a build issue.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index d333b20..ce40329 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -82,7 +82,7 @@ define DBUS_REMOVE_VAR_LIB_DBUS
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 endef
 
-DBUS_POST_BUILD_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
+DBUS_PRE_INSTALL_TARGET_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
 
 define DBUS_REMOVE_DEVFILES
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
-- 
2.7.4
