From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:26:58 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.7.17
Message-ID: <20130602212106.2824B9A6D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=316f991729c423c9a49a955d3747ff31ad7a0068
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../sqlite/sqlite-dont-force-posix-fallocate.patch |   23 ++++++++++++++++++++
 package/sqlite/sqlite.mk                           |    4 +-
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite-dont-force-posix-fallocate.patch b/package/sqlite/sqlite-dont-force-posix-fallocate.patch
new file mode 100644
index 0000000..118001b
--- /dev/null
+++ b/package/sqlite/sqlite-dont-force-posix-fallocate.patch
@@ -0,0 +1,23 @@
+This is checked by configure and passed as a define directive when building.
+There's no need to check again and potentially override a failed check
+(uClibc <= 0.9.33.2 for example lacks posix_fallocate).
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura sqlite-autoconf-3071700.orig/sqlite3.c sqlite-autoconf-3071700/sqlite3.c
+--- sqlite-autoconf-3071700.orig/sqlite3.c	2013-05-23 03:17:27.170459400 -0300
++++ sqlite-autoconf-3071700/sqlite3.c	2013-05-23 03:25:01.839227616 -0300
+@@ -22931,13 +22931,6 @@
+ */
+ #if SQLITE_OS_UNIX              /* This file is used on unix only */
+
+-/* Use posix_fallocate() if it is available
+-*/
+-#if !defined(HAVE_POSIX_FALLOCATE) \
+-      && (_XOPEN_SOURCE >= 600 || _POSIX_C_SOURCE >= 200112L)
+-# define HAVE_POSIX_FALLOCATE 1
+-#endif
+-
+ /*
+ ** There are various methods for file locking used for concurrency
+ ** control:
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 8eb6b2f..39a39d0 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3071401
+SQLITE_VERSION = 3071700
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org
+SQLITE_SITE = http://www.sqlite.org/2013
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
