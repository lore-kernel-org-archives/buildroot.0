From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:58:12 +0100
Subject: [Buildroot] [git commit] uclibc: add patch to fix <unistd.h> header
Message-ID: <20151103150018.534B881A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=52717eac86da18d4de08220d2c59d29086cf147f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump to uClibc-ng 1.0.8 added some changes in <unistd.h> related
to syncfs() that broke the build for packages including this header
file, such as lighttpd. This commit adds a uClibc-ng patch (submitted
upstream) which fixes the issue.

Fixes:

  http://autobuild.buildroot.org/results/6be/6be17a91373708900082958a59df8b7575df69c0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Xi-Sheng Luo <lxsjason@gmail.com>
---
 .../1.0.8/0001-unistd-fix-if-condition.patch       |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/1.0.8/0001-unistd-fix-if-condition.patch b/package/uclibc/1.0.8/0001-unistd-fix-if-condition.patch
new file mode 100644
index 0000000..c321f4e
--- /dev/null
+++ b/package/uclibc/1.0.8/0001-unistd-fix-if-condition.patch
@@ -0,0 +1,34 @@
+From 1e85892911bf016e9bb2a647b6584cdd806706f8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 3 Nov 2015 15:32:23 +0100
+Subject: [PATCH] unistd: fix #if condition
+
+Commit dfa593d4d881116723a4401b466ea964fb12327b ("syncfs: add system
+call support") modified the #if condition around the definition of the
+syncfs() prototype in a way that doesn't build, causing build failures
+of any file including <unistd.h>:
+
+output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/include/unistd.h:988:14: error: #if with no expression
+ #if __USE_GNU
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/unistd.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/unistd.h b/include/unistd.h
+index 4701dab..40d6abd 100644
+--- a/include/unistd.h
++++ b/include/unistd.h
+@@ -1073,7 +1073,7 @@ extern char *getpass (const char *__prompt) __nonnull ((1));
+ extern int fsync (int __fd);
+ #endif /* Use BSD || X/Open || Unix98.  */
+ 
+-#if __USE_GNU
++#if defined __USE_GNU
+ /* Make all changes done to all files on the file system associated
+  *    with FD actually appear on disk.  */
+ extern int syncfs (int __fd) __THROW;
+-- 
+2.6.2
+
