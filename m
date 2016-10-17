From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 Oct 2016 01:27:13 -0700
Subject: [Buildroot] [PATCH] linux-pam: backport build fix when crypt() is
	not part of crypt_libs
Message-ID: <1476692833-20087-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build fails at pam_pwhistory.so linking step with the following
message:
  ld: cannot find -l-lintl
This happens because the configure script incorrectly adds '-l' to LIBS
when the crypt function is a part of libc.

Backport fix from the linux-pam mainline.
Backported from: 01e0038fa55581c4afc9d63b6180d2ea77ba2940

Fixes:
  http://autobuild.buildroot.net/results/7d0/7d0b61da93551ab49ae70210d5886324398b2ab0/
  http://autobuild.buildroot.net/results/6ea/6eafccaa6aefdae7544789c49699c48dd0409623/
  http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/
  http://autobuild.buildroot.net/results/62d/62d19cc368637e10d9ecb0b8a942a99e32941240/
  http://autobuild.buildroot.net/results/9a7/9a7ec6b1938c03589fbff4bc54e151f058baca1c/
  http://autobuild.buildroot.net/results/f00/f00073f4e13c7e48efacfa11e68af42f4d6eba51/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 ...uild-when-crypt-is-not-part-of-crypt_libs.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/linux-pam/0004-build-fix-build-when-crypt-is-not-part-of-crypt_libs.patch

diff --git a/package/linux-pam/0004-build-fix-build-when-crypt-is-not-part-of-crypt_libs.patch b/package/linux-pam/0004-build-fix-build-when-crypt-is-not-part-of-crypt_libs.patch
new file mode 100644
index 0000000..e1b65b2
--- /dev/null
+++ b/package/linux-pam/0004-build-fix-build-when-crypt-is-not-part-of-crypt_libs.patch
@@ -0,0 +1,32 @@
+From 01e0038fa55581c4afc9d63b6180d2ea77ba2940 Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@thkukuk.de>
+Date: Mon, 4 Apr 2016 11:35:57 +0200
+Subject: [PATCH] build: fix build when crypt() is not part of crypt_libs
+ [ticket#46]
+
+* configure.ac: Don't set empty -l option in crypt check
+
+Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+Backported from: 01e0038fa55581c4afc9d63b6180d2ea77ba2940
+
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 739390e..b377e56 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -401,7 +401,7 @@ AS_IF([test "x$ac_cv_header_xcrypt_h" = "xyes"],
+   [crypt_libs="crypt"])
+ 
+ BACKUP_LIBS=$LIBS
+-AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="-l$ac_lib", LIBCRYPT="")
++AC_SEARCH_LIBS([crypt],[$crypt_libs], LIBCRYPT="${ac_lib:+-l$ac_lib}", LIBCRYPT="")
+ AC_CHECK_FUNCS(crypt_r crypt_gensalt_r)
+ LIBS=$BACKUP_LIBS
+ AC_SUBST(LIBCRYPT)
+-- 
+2.1.4
+
-- 
2.1.4
