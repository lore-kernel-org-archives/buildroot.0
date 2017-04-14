From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 13 Apr 2017 22:20:47 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
Message-ID: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ncurses package installs a full version of clear and reset(tset)
tools.  Preserve these by disabling the options in the busybox config
file.  This removes the need for ncurses to depend on busybox for solely
ordering of target install.

This commit resolves the following python circular dependency with python.
busybox -> libselinux -> python3 -> ncurses -> busybox

Fixes:
http://autobuild.buildroot.net/results/db1/db1e6f3054092fc5576ccab8e04a3b9d74ca9a8c/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/busybox/busybox.mk | 12 ++++++++++++
 package/ncurses/ncurses.mk |  5 -----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f9dacc7..b159b44 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -148,6 +148,17 @@ define BUSYBOX_MUSL_TWEAKS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
+# Ncurses package overlaps:
+#     /usr/bin/clear
+#     /usr/bin/reset -> /usr/bin/tset (symlink)
+#
+define BUSYBOX_NCURSE_PROGS_TWEAKS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_CLEAR,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_DISABLE_OPT,CONFIG_RESET,$(BUSYBOX_BUILD_CONFIG))
+endef
+endif
+
 define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	if grep -q CONFIG_UDHCPC=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
@@ -229,6 +240,7 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_MUSL_TWEAKS)
+	$(BUSYBOX_NCURSE_PROGS_TWEAKS)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 68c77ac..2b99d3f 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -29,11 +29,6 @@ NCURSES_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_NCURSES_TARGET_PROGS),,--without-progs) \
 	--without-manpages
 
-# Install after busybox for the full-blown versions
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-NCURSES_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_STATIC_LIBS),y)
 NCURSES_CONF_OPTS += --without-shared --with-normal
 else ifeq ($(BR2_SHARED_LIBS),y)
-- 
1.9.1
