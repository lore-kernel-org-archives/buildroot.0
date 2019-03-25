From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:38:51 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/php: security
 bump to version 7.3.3
Message-ID: <20190325163635.8F3B482B83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=99d8c1a07c8ad96fea0ef1d72e5e786d89a56196
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

php-7.3.3 fixes a number of security issues (no CVE known, bugtracker issues
not yet public): https://secure.php.net/ChangeLog-7.php#7.3.3

Drop 0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch as the
flock detection has been removed since commit 9222702633 (Avoid dependency
on "struct flock" fields order.)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b821ae3d63440258808e413b1ace53639066046a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ch => 0004-Call-apxs-with-correct-prefix.patch} |  0
 ...ck-mechanism-is-obviously-linux-so-force-.patch | 82 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 84 deletions(-)

diff --git a/package/php/0005-Call-apxs-with-correct-prefix.patch b/package/php/0004-Call-apxs-with-correct-prefix.patch
similarity index 100%
rename from package/php/0005-Call-apxs-with-correct-prefix.patch
rename to package/php/0004-Call-apxs-with-correct-prefix.patch
diff --git a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
deleted file mode 100644
index 5c3814f619..0000000000
--- a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From bedbd41ef0a5ce80b83a6f6eaebd7c90f0bc5615 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 9 Aug 2016 11:52:19 +0200
-Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: update for 7.2.12 & 7.3.2]
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
-[aduskett at gmail.com: Update for 7.3.0]
----
- ext/opcache/config.m4 | 34 ++--------------------------------
- 1 file changed, 2 insertions(+), 32 deletions(-)
-
-diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index fbb9b21..ffddc8e 100644
---- a/ext/opcache/config.m4
-+++ b/ext/opcache/config.m4
-@@ -334,58 +334,8 @@ int main() {
-     msg=yes],[msg=no],[msg=no])
-   AC_MSG_RESULT([$msg])
- 
--flock_type=unknown
--AC_MSG_CHECKING(for struct flock layout)
--
--if test "$flock_type" = "unknown"; then
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5, 6, 7 };
--  int main() {
--    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 6 && lock.l_len== 7) {
--		return 0;
--    }
--    return 1;
--  }
--]])], [
--    flock_type=aix64
--    AC_DEFINE([HAVE_FLOCK_AIX64], [], [Struct flock is 64-bit AIX-type])
--], [])
--fi
--
--if test "$flock_type" = "unknown"; then
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() {
--    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
--		return 0;
--    }
--    return 1;
--  }
--]])], [
--	flock_type=linux
--    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
--], [])
--fi
--
--if test "$flock_type" = "unknown"; then
--AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() {
--    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
--		return 0;
--    }
--    return 1;
--  }
--]])], [
--	flock_type=bsd
--    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
--], [])
--fi
--
--AC_MSG_RESULT([$flock_type])
-+flock_type=linux
-+AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
- 
- if test "$flock_type" = "unknown"; then
- 	AC_MSG_ERROR([Don't know how to define struct flock on this system[,] set --enable-opcache=no])
--- 
-2.7.4
-
diff --git a/package/php/php.hash b/package/php/php.hash
index 5d74a28bc7..8a9814d10e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 010b868b4456644ae227d05ad236c8b0a1f57dc6320e7e5ad75e86c5baf0a9a8  php-7.3.2.tar.xz
+sha256 6bb03e79a183d0cb059a6d117bbb2e0679cab667fb713a13c6a16f56bebab9b3  php-7.3.3.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 061b2f2609..ea6deca7c1 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.2
+PHP_VERSION = 7.3.3
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
