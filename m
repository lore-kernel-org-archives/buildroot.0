From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Feb 2019 10:48:51 +0100
Subject: [Buildroot] [git commit] package/php: security bump to version 7.3.2
Message-ID: <20190210095304.71AD3814E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5e40c94b3ff1881f2296fdcf8f1d85e48c788c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0004.

This bump fixes https://bugs.php.net/bug.php?id=77369,
status of CVE-ID: needed

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ck-mechanism-is-obviously-linux-so-force-.patch | 36 +++++++++++++++++-----
 package/php/php.hash                               |  2 +-
 package/php/php.mk                                 |  2 +-
 3 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
index 280d5ee47b..5c3814f619 100644
--- a/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
+++ b/package/php/0004-OPcache-flock-mechanism-is-obviously-linux-so-force-.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] OPcache: flock mechanism is obviously linux so force it.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Bernd: update for 7.2.12]
+[Bernd: update for 7.2.12 & 7.3.2]
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [aduskett at gmail.com: Update for 7.3.0]
 ---
@@ -16,12 +16,30 @@ diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
 index fbb9b21..ffddc8e 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -341,38 +341,8 @@ int main() {
+@@ -334,58 +334,8 @@ int main() {
      msg=yes],[msg=no],[msg=no])
    AC_MSG_RESULT([$msg])
  
 -flock_type=unknown
--AC_MSG_CHECKING("whether flock struct is linux ordered")
+-AC_MSG_CHECKING(for struct flock layout)
+-
+-if test "$flock_type" = "unknown"; then
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-  #include <fcntl.h>
+-  struct flock lock = { 1, 2, 3, 4, 5, 6, 7 };
+-  int main() {
+-    if(lock.l_type == 1 && lock.l_whence == 2 && lock.l_start == 6 && lock.l_len== 7) {
+-		return 0;
+-    }
+-    return 1;
+-  }
+-]])], [
+-    flock_type=aix64
+-    AC_DEFINE([HAVE_FLOCK_AIX64], [], [Struct flock is 64-bit AIX-type])
+-], [])
+-fi
+-
+-if test "$flock_type" = "unknown"; then
 -AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
@@ -34,10 +52,10 @@ index fbb9b21..ffddc8e 100644
 -]])], [
 -	flock_type=linux
 -    AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
--    AC_MSG_RESULT("yes")
--], [AC_MSG_RESULT("no")], [AC_MSG_RESULT([no])])
+-], [])
+-fi
 -
--AC_MSG_CHECKING("whether flock struct is BSD ordered")
+-if test "$flock_type" = "unknown"; then
 -AC_RUN_IFELSE([AC_LANG_SOURCE([[
 -  #include <fcntl.h>
 -  struct flock lock = { 1, 2, 3, 4, 5 };
@@ -50,8 +68,10 @@ index fbb9b21..ffddc8e 100644
 -]])], [
 -	flock_type=bsd
 -    AC_DEFINE([HAVE_FLOCK_BSD], [], [Struct flock is BSD-type])
--    AC_MSG_RESULT("yes")
--], [AC_MSG_RESULT("no")], [AC_MSG_RESULT([no])])
+-], [])
+-fi
+-
+-AC_MSG_RESULT([$flock_type])
 +flock_type=linux
 +AC_DEFINE([HAVE_FLOCK_LINUX], [], [Struct flock is Linux-type])
  
diff --git a/package/php/php.hash b/package/php/php.hash
index 2cb89e0366..5d74a28bc7 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From http://php.net/downloads.php
-sha256 cfe93e40be0350cd53c4a579f52fe5d8faf9c6db047f650a4566a2276bf33362  php-7.3.1.tar.xz
+sha256 010b868b4456644ae227d05ad236c8b0a1f57dc6320e7e5ad75e86c5baf0a9a8  php-7.3.2.tar.xz
 
 # License file
 sha256 f689b8fa63bea7950ce6a21bf52ed88ea0d77673ee76e6de12f51191174d91b8  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index be7e9b3c89..061b2f2609 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 7.3.1
+PHP_VERSION = 7.3.2
 PHP_SITE = http://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
