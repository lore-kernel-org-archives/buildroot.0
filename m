From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sun, 2 May 2010 09:41:29 +0200
Subject: [Buildroot] [git commit master] Fix GDB BFD test linking
Message-ID: <20100502074443.4D60B8A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ee39d53ce343c2d8e4603f40a9d3aaba6d5ef8ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling GDB for target (in my case i386) it links
wrong BFD library from host OS. This prevents GDB from compiling
support for ELF and thus GDB is unusable on target.

More about this issue was already posted at:
http://lists.uclibc.org/pipermail/buildroot/2009-March/026585.html

Fix this issue by forcing ELF support.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
-- 
1.6.3.3
