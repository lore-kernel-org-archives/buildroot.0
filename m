From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Sep 2009 15:56:34 +0200
Subject: [Buildroot] [git commit master] squashfs: fix for mksquashfs 4.0
	race condition
Message-ID: <20090914135703.58E0C7761C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=76aaac62a6da754b653d1f34e86133e19f364041
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for the race condition in mksquashfs recently seen.
Patch by Phillip Lougher.

See http://thread.gmane.org/gmane.comp.file-systems.squashfs.devel/76
for details.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +
 ...quashfs-4.0-mksquashfs-race-condition-fix.patch |   41 ++++++++++++++++++++
 target/squashfs/squashfsroot.mk                    |    2 +-
 3 files changed, 44 insertions(+), 1 deletions(-)
 create mode 100644 target/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch

diff --git a/CHANGES b/CHANGES
index 1250b94..cc26756 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,8 @@
 
 	New packages: divine, libarchive
 
+	Updated/fixed packages: squashfs
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#487: Make kismet package sexier
diff --git a/target/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch b/target/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
new file mode 100644
index 0000000..7f8e8e0
--- /dev/null
+++ b/target/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
@@ -0,0 +1,41 @@
+[PATCH]: fix mksquashfs race condition
+
+See http://thread.gmane.org/gmane.comp.file-systems.squashfs.devel/76
+for details.
+---
+ squashfs-tools/mksquashfs.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: squashfs4.0/squashfs-tools/mksquashfs.c
+===================================================================
+--- squashfs4.0.orig/squashfs-tools/mksquashfs.c
++++ squashfs4.0/squashfs-tools/mksquashfs.c
+@@ -1733,8 +1733,8 @@ void unlock_fragments()
+ 		entry->buffer->block = bytes;
+ 		bytes += compressed_size;
+ 		fragments_outstanding --;
+-		pthread_mutex_unlock(&fragment_mutex);
+ 		queue_put(to_writer, entry->buffer);
++		pthread_mutex_unlock(&fragment_mutex);
+ 		pthread_mutex_lock(&fragment_mutex);
+ 		TRACE("fragment_locked writing fragment %d, compressed size %d"
+ 			"\n", entry->fragment, compressed_size);
+@@ -2426,8 +2426,8 @@ void *frag_deflator(void *arg)
+ 			write_buffer->block = bytes;
+ 			bytes += compressed_size;
+ 			fragments_outstanding --;
+-			pthread_mutex_unlock(&fragment_mutex);
+ 			queue_put(to_writer, write_buffer);
++			pthread_mutex_unlock(&fragment_mutex);
+ 			TRACE("Writing fragment %lld, uncompressed size %d, "
+ 				"compressed size %d\n", file_buffer->block,
+ 				file_buffer->size, compressed_size);
+@@ -4137,7 +4137,7 @@ void read_recovery_data(char *recovery_f
+ 
+ 
+ #define VERSION() \
+-	printf("mksquashfs version 4.0 (2009/04/05)\n");\
++	printf("mksquashfs version 4.0-test (2009/04/05)\n");\
+ 	printf("copyright (C) 2009 Phillip Lougher <phillip@lougher.demon.co.uk>\n\n"); \
+ 	printf("This program is free software; you can redistribute it and/or\n");\
+ 	printf("modify it under the terms of the GNU General Public License\n");\
diff --git a/target/squashfs/squashfsroot.mk b/target/squashfs/squashfsroot.mk
index d7d559b..3ff0f3b 100644
--- a/target/squashfs/squashfsroot.mk
+++ b/target/squashfs/squashfsroot.mk
@@ -14,7 +14,7 @@ $(DL_DIR)/$(SQUASHFS_SOURCE):
 
 $(SQUASHFS_DIR)/.unpacked: $(DL_DIR)/$(SQUASHFS_SOURCE) #$(SQUASHFS_PATCH)
 	$(SQUASHFS_CAT) $(DL_DIR)/$(SQUASHFS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(SQUASHFS_DIR) target/squashfs/ squashfs\*.patch
+	toolchain/patch-kernel.sh $(SQUASHFS_DIR) target/squashfs/ squashfs-$(SQUASHFS_VERSION)-\*.patch
 	touch $@
 
 $(SQUASHFS_DIR)/squashfs-tools/mksquashfs: $(SQUASHFS_DIR)/.unpacked
-- 
1.6.3.3
