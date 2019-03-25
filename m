From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 18:14:32 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/php: security
 bump to version 7.2.16
Message-ID: <20190325171107.0DF8C82B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07802ff814e1426ce793a7362d6832fabaac559d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

php-7.2.16 fixes a number of security issues (no CVE known, bugtracker issues
not yet public): https://www.php.net/ChangeLog-7.php#7.2.16

Drop 0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch as the
flock detection has been removed since commit 9222702633 (Avoid dependency
on "struct flock" fields order.)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9a455a6c9bd45c2620e0e6ade2c89f7b99c6a28a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-mechanism-is-obviously-linux-so-force-.patch | 80 ----------------------
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 82 deletions(-)

diff --git a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
deleted file mode 100644
index c5d3740920..0000000000
--- a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From bedbd41ef0a5ce80b83a6f6eaebd7c90f0bc5615 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 9 Aug 2016 11:52:19 +0200
-Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: update for 7.2.12 & 7.2.15]
----
- ext/opcache/config.m4 | 34 ++--------------------------------
- 1 file changed, 2 insertions(+), 32 deletions(-)
-
-diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index fbb9b21..ffddc8e 100644
---- a/ext/opcache/config.m4
-+++ b/ext/opcache/config.m4
-@@ -343,58 +343,8 @@ int main() {
-     msg=yes,msg=no,msg=no)
-   AC_MSG_RESULT([$msg])
- 
--flock_type=unknown
--AC_MSG_CHECKING(for struct flock layout)
--
--if test "$flock_type" = "unknown"; then
--AC_TRY_RUN([
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5, 6, 7 };
--  int main() {
--    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 6 && lock.l_len== 7) {
--		return 0;
--    }
--    return 1;
--  }
--], [
--    flock_type=aix64
--    AC_DEFINE([HAVE_FLOCK_AIX64], [], [Struct flock is 64-bit AIX-type])
--], [])
--fi
--
--if test "$flock_type" = "unknown"; then
--AC_TRY_RUN([
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() {
--    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 3 && lock.l_len == 4) {
--		return 0;
--    }
--    return 1;
--  }
--], [
--	flock_type=linux
--    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
--], [])
--fi
--
--if test "$flock_type" = "unknown"; then
--AC_TRY_RUN([
--  #include <fcntl.h>
--  struct flock lock = { 1, 2, 3, 4, 5 };
--  int main() {
--    if(lock.l_start == 1 && lock.l_len == 2 && lock.l_type == 4 && lock.l_whence == 5) {
--		return 0;
--    }
--    return 1;
--  }
--], [
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
index 89cdbd204b..865cee4ee7 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 75e90012faef700dffb29311f3d24fa25f1a5e0f70254a9b8d5c794e25e938ce  php-7.2.15.tar.xz
+sha256 7d91ed3c1447c6358a3d53f84599ef854aca4c3622de7435e2df115bf196e482  php-7.2.16.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index cf1984c612..a2f573ea7f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.15
+PHP_VERSION = 7.2.16
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
