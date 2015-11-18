From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Nov 2015 23:29:14 +0100
Subject: [Buildroot] [PATCH] slang: fix build on musl
Message-ID: <1447885754-609-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from Alpine Linux to fix the build of slang with the musl C
library.

Fixes:

  http://autobuild.buildroot.org/results/bc3/bc3cca6e6a906afa4c57dcddfb4a9ecd0cb44398/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...osix_close-function-to-posix_close_slfile.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch

diff --git a/package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch b/package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch
new file mode 100644
index 0000000..4b3c869
--- /dev/null
+++ b/package/slang/0004-Rename-posix_close-function-to-posix_close_slfile.patch
@@ -0,0 +1,47 @@
+From 055b02cf98ab9b7301988c3be2d277f262f0957e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Wed, 18 Nov 2015 23:12:15 +0100
+Subject: [PATCH] Rename posix_close() function to posix_close_slfile()
+
+posix_close() is a function that will be implemented as part of an
+upcoming of the POSIX standard. For this reason, the musl C library
+has already started implementing this function call. Unfortunately,
+since slang already defines a function with the same name, it cannot
+build properly with the musl C library.
+
+This commit fixes that by renaming the slang function to
+posix_close_slfile().
+
+This patch has been taken from the Alpine Linux repository, at
+http://git.alpinelinux.org/cgit/aports/plain/main/slang/musl-fix-posix_close-clash.patch.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/slposio.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/slposio.c b/src/slposio.c
+index 94f20dd..475e2c9 100644
+--- a/src/slposio.c
++++ b/src/slposio.c
+@@ -372,7 +372,7 @@ static int posix_close_fd (int *fd)
+    return 0;
+ }
+ 
+-static int posix_close (SLFile_FD_Type *f)
++static int posix_close_slfile (SLFile_FD_Type *f)
+ {
+    int status = do_close (f);
+ 
+@@ -1011,7 +1011,7 @@ static SLang_Intrin_Fun_Type Fd_Name_Table [] =
+    MAKE_INTRINSIC_2("write", posix_write, V, F, B),
+    MAKE_INTRINSIC_1("dup_fd", posix_dup, V, F),
+    MAKE_INTRINSIC_2("dup2_fd", posix_dup2, I, F, I),
+-   MAKE_INTRINSIC_1("close", posix_close, I, F),
++   MAKE_INTRINSIC_1("close", posix_close_slfile, I, F),
+    MAKE_INTRINSIC_1("_close", posix_close_fd, I, I),
+ #if defined(TTYNAME_R)
+    MAKE_INTRINSIC_0("ttyname", posix_ttyname, V),
+-- 
+2.6.3
+
-- 
2.6.3
