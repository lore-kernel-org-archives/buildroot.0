From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Apr 2011 23:32:46 +0200
Subject: [Buildroot] [git commit] u-boot: fix target build of fw_printenv
Message-ID: <20110424213558.57C5282A3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cdd4a7a06184ec1a322ac43f633b5f15f991de54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3571

The current approach for building fw_printenv for the target fails on
some configurations, so use the upstream make target (which works)
instead.

At the same time get rid of the unneeded stripping.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    1 +
 boot/u-boot/u-boot.mk |   10 +++-------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index 07e4935..19d2cc5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,6 +19,7 @@
 	#3475: Calling sync on large filesystems when not always necessary
 	#3511: make busybox-menuconfig does not download busybox package
 	#3541: Quotes in the top Makefile:217 break buildroot/kernel config...
+	#3571: u-boot: fw_printenv does not build
 	#3643: popt source url is not responding
 
 2011.02, Released February 28th, 2011:
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 2f839c5..ff3f65e 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -159,15 +159,11 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 		$(U_BOOT_DIR)/tools/os_support.c \
 		$(wildcard $(U_BOOT_DIR)/libfdt/fdt*.c $(U_BOOT_DIR)/lib/libfdt/fdt*.c)
 
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
-
 # Build manually fw_printenv for the target
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
-	mkdir -p $(@D)
-	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
-		-DUSE_HOSTCC -o $@ \
-		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib*/crc32.c
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+	$(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) HOSTCC="$(TARGET_CC)" -C $(U_BOOT_DIR) env
+	$(INSTALL) -m 0755 -D $(U_BOOT_DIR)/tools/env/fw_printenv $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
 u-boot: $(U_BOOT_TARGETS)
-- 
1.7.3.4
