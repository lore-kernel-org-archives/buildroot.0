From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Oct 2018 20:56:10 +0100
Subject: [Buildroot] [git commit] neardal: fix static build with libedit and
 libbsd
Message-ID: <20181030201012.D187283239@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91b6ca96826d76e329561e1c8848bfafa9172f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstreamable patch to use pkg-config for finding libedit and
readline dependencies and drop ncurses "hack"

Fixes:
 - http://autobuild.buildroot.org/results/b0b17f4a5b0a32631a12bdb350ba7c21f7c595d0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-static-linking-with-libedit-or-readline.patch | 45 ++++++++++++++++++++++
 package/neardal/neardal.mk                         |  7 ----
 2 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch b/package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch
new file mode 100644
index 0000000000..bae0edae96
--- /dev/null
+++ b/package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch
@@ -0,0 +1,45 @@
+From 62ae1bf0206960d0ba5ff8f90238030e67f1a5cd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 28 Oct 2018 20:58:55 +0100
+Subject: [PATCH] fix static linking with libedit or readline
+
+Use PKG_CHECK_MODULES to find libedit or readline and continue to use
+AC_SEARCH_LIBS as a fallback
+
+By using PKG_CHECK_MODULES, static link will work as -lncurses or -lbsd
+will be automatically added
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/connectivity/neardal/pull/7]
+---
+ configure.ac | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f0cebed..211b896 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,10 +68,16 @@ PKG_CHECK_MODULES(gio, gio-unix-2.0 >= 2.30,
+ 	AC_SUBST([gio_LIBS]),
+ 	AC_MSG_ERROR(gio-unix-2.0 >= 2.30 is required))
+ 
+-AC_SEARCH_LIBS([rl_initialize], [edit readline],
+-	[AS_IF([echo $LIBS | grep -q "-ledit"],
+-		[CPPFLAGS="-DHAVE_LIBEDIT $CPPFLAGS"])],
+-	[AC_MSG_ERROR(editline or readline is required)])
++PKG_CHECK_MODULES(libedit, libedit,
++	[CPPFLAGS="-DHAVE_LIBEDIT $libedit_CFLAGS $CPPFLAGS"
++	 LIBS="$libedit_LIBS $LIBS"],
++	[PKG_CHECK_MODULES(readline, readline,
++		[CPPFLAGS="$readline_CFLAGS $CPPFLAGS"
++		 LIBS="$readline_LIBS $LIBS"],
++		AC_SEARCH_LIBS([rl_initialize], [edit readline],
++			[AS_IF([echo $LIBS | grep -q "-ledit"],
++				[CPPFLAGS="-DHAVE_LIBEDIT $CPPFLAGS"])],
++			[AC_MSG_ERROR(editline or readline is required)]))])
+ 
+ AC_PATH_TOOL([DOXYGEN], [doxygen])
+ AM_CONDITIONAL([HAVE_DOXYGEN], [test ! -z "$DOXYGEN"])
+-- 
+2.17.1
+
diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index f3e55fd99f..3883011932 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -21,13 +21,6 @@ else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 NEARDAL_DEPENDENCIES += libedit
 endif
 
-# Both readline and libedit link with ncurses but the configure script
-# forgets to take that into account, causing the detection to fail
-# when linking statically
-ifeq ($(BR2_STATIC_LIBS),y)
-NEARDAL_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs ncurses`"
-endif
-
 define NEARDAL_INSTALL_NCL
 	$(INSTALL) -m 0755 -D $(@D)/ncl/ncl $(TARGET_DIR)/usr/bin/ncl
 endef
