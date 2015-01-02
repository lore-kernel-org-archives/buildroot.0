From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:24:57 +0100
Subject: [Buildroot] [git commit] package/busybox: Add facility for DHCP
	hooks
Message-ID: <20150102182811.905E2807FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fb574fdc88e6b83f7a51d215602c9dbf08a30a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The (u)dhcpc hook installed by the busybox package configures the
network and exits. If we want to do anything further with a DHCP lease,
we'd have to replace the script entirely.

This change introduces a .d directory for hooks (based on the script
filename), which are executed after the interface configuration. This
allows packages to drop a script file in the .d directory to perform
actions on DHCP events.

We'll use this in a later change to notify petitboot of DHCP boot
information.

[Thomas: update to latest Buildroot, fix indentation.]

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk    |    2 ++
 package/busybox/udhcpc.script |    6 ++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 8e75e1f..f68a2f8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -212,6 +212,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
 	$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script
+	$(INSTALL) -m 0755 -d \
+		$(TARGET_DIR)/usr/share/udhcpc/default.script.d
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index e23d1f1..50c52e6 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -64,4 +64,10 @@ case "$1" in
 		;;
 esac
 
+HOOK_DIR="$0.d"
+for hook in "${HOOK_DIR}/"*; do
+    [ -f "${hook}" -a -x "${hook}" ] || continue
+    "${hook}" "${@}"
+done
+
 exit 0
