From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Oct 2020 21:43:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/spice: bump to version 0.14.3
In-Reply-To: <20201006194335.484399-1-fontaine.fabrice@gmail.com>
References: <20201006194335.484399-1-fontaine.fabrice@gmail.com>
Message-ID: <20201006194335.484399-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version) and so autoreconf
- Update indentation in hash file

https://github.com/freedesktop/spice/blob/v0.14.3/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure.ac-add-enable-tests.patch  | 54 -------------------
 package/spice/spice.hash                      |  4 +-
 package/spice/spice.mk                        |  4 +-
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 package/spice/0001-configure.ac-add-enable-tests.patch

diff --git a/package/spice/0001-configure.ac-add-enable-tests.patch b/package/spice/0001-configure.ac-add-enable-tests.patch
deleted file mode 100644
index 668dea1ca3..0000000000
--- a/package/spice/0001-configure.ac-add-enable-tests.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 1b6eaf5589a14763452cbe53382cc699cdeca141 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 15 Nov 2019 11:36:14 +0100
-Subject: [PATCH] configure.ac: add --enable-tests
-
-Allow the user to disable tests through --disable-tests, this is
-especially useful for example to disable gdk-pixbuf dependency
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/spice/spice-common/merge_requests/6]
----
- Makefile.am  | 6 +++++-
- configure.ac | 7 +++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/subprojects/spice-common/Makefile.am b/subprojects/spice-common/Makefile.am
-index 5402499..00623a1 100644
---- a/subprojects/spice-common/Makefile.am
-+++ b/subprojects/spice-common/Makefile.am
-@@ -1,7 +1,11 @@
- NULL =
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = python_modules common tests docs
-+SUBDIRS = python_modules common docs
-+
-+if ENABLE_TESTS
-+SUBDIRS += tests
-+endif
- 
- EXTRA_DIST =				\
- 	meson.build			\
-diff --git a/subprojects/spice-common/configure.ac b/subprojects/spice-common/configure.ac
-index 9d10287..2dba7c8 100644
---- a/subprojects/spice-common/configure.ac
-+++ b/subprojects/spice-common/configure.ac
-@@ -33,6 +33,13 @@ AC_SEARCH_LIBS(regcomp, [regex rx])
- SPICE_CHECK_SYSDEPS
- SPICE_EXTRA_CHECKS
- 
-+AC_ARG_ENABLE([tests],
-+  AS_HELP_STRING([--enable-tests],
-+                 [Enable tests @<:@default=yes@:>@]),
-+  [],
-+  enable_tests="yes")
-+AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = "xyes")
-+
- AC_ARG_ENABLE([alignment-checks],
-   AS_HELP_STRING([--enable-alignment-checks],
-                  [Enable runtime checks for cast alignment @<:@default=no@:>@]),
--- 
-2.23.0
-
diff --git a/package/spice/spice.hash b/package/spice/spice.hash
index 4243244129..8f84c2321f 100644
--- a/package/spice/spice.hash
+++ b/package/spice/spice.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	b203b3882e06f4c7249a3150d90c84e1a90490d41ead255a3d2cede46f4a29a7	spice-0.14.2.tar.bz2
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  551d4be4a07667cf0543f3c895beb6da8a93ef5a9829f2ae47817be5e616a114  spice-0.14.3.tar.bz2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index bed6931c2e..78d397bdc0 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPICE_VERSION = 0.14.2
+SPICE_VERSION = 0.14.3
 SPICE_SOURCE = spice-$(SPICE_VERSION).tar.bz2
 SPICE_SITE = http://www.spice-space.org/download/releases/spice-server
 SPICE_LICENSE = LGPL-2.1+
@@ -17,8 +17,6 @@ SPICE_DEPENDENCIES = \
 	openssl \
 	pixman \
 	spice-protocol
-# We're patching subprojects/spice-common/configure.ac
-SPICE_AUTORECONF = YES
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
-- 
2.28.0
