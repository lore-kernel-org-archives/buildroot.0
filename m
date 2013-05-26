From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 23:00:30 +0200
Subject: [Buildroot] [git commit] skeleton: add default login port to
	/etc/securetty
Message-ID: <20130602212057.258779A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d67b3a54af65ab4818a891458d2d59f91f239f99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We ran into a "Login incorrect" problem when running the same rootfs
image across platforms with different loging ports ttyS0/1/2/3.

Simply assignning "console" to BR2_TARGET_GENERIC_GETTY_PORT, which in
turn modifies the /etc/inittab, is not enough because the "console" device
was missing in the /etc/securetty.

While current securetty has enumerated a lot of ttys, this patch should save
some efforts to enumerate more.

[Peter: guard with single quotes]
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |    1 +
 system/system.mk              |    8 ++++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 180c81d..3bab725 100755
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
index 44a33ae..50c86ad 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -9,6 +9,10 @@ TARGET_GENERIC_GETTY:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT))
 TARGET_GENERIC_GETTY_BAUDRATE:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_BAUDRATE))
 TARGET_GENERIC_GETTY_TERM:=$(call qstrip,$(BR2_TARGET_GENERIC_GETTY_TERM))
 
+target-generic-securetty:
+	grep -q '^$(TARGET_GENERIC_GETTY)$$' $(TARGET_DIR)/etc/securetty || \
+		echo '$(TARGET_GENERIC_GETTY)' >> $(TARGET_DIR)/etc/securetty
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
