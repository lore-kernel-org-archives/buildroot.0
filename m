From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:36 -0000
Subject: [Buildroot] [git commit] package/mutt: bump to version 1.12.1
Message-ID: <20190903133619.ABC568A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5797e23260581a60dfdbdf17f7724f548a08864
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove both patches (already in version) and drop AUTORECONF

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-fix-static-build-with-idn2-and-unistrin.patch | 37 ----------------
 ...0002-Fix-unistring-library-configure-test.patch | 49 ----------------------
 package/mutt/mutt.hash                             |  2 +-
 package/mutt/mutt.mk                               |  4 +-
 4 files changed, 2 insertions(+), 90 deletions(-)

diff --git a/package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch b/package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch
deleted file mode 100644
index c802cbb365..0000000000
--- a/package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From c53b36698fe4721fb562908ac6119aa9280383af Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Apr 2019 10:22:12 +0200
-Subject: [PATCH] configure.ac: fix static build with idn2 and unistring
-
-Commit 78db40f25c6479b14da5a73adf7207bfbec5ccc5 did not fix static build
-failure
-
-AC_SEARCH_LIBS prepends the library to LIBS as a result -lunistring is
-added before -lidn2. To fix static build, we must set -lunistring after
--lidn2
-
-Fixes:
- - http://autobuild.buildroot.org/results/c9544b4f1a0252e260a2ed19218fa950f4dc2d2d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://gitlab.com/muttmua/mutt/merge_requests/42]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index bd8beb91..75943eee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1402,7 +1402,7 @@ if test "x$with_idn2" != "xno"; then
-     AC_SEARCH_LIBS([idn2_check_version], [idn2], [
-       AC_DEFINE([HAVE_LIBIDN2], 1, [Define to 1 if you have the GNU idn2 library])
-       dnl -lunistring is needed for static linking
--      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring])
-+      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring], [LIBS="$LIBS -lunistring"])
-       MUTTLIBS="$MUTTLIBS $LIBS"
- 
-       dnl libidn2 >= 2.0.0 declares compatibility macros in idn2.h
--- 
-2.20.1
-
diff --git a/package/mutt/0002-Fix-unistring-library-configure-test.patch b/package/mutt/0002-Fix-unistring-library-configure-test.patch
deleted file mode 100644
index 46c8115c4f..0000000000
--- a/package/mutt/0002-Fix-unistring-library-configure-test.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 9da6bde1feafbe886c295027b959be47b4ad55b0 Mon Sep 17 00:00:00 2001
-From: Kevin McCarthy <kevin@8t8.us>
-Date: Sun, 21 Apr 2019 11:00:23 -0700
-Subject: [PATCH] Fix unistring library configure test.
-
-The "action-if-found" argument of AC_SEARCH_LIBS is run even if the
-result is "none required" (i.e. the test function is already in LIBS,
-in this case -lidn2).
-
-This was causing "-lunistring" to be appended on a system without the
-library installed, generating a build error.  Fix the test to not
-append the library for the "none required" case.
-
-Thanks to Fabrice Fontaine for reporting this issue and helping me
-test the fix.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.com/muttmua/mutt/commit/9da6bde1feafbe886c295027b959be47b4ad55b0]
----
- configure.ac | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 75943eee..102ddea2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1401,10 +1401,16 @@ if test "x$with_idn2" != "xno"; then
- 
-     AC_SEARCH_LIBS([idn2_check_version], [idn2], [
-       AC_DEFINE([HAVE_LIBIDN2], 1, [Define to 1 if you have the GNU idn2 library])
--      dnl -lunistring is needed for static linking
--      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring], [LIBS="$LIBS -lunistring"])
-       MUTTLIBS="$MUTTLIBS $LIBS"
- 
-+      dnl -lunistring is needed for static linking, and has to come
-+      dnl after the -lidn2
-+      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring], [
-+            if test "$ac_cv_search_u8_strconv_from_locale" != "none required"; then
-+              MUTTLIBS="$MUTTLIBS -lunistring"
-+            fi
-+      ])
-+
-       dnl libidn2 >= 2.0.0 declares compatibility macros in idn2.h
-       LIBS="$LIBS $LIBICONV"
-       AC_CHECK_DECL([idna_to_unicode_8z8z],
--- 
-2.18.1
-
diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index d0e2d2dd83..376fd8215c 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b651357ea6c8762178080493991c77ecb111d916d171d422500257ab48be2801  mutt-1.11.4.tar.gz
+sha256 01c565406ec4ffa85db90b45ece2260b25fac3646cc063bbc20a242c6ed4210c  mutt-1.12.1.tar.gz
 sha256 732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 613358abdd..6a52106abc 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.11.4
+MUTT_VERSION = 1.12.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
-# We're patching configure.ac
-MUTT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
