From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:22:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mutt: fix static
 build with idn2 and unistring
Message-ID: <20190424201805.900D1814AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f1466ec1597afa897c308c1ea3c508a1cace725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/c9544b4f1a0252e260a2ed19218fa950f4dc2d2d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a78ed3f3756273628143d7330ead3e7ae04ffc00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...c-fix-static-build-with-idn2-and-unistrin.patch | 37 ++++++++++++++++++++++
 package/mutt/mutt.mk                               |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch b/package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch
new file mode 100644
index 0000000000..c802cbb365
--- /dev/null
+++ b/package/mutt/0001-configure.ac-fix-static-build-with-idn2-and-unistrin.patch
@@ -0,0 +1,37 @@
+From c53b36698fe4721fb562908ac6119aa9280383af Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Apr 2019 10:22:12 +0200
+Subject: [PATCH] configure.ac: fix static build with idn2 and unistring
+
+Commit 78db40f25c6479b14da5a73adf7207bfbec5ccc5 did not fix static build
+failure
+
+AC_SEARCH_LIBS prepends the library to LIBS as a result -lunistring is
+added before -lidn2. To fix static build, we must set -lunistring after
+-lidn2
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c9544b4f1a0252e260a2ed19218fa950f4dc2d2d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://gitlab.com/muttmua/mutt/merge_requests/42]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index bd8beb91..75943eee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1402,7 +1402,7 @@ if test "x$with_idn2" != "xno"; then
+     AC_SEARCH_LIBS([idn2_check_version], [idn2], [
+       AC_DEFINE([HAVE_LIBIDN2], 1, [Define to 1 if you have the GNU idn2 library])
+       dnl -lunistring is needed for static linking
+-      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring])
++      AC_SEARCH_LIBS([u8_strconv_from_locale], [unistring], [LIBS="$LIBS -lunistring"])
+       MUTTLIBS="$MUTTLIBS $LIBS"
+ 
+       dnl libidn2 >= 2.0.0 declares compatibility macros in idn2.h
+-- 
+2.20.1
+
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index a336839cb7..5860e8430e 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -10,6 +10,8 @@ MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
 MUTT_CONF_OPTS = --disable-doc --disable-smtp
+# We're patching configure.ac
+MUTT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MUTT_DEPENDENCIES += libiconv
