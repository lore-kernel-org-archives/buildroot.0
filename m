From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 16:47:01 +0200
Subject: [Buildroot] [PATCH 2/5] busybox: Install scripts only when needed
In-Reply-To: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1413643624-14757-3-git-send-email-maxime.hadjinlian@gmail.com>
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
 package/busybox/busybox.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 422a95d..a8b4b24 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -167,6 +167,7 @@ define BUSYBOX_SET_INIT
 endef
 endif
 
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)
 define BUSYBOX_INSTALL_LOGGING_SCRIPT
 	if grep -q CONFIG_SYSLOGD=y $(@D)/.config; then \
 		[ -f $(TARGET_DIR)/etc/init.d/S01logging ] || \
@@ -174,11 +175,16 @@ define BUSYBOX_INSTALL_LOGGING_SCRIPT
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
+ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX), y)
 define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 	[ -f $(TARGET_DIR)/etc/init.d/S15watchdog ] || \
 		$(INSTALL) -D -m 0755 package/busybox/S15watchdog \
@@ -187,6 +193,7 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 			$(TARGET_DIR)/etc/init.d/S15watchdog
 endef
 endif
+endif
 
 # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
 # full-blown versions of apps installed by other packages with sym/hard links.
-- 
2.1.1
