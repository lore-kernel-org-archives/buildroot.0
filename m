From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  3 Feb 2013 13:30:22 +0100
Subject: [Buildroot] [PATCH] gdb: build gdbserver with TARGET_MAKE_ENV
Message-ID: <1359894622-4783-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the exact same problem than
21a0c11a90f9ff19c78a5f32e0a2e9064fd28054, but for the gdbserver
build. The problem is that when you use the Crosstool-NG toolchain
backend, gawk gets built as a dependency of Crosstool-NG. So the gdb
configure scripts detects it, and assumes it is in the PATH (because
the gdb configure step gets run with TARGET_MAKE_ENV).

But then, the build fails, because it tries to run gawk, but gawk
isn't in the PATH, because we forget to use this TARGET_MAKE_ENV
variable when building gdbserver.

Fixes http://autobuild.buildroot.org/results/d0173de533b5e2fffed2eff7327a502ed2d787cd/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/gdb.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 4b8fe3a..a932b1f 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -144,6 +144,7 @@ $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 	touch $@
 
 $(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
+	$(TARGET_MAKE_ENV) \
 	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_SERVER_DIR)
 
-- 
1.7.9.5
