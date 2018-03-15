From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 15 Mar 2018 20:37:11 +0100
Subject: [Buildroot] [PATCH 1/1] safeclib: fix build without wchar and
 host-doxygen
Message-ID: <20180315193711.11437-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch (sent upstream) to add a --disable-doc option

Fixes:
 - http://autobuild.buildroot.net/results/e597843f2bb528da01d1e617929c818613b56cec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/safeclib/0001-Add-disable-doc-option.patch | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/safeclib/0001-Add-disable-doc-option.patch

diff --git a/package/safeclib/0001-Add-disable-doc-option.patch b/package/safeclib/0001-Add-disable-doc-option.patch
new file mode 100644
index 0000000000..67c48906f3
--- /dev/null
+++ b/package/safeclib/0001-Add-disable-doc-option.patch
@@ -0,0 +1,58 @@
+From 0d56b6327f6b652511c3e4c72382f4dc4d194e10 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 15 Mar 2018 20:12:28 +0100
+Subject: [PATCH] Add --disable-doc option
+
+This option allows the user to disable man pages even if pod2man and
+doxygen programs are found
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.am  |  2 ++
+ configure.ac | 10 ++++++++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 0f65c5c1..ce1424bb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -104,6 +104,7 @@ LIBTOOL_DISTCLEAN_FILES = \
+ 	build-tools/test-driver
+ DISTCLEANFILES = .version
+ 
++if ENABLE_DOC
+ MAN1_SOURCES = doc/man/man1/check_for_unsafe_apis.1
+ dist_man_MANS =
+ if HAVE_POD2MAN
+@@ -560,6 +561,7 @@ clean-local:
+ 	rm -rf $(builddir)/doc/html
+ 	rm -rf $(builddir)/doc/man
+ endif
++endif
+ 
+ if ENABLE_GCOV
+ gcov: check
+diff --git a/configure.ac b/configure.ac
+index 0e4e5eea..33ed7326 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -339,6 +339,16 @@ else
+ 	AC_MSG_RESULT([no (default)])
+ fi
+ 
++AC_ARG_ENABLE(doc,
++	AS_HELP_STRING([--disable-doc],
++	               [disable documentation @<:@default=no@:>@]),
++	[case "${enableval}" in
++	yes) enable_doc=true ;;
++	no)  enable_doc=false ;;
++	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-doc]) ;;
++	esac], [enable_doc=true])
++AM_CONDITIONAL(ENABLE_DOC, test "x$enable_doc" = "xtrue")
++
+ dnl for windows dllimport. checking pic_flag DLL_EXPORT would be better,
+ dnl but this is only enabled for the shared objs, and we need it in the config
+ dnl for our tests.
+-- 
+2.14.1
+
-- 
2.14.1
