From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 16:46:50 +0200
Subject: [Buildroot] [git commit] toolchain/gdb: strip tarball component
	when extracting
Message-ID: <20111005150454.877F58DEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5da6f9553ac82fefbefb655ac0207bc58615ae4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For some tarballs of gdb (see next patch), the extracted directory is
*not* named after the version string (eg. gdb-6.6a extract into gdb-6.6/)

Create the appropriate directory first, then use --strip-{components,path}
when extracting gdb (the same way it is done for the generic package
infrastructure).

At the same time, get rid of the snapshot special case, because:
 1- it's no longer available in the menu
 2- it would be handled by the above change

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/gdb.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 4622616..85b892f 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -28,13 +28,8 @@ $(DL_DIR)/$(GDB_SOURCE):
 
 gdb-unpacked: $(GDB_DIR)/.unpacked
 $(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
-	mkdir -p $(TOOLCHAIN_DIR)
-	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-ifeq ($(GDB_VERSION),snapshot)
-	GDB_REAL_DIR=$(shell \
-		tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
-	ln -sf $(TOOLCHAIN_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
-endif
+	mkdir -p $(GDB_DIR)
+	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(GDB_DIR) $(TAR_STRIP_COMPONENTS)=1 $(TAR_OPTIONS) -
 ifneq ($(wildcard $(GDB_PATCH_DIR)),)
 	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
 endif
