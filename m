From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Tue, 21 May 2013 17:56:31 +0800
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
Message-ID: <1369130191-15503-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We ran into a "Login incorrect" problem when running the same rootfs
image across platforms with different loging ports ttyS0/1/2/3.

Simply assignning "console" to BR2_TARGET_GENERIC_GETTY_PORT, which in
turn modifies the /etc/inittab, is not enough because the "console" device
was missing in the /etc/securetty.

While current securetty has enumerated a lot of ttys, this patch should save
some efforts to enumerate more.

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 system/system.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/system/system.mk b/system/system.mk
index 44a33ae..67d3113 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -40,6 +40,9 @@ target-generic-do-remount-rw:
 target-generic-dont-remount-rw:
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 
+target-generic-securetty:
+	grep -q $(TARGET_GENERIC_GETTY) $(TARGET_DIR)/etc/securetty || echo $(TARGET_GENERIC_GETTY) >> $(TARGET_DIR)/etc/securetty
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -60,4 +63,7 @@ TARGETS += target-generic-do-remount-rw
 else
 TARGETS += target-generic-dont-remount-rw
 endif
+ifneq ($(TARGET_GENERIC_GETTY),)
+TARGETS += target-generic-securetty
+endif
 endif
-- 
1.8.2.1
