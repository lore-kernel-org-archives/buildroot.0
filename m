From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Feb 2011 16:04:54 +0100
Subject: [Buildroot] [git commit master 1/1] avahi: fix avahi access through
	dbus
Message-ID: <20110228150514.4886B8F7AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfee7243c65fd11118573fe3128db34993df037a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ensure that the avahi dbus service gets installed if dbus support is
enabled, otherwise avahi access through dbus fails (as clients try
to start the daemon and dbus doesn't know how to do this).

Fixed upstream in 0.6.28 (http://avahi.org/ticket/319) but this
workaround is simpler/safer for now.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/avahi/avahi.mk |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 8c0d920..6321557 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -160,8 +160,19 @@ define AVAHI_INSTALL_DAEMON_INITSCRIPT
 	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
 endef
 
+# avahi build sys erroneously only installs dbus service if systemd is enabled
+define AVAHI_INSTALL_DAEMON_DBUS_SERVICE
+	$(INSTALL) -m 0644 -D $(@D)/avahi-daemon/org.freedesktop.Avahi.service \
+		$(TARGET_DIR)/usr/share/dbus-1/system-services/org.freedesktop.Avahi.service
+endef
+
 ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
 AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_DBUS_SERVICE
+endif
+
 endif
 
 $(eval $(call AUTOTARGETS,package,avahi))
-- 
1.7.3.4
