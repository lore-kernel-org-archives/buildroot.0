From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:24:11 +0100
Subject: [Buildroot] [git commit] e2fsprogs: bump to version 1.42
Message-ID: <20120126212542.8104E9058C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8a117435a184e77102fdb64f1698d35d519a6f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/e2fsprogs/Config.in                        |    3 ++
 ... e2fsprogs-add-missing-dep-of-tst_uuid-o.patch} |    0
 package/e2fsprogs/e2fsprogs-fallocate.patch        |   22 ++++++++++++++++++++
 ...it-libs.patch => e2fsprogs-sem-init-libs.patch} |    0
 package/e2fsprogs/e2fsprogs.mk                     |    3 +-
 5 files changed, 27 insertions(+), 1 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index a98c49e..d4f4405 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -47,6 +47,9 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 	bool "e2undo"
 	default y
 
+config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
+	bool "e4defrag"
+
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
 	default y
diff --git a/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch b/package/e2fsprogs/e2fsprogs-add-missing-dep-of-tst_uuid-o.patch
similarity index 100%
rename from package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch
rename to package/e2fsprogs/e2fsprogs-add-missing-dep-of-tst_uuid-o.patch
diff --git a/package/e2fsprogs/e2fsprogs-fallocate.patch b/package/e2fsprogs/e2fsprogs-fallocate.patch
new file mode 100644
index 0000000..4d952a5
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-fallocate.patch
@@ -0,0 +1,22 @@
+We assume that fallocate is supported somehow
+but we need to check if we have fallocate()
+this problem shows up on uclibc systems since
+uclibc does not have fallocate() implemented
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
+===================================================================
+--- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
++++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 17:25:37.338783680 -0800
+@@ -895,7 +895,7 @@
+ 		goto unimplemented;
+ #endif
+ 	} else {
+-#ifdef FALLOC_FL_PUNCH_HOLE
++#if defined FALLOC_FL_PUNCH_HOLE && defined HAVE_FALLOCATE
+ 		/*
+ 		 * If we are not on block device, try to use punch hole
+ 		 * to reclaim free space.
diff --git a/package/e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch b/package/e2fsprogs/e2fsprogs-sem-init-libs.patch
similarity index 100%
rename from package/e2fsprogs/e2fsprogs-1.41.9-sem-init-libs.patch
rename to package/e2fsprogs/e2fsprogs-sem-init-libs.patch
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index d945a12..912deab 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-E2FSPROGS_VERSION = 1.41.14
+E2FSPROGS_VERSION = 1.42
 E2FSPROGS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
 E2FSPROGS_CONF_OPT = \
@@ -39,6 +39,7 @@ E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FREEFRAG) += usr/sbin/e2freefrag
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2FSCK) += usr/sbin/e2fsck
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2LABEL) += usr/sbin/e2label
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E2UNDO) += usr/sbin/e2undo
+E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_E4DEFRAG) += usr/sbin/e4defrag
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FILEFRAG) += usr/sbin/filefrag
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_FSCK) += usr/sbin/fsck
 E2FSPROGS_BINTARGETS_$(BR2_PACKAGE_E2FSPROGS_LOGSAVE) += usr/sbin/logsave
