From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2015 23:45:32 +0100
Subject: [Buildroot] [git commit] uclibc: update to 1.0.9
Message-ID: <20151116224600.A9CCE81E6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67299e3ae02f7c31c58875deb655e031c7f4fe82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a fanotify include bug where old kernels (2.6.x) fail to build.
Fixes recent failures on x86 with Linux 4.3.x kernel regarding
network sockets. Includes the removed patch.

Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../1.0.8/0001-unistd-fix-if-condition.patch       |   34 --------------------
 package/uclibc/Config.in                           |    2 +-
 package/uclibc/uclibc.hash                         |    2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/uclibc/1.0.8/0001-unistd-fix-if-condition.patch b/package/uclibc/1.0.8/0001-unistd-fix-if-condition.patch
deleted file mode 100644
index c321f4e..0000000
--- a/package/uclibc/1.0.8/0001-unistd-fix-if-condition.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1e85892911bf016e9bb2a647b6584cdd806706f8 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 3 Nov 2015 15:32:23 +0100
-Subject: [PATCH] unistd: fix #if condition
-
-Commit dfa593d4d881116723a4401b466ea964fb12327b ("syncfs: add system
-call support") modified the #if condition around the definition of the
-syncfs() prototype in a way that doesn't build, causing build failures
-of any file including <unistd.h>:
-
-output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:988:14: error: #if with no expression
- #if __USE_GNU
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- include/unistd.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/unistd.h b/include/unistd.h
-index 4701dab..40d6abd 100644
---- a/include/unistd.h
-+++ b/include/unistd.h
-@@ -1073,7 +1073,7 @@ extern char *getpass (const char *__prompt) __nonnull ((1));
- extern int fsync (int __fd);
- #endif /* Use BSD || X/Open || Unix98.  */
- 
--#if __USE_GNU
-+#if defined __USE_GNU
- /* Make all changes done to all files on the file system associated
-  *    with FD actually appear on disk.  */
- extern int syncfs (int __fd) __THROW;
--- 
-2.6.2
-
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 21d8ddc..eeb6ca0 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -57,7 +57,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
-	default "1.0.8"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.9"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index d9931a9..f985501 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -2,7 +2,7 @@
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
 # From http://www.uclibc-ng.org/
-sha256  11575cda78681713f5a36cf35deaae93acdc7dce463d38a12902991fb7f5312a        uClibc-ng-1.0.8.tar.xz
+sha256  08be8dd22ac0c3806add88b813129fb3014437eddc9d78fc73eba7f33c4b4a9d        uClibc-ng-1.0.9.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
 none	xxx	uClibc-arc-2015.06.tar.gz
