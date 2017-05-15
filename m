From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:43:44 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] dbus: fix dbus symlink
	removal
Message-ID: <20170515125326.A54507FA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3858b49e9302789bf70b7e49a69982a4c4a61162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

There was already a post-build hook to delete the /var/lib/dbus symlink
created by buildroot after the package's own installation, to prevent
a dbus installation error during "make dbus-rebuild".  However, this
misses the case for when one might delete the .stamp_target_installed
file manually, outside of dbus-rebuild.  This can be fixed by changing
the post-build hook to a pre-install hook.  This seems appropriate,
since it is really addressing an installation issue, not a build issue.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c2d6c4ac3277e545ef27b3d4f3e6d94e50d76256)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 2d1583e..66b90bc 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -82,7 +82,7 @@ define DBUS_REMOVE_VAR_LIB_DBUS
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 endef
 
-DBUS_POST_BUILD_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
+DBUS_PRE_INSTALL_TARGET_HOOKS += DBUS_REMOVE_VAR_LIB_DBUS
 
 define DBUS_REMOVE_DEVFILES
 	rm -rf $(TARGET_DIR)/usr/lib/dbus-1.0
