From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:41:50 +0200
Subject: [Buildroot] [PATCH 04/74] avahi: convert old-style hook to
	new-style hook
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <28025091919e3e0dfb99a39e9f6afde46764b8ab.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk |   24 ++++++++++++++++++------
 1 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 8e2d14f..e1bebd9 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -137,19 +137,31 @@ AVAHI_DEPENDENCIES += libintl
 AVAHI_MAKE_OPT = LIBS=-lintl
 endif
 
-$(eval $(call AUTOTARGETS,package,avahi))
-
-$(AVAHI_HOOK_POST_INSTALL):
+define AVAHI_REMOVE_INITSCRIPT
 	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
-ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
+endef
+
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_INITSCRIPT
+
+define AVAHI_INSTALL_AUTOIPD
 	rm -rf $(TARGET_DIR)/etc/dhcp3/
 	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/var/lib
 	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
+endef
+
+ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_AUTOIPD
 endif
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+
+define AVAHI_INSTALL_DAEMON_INITSCRIPT
 	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
+endef
+
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_INSTALL_DAEMON_INITSCRIPT
 endif
-	touch $@
+
+$(eval $(call AUTOTARGETS,package,avahi))
-- 
1.7.0.4
