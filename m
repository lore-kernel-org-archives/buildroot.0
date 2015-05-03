From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 16:33:46 +0200
Subject: [Buildroot] [git commit] poppler: add patch to fix invalid syntax
	in configure script
Message-ID: <20150503143419.1B9E2818B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc8423a8d485283e1c5c44026d3777173afb469a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When configuring poppler, a shell error occurs:

./configure: line 19741: test: x: unary operator expected

This is due to an invalid configure test, which is fixed by a newly
added patch. We patch the configure script directly because poppler
doesn't autoreconf properly. A patch on configure.ac has been
submitted upstream so that hopefully we can drop our patch in a future
release of poppler.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...invalid-shell-comparaison-in-libtiff-test.patch |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch b/package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch
new file mode 100644
index 0000000..f40bee1
--- /dev/null
+++ b/package/poppler/0001-Fix-invalid-shell-comparaison-in-libtiff-test.patch
@@ -0,0 +1,23 @@
+Fix syntax issue in configure script
+
+The change is not done in configure.ac, because the package doesn't
+autoreconf properly.
+
+Patch on configure.ac submitted upstream at
+https://bugs.freedesktop.org/show_bug.cgi?id=90292.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
+@@ -19738,7 +19738,7 @@
+ CXXFLAGS="$CXXFLAGS $LIBTIFF_CFLAGS"
+ LIBS="$LIBS $LIBTIFF_LIBS"
+ if test x$enable_libtiff = xyes; then
+-  if test x"$LIBTIFF_LIBS" != ; then
++  if test x"$LIBTIFF_LIBS" != x; then
+     ac_fn_cxx_check_func "$LINENO" "TIFFOpen" "ac_cv_func_TIFFOpen"
+ if test "x$ac_cv_func_TIFFOpen" = xyes; then :
+ 
