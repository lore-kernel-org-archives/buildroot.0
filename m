From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] target: support generic getty
	with sysvinit inittabs
Message-ID: <20101214003642.3DDEE8E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fb7226ca2f185577f656b422f9e6a73304de71e9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In sysvinit inittab the "id" field (first field) must be no longer
than 4 bytes, and is not used by init to determine the output
terminal. Therefore, we adjust the strategy used to modify the inittab
file according to the getty configuration.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/generic/Makefile.in |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
index 1ef2a9d..3a750c3 100644
--- a/target/generic/Makefile.in
+++ b/target/generic/Makefile.in
@@ -11,10 +11,16 @@ target-generic-issue:
 	mkdir -p $(TARGET_DIR)/etc
 	echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
 
-target-generic-getty:
+target-generic-getty-busybox:
 	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
 		$(TARGET_DIR)/etc/inittab
 
+# In sysvinit inittab, the "id" must not be longer than 4 bytes, so we
+# skip the "tty" part and keep only the remaining.
+target-generic-getty-sysvinit:
+	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(TARGET_GENERIC_GETTY) | tail -c+4)::respawn:/sbin/getty -L $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
+		$(TARGET_DIR)/etc/inittab
+
 ifneq ($(TARGET_GENERIC_HOSTNAME),)
 TARGETS += target-generic-hostname
 endif
@@ -24,5 +30,9 @@ TARGETS += target-generic-issue
 endif
 
 ifeq ($(BR2_TARGET_GENERIC_GETTY),y)
-TARGETS += target-generic-getty
+ifeq ($(BR2_PACKAGE_SYSVINIT),y)
+TARGETS += target-generic-getty-sysvinit
+else
+TARGETS += target-generic-getty-busybox
+endif
 endif
-- 
1.7.2.2
