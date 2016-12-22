From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Thu, 22 Dec 2016 21:57:07 +0530
Subject: [Buildroot] [RFC PATCH] util-linux: fix build with ncurses
Message-ID: <1482424027-9369-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

util-linux version 2.29 changed ncurses handling a lot. pkg-config
support to detect ncurses is removed from configure.ac and
ncurses-config is used to detect it. But it even didn't allow to
change config file for cross compilation. However, it is fixed in
upstream later and pkg-config support is added back.

This commit adds two patches from upstream that adds pkg-config support
and allows specifying ncurses-config file as well. However preference is
first given to pkg-config and later nucrses-config file. It also first checks
for version 6 and later 5.

Config option that changed are, ncursesw is enabled by default and ncurses
is disabled by default. So we need to explicilty specify with/without wide
char support now. This new version also allows disabling widechar support.
But it can't be enabled if ncurses without widechar support is enabled.

While building ncurses package, we explicitly enable pkg-config support,
so we don't need to specify ncurses-config file, but it is specified for
completeness.

Fixes:
  http://autobuild.buildroot.net/results/4a2/4a25fb0d4546391d5dbbaa6cde17c45aeddb3549

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Cc: Carlos Santos <casantos@datacom.ind.br>
---
 ...1-build-sys-prefer-pkg-config-for-ncurses.patch | 76 ++++++++++++++++++
 .../0002-build-sys-cleanup-UL_NCURSES_CHECK.patch  | 91 ++++++++++++++++++++++
 package/util-linux/Config.in                       |  4 -
 package/util-linux/util-linux.mk                   | 18 ++++-
 4 files changed, 184 insertions(+), 5 deletions(-)
 create mode 100644 package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch
 create mode 100644 package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch

