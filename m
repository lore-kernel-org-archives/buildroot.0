From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 24 Feb 2011 21:37:48 +0100
Subject: [Buildroot] [PATCH] gdb: depend on host-expat to fix remote
	debugging
Message-ID: <1298579868-22046-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the following error when using GDB with gdbserver:

  warning: Can not parse XML target description; XML support was disabled at compile time
  Remote 'g' packet reply is too long: <very long line of hex chars>
  [remote debugging does not work]

Use $(HOST_CONFIGURE_OPTS) so expat is found.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 toolchain/gdb/gdb.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 739ebbe..caf3e36 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -183,6 +183,7 @@ $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 	(cd $(GDB_HOST_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
 		bash_cv_have_mbstate_t=yes \
+		$(HOST_CONFIGURE_OPTS) \
 		$(GDB_DIR)/configure $(QUIET) \
 		--cache-file=/dev/null \
 		--prefix=$(STAGING_DIR) \
@@ -207,7 +208,7 @@ $(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
 	ln -snf $(REAL_GNU_TARGET_NAME)-gdb \
 		$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
 
-gdbhost: $(TARGET_CROSS)gdb
+gdbhost: host-expat $(TARGET_CROSS)gdb
 
 gdbhost-source: $(DL_DIR)/$(GDB_SOURCE)
 
-- 
1.7.1
