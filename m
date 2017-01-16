From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Jan 2017 22:24:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/git: Fix build without libiconv
Message-ID: <20170116212417.30415-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes
http://autobuild.buildroot.net/results/6be/6be94fe2542f3ac9fb785dd22f504e25c2a7802e/

This patch is also needed: http://patchwork.ozlabs.org/patch/715921/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-configure.ac-fix-old-iconv-check.patch    | 42 ++++++++++++++++++
 .../git/0002-configure.ac-Fix-without-iconv.patch  | 51 ++++++++++++++++++++++
 package/git/git.mk                                 |  1 +
 3 files changed, 94 insertions(+)
 create mode 100644 package/git/0001-configure.ac-fix-old-iconv-check.patch
 create mode 100644 package/git/0002-configure.ac-Fix-without-iconv.patch

diff --git a/package/git/0001-configure.ac-fix-old-iconv-check.patch b/package/git/0001-configure.ac-fix-old-iconv-check.patch
new file mode 100644
index 000000000..4aa48f610
--- /dev/null
+++ b/package/git/0001-configure.ac-fix-old-iconv-check.patch
@@ -0,0 +1,42 @@
+From 3c170355aeba39bb310d8b9192c9623b380d5eae Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 16 Jan 2017 20:14:10 +0100
+Subject: [PATCH 1/2] configure.ac: fix old iconv check
+
+According to
+https://www.gnu.org/software/autoconf/manual/autoconf-2.69/html_node/Running-the-Compiler.html
+the parameter syntax of AC_COMPILE_IFELSE is
+
+(input, [action-if-true], [action-if-false])
+
+Displaying "no" when the test was positive and enabling support for old
+iconv implementations by OLD_ICONV=UnfortunatelyYes when the test fails
+it obviously wrong. This patch switches the actions to fix the problem.
+
+Patch sent upstream:
+https://public-inbox.org/git/20170116195638.3713-1-bernd.kuhls at writeme.com/T/#t
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0b15f04b1..63e71a472 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -759,9 +759,9 @@ GIT_STASH_FLAGS($ICONVDIR)
+ 
+ AC_MSG_CHECKING([for old iconv()])
+ AC_COMPILE_IFELSE([OLDICONVTEST_SRC],
+-	[AC_MSG_RESULT([no])],
+ 	[AC_MSG_RESULT([yes])
+-	OLD_ICONV=UnfortunatelyYes])
++	OLD_ICONV=UnfortunatelyYes],
++	[AC_MSG_RESULT([no])])
+ 
+ GIT_UNSTASH_FLAGS($ICONVDIR)
+ 
+-- 
+2.11.0
+
diff --git a/package/git/0002-configure.ac-Fix-without-iconv.patch b/package/git/0002-configure.ac-Fix-without-iconv.patch
new file mode 100644
index 000000000..0aa374023
--- /dev/null
+++ b/package/git/0002-configure.ac-Fix-without-iconv.patch
@@ -0,0 +1,51 @@
+From f19defa5e9fd9fea339c2e2beb9d429dedc7a95a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 16 Jan 2017 20:34:29 +0100
+Subject: [PATCH 2/2] configure.ac: Fix --without-iconv
+
+GIT_PARSE_WITH(iconv)) sets NO_ICONV=YesPlease in
+https://github.com/git/git/blob/maint/configure.ac#L327
+
+But the command GIT_CONF_SUBST([NO_ICONV]) in
+https://github.com/git/git/blob/maint/configure.ac#L618
+
+is only executed when NO_ICONV is an empty variable
+https://github.com/git/git/blob/maint/configure.ac#L578
+
+which has the effect that NO_ICONV=YesPlease is not written to
+config.mak.autogen which breaks compilation in systems without iconv.
+
+Patch sent upstream:
+https://public-inbox.org/git/20170116195638.3713-2-bernd.kuhls at writeme.com/T/#u
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 63e71a472..419469315 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -614,15 +614,15 @@ LIBS="$old_LIBS"
+ 
+ GIT_UNSTASH_FLAGS($ICONVDIR)
+ 
+-GIT_CONF_SUBST([NEEDS_LIBICONV])
+-GIT_CONF_SUBST([NO_ICONV])
+-
+ if test -n "$NO_ICONV"; then
+     NEEDS_LIBICONV=
+ fi
+ 
+ fi
+ 
++GIT_CONF_SUBST([NEEDS_LIBICONV])
++GIT_CONF_SUBST([NO_ICONV])
++
+ #
+ # Define NO_DEFLATE_BOUND if deflateBound is missing from zlib.
+ 
+-- 
+2.11.0
+
diff --git a/package/git/git.mk b/package/git/git.mk
index 7d4d36363..f47209a74 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -10,6 +10,7 @@ GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib host-gettext
+GIT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 GIT_DEPENDENCIES += openssl
-- 
2.11.0
