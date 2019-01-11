From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 11 Jan 2019 22:50:20 +0100
Subject: [Buildroot] [PATCH 1/1] readline: bump to version 8.0
Message-ID: <20190111215020.5701-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove first patch (already in version) and so remove
  READLINE_AUTOCONF as configure.ac is not patched anymore
- Use the new --disable-install-examples option and remove
  READLINE_PURGE_EXAMPLES
- Remove READLINE_INSTALL_PC_FILE as readline.pc is installed since:
  http://git.savannah.gnu.org/cgit/readline.git/commit/Makefile.in?id=8e6ccd0373d77b86ed37a9a7d232ccfea3d6670c
- Remove READLINE_INSTALL_FIXUPS_SHARED (libraries are installed with
  correct rights)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...c-readline.pc.in-fix-Requires.private-val.patch | 62 ----------------------
 package/readline/readline.hash                     |  5 +-
 package/readline/readline.mk                       | 29 +---------
 3 files changed, 6 insertions(+), 90 deletions(-)
 delete mode 100644 package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch

diff --git a/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch b/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
deleted file mode 100644
index 22b479cd91..0000000000
--- a/package/readline/0001-configure.ac-readline.pc.in-fix-Requires.private-val.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 7bbf2046fbcf4416ec226ecb3a2b4c6a5c263298 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 22 Apr 2018 23:06:28 +0200
-Subject: [PATCH] configure.ac, readline.pc.in: fix Requires.private value
-
-The provided readline.pc.in hardcodes the fact that readline depends
-on the tinfo library. However, different termcap implementation are
-supported beyond tinfo. This commit improves the configure.ac script
-to define a TERMCAP_PKG_CONFIG_LIB variable, which is then used in
-readline.pc.in.
-
-This for example allows the generated readline.pc to properly contain
-"Requires.private: ncurses" when ncurses is used as the termcap
-implementation.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- configure.ac   | 8 ++++++++
- readline.pc.in | 2 +-
- 2 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fd0cec4..9f85f37 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -276,6 +276,13 @@ case "$BUILD_DIR" in
- *)	;;
- esac
- 
-+case "$TERMCAP_LIB" in
-+-ltinfo)  TERMCAP_PKG_CONFIG_LIB=tinfo ;;
-+-lcurses) TERMCAP_PKG_CONFIG_LIB=ncurses ;;
-+-lncurses) TERMCAP_PKG_CONFIG_LIB=ncurses ;;
-+-ltermcap) TERMCAP_PKG_CONFIG_LIB=termcap ;;
-+esac
-+
- AC_SUBST(BUILD_DIR)
- 
- AC_SUBST(CFLAGS)
-@@ -292,6 +299,7 @@ AC_SUBST(host_os)
- AC_SUBST(LIBVERSION)
- 
- AC_SUBST(TERMCAP_LIB)
-+AC_SUBST(TERMCAP_PKG_CONFIG_LIB)
- 
- AC_OUTPUT([Makefile doc/Makefile examples/Makefile shlib/Makefile readline.pc],
- [
-diff --git a/readline.pc.in b/readline.pc.in
-index fbfca8a..a7f2cf3 100644
---- a/readline.pc.in
-+++ b/readline.pc.in
-@@ -7,6 +7,6 @@ Name: Readline
- Description: Gnu Readline library for command line editing
- URL: http://tiswww.cwru.edu/php/chet/readline/rltop.html
- Version: @LIBVERSION@
--Requires.private: tinfo
-+Requires.private: @TERMCAP_PKG_CONFIG_LIB@
- Libs: -L${libdir} -lreadline
- Cflags: -I${includedir}/readline
--- 
-2.14.3
-
diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index 43f8c64bb2..560154c2f7 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334  readline-7.0.tar.gz
+sha256 e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461  readline-8.0.tar.gz
+
+# Hash for license file
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index e00c594697..f5d7d5bf9e 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,46 +4,21 @@
 #
 ################################################################################
 
-READLINE_VERSION = 7.0
+READLINE_VERSION = 8.0
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf
 HOST_READLINE_DEPENDENCIES = host-ncurses host-autoconf
 READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
 	bash_cv_wcwidth_broken=no
+READLINE_CONF_OPTS = --disable-install-examples
 READLINE_LICENSE = GPL-3.0+
 READLINE_LICENSE_FILES = COPYING
 
-# readline only uses autoconf, not automake, and therefore the regular
-# AUTORECONF = YES doesn't work.
-define READLINE_AUTOCONF
-	cd $(@D); $(HOST_DIR)/bin/autoconf
-endef
-READLINE_PRE_CONFIGURE_HOOKS += READLINE_AUTOCONF
-HOST_READLINE_PRE_CONFIGURE_HOOKS += READLINE_AUTOCONF
-
-define READLINE_PURGE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/share/readline
-endef
-READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES
-
-define READLINE_INSTALL_PC_FILE
-	$(INSTALL) -D -m 644 $(@D)/readline.pc $(STAGING_DIR)/usr/lib/pkgconfig/readline.pc
-endef
-READLINE_POST_INSTALL_STAGING_HOOKS += READLINE_INSTALL_PC_FILE
-
 define READLINE_INSTALL_INPUTRC
 	$(INSTALL) -D -m 644 package/readline/inputrc $(TARGET_DIR)/etc/inputrc
 endef
 READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_INPUTRC
 
-ifneq ($(BR2_STATIC_LIBS),y)
-# libraries get installed read only, so strip fails
-define READLINE_INSTALL_FIXUPS_SHARED
-	chmod +w $(addprefix $(TARGET_DIR)/usr/lib/,libhistory.so.* libreadline.so.*)
-endef
-READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_INSTALL_FIXUPS_SHARED
-endif
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.14.1
