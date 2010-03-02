From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 2 Mar 2010 17:42:23 +0100
Subject: [Buildroot] [git commit master] squashfs: fix 3.4 build after
	be8a104c3cd (pass CFLAGS/LDFLAGS and add host-zlib dependency)
Message-ID: <20100302164424.3EC357777C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=58794482a970d226208b9b510e606b9b44c752cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit be8a104c3cd (pass CFLAGS/LDFLAGS and add host-zlib dependency)
changed the way make was invocated for squashfs and added a patch for 4.0,
but forgot to add an equivalent patch for 3.4.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 +++
 .../squashfs/squashfs-3.4-build-system-fix.patch   |   28 ++++++++++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 target/squashfs/squashfs-3.4-build-system-fix.patch

diff --git a/CHANGES b/CHANGES
index a49ca4e..76d9aee 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,7 @@
+2010.05, Not yet released
+
+	 Updated/fixed packages: squashfs
+
 2010.02, Release February 26th, 2010:
 
 	Fixes all over the tree.
diff --git a/target/squashfs/squashfs-3.4-build-system-fix.patch b/target/squashfs/squashfs-3.4-build-system-fix.patch
new file mode 100644
index 0000000..5b86b00
--- /dev/null
+++ b/target/squashfs/squashfs-3.4-build-system-fix.patch
@@ -0,0 +1,28 @@
+[PATCH]: squashfs-tools: Handle user supplied CFLAGS/LDFLAGS
+
+Properly handle make CFLAGS=.. LDFLAGS=..
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ squashfs-tools/Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: squashfs3.4/squashfs-tools/Makefile
+===================================================================
+--- squashfs3.4.orig/squashfs-tools/Makefile
++++ squashfs3.4/squashfs-tools/Makefile
+@@ -2,12 +2,12 @@ INSTALL_DIR = /usr/local/bin
+ 
+ INCLUDEDIR = .
+ 
+-CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
++override CFLAGS += -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
+ 
+ all: mksquashfs unsquashfs
+ 
+ mksquashfs: mksquashfs.o read_fs.o sort.o
+-	$(CC) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
+ 
+ mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h
+ 
-- 
1.6.3.3
