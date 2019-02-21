From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 11:22:01 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/php: security
 bump to version 7.2.15
Message-ID: <20190221102049.AB28E8B6EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c0a6c34f8ae9a30d705c5acb910c46c38352388
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Rebased patch 0004.

This bump fixes https://bugs.php.net/bug.php?id=77369,
status of CVE-ID: needed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5e40c94b3ff1881f2296fdcf8f1d85e48c788c8)
[Peter: bump to 7.2.15 instead]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-mechanism-is-obviously-linux-so-force-.patch | 36 +++++++++++++++++-----
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
index 2c08437e4d..c5d3740920 100644
--- a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
+++ b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: update for 7.2.12]
+[Bernd: update for 7.2.12 & 7.2.15]
 ---
  ext/opcache/config.m4 | 34 ++--------------------------------
  1 file changed, 2 insertions(+), 32 deletions(-)
@@ -14,12 +14,30 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index fbb9b21..ffddc8e 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -343,38 +343,8 @@ int main() {
+@@ -343,58 +343,8 @@ int main() {
      msg=yes,msg=no,msg=no)
    AC_MSG_RESULT([$msg])
  
 -flock_type=unknown
--AC_MSG_CHECKING("whether flock struct is linux ordered")
+-AC_MSG_CHECKING(for struct flock layout)
+-
+-if test "$flock_type" = "unknown"; then
+-AC_TRY_RUN([
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5, 6, 7 };
+-  int main() {
+-    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 6 && lock.l_len== 7) {
+-		return 0;
+-    }
+-    return 1;
+-  }
+-], [
+-    flock_type=aix64
+-    AC_DEFINE([HAVE_FLOCK_AIX64], [], [Struct flock is 64-bit AIX-type])
+-], [])
+-fi
+-
+-if test "$flock_type" = "unknown"; then
 -AC_TRY_RUN([
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
@@ -32,10 +50,10 @@ index fbb9b21..ffddc8e 100644
 -], [
 -	flock_type=linux
 -    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
--    AC_MSG_RESULT("yes")
--], AC_MSG_RESULT("no") )
+-], [])
+-fi
 -
--AC_MSG_CHECKING("whether flock struct is BSD ordered")
+-if test "$flock_type" = "unknown"; then
 -AC_TRY_RUN([
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
@@ -48,8 +66,10 @@ index fbb9b21..ffddc8e 100644
 -], [
 -	flock_type=bsd
 -    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
--    AC_MSG_RESULT("yes")
--], AC_MSG_RESULT("no") )
+-], [])
+-fi
+-
+-AC_MSG_RESULT([$flock_type])
 +flock_type=linux
 +AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
  
diff --git a/package/php/php.hash b/package/php/php.hash
index acbe499536..89cdbd204b 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 ee3f1cc102b073578a3c53ba4420a76da3d9f0c981c02b1664ae741ca65af84f  php-7.2.14.tar.xz
+sha256 75e90012faef700dffb29311f3d24fa25f1a5e0f70254a9b8d5c794e25e938ce  php-7.2.15.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index e5a0d7729c..cf1984c612 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.2.14
+PHP_VERSION = 7.2.15
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
