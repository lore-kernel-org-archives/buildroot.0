From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 15:43:33 +0200
Subject: [Buildroot] [git commit] gettext: optimize build time
Message-ID: <20140609134342.366529CF7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c8f6d42f4f8f586b803979dd5ac72fb52da8d15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit significantly reduces the build time of host-gettext and
gettext, by using the capacity of gettext to handle build things in a
certain subdirectory:

 - For the host variant of gettext, we only need the gettext-tools,
   available in the directory of the same name in the gettext sources.

 - For the target variant of gettext, we only need the gettext library
   libintl, available in the gettext-runtime directory in the gettext
   sources.

So by using appropriate values of GETTEXT_SUBDIR and
HOST_GETTEXT_SUBDIR, we only build what's necessary. Moreover, by
manually patching gettext-tools/Makefile.in and
gettext-runtime/Makefile.in, we make sure to not build and install
things like examples, documentation and so on.

In addition to this, these changes avoid the need to autoreconfigure
the gettext package, which was particularly long.

Thanks to these changes, the build time of gettext goes from 1 minutes
and 37 seconds to just 24 seconds, and the build of host-gettext goes
from 2 minutes and 18 seconds to 1 minute and 13 seconds.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .../gettext-03-option-to-disable-tools.patch       |   42 --------------------
 .../gettext/gettext-04-remove-examples-tests.patch |   20 ---------
 package/gettext/gettext.mk                         |   26 +++++++-----
 3 files changed, 16 insertions(+), 72 deletions(-)

diff --git a/package/gettext/gettext-03-option-to-disable-tools.patch b/package/gettext/gettext-03-option-to-disable-tools.patch
deleted file mode 100644
index 24a9996..0000000
--- a/package/gettext/gettext-03-option-to-disable-tools.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Add a --disable-tools option
-
-This patch adds a --disable-tools option that allows to disable the
-compilation of the gettext tools, which may not be necessary on a
-small embedded Linux system.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -37,6 +37,10 @@
- 
- dnl Checks for library functions.
- 
-+AC_ARG_ENABLE([tools], [--disable-tools  do not build tools],
-+		       [enable_tools=$enableval], [enable_tools=yes])
-+AM_CONDITIONAL([ENABLE_TOOLS], [test "$enable_tools" = "yes"])
-+
- AC_CONFIG_SUBDIRS([gettext-runtime gettext-tools])
- 
- dnl Ensure that "configure --help" lists all the command line options that
-Index: b/Makefile.am
-===================================================================
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -20,7 +20,13 @@
- ACLOCAL = build-aux/fixaclocal @ACLOCAL@
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = gnulib-local gettext-runtime gettext-tools
-+if ENABLE_TOOLS
-+TOOLS_SUBDIR = gettext-tools
-+else
-+TOOLS_SUBDIR =
-+endif
-+
-+SUBDIRS = gnulib-local gettext-runtime $(TOOLS_SUBDIR)
- 
- EXTRA_DIST = \
-   version.sh DEPENDENCIES PACKAGING HACKING ChangeLog.0 autogen.sh \
diff --git a/package/gettext/gettext-04-remove-examples-tests.patch b/package/gettext/gettext-04-remove-examples-tests.patch
deleted file mode 100644
index f7d88d9..0000000
--- a/package/gettext/gettext-04-remove-examples-tests.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Disable tests and examples
-
-This patch disables the gettext-tools tests and examples, which are
-generally not necessary.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/gettext-tools/Makefile.am
-===================================================================
---- a/gettext-tools/Makefile.am
-+++ b/gettext-tools/Makefile.am
-@@ -20,7 +20,7 @@
- ACLOCAL = ../build-aux/fixaclocal @ACLOCAL@
- ACLOCAL_AMFLAGS = -I m4 -I ../gettext-runtime/m4 -I ../m4 -I gnulib-m4 -I libgrep/gnulib-m4 -I libgettextpo/gnulib-m4
- 
--SUBDIRS = doc intl gnulib-lib libgrep src libgettextpo po projects styles misc man m4 tests gnulib-tests examples
-+SUBDIRS = doc intl gnulib-lib libgrep src libgettextpo po projects styles misc man m4
- 
- EXTRA_DIST = misc/DISCLAIM
- MOSTLYCLEANFILES = core *.stackdump
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 52a72db..948ab9d 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -9,7 +9,6 @@ GETTEXT_SITE = $(BR2_GNU_MIRROR)/gettext
 GETTEXT_INSTALL_STAGING = YES
 GETTEXT_LICENSE = GPLv2+
 GETTEXT_LICENSE_FILES = COPYING
-GETTEXT_AUTORECONF = YES
 
 GETTEXT_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 HOST_GETTEXT_DEPENDENCIES = # we don't want the libiconv dependency
@@ -23,8 +22,7 @@ GETTEXT_CONF_OPT += \
 	--disable-native-java \
 	--disable-csharp \
 	--disable-relocatable \
-	--without-emacs \
-	--disable-tools
+	--without-emacs
 
 HOST_GETTEXT_CONF_OPT = \
 	--disable-libasprintf \
@@ -37,6 +35,21 @@ HOST_GETTEXT_CONF_OPT = \
 	--disable-relocatable \
 	--without-emacs
 
+# For the target version, we only need the runtime, and for the host
+# version, we only need the tools.
+GETTEXT_SUBDIR = gettext-runtime
+HOST_GETTEXT_SUBDIR = gettext-tools
+
+# Disable the build of documentation and examples of gettext-tools,
+# and the build of documentation and tests of gettext-runtime.
+define HOST_GETTEXT_DISABLE_UNNEEDED
+	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/examples$$//' $(@D)/gettext-tools/Makefile.in
+	$(SED) '/^SUBDIRS/s/ doc //;/^SUBDIRS/s/tests$$//' $(@D)/gettext-runtime/Makefile.in
+endef
+
+GETTEXT_POST_PATCH_HOOKS += HOST_GETTEXT_DISABLE_UNNEEDED
+HOST_GETTEXT_POST_PATCH_HOOKS += HOST_GETTEXT_DISABLE_UNNEEDED
+
 # Force build with NLS support, otherwise libintl is not built
 # This is needed because some packages (eg. libglib2) requires
 # locales, but do not properly depend on BR2_ENABLE_LOCALE, and
@@ -46,13 +59,6 @@ ifeq ($(BR2_ENABLE_LOCALE),)
 GETTEXT_CONF_OPT += --enable-nls
 endif
 
-# When static libs are preferred the .so files aren't created
-ifeq ($(BR2_PREFER_STATIC_LIB),)
-define GETTEXT_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
-endef
-endif
-
 # Disable interactive confirmation in host gettextize for package fixups
 define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
 	$(SED) '/read dummy/d' $(HOST_DIR)/usr/bin/gettextize
