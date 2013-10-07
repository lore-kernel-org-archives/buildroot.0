From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon,  7 Oct 2013 13:42:10 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with berkeleydb 6
Message-ID: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from :
  https://bugs.php.net/patch-display.php?bug_id=65426&patch=db6.patch&revision=1376033083&download=1

Notice this patch was not applied by upstream because of licence
issue with berkeleydb 6. Linking with berkeleydb 6 may force user
to publish patch applyed to php.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/php/php-db6.patch |   70 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/php/php-db6.patch

diff --git a/package/php/php-db6.patch b/package/php/php-db6.patch
new file mode 100644
index 0000000..e28e715
--- /dev/null
+++ b/package/php/php-db6.patch
@@ -0,0 +1,70 @@
+Allow PHP to compile ans link with berkeleydb 6
+
+Copied from: 
+  https://bugs.php.net/patch-display.php?bug_id=65426&patch=db6.patch&revision=1376033083&download=1
+
+Notice this patch iwas not applied by upstream because of licence 
+problem with berkeleydb 6. Linking with berkeleydb 6 may force you 
+to publish patch applyed to php.
+
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+
+--- a/configure	2013-07-03 08:16:15.000000000 +0200
++++ b/configure	2013-08-07 19:19:16.797273766 +0200
+@@ -42409,7 +42409,7 @@
+ /* end confdefs.h.  */
+ 
+ #include "$THIS_INCLUDE"
+-#if DB_VERSION_MAJOR == 4 || (4 == 4 && DB_VERSION_MAJOR == 5)
++#if DB_VERSION_MAJOR == 4 || (4 == 4 && DB_VERSION_MAJOR >= 5)
+             yes
+ #endif
+ 
+@@ -42785,7 +42785,7 @@
+ /* end confdefs.h.  */
+ 
+ #include "$THIS_INCLUDE"
+-#if DB_VERSION_MAJOR == 3 || (3 == 4 && DB_VERSION_MAJOR == 5)
++#if DB_VERSION_MAJOR == 3 || (3 == 4 && DB_VERSION_MAJOR >= 5)
+             yes
+ #endif
+ 
+@@ -43161,7 +43161,7 @@
+ /* end confdefs.h.  */
+ 
+ #include "$THIS_INCLUDE"
+-#if DB_VERSION_MAJOR == 2 || (2 == 4 && DB_VERSION_MAJOR == 5)
++#if DB_VERSION_MAJOR == 2 || (2 == 4 && DB_VERSION_MAJOR >= 5)
+             yes
+ #endif
+ 
+--- a/ext/dba/config.m4	2013-07-03 08:10:53.000000000 +0200
++++ b/ext/dba/config.m4	2013-08-07 19:18:55.774448348 +0200
+@@ -245,7 +245,7 @@
+         ],[
+           AC_EGREP_CPP(yes,[
+ #include "$THIS_INCLUDE"
+-#if DB_VERSION_MAJOR == $1 || ($1 == 4 && DB_VERSION_MAJOR == 5)
++#if DB_VERSION_MAJOR == $1 || ($1 == 4 && DB_VERSION_MAJOR >= 5)
+             yes
+ #endif
+           ],[
+--- a/ext/dba/dba_db4.c	2013-07-03 08:10:53.000000000 +0200
++++ b/ext/dba/dba_db4.c	2013-08-07 19:19:04.827562638 +0200
+@@ -44,7 +44,7 @@
+ {
+ 	TSRMLS_FETCH();
+ 
+-#if (DB_VERSION_MAJOR == 5 || (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR == 8))
++#if (DB_VERSION_MAJOR >= 5 || (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR == 8))
+ /* Bug 51086, Berkeley DB 4.8.26 */
+ /* This code suppresses a BDB 4.8+ error message, thus keeping PHP test compatibility */
+ 	{
+--- a/ext/dba/tests/dba_db4_handlers.phpt	2013-07-03 08:10:53.000000000 +0200
++++ b/ext/dba/tests/dba_db4_handlers.phpt	2013-08-07 20:39:34.640194224 +0200
+@@ -47,4 +47,4 @@
+ Test 1
+ Success: db4 enabled
+ Test 2 - full info
+-.*Berkeley DB (4|5).*
++.*Berkeley DB (4|5|6).*
-- 
1.7.9.5
