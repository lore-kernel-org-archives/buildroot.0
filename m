From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Date: Wed,  9 Apr 2014 08:53:56 -0500
Subject: [Buildroot] [PATCH v2] expect: new package 5.45
Message-ID: <1397051636-22272-1-git-send-email-andrew.ruder@elecsyscorp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
---
 A few changes from the last time:

    . Removed the dependencies in BR2_PACKAGE_EXPECT Config.in
      since it is taken care of by the BR2_PACKAGE_TCL.

    . Split the patch into two (one for each notional change) and
      added git-style headers to each patch.

 package/Config.in                                  |   1 +
 package/expect/Config.in                           |   7 ++
 .../expect-0001-enable-cross-compilation.patch     | 120 +++++++++++++++++++++
 .../expect-0002-allow-tcl-build-directory.patch    |  34 ++++++
 package/expect/expect.mk                           |  21 ++++
 5 files changed, 183 insertions(+)
 create mode 100644 package/expect/Config.in
 create mode 100644 package/expect/expect-0001-enable-cross-compilation.patch
 create mode 100644 package/expect/expect-0002-allow-tcl-build-directory.patch
 create mode 100644 package/expect/expect.mk


diff --git a/package/Config.in b/package/Config.in
index 72d529c..6abc7b3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -477,6 +477,7 @@ source "package/ruby/Config.in"
 source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
 menu "tcl libraries/modules"
+source "package/expect/Config.in"
 source "package/tcllib/Config.in"
 endmenu
 endif
