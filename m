From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 24 Apr 2017 17:38:46 -0500
Subject: [Buildroot] [PATCH] busybox: no need to disable clear and reset
In-Reply-To: <20170424201323.30582-1-arnout@mind.be>
References: <20170424201323.30582-1-arnout@mind.be>
Message-ID: <CANQCQpZX63Qy5XiVg6V8jqnDx365DnNjZ7S751L_Fh84FWyLHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Apr 24, 2017 3:13 PM, "Arnout Vandecappelle (Essensium/Mind)" <
arnout@mind.be> wrote:

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


I'll give this a test tonight


Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 689830e7f8..a536ed2953 100644
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
-       $(call KCONFIG_DISABLE_OPT,CONFIG_CLEAR,$(BUSYBOX_BUILD_CONFIG))
-       $(call KCONFIG_DISABLE_OPT,CONFIG_RESET,$(BUSYBOX_BUILD_CONFIG))
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
-       $(BUSYBOX_DISABLE_NCURSES_PROGS)
 endef

 define BUSYBOX_CONFIGURE_CMDS
--
2.11.0
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170424/563bb696/attachment.html>
