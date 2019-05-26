From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 26 May 2019 20:31:34 +0200
Subject: [Buildroot] [git commit] package/mutt: fix static build without
 unistring
Message-ID: <20190526182526.A102A8377F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=486b5bebf40629b51dac5699c4c6ea4110f92676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/9f3dd4e81ba9e82db0e858f91de13ef23bc2bf14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0002-Fix-unistring-library-configure-test.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/package/mutt/0002-Fix-unistring-library-configure-test.patch b/package/mutt/0002-Fix-unistring-library-configure-test.patch
new file mode 100644
index 0000000000..46c8115c4f
--- /dev/null
+++ b/package/mutt/0002-Fix-unistring-library-configure-test.patch
@@ -0,0 +1,49 @@
+From 9da6bde1feafbe886c295027b959be47b4ad55b0 Mon Sep 17 00:00:00 2001
+From: Kevin McCarthy <kevin@8t8.us>
+Date: Sun, 21 Apr 2019 11:00:23 -0700
+Subject: [PATCH] Fix unistring library configure test.
+
+The "action-if-found" argument of AC_SEARCH_LIBS is run even if the
+result is "none required" (i.e. the test function is already in LIBS,
+in this case -lidn2).
+
+This was causing "-lunistring" to be appended on a system without the
+library installed, generating a build error.  Fix the test to not
+append the library for the "none required" case.
+
+Thanks to Fabrice Fontaine for reporting this issue and helping me
+test the fix.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.com/muttmua/mutt/commit/9da6bde1feafbe886c295027b959be47b4ad55b0]
+---
+ configure.ac | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 75943eee..102ddea2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1401,10 +1401,16 @@ if test "x$with_idn2" != "xno"; then
+ 
+     AC_SEARCH_LIBS([idn2_check_version], [idn2], [
+       AC_DEFINE([HAVE_LIBIDN2], 1, [Define to 1 if you have the GNU idn2 library])
+-      dnl -lunistring is needed for static linking
+-      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring], [LIBS="$LIBS -lunistring"])
+       MUTTLIBS="$MUTTLIBS $LIBS"
+ 
++      dnl -lunistring is needed for static linking, and has to come
++      dnl after the -lidn2
++      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring], [
++            if test "$ac_cv_search_u8_strconv_from_locale" != "none required"; then
++              MUTTLIBS="$MUTTLIBS -lunistring"
++            fi
++      ])
++
+       dnl libidn2 >= 2.0.0 declares compatibility macros in idn2.h
+       LIBS="$LIBS $LIBICONV"
+       AC_CHECK_DECL([idna_to_unicode_8z8z],
+-- 
+2.18.1
+
