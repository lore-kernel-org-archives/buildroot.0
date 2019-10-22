From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 21:48:30 +0200
Subject: [Buildroot] [git commit] package/lttng-libust: bump version to
 2.11.0
Message-ID: <20191022194941.9A40E83CBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d66135639872aa928936e6608f5f64be83d94c0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove
`0001-configure.ac-add-disable-examples-option-to-not-buil.patch` as
the `--disable-examples` option exists in LTTng-UST 2.11.0.

Also handle numactl as an optional dependency.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-add-disable-examples-option-to-not-buil.patch | 68 ----------------------
 package/lttng-libust/lttng-libust.hash             |  4 +-
 package/lttng-libust/lttng-libust.mk               | 11 +++-
 3 files changed, 10 insertions(+), 73 deletions(-)

diff --git a/package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch b/package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch
deleted file mode 100644
index ef817e44bb..0000000000
--- a/package/lttng-libust/0001-configure.ac-add-disable-examples-option-to-not-buil.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 08aa9a26779d4ede3de7857fafd03bd6331ba948 Mon Sep 17 00:00:00 2001
-From: Philippe Proulx <eeppeliteloop@gmail.com>
-Date: Mon, 6 Nov 2017 15:46:03 -0500
-Subject: [PATCH] configure.ac: add --disable-examples option to not
- build/install examples
-
-Some environments and distributions do not need the LTTng-UST examples
-to be built because they remove them anyway. Continue to build them by
-default, but add --disable-examples to explicitly disable them.
-
-Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
-[Philippe: backport from upstream commit 08aa9a26]
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- configure.ac    | 16 ++++++++++++++++
- doc/Makefile.am |  6 +++++-
- 2 files changed, 21 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 10087f3f..68f41315 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -423,6 +423,19 @@ AC_DEFINE_UNQUOTED([LTTNG_SYSTEM_RUNDIR], ["$lttng_system_rundir"],
- AC_CHECK_PROG([BUILD_GEN_TP_EXAMPLES], [python], ["yes"])
- AM_CONDITIONAL([BUILD_GEN_TP_EXAMPLES], [test "x$BUILD_GEN_TP_EXAMPLES" = "xyes"])
-
-+# Enable building examples
-+AC_ARG_ENABLE(
-+	examples,
-+	AS_HELP_STRING(
-+		[--disable-examples],
-+		[Do not build and install examples]
-+	),
-+	[enable_examples=$enableval],
-+	[enable_examples=yes]
-+)
-+
-+AM_CONDITIONAL([ENABLE_EXAMPLES], [test "x$enable_examples" != "xno"])
-+
- # Set $IN_GIT_REPO if we're in the Git repository; the `bootstrap` file
- # is not distributed in tarballs.
- AS_IF([test -f "$srcdir/bootstrap"], [in_git_repo=yes], [in_git_repo=no])
-@@ -596,6 +609,9 @@ PPRINT_PROP_BOOL([NUMA], $value)
- AS_ECHO
- PPRINT_SET_INDENT(0)
-
-+test "x$enable_examples" = xyes && value=1 || value=0
-+PPRINT_PROP_BOOL([Build and install examples], $value, $PPRINT_COLOR_SUBTITLE)
-+
- # man pages build enabled/disabled
- m4_pushdef([build_man_pages_msg], [Build and install man pages])
-
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index e110ed85..a67c8c22 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -1,3 +1,7 @@
--SUBDIRS = . man examples
-+SUBDIRS = . man
-+
-+if ENABLE_EXAMPLES
-+SUBDIRS += examples
-+endif
-
- dist_doc_DATA = java-agent.txt
---
-2.15.0
-
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 2767332545..85e1acc261 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,5 +1,5 @@
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.5.tar.bz2.sha256
-sha256 06f9ed9b2198855b1c7fcbf15fe57297ee259409ffa1b3bad87321412d98bc35  lttng-ust-2.10.5.tar.bz2
+# From https://lttng.org/files/lttng-ust/lttng-ust-2.11.0.tar.bz2.sha256
+sha256 683280cfe5e12021e64c32cef9eeb0128f1f23dec32ba28adb5a2074be37c4d8  lttng-ust-2.11.0.tar.bz2
 
 # Hash for license file
 sha256 74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index ec855c5a5e..0c2fdb57ef 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,15 +5,13 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.10.5
+LTTNG_LIBUST_VERSION = 2.11.0
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES = liburcu util-linux
 LTTNG_LIBUST_CONF_OPTS += --disable-man-pages --disable-examples
-# 0001-configure.ac-add-disable-examples-option-to-not-buil.patch
-LTTNG_LIBUST_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
@@ -26,4 +24,11 @@ LTTNG_LIBUST_CONF_ENV = am_cv_pathless_PYTHON="none"
 LTTNG_LIBUST_CONF_OPTS += --disable-python-agent
 endif
 
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+LTTNG_LIBUST_DEPENDENCIES += numactl
+LTTNG_LIBUST_CONF_OPTS += --enable-numa
+else
+LTTNG_LIBUST_CONF_OPTS += --disable-numa
+endif
+
 $(eval $(autotools-package))
