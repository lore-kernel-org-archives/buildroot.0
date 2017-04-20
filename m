From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 19 Apr 2017 21:13:28 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: ncurses progs equiv as default
Message-ID: <1492654408-25342-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, enable the busybox equivalents of the ncurses
clear and reset if ncurses progs are not enabled.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/busybox/busybox.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9d9fcc2..56ec939 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -153,10 +153,15 @@ ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
 #     /usr/bin/clear
 #     /usr/bin/reset -> /usr/bin/tset (symlink)
 #
-define BUSYBOX_DISABLE_NCURSES_PROGS
+define BUSYBOX_NCURSES_PROGS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_CLEAR,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_RESET,$(BUSYBOX_BUILD_CONFIG))
 endef
+else
+define BUSYBOX_NCURSES_PROGS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CLEAR,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RESET,$(BUSYBOX_BUILD_CONFIG))
+endef
 endif
 
 define BUSYBOX_INSTALL_UDHCPC_SCRIPT
@@ -240,7 +245,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_MUSL_TWEAKS)
-	$(BUSYBOX_DISABLE_NCURSES_PROGS)
+	$(BUSYBOX_NCURSES_PROGS)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
-- 
1.9.1
