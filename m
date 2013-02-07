From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu,  7 Feb 2013 22:58:10 +0100
Subject: [Buildroot] [PATCH] rootfs-overlay: also exclude .empty files
In-Reply-To: <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
References: <CAJkQPO=A+_7t-dbSP8VutAsen+MvG9J44qx3D6uxKt7C2mBQUg@mail.gmail.com>
Message-ID: <1360274290-16081-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

This makes it possible to put empty directories in the overlay.
Thanks to Aras Vaichas for pointing that out.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                         |    3 ++-
 docs/manual/customize-rootfs.txt |    4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d9e5f24..b50c4ed 100644
--- a/Makefile
+++ b/Makefile
@@ -504,7 +504,8 @@ endif
 	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
 		$(call MESSAGE,"Copying overlay $${dir}"); \
 		rsync -a \
-			--exclude .svn --exclude .git --exclude .hg --exclude '*~' \
+			--exclude .empty --exclude .svn --exclude .git \
+			--exclude .hg --exclude '*~' \
 			$${dir}/ $(TARGET_DIR); \
 	done
 
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index fa04d85..1a47d7e 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -26,8 +26,8 @@ there are a few ways to customize the resulting target filesystem.
 
 * Create a filesystem overlay: a tree of files that are copied directly
   over the target filesystem after it has been built.  Set
-  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+,
-  +.hg+ directories and files ending with +~+ are excluded.
+  +BR2_ROOTFS_OVERLAY+ to the top of the tree.  +.git+, +.svn+, +.hg+
+  directories, +.empty+ files and files ending with +~+ are excluded.
   _Among these first 3 methods, this one should be preferred_.
 
 * In the Buildroot configuration, you can specify the path to a
-- 
1.7.10.4
