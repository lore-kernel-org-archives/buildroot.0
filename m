From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Jan 2014 15:09:05 +0100
Subject: [Buildroot] [git commit] lftp: bump to 4.4.15 and remove
	cross-compile patch.
Message-ID: <20140125141050.D801299C48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ba3432ab3ec921c4ba089b5c80d60e167fe85f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch has been accepted upstream. See:
http://www.mail-archive.com/lftp-devel%40uniyar.ac.ru/msg01841.html

Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ..._fallocate-m4-check-for-cross-compilation.patch |   46 --------------------
 package/lftp/lftp.mk                               |    2 +-
 2 files changed, 1 insertions(+), 47 deletions(-)

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
-Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
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
