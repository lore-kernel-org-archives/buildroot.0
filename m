From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Jun 2013 21:03:34 +0200
Subject: [Buildroot] [git commit] dbus: ensure directory exists before
	installing symlink
Message-ID: <20130629190817.A00489B2CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cf8595f2996b46143c1a95d3bd6f4e131a94b94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If you use a custom target skeleton with no /var/lib directory,
then the symlink installation in dbus.mk will fail.  This patch
fixes this issue by creating /var/lib before creating a symlink
there.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/dbus.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a855f05..57274a0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -66,6 +66,7 @@ DBUS_POST_INSTALL_TARGET_HOOKS += DBUS_REMOVE_DEVFILES
 endif
 
 define DBUS_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/var/lib
 	rm -rf $(TARGET_DIR)/var/lib/dbus
 	ln -sf /tmp/dbus $(TARGET_DIR)/var/lib/dbus
 	$(INSTALL) -m 0755 -D package/dbus/S30dbus $(TARGET_DIR)/etc/init.d/S30dbus
