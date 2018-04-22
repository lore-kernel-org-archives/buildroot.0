From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Apr 2018 23:20:04 +0200
Subject: [Buildroot] [PATCH 2/3] readline: install a .pc file
In-Reply-To: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
References: <20180422212005.13062-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180422212005.13062-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (such as udftools) fail to build against readline in
static linking configurations. To fix this, we install the .pc file
provided by readline.

Unfortunately, this .pc file is by default not correct, so a patch is
added to fix it, and this patch requires to re-autoconf the package
(but not autoreconf since only autoconf is used).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-readline.pc.in-fix-Requires.private-val.patch | 62 ++++++++++++++++++++++
 package/readline/readline.mk                       | 17 +++++-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch

diff --git a/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch b/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
new file mode 100644
index 0000000000..22b479cd91
--- /dev/null
+++ b/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
@@ -0,0 +1,62 @@
+From 7bbf2046fbcf4416ec226ecb3a2b4c6a5c263298 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 22 Apr 2018 23:06:28 +0200
+Subject: [PATCH] configure.ac, readline.pc.in: fix Requires.private value
+
+The provided readline.pc.in hardcodes the fact that readline depends
+on the tinfo library. However, different termcap implementation are
+supported beyond tinfo. This commit improves the configure.ac script
+to define a TERMCAP_PKG_CONFIG_LIB variable, which is then used in
+readline.pc.in.
+
+This for example allows the generated readline.pc to properly contain
+"Requires.private: ncurses" when ncurses is used as the termcap
+implementation.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ configure.ac   | 8 ++++++++
+ readline.pc.in | 2 +-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index fd0cec4..9f85f37 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -276,6 +276,13 @@ case "$BUILD_DIR" in
+ *)	;;
+ esac
+ 
++case "$TERMCAP_LIB" in
++-ltinfo)  TERMCAP_PKG_CONFIG_LIB=tinfo ;;
++-lcurses) TERMCAP_PKG_CONFIG_LIB=ncurses ;;
++-lncurses) TERMCAP_PKG_CONFIG_LIB=ncurses ;;
++-ltermcap) TERMCAP_PKG_CONFIG_LIB=termcap ;;
++esac
++
+ AC_SUBST(BUILD_DIR)
+ 
+ AC_SUBST(CFLAGS)
+@@ -292,6 +299,7 @@ AC_SUBST(host_os)
+ AC_SUBST(LIBVERSION)
+ 
+ AC_SUBST(TERMCAP_LIB)
++AC_SUBST(TERMCAP_PKG_CONFIG_LIB)
+ 
+ AC_OUTPUT([Makefile doc/Makefile examples/Makefile shlib/Makefile readline.pc],
+ [
+diff --git a/readline.pc.in b/readline.pc.in
+index fbfca8a..a7f2cf3 100644
+--- a/readline.pc.in
++++ b/readline.pc.in
+@@ -7,6 +7,6 @@ Name: Readline
+ Description: Gnu Readline library for command line editing
+ URL: http://tiswww.cwru.edu/php/chet/readline/rltop.html
+ Version: @LIBVERSION@
+-Requires.private: tinfo
++Requires.private: @TERMCAP_PKG_CONFIG_LIB@
+ Libs: -L${libdir} -lreadline
+ Cflags: -I${includedir}/readline
+-- 
+2.14.3
+
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index cc5d4f2920..e00c594697 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -7,18 +7,31 @@
 READLINE_VERSION = 7.0
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
-READLINE_DEPENDENCIES = ncurses
-HOST_READLINE_DEPENDENCIES = host-ncurses
+READLINE_DEPENDENCIES = ncurses host-autoconf
+HOST_READLINE_DEPENDENCIES = host-ncurses host-autoconf
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 	bash_cv_wcwidth_broken=no
 READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 
+# readline only uses autoconf, not automake, and therefore the regular
+# AUTORECONF = YES doesn't work.
+define READLINE_AUTOCONF
+	cd $(@D); $(HOST_DIR)/bin/autoconf
+endef
+READLINE_PRE_CONFIGURE_HOOKS += READLINE_AUTOCONF
+HOST_READLINE_PRE_CONFIGURE_HOOKS += READLINE_AUTOCONF
+
 define READLINE_PURGE_EXAMPLES
 	rm -rf $(TARGET_DIR)/usr/share/readline
 endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
 
+define READLINE_INSTALL_PC_FILE
+	$(INSTALL) -D -m 644 $(@D)/readline.pc $(STAGING_DIR)/usr/lib/pkgconfig/readline.pc
+endef
+READLINE_POST_INSTALL_STAGING_HOOKS += READLINE_INSTALL_PC_FILE
+
 define READLINE_INSTALL_INPUTRC
 	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
 endef
-- 
2.14.3
