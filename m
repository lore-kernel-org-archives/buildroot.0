From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Apr 2019 16:45:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/neardal: bump to version
 4143d130ed39299bfc59d08d2c7c77dbc7f809e9
Message-ID: <20190418144542.24410-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tic-linking-with-libedit-or-readline.patch | 45 -------------------
 package/neardal/neardal.hash                  |  3 +-
 package/neardal/neardal.mk                    |  2 +-
 3 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch

diff --git a/package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch b/package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch
deleted file mode 100644
index bae0edae96..0000000000
--- a/package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 62ae1bf0206960d0ba5ff8f90238030e67f1a5cd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 28 Oct 2018 20:58:55 +0100
-Subject: [PATCH] fix static linking with libedit or readline
-
-Use PKG_CHECK_MODULES to find libedit or readline and continue to use
-AC_SEARCH_LIBS as a fallback
-
-By using PKG_CHECK_MODULES, static link will work as -lncurses or -lbsd
-will be automatically added
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/connectivity/neardal/pull/7]
----
- configure.ac | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f0cebed..211b896 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -68,10 +68,16 @@ PKG_CHECK_MODULES(gio, gio-unix-2.0 >= 2.30,
- 	AC_SUBST([gio_LIBS]),
- 	AC_MSG_ERROR(gio-unix-2.0 >= 2.30 is required))
- 
--AC_SEARCH_LIBS([rl_initialize], [edit readline],
--	[AS_IF([echo $LIBS | grep -q "-ledit"],
--		[CPPFLAGS="-DHAVE_LIBEDIT $CPPFLAGS"])],
--	[AC_MSG_ERROR(editline or readline is required)])
-+PKG_CHECK_MODULES(libedit, libedit,
-+	[CPPFLAGS="-DHAVE_LIBEDIT $libedit_CFLAGS $CPPFLAGS"
-+	 LIBS="$libedit_LIBS $LIBS"],
-+	[PKG_CHECK_MODULES(readline, readline,
-+		[CPPFLAGS="$readline_CFLAGS $CPPFLAGS"
-+		 LIBS="$readline_LIBS $LIBS"],
-+		AC_SEARCH_LIBS([rl_initialize], [edit readline],
-+			[AS_IF([echo $LIBS | grep -q "-ledit"],
-+				[CPPFLAGS="-DHAVE_LIBEDIT $CPPFLAGS"])],
-+			[AC_MSG_ERROR(editline or readline is required)]))])
- 
- AC_PATH_TOOL([DOXYGEN], [doxygen])
- AM_CONDITIONAL([HAVE_DOXYGEN], [test ! -z "$DOXYGEN"])
--- 
-2.17.1
-
diff --git a/package/neardal/neardal.hash b/package/neardal/neardal.hash
index c767a74569..b8b8b96a44 100644
--- a/package/neardal/neardal.hash
+++ b/package/neardal/neardal.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9955753759a2604fa47562a4bbccd3b787d625e70311bb6662936d89d26715b7  neardal-33b54a55032b047fd885a5eb3592c169c0056c49.tar.gz
+sha256 dae3c432e619a0d3102c5222d0b8fde74413ae519a64ccaae0fc81d31504aecb  neardal-4143d130ed39299bfc59d08d2c7c77dbc7f809e9.tar.gz
+sha256 296a87e9098d3f2ce1ef80c73c53399dc2c7412f35d4175c45810ea15ed86406  COPYING
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 3883011932..ea9643244e 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEARDAL_VERSION = 33b54a55032b047fd885a5eb3592c169c0056c49
+NEARDAL_VERSION = 4143d130ed39299bfc59d08d2c7c77dbc7f809e9
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_INSTALL_STAGING = YES
 NEARDAL_LICENSE = GPL-2.0
-- 
2.20.1
