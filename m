From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 16 Jan 2014 01:15:54 +0100
Subject: [Buildroot] [PATCH v2 11/12] libenca: new package
In-Reply-To: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1389831355-19983-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1389831355-19983-12-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extremely Naive Charset Analyser.

This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
---
Changes v3 --> v4:
  - New patch against Makefile.am and do AUTORECONF (Thomas Petazzoni,
    Yann E. Morin)
  - Remove the uses of prefix by adding a patch which removes a hack in
    the configure.ac (Yann E. Morin)
Changes v2 --> v3:
  - Bump libenca to 1.15 (1.9 was 4 years ago)
  - Rework the whole libenca.mk file
  - Switch source to github
Changes v1 --> v2:
  - Rename patch files (Thomas Petazzoni)
  - Fix header of the mk files (Thomas Petazzoni)
  - Fix indent (Thomas Petazzoni)
  - Put LIBENCA_CONF_ENV on one line (Thomas Petazzoni)
---
 package/Config.in                                  |  1 +
 package/libenca/Config.in                          |  6 +++
 .../libenca/libenca-000-do-not-build-tools.patch   | 44 ++++++++++++++++++++++
 .../libenca-001-fix-installation-error.patch       | 44 ++++++++++++++++++++++
 ...benca-002-remove-prefix-hack-in-configure.patch | 33 ++++++++++++++++
 package/libenca/libenca.mk                         | 36 ++++++++++++++++++
 6 files changed, 164 insertions(+)
 create mode 100644 package/libenca/Config.in
 create mode 100644 package/libenca/libenca-000-do-not-build-tools.patch
 create mode 100644 package/libenca/libenca-001-fix-installation-error.patch
 create mode 100644 package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
 create mode 100644 package/libenca/libenca.mk

diff --git a/package/Config.in b/package/Config.in
index b5edacd..66a91f5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -772,6 +772,7 @@ menu "Text and terminal handling"
 source "package/enchant/Config.in"
 source "package/icu/Config.in"
 source "package/libedit/Config.in"
+source "package/libenca/Config.in"
 source "package/libfribidi/Config.in"
 source "package/libiconv/Config.in"
 source "package/linenoise/Config.in"
