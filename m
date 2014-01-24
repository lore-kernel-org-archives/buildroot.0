From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
Date: Fri, 24 Jan 2014 16:07:55 +0100
Subject: [Buildroot] [PATCH] lftp: bump to 4.4.15 and remove cross-compile
	patch.
Message-ID: <1390576075-16900-1-git-send-email-rebillout@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch has been accepted upstream. See:
http://www.mail-archive.com/lftp-devel%40uniyar.ac.ru/msg01841.html

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
 ..._fallocate-m4-check-for-cross-compilation.patch | 46 ----------------------
 package/lftp/lftp.mk                               |  2 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch

diff --git a/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch b/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch
deleted file mode 100644
index 66f8a80..0000000
--- a/package/lftp/0001-Fix-posix_fallocate-m4-check-for-cross-compilation.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 450ed0f38159a9944460ecff65793fe6de206df4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Arnaud=20R=C3=A9billout?= <rebillout@syscom.ch>
-Date: Mon, 25 Nov 2013 11:03:59 +0100
-Subject: [PATCH] Fix posix_fallocate m4 check for cross-compilation.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If we're cross-compiling, we can't test if the code run, we can only
-test that it compiles and links. If it does, assume posix_fallocate
-works, because cross-compilation for AIX or old glibc is unlikely.
-
-Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
----
- m4/lftp.m4 | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/m4/lftp.m4 b/m4/lftp.m4
-index 6d7ad9c..b38364d 100644
---- a/m4/lftp.m4
-+++ b/m4/lftp.m4
-@@ -271,6 +271,21 @@ AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
-        i_cv_posix_fallocate_works=yes
-      ], [
-        i_cv_posix_fallocate_works=no
-+     ], [
-+       dnl * Cross-compilation: we can only test if the code compiles and links.
-+       dnl * If it does, assume that it works, because cross-compilation for AIX or old glibc is unlikely.
-+       AC_CACHE_VAL([i_cv_posix_fallocate_works],[
-+         AC_LINK_IFELSE([
-+           #include <fcntl.h>
-+       	   int main() {
-+             posix_fallocate(0, 0, 0);
-+           }
-+         ], [
-+           i_cv_posix_fallocate_works=yes
-+         ], [
-+           i_cv_posix_fallocate_works=no
-+         ])
-+       ])
-      ])
-    ])
-    if test x$i_cv_posix_fallocate_works = xyes; then
--- 
-1.8.4.4
-
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index faf9f37..0b00594 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.4.10
+LFTP_VERSION = 4.4.15
 LFTP_SITE    = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
 LFTP_LICENSE_FILES = COPYING
-- 
1.8.5.3
