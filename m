From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Jan 2012 12:46:37 +0100
Subject: [Buildroot] [git commit] gdb: also force ELF support for gdbhost
Message-ID: <20120124120024.DA4EB903C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afb6e3ed52142ef8d9450a743f9487c4fedf9a0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do for target (ee39d53ce3ee (Fix GDB BFD test linking)).

Gdb comes with an embedded copy of libiberty, but binutils also installs
libiberty.a into HOST_DIR. The gdb configure script tries to link against
this one rather than the gdb version when it checks for ELF support.
This may fail if those versions are not compatible, leading to obscure
error messages from gdb at runtime such as:

I'm sorry, Dave, I can't do that. Symbol format `elf32-$ARCH' unknown.

Fix it by forcing ELF support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 85b892f..56faf49 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -195,6 +195,8 @@ $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 	touch $@
 
 $(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
+	# force ELF support since it fails due to BFD linking problems
+	gdb_cv_var_elf=yes \
 	$(MAKE) -C $(GDB_HOST_DIR)
 	strip $(GDB_HOST_DIR)/gdb/gdb
 
