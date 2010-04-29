From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 29 Apr 2010 22:19:20 +0300
Subject: [Buildroot] [PATCH] Fix GDB BFD test linking
Message-ID: <20100429191920.6133.88233.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling GDB for target (in my case i386) it links
wrong BFD library from host OS. This prevents GDB from compiling
support for ELF and thus GDB is unusable on target.

More about this issue was already posted at:
http://lists.uclibc.org/pipermail/buildroot/2009-March/026585.html

Fix this issue by forcing ELF support.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 toolchain/gdb/gdb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 5e91d98..5725067 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -93,6 +93,8 @@ endif
 	touch $@
 
 $(GDB_TARGET_DIR)/gdb/gdb: $(GDB_TARGET_DIR)/.configured
+	# force ELF support since it fails due to BFD linking problems
+	gdb_cv_var_elf=yes \
 	$(MAKE) CC=$(TARGET_CC) MT_CFLAGS="$(TARGET_CFLAGS)" \
 		-C $(GDB_TARGET_DIR)
 	$(STRIPCMD) $(GDB_TARGET_DIR)/gdb/gdb