diff --git a/package/expect/Config.in b/package/expect/Config.in
new file mode 100644
index 0000000..5557f4a
--- /dev/null
+++ b/package/expect/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_EXPECT
+	bool "expect"
+	help
+	  Expect is a tool for automating interactive applications
+	  such as telnet, ftp, passwd, fsck, rlogin, ssh, tip, etc.
+
+	  http://expect.sourceforge.net/
diff --git a/package/expect/expect-0001-enable-cross-compilation.patch b/package/expect/expect-0001-enable-cross-compilation.patch
new file mode 100644
index 0000000..fd31a01
--- /dev/null
+++ b/package/expect/expect-0001-enable-cross-compilation.patch
@@ -0,0 +1,120 @@
+From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+Subject: [PATCH] enable cross compilation for expect
+
+This patch was created by running ./configure on a modern Linux machine
+and inserting the results into the cross compilation section of
+each AC_MSG_CHECKING that bombed out with an error.
+
+Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+---
+
+Index: expect-5.45/configure.in
+===================================================================
+--- expect-5.45.orig/configure.in	2013-11-14 07:59:58.732100595 -0600
++++ expect-5.45/configure.in	2013-11-14 07:59:58.732100595 -0600
+@@ -481,7 +481,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ AC_MSG_CHECKING([if any value exists for WNOHANG])
+@@ -506,7 +506,8 @@
+ 	AC_MSG_RESULT(no)
+ 	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(yes)
++	AC_DEFINE(WNOHANG_BACKUP_VALUE, 1)
+ )
+ 
+ #
+@@ -574,7 +575,7 @@
+ 	AC_DEFINE(REARM_SIG)
+ ,
+ 	AC_MSG_RESULT(no)
+-, AC_MSG_WARN([Expect can't be cross compiled])
++, AC_MSG_RESULT(no)
+ )
+ 
+ # HPUX7 has trouble with the big cat so split it
+@@ -725,7 +726,7 @@
+ ,
+         AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ # mach systems have include files for unimplemented features
+@@ -749,7 +750,9 @@
+ ,
+         AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++    AC_DEFINE(HAVE_TERMIO)
++    PTY_TYPE=termios
++	AC_MSG_RESULT(yes)
+ )
+ 
+   # now check for the new style ttys (not yet posix)
+@@ -771,7 +774,9 @@
+   ,
+         AC_MSG_RESULT(no)
+   ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++        AC_DEFINE(HAVE_TERMIOS)
++        PTY_TYPE=termios
++        AC_MSG_RESULT(yes)
+   )
+ fi
+ 
+@@ -794,7 +799,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ AC_MSG_CHECKING([if TIOCGWINSZ in termios.h])
+@@ -816,7 +821,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ # finally check for Cray style ttys
+@@ -837,7 +842,7 @@
+ ,
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(no)
+ )
+ 
+ #
+@@ -869,7 +874,9 @@
+ AC_HAVE_FUNCS(getpty)
+ 
+ # following test sets SETPGRP_VOID if setpgrp takes 0 args, else takes 2
+-AC_FUNC_SETPGRP
++cat >>expect_cf.h <<\_ACEOF
++#define SETPGRP_VOID 1
++_ACEOF
+ 
+ #
+ # check for timezones
+@@ -889,7 +896,7 @@
+ 	AC_MSG_RESULT(yes),
+ 	AC_MSG_RESULT(no)
+ ,
+-	AC_MSG_ERROR([Expect can't be cross compiled])
++	AC_MSG_RESULT(yes)
+ )
+ 
+ 
diff --git a/package/expect/expect-0002-allow-tcl-build-directory.patch b/package/expect/expect-0002-allow-tcl-build-directory.patch
new file mode 100644
index 0000000..83ede7a
--- /dev/null
+++ b/package/expect/expect-0002-allow-tcl-build-directory.patch
@@ -0,0 +1,34 @@
+From: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+Subject: [PATCH] Allow tcl build directory for linking
+
+Some small changes to use TCL_BUILD_LIB_SPEC instead of TCL_LIB_SPEC for
+linking against tcl directly out of its build directory.
+
+Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
+---
+
+Index: expect-5.45/Makefile.in
+===================================================================
+--- expect-5.45.orig/Makefile.in	2013-11-14 07:59:58.732100595 -0600
++++ expect-5.45/Makefile.in	2013-11-14 07:59:58.732100595 -0600
+@@ -393,7 +393,7 @@
+ 		@LDFLAGS_DEFAULT@ \
+ 		-o expect exp_main_exp.o \
+ 		@EXP_BUILD_LIB_SPEC@ \
+-		@TCL_LIB_SPEC@ \
++		@TCL_BUILD_LIB_SPEC@ \
+ 		@TCL_DL_LIBS@ @PKG_LIBS@ @MATH_LIBS@ \
+ 		@TCL_CC_SEARCH_FLAGS@ \
+ 		@EXP_CC_SEARCH_FLAGS@
+Index: expect-5.45/tclconfig/tcl.m4
+===================================================================
+--- expect-5.45.orig/tclconfig/tcl.m4	2010-11-09 13:42:10.000000000 -0600
++++ expect-5.45/tclconfig/tcl.m4	2013-11-14 08:02:08.424100580 -0600
+@@ -412,6 +412,7 @@
+     AC_SUBST(TCL_LIB_FILE)
+     AC_SUBST(TCL_LIB_FLAG)
+     AC_SUBST(TCL_LIB_SPEC)
++    AC_SUBST(TCL_BUILD_LIB_SPEC)
+ 
+     AC_SUBST(TCL_STUB_LIB_FILE)
+     AC_SUBST(TCL_STUB_LIB_FLAG)
diff --git a/package/expect/expect.mk b/package/expect/expect.mk
new file mode 100644
index 0000000..91fa019
--- /dev/null
+++ b/package/expect/expect.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# expect
+#
+################################################################################
+
+EXPECT_VERSION = 5.45
+EXPECT_SOURCE = expect$(EXPECT_VERSION).tar.gz
+EXPECT_SITE = http://downloads.sourceforge.net/project/expect/Expect/$(EXPECT_VERSION)
+EXPECT_LICENSE = Public domain
+EXPECT_LICENSE_FILES = README
+
+EXPECT_AUTORECONF = YES
+EXPECT_DEPENDENCIES = tcl
+EXPECT_CONF_OPT = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
+
+# Since we don't want examples installed
+EXPECT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)  install-binaries
+
+$(eval $(autotools-package))
+
-- 
1.9.0.rc3.12.gbc97e2d
