From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2015 23:05:35 +0100
Subject: [Buildroot] [git commit] package/skeleton: parameterise the
	symlinks-or-mkdir macro
Message-ID: <20151128221537.7C0F47F8B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d60d6ac0370ba10bf3dd5e237b63f26d22c1aac2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

currently, we only make the merged symlinks or non-merged mkdirs in the
target directory. This is fine, as long as one does not run gdb.

However, as soon as one wants to run gdbserver on the target,
gdb will only search for libraries in /lib in the sysroot.

In preparation for a patch to fix that, make the symlink-or-mkdir macro
a function that takes as parameter the base directory where to create
symlinks or mkdir in.

Move the function declarations out of the custom/non-custom skeleton
conditional block, so they are always available.

Reported-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton/skeleton.mk |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 46e8cc4..b296cbd 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -57,27 +57,28 @@ else # ! custom skeleton
 
 SKELETON_PATH = system/skeleton
 
+endif # ! custom skeleton
+
+# This function handles the merged or non-merged /usr cases
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 define SKELETON_USR_SYMLINKS_OR_DIRS
-	ln -snf usr/bin $(TARGET_DIR)/bin
-	ln -snf usr/sbin $(TARGET_DIR)/sbin
-	ln -snf usr/lib $(TARGET_DIR)/lib
+	ln -snf usr/bin $(1)/bin
+	ln -snf usr/sbin $(1)/sbin
+	ln -snf usr/lib $(1)/lib
 endef
 else
 define SKELETON_USR_SYMLINKS_OR_DIRS
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/bin
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/sbin
-	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib
+	$(INSTALL) -d -m 0755 $(1)/bin
+	$(INSTALL) -d -m 0755 $(1)/sbin
+	$(INSTALL) -d -m 0755 $(1)/lib
 endef
 endif
 
-endif # ! custom skeleton
-
 define SKELETON_INSTALL_TARGET_CMDS
 	rsync -a --ignore-times $(SYNC_VCS_EXCLUSIONS) \
 		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 		$(SKELETON_PATH)/ $(TARGET_DIR)/
-	$(SKELETON_USR_SYMLINKS_OR_DIRS)
+	$(call SKELETON_USR_SYMLINKS_OR_DIRS,$(TARGET_DIR))
 	ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
 	ln -snf lib $(TARGET_DIR)/usr/$(LIB_SYMLINK)
 	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt \
