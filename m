From: Roland Franke <fli4l@franke-prem.de>
Date: Mon,  9 May 2016 22:10:35 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
Message-ID: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delete patch 0001-Add-configure-option-to-disable-documentation.patch
as this is now include in the new version.

Signed-off-by: Roland Franke <fli4l@franke-prem.de>
---
 ...configure-option-to-disable-documentation.patch | 71 ----------------------
 package/rrdtool/rrdtool.hash                       |  2 +-
 package/rrdtool/rrdtool.mk                         |  3 +-
 3 files changed, 2 insertions(+), 74 deletions(-)
 delete mode 100644 package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch

diff --git a/package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch b/package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch
deleted file mode 100644
index afb6292..0000000
--- a/package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From deaef0790f3cbbce826275d3564551fc9568b628 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 2 Dec 2015 14:31:52 -0300
-Subject: [PATCH] Add configure option to disable documentation
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- Makefile.am  | 6 +++++-
- configure.ac | 8 ++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index f45975c..1f46a9b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -5,7 +5,11 @@ RSYNC = rsync --rsh=ssh
- 
- # build the following subdirectories
- 
--SUBDIRS = po src doc bindings tests
-+SUBDIRS = po src bindings tests
-+
-+if BUILD_DOCS
-+SUBDIRS += doc
-+endif
- 
- if BUILD_EXAMPLES
- SUBDIRS += examples
-diff --git a/configure.ac b/configure.ac
-index dc70e7d..7460c67 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -100,6 +100,9 @@ AC_ARG_VAR(RRDGRAPH_YLEGEND_ANGLE,
- AC_DEFINE_UNQUOTED(RRDGRAPH_YLEGEND_ANGLE,${RRDGRAPH_YLEGEND_ANGLE:-90.0},
-  [Vertical label angle: -90.0 (default) or 90.0])
- 
-+AC_ARG_ENABLE(docs,AS_HELP_STRING([--disable-docs],[disable building documentation]),
-+[],[enable_docs=yes])
-+
- AC_ARG_ENABLE(examples,AS_HELP_STRING([--disable-examples],[disable building of examples]),
- [],[enable_examples=yes])
- 
-@@ -115,6 +118,7 @@ AC_ARG_ENABLE(rrd_graph,AS_HELP_STRING([--disable-rrd_graph],[disable all rrd_gr
- AC_ARG_ENABLE(rrd_restore,AS_HELP_STRING([--disable-rrd_restore],[disable rrd_restore XML import functions]),
- [],[enable_rrd_restore=yes])
- 
-+AM_CONDITIONAL(BUILD_DOCS,[test $enable_docs != no])
- AM_CONDITIONAL(BUILD_EXAMPLES,[test $enable_examples != no])
- AM_CONDITIONAL(BUILD_RRDCGI,[test $enable_rrdcgi != no])
- AM_CONDITIONAL(BUILD_RRDCACHED,[test $enable_rrdcached != no])
-@@ -945,6 +949,8 @@ fi
- 
- AC_SUBST(COMP_PYTHON)
- 
-+if test $enable_docs != no; then
-+
- dnl Check for nroff
- AC_ARG_VAR(NROFF, [path to the local nroff version])
- AC_PATH_PROGS(NROFF, [gnroff nroff])
-@@ -961,6 +967,8 @@ AC_ARG_VAR(RRDDOCDIR, [[DATADIR/doc/PACKAGE-VERSION] Documentation directory])
- if test -z "$RRDDOCDIR"; then
-    RRDDOCDIR='${datadir}/doc/${PACKAGE}-${VERSION}'; fi
- 
-+fi
-+
- # systemd check
- PKG_PROG_PKG_CONFIG
- AC_ARG_WITH([systemdsystemunitdir],
--- 
-2.4.10
-
diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 97741c9..3422ad7 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9832775479684b8f94767201ee0440a1cacdbbbb7dd6736eb96b9a0750644ce8	rrdtool-1.5.6.tar.gz
+sha256	cd948e89cd2d8825fab4a6fb0323f810948d934af7d92c9ee8b5e9e1350e52d7  rrdtool-1.6.0.tar.gz
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 6d6ab0c..f3c7451 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.5.6
+RRDTOOL_VERSION = 1.6.0
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
-# For 0001-Add-configure-option-to-disable-documentation.patch
 RRDTOOL_AUTORECONF = YES
 RRDTOOL_GETTEXTIZE = YES
 RRDTOOL_INSTALL_STAGING = YES
-- 
1.9.1
