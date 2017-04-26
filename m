From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Apr 2017 09:20:15 +0200
Subject: [Buildroot] [git commit] busybox: no need to disable clear and reset
Message-ID: <20170426072113.83BED80648@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=200282e2070ec0405184378c3cfb4e04ab26c5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing clear and reset from the busybox config when the ncurses tools
are enabled is not really needed.

Since commit 802bff9c42, the busybox install will not overwrite
existing programs. Therefore, the tools will be installed correctly
regardless of the order of the build:
- if busybox is built first, the clear and reset apps are installed,
  but they will be overwritten by ncurses;
- if ncurses is built first, it will install the clear and reset apps,
  and busybox will no longer install them.

We prefer not to modify the busybox configuration when not strictly
necessary, because it is surprising for the user that his configuration
is not applied. Clearly, it's not ideal that busybox is configured with
redundant apps, but if the user wants to shrink it, it's possible to
provide a custom config.

This partially reverts commit 33c72344a8686a136c1da6a056ed6c0945bbf8b7.

Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Matt Weber  <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 689830e..a536ed2 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -148,17 +148,6 @@ define BUSYBOX_MUSL_TWEAKS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_NCURSES_TARGET_PROGS),y)
-# Ncurses package overlaps:
-#     /usr/bin/clear
-#     /usr/bin/reset -> /usr/bin/tset (symlink)
-#
-define BUSYBOX_DISABLE_NCURSES_PROGS
-	$(call KCONFIG_DISABLE_OPT,CONFIG_CLEAR,$(BUSYBOX_BUILD_CONFIG))
-	$(call KCONFIG_DISABLE_OPT,CONFIG_RESET,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
 define BUSYBOX_INSTALL_UDHCPC_SCRIPT
 	if grep -q CONFIG_UDHCPC=y $(@D)/.config; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
@@ -240,7 +229,6 @@ define BUSYBOX_KCONFIG_FIXUP_CMDS
 	$(BUSYBOX_SET_WATCHDOG)
 	$(BUSYBOX_SET_SELINUX)
 	$(BUSYBOX_MUSL_TWEAKS)
-	$(BUSYBOX_DISABLE_NCURSES_PROGS)
 endef
 
 define BUSYBOX_CONFIGURE_CMDS
