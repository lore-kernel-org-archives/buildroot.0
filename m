From: roylee17 at gmail.com <roylee17@gmail.com>
Date: Fri, 13 Jul 2012 11:19:05 +0800
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
	/etc/securetty
Message-ID: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
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

Change-Id: Ifb1239c80eb86528345b24eb8d04b52b67aa1209
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 target/generic/Makefile.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 4185202..571b54a 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -31,6 +31,9 @@ target-generic-do-remount-rw:
 target-generic-dont-remount-rw:
 	$(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
 
+target-generic-securetty:
+	grep -q $(TARGET_GENERIC_GETTY) $(TARGET_DIR)/etc/securetty || echo $(TARGET_GENERIC_GETTY) >> $(TARGET_DIR)/etc/securetty
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -50,4 +53,7 @@ TARGETS += target-generic-do-remount-rw
 else
 TARGETS += target-generic-dont-remount-rw
 endif
+ifneq ($(TARGET_GENERIC_GETTY),)
+TARGETS += target-generic-securetty
+endif
 endif
-- 
1.7.8.6
