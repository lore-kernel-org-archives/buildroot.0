From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 12 Jul 2015 20:44:56 +0200
Subject: [Buildroot] [PATCH v5 1/3] busybox: Install scripts only when needed
Message-ID: <1436726698-17776-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Init scripts are only usefull with init system that supports them, it
means that we don't want init scripts files unless Busybox or SysV has
been chosen as the init.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
v1 -> v2:
   - Remove non needed space in ifeq (Thomas Petazzoni)
---
 package/busybox/busybox.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 92874cd..5602fb1 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -141,17 +141,23 @@ define BUSYBOX_SET_INIT
 endef
 endif
 
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/S01logging \
 			$(TARGET_DIR)/etc/init.d/S01logging; \
 	else rm -f $(TARGET_DIR)/etc/init.d/S01logging; fi
 endef
+endif
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
 define BUSYBOX_SET_WATCHDOG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
 endef
+endif
+
+ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
 define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 	$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
 		$(TARGET_DIR)/etc/init.d/S15watchdog
@@ -167,6 +173,7 @@ define BUSYBOX_LINUX_PAM
 endef
 BUSYBOX_DEPENDENCIES += linux-pam
 endif
+endif
 
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
-- 
2.1.4
