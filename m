From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Jun 2009 20:56:49 +0200
Subject: [Buildroot] [git commit] u-boot: target tools: use library files
	from their original location
Message-ID: <20090630194636.C2542774F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=99da30bf5d14f465ad18bbf204d09f84b427d52d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


u-boot 2009.06 changed the tools/ logic, and no longer adds symbolic
links to the needed library files in the tools directory.

Fix build by referencing the library files in their original location.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Makefile.in |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index cd18404..b74e43a 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -186,16 +186,19 @@ $(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 
 $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
-	$(TARGET_CC) -I$(U_BOOT_DIR)/include -DUSE_HOSTCC -o $@ \
-		$(U_BOOT_DIR)/tools/mkimage.c \
-		$(addprefix $(U_BOOT_DIR)/tools/,crc32.c image.c md5.c sha1.c fdt*.c)
+	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
+		-DUSE_HOSTCC -o $@ \
+		$(U_BOOT_DIR)/tools/mkimage.c $(U_BOOT_DIR)/common/image.c \
+		$(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
+		$(U_BOOT_DIR)/libfdt/fdt*.c
+
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
 $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
 		-DUSE_HOSTCC -o $@ \
-		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/tools/crc32.c
+		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
-- 
1.6.3.3
