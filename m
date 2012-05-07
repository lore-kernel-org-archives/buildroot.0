From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  7 May 2012 15:28:28 +0200
Subject: [Buildroot] [PATCH] gdb: fix target gdb build when host-gawk is
	built before
Message-ID: <1336397308-7195-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the crosstool-ng backend is used, host-gawk is built as a
dependency of the crosstool-ng package, and therefore an host 'gawk'
binary is installed in $(HOST_DIR).

When the target gdb package is also selected, this unfortunately leads
to a build failure, as reported on
http://buildroot.humanoidz.org/results/f19c0499d08212d8b5100fa9434e1197092957db/build-end.log.

The problem is that the ./configure of gdb detects gawk in the PATH,
but at compile time, it gdb fails to find gawk. This is due to the
fact that the gdb compilation process is started without the correct
path. This patch fixes this by passing $(TARGET_MAKE_ENV) in the
environment of the gdb compilation process.

A better fix would be to switch gdb to the AUTOTARGETS infrastructure
in the future.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/gdb/gdb.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index b5c085b..0b85180 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -90,6 +90,7 @@ endif
 $(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
 	# force ELF support since it fails due to BFD linking problems
 	gdb_cv_var_elf=yes \
+	$(TARGET_MAKE_ENV) \
 	$(MAKE) CC="$(TARGET_CC)" MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_TARGET_DIR)
 
-- 
1.7.9.5
