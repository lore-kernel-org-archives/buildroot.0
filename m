From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 05:26:51 -0500
Subject: [Buildroot] [PATCH] gdb: drop local stripping in favor of top level
Message-ID: <1290076011-31508-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the top level takes care of stripping for us, and some file formats
cannot be stripped safely (like FLAT which will error out), simply punt
the manual stripping from the gdb package.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 toolchain/gdb/gdb.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index c4fef89..54c3905 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -97,7 +97,6 @@ $(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
 	gdb_cv_var_elf=yes \
 	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_TARGET_DIR)
-	$(STRIPCMD) $(GDB_TARGET_DIR)/gdb/gdb
 
 $(TARGET_DIR)/usr/bin/gdb: $(GDB_TARGET_DIR)/gdb/gdb
 	install -c -D $(GDB_TARGET_DIR)/gdb/gdb $(TARGET_DIR)/usr/bin/gdb
@@ -152,7 +151,6 @@ $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 $(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
 	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_SERVER_DIR)
-	$(STRIPCMD) $(GDB_SERVER_DIR)/gdbserver
 
 $(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-- 
1.7.3.2
