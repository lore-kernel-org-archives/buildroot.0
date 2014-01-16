From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 16 Jan 2014 16:52:18 +0800
Subject: [Buildroot] [RFC,
	PATCH 1/8] package/busybox: Add facility for DHCP hooks
In-Reply-To: <1389862338.917573.283530987294.0.gpush@pablo>
Message-ID: <1389862338.917966.273409717366.1.gpush@pablo>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The (u)dhcpc hook installed by the busybox package configures the
network and exits. If we want to do anything further with a DHCP lease,
we'd have to replace the script entirely.

This change introduces a .d directory for hooks (based on the script
filename), which are executed after the interface configuration. This
allows packages to drop a script file in the .d directory to perform
actions on DHCP events.

We'll use this in a later change to notify petitboot of DHCP boot
information.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/busybox/busybox.mk    |    2 ++
 package/busybox/udhcpc.script |    9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f6f542e2..6ff5f3da 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -200,6 +200,8 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	if [ ! -f $(TARGET_DIR)/usr/share/udhcpc/default.script ]; then \
 		$(INSTALL) -m 0755 -D package/busybox/udhcpc.script \
 			$(TARGET_DIR)/usr/share/udhcpc/default.script; \
+		$(INSTALL) -m 755 -d \
+			$(TARGET_DIR)/usr/share/udhcpc/default.script.d; \
 	fi
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_MDEV_CONF)
diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 43742fbd..8930d4a8 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -63,4 +63,13 @@ case "$1" in
 		;;
 esac
 
+HOOK_DIR="$0.d"
+if [ -d "$HOOK_DIR" ]
+then
+	for HOOK in $HOOK_DIR/*; do
+		$HOOK "$@"
+	done
+fi
+
+
 exit 0