diff --git a/package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch b/package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch
new file mode 100644
index 0000000..ca22ee2
--- /dev/null
+++ b/package/util-linux/0001-build-sys-prefer-pkg-config-for-ncurses.patch
@@ -0,0 +1,76 @@
+From 3f7429fd2d539c7f948f72bd829404b55ac19d9f Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 12 Dec 2016 15:23:53 +0100
+Subject: [PATCH] build-sys: prefer pkg-config for ncurses
+
+and use ncurses{5,6}-config as fallback only.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ m4/ul.m4 | 48 ++++++++++++++++++++++++++++--------------------
+ 1 file changed, 28 insertions(+), 20 deletions(-)
+
+diff --git a/m4/ul.m4 b/m4/ul.m4
+index c569c36..44c721e 100644
+--- a/m4/ul.m4
++++ b/m4/ul.m4
+@@ -438,28 +438,36 @@ dnl The expected <name> is ncurses or ncursesw.
+ dnl
+ AC_DEFUN([UL_NCURSES_CHECK], [
+   m4_define([suffix], $1)
++  m4_define([suffixup], m4_toupper($1))
++
++  # pkg-config
++  PKG_CHECK_MODULES(suffixup, [$1], [
++    have_[]suffix=yes
++    NCURSES_LIBS=${suffixup[]_LIBS}
++    NCURSES_CFLAGS=${suffixup[]_CFLAGS}
++  ],[have_[]suffix=no])
+ 
+   # ncurses-config should be everywhere, pkg-config is not supported by default
+   # by ncurses upstream
+   #
+-  AC_MSG_CHECKING([$1])
+-  if AC_RUN_LOG([suffix[]6-config --version >/dev/null]); then
+-    have_[]suffix=yes
+-    NCURSES_LIBS=`suffix[]6-config --libs`
+-    NCURSES_CFLAGS=`suffix[]6-config --cflags`
+-    AC_MSG_RESULT([(v6) yes])
+-  elif AC_RUN_LOG([suffix[]5-config --version >/dev/null]); then
+-    have_[]suffix=yes
+-    NCURSES_LIBS=`suffix[]5-config --libs`
+-    NCURSES_CFLAGS=`suffix[]5-config --cflags`
+-    AC_MSG_RESULT([(v5) yes])
+-  else
+-    AC_MSG_RESULT([no])
+-
+-    # fallback
+-    AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
+-    AS_IF([test "x$have_[]suffix" = xyes], [
+-      NCURSES_LIBS="-l[]suffix"
+-    ])
+-  fi
++  AS_IF([test "x$have_[]suffix" = xno], [
++    AC_MSG_CHECKING([$1 config])
++    if AC_RUN_LOG([suffix[]6-config --version >/dev/null]); then
++      have_[]suffix=yes
++      NCURSES_LIBS=`suffix[]6-config --libs`
++      NCURSES_CFLAGS=`suffix[]6-config --cflags`
++      AC_MSG_RESULT([(v6) yes])
++    elif AC_RUN_LOG([suffix[]5-config --version >/dev/null]); then
++      have_[]suffix=yes
++      NCURSES_LIBS=`suffix[]5-config --libs`
++      NCURSES_CFLAGS=`suffix[]5-config --cflags`
++      AC_MSG_RESULT([(v5) yes])
++    else
++      AC_MSG_RESULT([no])
++      AS_IF([test "x$have_[]suffix" = xno], [
++        AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
++        AS_IF([test "x$have_[]suffix" = xyes], [NCURSES_LIBS="-l[]suffix"])
++      ])
++    fi
++  ])
+ ])
+-- 
+2.6.2
+
diff --git a/package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch b/package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
new file mode 100644
index 0000000..40810b2
--- /dev/null
+++ b/package/util-linux/0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
@@ -0,0 +1,91 @@
+From 862326451184bb0fe9c2b2b110fcfc986f9b1734 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 13 Dec 2016 12:41:18 +0100
+Subject: [PATCH] build-sys: cleanup UL_NCURSES_CHECK
+
+* use SUFFIX for upper-case suffix
+* use AC_CHECK_TOOL() to search for ncurses-config (thanks to Mike Frysinger)
+* separate checks by AS_IF()
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+---
+ m4/ul.m4 | 54 +++++++++++++++++++++++++++++++++---------------------
+ 1 file changed, 33 insertions(+), 21 deletions(-)
+
+diff --git a/m4/ul.m4 b/m4/ul.m4
+index 44c721e..f8a0dd7 100644
+--- a/m4/ul.m4
++++ b/m4/ul.m4
+@@ -438,36 +438,48 @@ dnl The expected <name> is ncurses or ncursesw.
+ dnl
+ AC_DEFUN([UL_NCURSES_CHECK], [
+   m4_define([suffix], $1)
+-  m4_define([suffixup], m4_toupper($1))
++  m4_define([SUFFIX], m4_toupper($1))
+ 
+-  # pkg-config
+-  PKG_CHECK_MODULES(suffixup, [$1], [
++  # pkg-config (not supported by ncurses upstream by default)
++  #
++  PKG_CHECK_MODULES(SUFFIX, [$1], [
+     have_[]suffix=yes
+-    NCURSES_LIBS=${suffixup[]_LIBS}
+-    NCURSES_CFLAGS=${suffixup[]_CFLAGS}
++    NCURSES_LIBS=${SUFFIX[]_LIBS}
++    NCURSES_CFLAGS=${SUFFIX[]_CFLAGS}
+   ],[have_[]suffix=no])
+ 
+-  # ncurses-config should be everywhere, pkg-config is not supported by default
+-  # by ncurses upstream
++  # ncurses6-config
+   #
+   AS_IF([test "x$have_[]suffix" = xno], [
+-    AC_MSG_CHECKING([$1 config])
+-    if AC_RUN_LOG([suffix[]6-config --version >/dev/null]); then
++    AC_CHECK_TOOL(SUFFIX[]6_CONFIG, suffix[]6-config)
++    if AC_RUN_LOG([$SUFFIX[]6_CONFIG --version >/dev/null]); then
+       have_[]suffix=yes
+-      NCURSES_LIBS=`suffix[]6-config --libs`
+-      NCURSES_CFLAGS=`suffix[]6-config --cflags`
+-      AC_MSG_RESULT([(v6) yes])
+-    elif AC_RUN_LOG([suffix[]5-config --version >/dev/null]); then
++      NCURSES_LIBS=`$SUFFIX[]6_CONFIG --libs`
++      NCURSES_CFLAGS=`$SUFFIX[]6_CONFIG --cflags`
++    else
++      have_[]suffix=no
++    fi
++  ])
++
++  # ncurses5-config
++  #
++  AS_IF([test "x$have_[]suffix" = xno], [
++    AC_CHECK_TOOL(SUFFIX[]5_CONFIG, suffix[]5-config)
++    if AC_RUN_LOG([$SUFFIX[]5_CONFIG --version >/dev/null]); then
+       have_[]suffix=yes
+-      NCURSES_LIBS=`suffix[]5-config --libs`
+-      NCURSES_CFLAGS=`suffix[]5-config --cflags`
+-      AC_MSG_RESULT([(v5) yes])
++      NCURSES_LIBS=`$SUFFIX[]5_CONFIG --libs`
++      NCURSES_CFLAGS=`$SUFFIX[]5_CONFIG --cflags`
+     else
+-      AC_MSG_RESULT([no])
+-      AS_IF([test "x$have_[]suffix" = xno], [
+-        AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
+-        AS_IF([test "x$have_[]suffix" = xyes], [NCURSES_LIBS="-l[]suffix"])
+-      ])
++      have_[]suffix=no
+     fi
+   ])
++
++  # classic autoconf way
++  #
++  AS_IF([test "x$have_[]suffix" = xno], [
++    AS_IF([test "x$have_[]suffix" = xno], [
++      AC_CHECK_LIB([$1], [initscr], [have_[]suffix=yes], [have_[]suffix=no])
++      AS_IF([test "x$have_[]suffix" = xyes], [NCURSES_LIBS="-l[]suffix"])
++    ])
++  ])
+ ])
+-- 
+2.6.2
+
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 9b70f9f..e957f84 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -1,6 +1,5 @@
 menuconfig BR2_PACKAGE_UTIL_LINUX
 	bool "util-linux"
-	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Various useful/essential linux libraries and utilities.
@@ -370,6 +369,3 @@ config BR2_PACKAGE_UTIL_LINUX_ZRAMCTL
 	  Set up and control zram devices
 
 endif
-
-comment "util-linux needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 1bf2046..bec6993 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -9,6 +9,10 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
+# For 0001-build-sys-prefer-pkg-config-for-ncurses.patch and
+# 0002-build-sys-cleanup-UL_NCURSES_CHECK.patch
+UTIL_LINUX_AUTORECONF = YES
+
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
 UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, LGPLv2.1+ (libblkid, libfdisk, libmount), BSD-3c (libuuid)
@@ -43,8 +47,20 @@ endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 UTIL_LINUX_DEPENDENCIES += ncurses
+ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
+UTIL_LINUX_CONF_OPTS += --with-ncursesw
+UTIL_LINUX_CONF_ENV += NCURSESW5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+else
+UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
+UTIL_LINUX_CONF_ENV += NCURSES5_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+endif
 else
-UTIL_LINUX_CONF_OPTS += --without-ncurses
+ifeq ($(BR2_USE_WCHAR),y)
+UTIL_LINUX_CONF_OPTS += --enable-widechar
+else
+UTIL_LINUX_CONF_OPTS += --disable-widechar
+endif
+UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
-- 
2.6.2
