From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2019 23:14:13 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/spice: disable
 tests
Message-ID: <20191122220744.B65768F606@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d30fd0f6f45e6d0c52eb594d13b7847498833f91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

By disabling tests, we'll remove the optional gdk-pixbuf dependency

Fixes:
 - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f581525812fa9dbe98b2c04c7207ba198418769c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../spice/0001-configure.ac-add-enable-tests.patch | 54 ++++++++++++++++++++++
 package/spice/spice.mk                             |  5 +-
 2 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/package/spice/0001-configure.ac-add-enable-tests.patch b/package/spice/0001-configure.ac-add-enable-tests.patch
new file mode 100644
index 0000000000..668dea1ca3
--- /dev/null
+++ b/package/spice/0001-configure.ac-add-enable-tests.patch
@@ -0,0 +1,54 @@
+From 1b6eaf5589a14763452cbe53382cc699cdeca141 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 15 Nov 2019 11:36:14 +0100
+Subject: [PATCH] configure.ac: add --enable-tests
+
+Allow the user to disable tests through --disable-tests, this is
+especially useful for example to disable gdk-pixbuf dependency
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/spice/spice-common/merge_requests/6]
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 7 +++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/subprojects/spice-common/Makefile.am b/subprojects/spice-common/Makefile.am
+index 5402499..00623a1 100644
+--- a/subprojects/spice-common/Makefile.am
++++ b/subprojects/spice-common/Makefile.am
+@@ -1,7 +1,11 @@
+ NULL =
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = python_modules common tests docs
++SUBDIRS = python_modules common docs
++
++if ENABLE_TESTS
++SUBDIRS += tests
++endif
+ 
+ EXTRA_DIST =				\
+ 	meson.build			\
+diff --git a/subprojects/spice-common/configure.ac b/subprojects/spice-common/configure.ac
+index 9d10287..2dba7c8 100644
+--- a/subprojects/spice-common/configure.ac
++++ b/subprojects/spice-common/configure.ac
+@@ -33,6 +33,13 @@ AC_SEARCH_LIBS(regcomp, [regex rx])
+ SPICE_CHECK_SYSDEPS
+ SPICE_EXTRA_CHECKS
+ 
++AC_ARG_ENABLE([tests],
++  AS_HELP_STRING([--enable-tests],
++                 [Enable tests @<:@default=yes@:>@]),
++  [],
++  enable_tests="yes")
++AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = "xyes")
++
+ AC_ARG_ENABLE([alignment-checks],
+   AS_HELP_STRING([--enable-alignment-checks],
+                  [Enable runtime checks for cast alignment @<:@default=no@:>@]),
+-- 
+2.23.0
+
diff --git a/package/spice/spice.mk b/package/spice/spice.mk
index 16e57441a8..b663479920 100644
--- a/package/spice/spice.mk
+++ b/package/spice/spice.mk
@@ -17,6 +17,8 @@ SPICE_DEPENDENCIES = \
 	openssl \
 	pixman \
 	spice-protocol
+# We're patching subprojects/spice-common/configure.ac
+SPICE_AUTORECONF = YES
 
 # We disable everything for now, because the dependency tree can become
 # quite deep if we try to enable some features, and I have not tested that.
@@ -25,7 +27,8 @@ SPICE_CONF_OPTS = \
 	--disable-opengl \
 	--disable-smartcard \
 	--without-sasl \
-	--disable-manual
+	--disable-manual \
+	--disable-tests
 
 SPICE_DEPENDENCIES += host-pkgconf
 
