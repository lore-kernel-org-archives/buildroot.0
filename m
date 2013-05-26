From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 26 May 2013 15:40:25 -0500
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
In-Reply-To: <1369599269-18876-1-git-send-email-spenser@gillilanding.com>
References: <1369599269-18876-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1369600825-19785-1-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tzu-Jung Lee <tjlee@ambarella.com>

We ran into a "Login incorrect" problem when running the same rootfs
image across platforms with different loging ports ttyS0/1/2/3.

Simply assignning "console" to BR2_TARGET_GENERIC_GETTY_PORT, which in
turn modifies the /etc/inittab, is not enough because the "console" device
was missing in the /etc/securetty.

While current securetty has enumerated a lot of ttys, this patch should save
some efforts to enumerate more.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/graph-depends |    1 +
 system/system.mk              |    8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 50b8670..ac24086 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -161,6 +161,7 @@ def remove_redundant_deps(deps):
     return newdeps
 
 TARGET_EXCEPTIONS = [
+    "target-generic-securetty",
     "target-generic-issue",
     "target-generic-getty-busybox",
     "target-generic-do-remount-rw",
diff --git a/system/system.mk b/system/system.mk
index 44a33ae..3e11a51 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -9,6 +9,10 @@ TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 
+target-generic-securetty:
+	grep -q ^$(TARGET_GENERIC_GETTY)$$ $(TARGET_DIR)/etc/securetty || \
+		echo $(TARGET_GENERIC_GETTY) >> $(TARGET_DIR)/etc/securetty
+
 target-generic-hostname:
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
@@ -40,6 +44,10 @@ target-generic-do-remount-rw:
 target-generic-dont-remount-rw:
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 
+ifneq ($(TARGET_GENERIC_GETTY),)
+TARGETS += target-generic-securetty
+endif
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
-- 
1.7.9.5