diff --git a/package/libenca/Config.in b/package/libenca/Config.in
new file mode 100644
index 0000000..5e951ed
--- /dev/null
+++ b/package/libenca/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBENCA
+	bool "libenca"
+	help
+	  Extremely Naive Charset Analyser
+
+	  http://cihar.com/software/enca/
diff --git a/package/libenca/libenca-000-do-not-build-tools.patch b/package/libenca/libenca-000-do-not-build-tools.patch
new file mode 100644
index 0000000..83db61b
--- /dev/null
+++ b/package/libenca/libenca-000-do-not-build-tools.patch
@@ -0,0 +1,44 @@
+From be1fe3e057ccb90fd476bf855f19ecbe97bf4e1e Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Wed, 15 Jan 2014 00:18:34 +0100
+Subject: [PATCH 1/3] Do not build tools
+
+We don't want to build tools using buildroot because there is currently no
+support for cross compile.
+And we need to execute make_hash (which seems to be the only things that get
+compiled in tools) to create encodings.h which will later be used during the
+build process.
+Thus, we disable the build of the tools, and we do ourselves using a
+POST_CONFIGURE_HOOKS.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ Makefile.am | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c9f203a..b5b50be 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,8 @@
+ # @(#) $Id: Makefile.am,v 1.35 2005/11/24 10:21:32 yeti Exp $
+ if MAINTAINER_MODE
+-SUBDIRS = tools data script lib src devel-docs test
++SUBDIRS = data script lib src devel-docs test
+ else
+-SUBDIRS = tools script lib src devel-docs test
++SUBDIRS = script lib src devel-docs test
+ endif
+ man_MANS = man/enca.1
+ 
+@@ -19,7 +19,6 @@ M4TESTS = \
+   m4/localias.m4 \
+   m4/long-text.l2 \
+   m4/recode-bugs.m4 \
+-  m4/tools.m4 \
+   m4/typevar.m4
+ 
+ EXTRA_DIST = \
+-- 
+1.8.5.2
+
diff --git a/package/libenca/libenca-001-fix-installation-error.patch b/package/libenca/libenca-001-fix-installation-error.patch
new file mode 100644
index 0000000..fc27841
--- /dev/null
+++ b/package/libenca/libenca-001-fix-installation-error.patch
@@ -0,0 +1,44 @@
+From 1ca09a1a8f3dd07e2805855a1f1a67a54e8d8adb Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Wed, 15 Jan 2014 00:20:08 +0100
+Subject: [PATCH 2/3] Fix installation error
+
+ln will complain that the link already exists and will error.
+Adding the -f flag, force ln to recreate the link without failing the
+build.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ Makefile.am     | 2 +-
+ src/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b5b50be..ddf1d5f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -54,7 +54,7 @@ install-data-hook:
+ 	cd $(DESTDIR)$(man1dir); \
+ 	inst1=`echo enca | sed '$(transform)'`.1; \
+ 	inst2=`echo enconv | sed '$(transform)'`.1; \
+-	$(LN_S) $$inst1 $$inst2
++	$(LN_S) -f $$inst1 $$inst2
+ 
+ uninstall-hook:
+ 	inst=`echo enconv | sed '$(transform)'`.1; \
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 2f01a12..3885137 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -47,7 +47,7 @@ install-exec-hook:
+ 	cd $(DESTDIR)$(bindir); \
+ 	inst1=`echo enca | sed '$(transform)'`; \
+ 	inst2=`echo enconv | sed '$(transform)'`; \
+-	$(LN_S) $$inst1$(EXEEXT) $$inst2$(EXEEXT)
++	$(LN_S) -f $$inst1$(EXEEXT) $$inst2$(EXEEXT)
+ 
+ uninstall-hook:
+ 	inst=`echo enconv | sed '$(transform)'`; \
+-- 
+1.8.5.2
+
diff --git a/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch b/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
new file mode 100644
index 0000000..45701f9
--- /dev/null
+++ b/package/libenca/libenca-002-remove-prefix-hack-in-configure.patch
@@ -0,0 +1,33 @@
+From 354a8217eb735c9678f42436d647571fcebc3ead Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Wed, 15 Jan 2014 00:46:10 +0100
+Subject: [PATCH 3/3] Remove prefix hack in configure
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ configure.ac | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9db3b21..9b99df4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,15 +100,6 @@ gtk_CHECK_GTK_DOC
+ dnl Check for good random number sources
+ AC_CHECK_FILES(/dev/random /dev/urandom /dev/srandom /dev/arandom)
+ 
+-dnl Dirty path hack.  Helps some people with badly set up search paths.
+-if test "$prefix" = "NONE"; then
+-  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+-fi
+-
+ dnl Checks for libraries.
+ ye_CHECK_LIBM
+ 
+-- 
+1.8.5.2
+
diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
new file mode 100644
index 0000000..e69c124
--- /dev/null
+++ b/package/libenca/libenca.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# libenca
+#
+################################################################################
+
+LIBENCA_VERSION = 1.15
+LIBENCA_SITE = $(call github,nijel,enca,$(LIBENCA_VERSION))
+LIBENCA_INSTALL_STAGING = YES
+LIBENCA_AUTORECONF = YES
+LIBENCA_LICENSE = GPLv2
+LIBENCA_LICENSE_FILES = COPYING
+
+LIBENCA_CONF_ENV += ac_cv_file__dev_random=yes \
+			ac_cv_file__dev_urandom=yes \
+			ac_cv_file__dev_arandom=no \
+			ac_cv_file__dev_srandom=no
+
+define LIBENCA_MAKE_HOST_TOOL
+	cd $(@D)/tools && sed -e 's/^#define \([A-Z0-9_]*\) \(.*\)/@\1@ \2/' \
+		-e 's/"//g' \
+		-e 's/NULL$$//' \
+		-e 's/ /\//' \
+		-e 's/^\(.*\)$$/s\/\1\//' \
+		../iconvenc.h >encodings.sed
+	cd $(@D)/tools && $(HOSTCC) -o make_hash make_hash.c
+	cd $(@D)/tools && sed -f encodings.sed ./encodings.dat | ./make_hash >encodings.h
+endef
+
+LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
+
+$(eval $(autotools-package))
+
+XERCES_CONF_OPT = --disable-threads \
+		  --with-gnu-ld
+
-- 
1.8.5.2
