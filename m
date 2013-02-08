From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:11:24 +0100
Subject: [Buildroot] [git commit] rootfs-overlay: also exclude .empty files
Message-ID: <20130208211821.4E3249AA19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afea3037ef3a6718051e79dd7f7e3bb2e4cc224e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes it possible to put empty directories in the overlay.
Thanks to Aras Vaichas for pointing that out.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                         |    3 ++-
 docs/manual/customize-rootfs.txt |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 395d270..7f0822f 100644
--- a/Makefile
+++ b/Makefile
@@ -506,7 +506,8 @@ endif
 	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
 		$(call MESSAGE,"Copying overlay $${dir}"); \
 		rsync -a \
-			--exclude .svn --exclude .git --exclude .hg --exclude '*~' \
+			--exclude .empty --exclude .svn --exclude .git \
+			--exclude .hg --exclude '*~' \
 			$${dir}/ $(TARGET_DIR); \
 	done
 
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 3cdbaa1..b1662cb 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -20,8 +20,8 @@ there are a few ways to customize the resulting target filesystem.
 
 * Create a filesystem overlay: a tree of files that are copied directly
   over the target filesystem after it has been built.  Set
-  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+,
-  +.hg+ directories and files ending with +~+ are excluded.
+  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+, +.hg+
+  directories, +.empty+ files and files ending with +~+ are excluded.
   _Among these first 3 methods, this one should be preferred_.
 
 * In the Buildroot configuration, you can specify the path to a
