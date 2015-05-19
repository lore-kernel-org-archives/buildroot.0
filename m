From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:40:25 +0200
Subject: [Buildroot] [git commit] php: patch acinclude.m4 instead of
	aclocal.m4
Message-ID: <20150519200603.A71AB7FD09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bba2edad8c55a93b34ff1d42db758b89ac376f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aclocal.m4 gets regenerated from acinclude.m4, so patch the last.

Fixes "Extensions are not supported on this platform" error when
loading any external (zend) extension in php.ini.
Was caused by 0001-ditch-unset.patch not being applied to the
correct file, and our ac_cv_func_dlopen=yes env setting being unset.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/0001-ditch-unset.patch     |    6 +++---
 package/php/0002-no-iconv-search.patch |    8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/php/0001-ditch-unset.patch b/package/php/0001-ditch-unset.patch
index b43b40f..eda83c9 100644
--- a/package/php/0001-ditch-unset.patch
+++ b/package/php/0001-ditch-unset.patch
@@ -3,9 +3,9 @@ Terminate them with extreme prejudice.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura php-5.6.7.orig/aclocal.m4 php-5.6.7/aclocal.m4
---- php-5.6.7.orig/aclocal.m4	2015-04-08 11:08:11.208848359 -0300
-+++ php-5.6.7/aclocal.m4	2015-04-08 11:08:49.828160195 -0300
+diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
+--- php-5.6.8.orig/acinclude.m4	2015-04-15 20:05:57.000000000 +0200
++++ php-5.6.8/acinclude.m4	2015-05-18 20:03:50.833099001 +0200
 @@ -1897,8 +1897,6 @@
  dnl
  AC_DEFUN([PHP_CHECK_FUNC_LIB],[
diff --git a/package/php/0002-no-iconv-search.patch b/package/php/0002-no-iconv-search.patch
index 3496222..3223953 100644
--- a/package/php/0002-no-iconv-search.patch
+++ b/package/php/0002-no-iconv-search.patch
@@ -8,10 +8,10 @@ PHP_ICONV_H_PATH which, again, uses test and absolute paths.
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: convert to nice m4 instead of patching configure]
 
-diff -Nura php-5.6.7.orig/aclocal.m4 php-5.6.7/aclocal.m4
---- php-5.6.7.orig/aclocal.m4	2015-04-08 11:08:11.208848359 -0300
-+++ php-5.6.7/aclocal.m4	2015-04-08 11:42:17.321044950 -0300
-@@ -2474,7 +2474,7 @@
+diff -Nura php-5.6.8.orig/acinclude.m4 php-5.6.8/acinclude.m4
+--- php-5.6.8.orig/acinclude.m4	2015-05-18 20:06:48.557099001 +0200
++++ php-5.6.8/acinclude.m4	2015-05-18 20:07:33.177099001 +0200
+@@ -2470,7 +2470,7 @@
    dnl
    if test "$found_iconv" = "no"; then
  
