From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 May 2013 21:45:03 +0200
Subject: [Buildroot] [git commit branch/next] gettext: don't patch different
	the host and target build
Message-ID: <20130530195804.9151F9A69D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d4133edfedd8ca641db39d3eec9dc7146c8fa4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Until now, the gettext source code was being patched differently for
the host and the target build, which is going to be incompatible with
out-of-tree build. The difference is that the gettext tools could be
disabled in the target build, but are always enabled on the host
build.

Therefore, this commit switches the gettext package to using proper
patches against the relevant configure.ac and Makefile.am
files. gettext is now being autoreconfigured. Configuration options
are also passed for the host variant, in order to disable the build of
a large number of things we don't care about.

Finally, the two existing patches are renamed to include a number in
their filename.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...patch => gettext-01-error_print_progname.patch} |    0
 ...patch => gettext-02-fix_rpl_gettimeofday.patch} |    0
 .../gettext-03-option-to-disable-tools.patch       |   42 ++++++++++++++++++++
 .../gettext/gettext-04-remove-examples-tests.patch |   20 +++++++++
 package/gettext/gettext-05-use-shell.patch         |   25 ++++++++++++
 package/gettext/gettext.mk                         |   26 +++++++------
 6 files changed, 101 insertions(+), 12 deletions(-)

diff --git a/package/gettext/gettext-error_print_progname.patch b/package/gettext/gettext-01-error_print_progname.patch
similarity index 100%
rename from package/gettext/gettext-error_print_progname.patch
rename to package/gettext/gettext-01-error_print_progname.patch
diff --git a/package/gettext/gettext-fix_rpl_gettimeofday.patch b/package/gettext/gettext-02-fix_rpl_gettimeofday.patch
similarity index 100%
rename from package/gettext/gettext-fix_rpl_gettimeofday.patch
rename to package/gettext/gettext-02-fix_rpl_gettimeofday.patch
diff --git a/package/gettext/gettext-03-option-to-disable-tools.patch b/package/gettext/gettext-03-option-to-disable-tools.patch
new file mode 100644
index 0000000..24a9996
--- /dev/null
+++ b/package/gettext/gettext-03-option-to-disable-tools.patch
@@ -0,0 +1,42 @@
+Add a --disable-tools option
+
+This patch adds a --disable-tools option that allows to disable the
+compilation of the gettext tools, which may not be necessary on a
+small embedded Linux system.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -37,6 +37,10 @@
+ 
+ dnl Checks for library functions.
+ 
++AC_ARG_ENABLE([tools], [--disable-tools  do not build tools],
++		       [enable_tools=$enableval], [enable_tools=yes])
++AM_CONDITIONAL([ENABLE_TOOLS], [test "$enable_tools" = "yes"])
++
+ AC_CONFIG_SUBDIRS([gettext-runtime gettext-tools])
+ 
+ dnl Ensure that "configure --help" lists all the command line options that
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,13 @@
+ ACLOCAL = build-aux/fixaclocal @ACLOCAL@
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = gnulib-local gettext-runtime gettext-tools
++if ENABLE_TOOLS
++TOOLS_SUBDIR = gettext-tools
++else
++TOOLS_SUBDIR =
++endif
++
++SUBDIRS = gnulib-local gettext-runtime $(TOOLS_SUBDIR)
+ 
+ EXTRA_DIST = \
+   version.sh DEPENDENCIES PACKAGING HACKING ChangeLog.0 autogen.sh \
diff --git a/package/gettext/gettext-04-remove-examples-tests.patch b/package/gettext/gettext-04-remove-examples-tests.patch
new file mode 100644
index 0000000..f7d88d9
--- /dev/null
+++ b/package/gettext/gettext-04-remove-examples-tests.patch
@@ -0,0 +1,20 @@
+Disable tests and examples
+
+This patch disables the gettext-tools tests and examples, which are
+generally not necessary.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/gettext-tools/Makefile.am
+===================================================================
+--- a/gettext-tools/Makefile.am
++++ b/gettext-tools/Makefile.am
+@@ -20,7 +20,7 @@
+ ACLOCAL = ../build-aux/fixaclocal @ACLOCAL@
+ ACLOCAL_AMFLAGS = -I m4 -I ../gettext-runtime/m4 -I ../m4 -I gnulib-m4 -I libgrep/gnulib-m4 -I libgettextpo/gnulib-m4
+ 
+-SUBDIRS = doc intl gnulib-lib libgrep src libgettextpo po projects styles misc man m4 tests gnulib-tests examples
++SUBDIRS = doc intl gnulib-lib libgrep src libgettextpo po projects styles misc man m4
+ 
+ EXTRA_DIST = misc/DISCLAIM
+ MOSTLYCLEANFILES = core *.stackdump
diff --git a/package/gettext/gettext-05-use-shell.patch b/package/gettext/gettext-05-use-shell.patch
new file mode 100644
index 0000000..5f6e2c2
--- /dev/null
+++ b/package/gettext/gettext-05-use-shell.patch
@@ -0,0 +1,25 @@
+gettext-runtime: use @SHELL@ for the SHELL variable definition
+
+The gettext-runtime/Makefile.in uses an hardcoded SHELL = /bin/sh
+variable. This causes problems at build time, because libtool is then
+called with the 'sh' shell, which does not support the += construct
+that the libtool script is using.
+
+Instead, this Makefile.in should be definining SHELL = @SHELL@, just
+like all other Makefile.in of gettext.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/gettext-runtime/intl/Makefile.in
+===================================================================
+--- a/gettext-runtime/intl/Makefile.in
++++ b/gettext-runtime/intl/Makefile.in
+@@ -17,7 +17,7 @@
+ PACKAGE = @PACKAGE@
+ VERSION = @VERSION@
+ 
+-SHELL = /bin/sh
++SHELL = @SHELL@
+ 
+ srcdir = @srcdir@
+ top_srcdir = @top_srcdir@
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 8dc701e..9061928 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -9,6 +9,8 @@ GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
+GETTEXT_AUTORECONF = YES
+HOST_GETTEXT_AUTORECONF = YES
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
@@ -22,6 +24,18 @@ GETTEXT_CONF_OPT += \
 	--disable-native-java \
 	--disable-csharp \
 	--disable-relocatable \
+	--without-emacs \
+	--disable-tools
+
+HOST_GETTEXT_CONF_OPT = \
+	--disable-libasprintf \
+	--disable-acl \
+	--disable-openmp \
+	--disable-rpath \
+	--disable-java \
+	--disable-native-java \
+	--disable-csharp \
+	--disable-relocatable \
 	--without-emacs
 
 # Force build with NLS support, otherwise libintl is not built
@@ -42,19 +56,7 @@ define GETTEXT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
 endef
 endif
-# Ditch the tools since they're off and pull other dependencies
-define GETTEXT_DISABLE_TOOLS
-	$(SED) 's/runtime gettext-tools/runtime/' $(@D)/Makefile.in
-endef
 endif # GETTEXT_TOOLS = n
 
-# The tools tests build fails with full toolchain without threads
-define GETTEXT_DISABLE_TESTS
-	$(SED) 's/m4 tests/m4/' $(@D)/gettext-tools/Makefile.in
-endef
-
-GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TOOLS
-GETTEXT_POST_PATCH_HOOKS += GETTEXT_DISABLE_TESTS
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
