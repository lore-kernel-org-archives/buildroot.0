From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Nov 2013 16:12:38 +0100
Subject: [Buildroot] [git commit] dbus: only install initscript for sysV
	targets
Message-ID: <20131126151609.6CF339BDBD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d08ba19c8102be8650906e4d874459ad2622f38c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

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
