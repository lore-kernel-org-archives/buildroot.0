From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Dec 2015 14:57:27 -0300
Subject: [Buildroot] [PATCH] rrdtool: add patch to disable documentation
Message-ID: <1449079047-8426-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to disable documentation. Fixes:
http://autobuild.buildroot.net/results/6fb/6fb94127af6ff53bdcf52ee0eec8971ccd8858f5/

Patch status: pull req https://github.com/oetiker/rrdtool-1.x/pull/690

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...configure-option-to-disable-documentation.patch | 71 ++++++++++++++++++++++
 package/rrdtool/rrdtool.mk                         |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch

diff --git a/package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch b/package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch
new file mode 100644
index 0000000..afb6292
--- /dev/null
+++ b/package/rrdtool/0001-Add-configure-option-to-disable-documentation.patch
@@ -0,0 +1,71 @@
+From deaef0790f3cbbce826275d3564551fc9568b628 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 2 Dec 2015 14:31:52 -0300
+Subject: [PATCH] Add configure option to disable documentation
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ Makefile.am  | 6 +++++-
+ configure.ac | 8 ++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index f45975c..1f46a9b 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,7 +5,11 @@ RSYNC = rsync --rsh=ssh
+ 
+ # build the following subdirectories
+ 
+-SUBDIRS = po src doc bindings tests
++SUBDIRS = po src bindings tests
++
++if BUILD_DOCS
++SUBDIRS += doc
++endif
+ 
+ if BUILD_EXAMPLES
+ SUBDIRS += examples
+diff --git a/configure.ac b/configure.ac
+index dc70e7d..7460c67 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,6 +100,9 @@ AC_ARG_VAR(RRDGRAPH_YLEGEND_ANGLE,
+ AC_DEFINE_UNQUOTED(RRDGRAPH_YLEGEND_ANGLE,${RRDGRAPH_YLEGEND_ANGLE:-90.0},
+  [Vertical label angle: -90.0 (default) or 90.0])
+ 
++AC_ARG_ENABLE(docs,AS_HELP_STRING([--disable-docs],[disable building documentation]),
++[],[enable_docs=yes])
++
+ AC_ARG_ENABLE(examples,AS_HELP_STRING([--disable-examples],[disable building of examples]),
+ [],[enable_examples=yes])
+ 
+@@ -115,6 +118,7 @@ AC_ARG_ENABLE(rrd_graph,AS_HELP_STRING([--disable-rrd_graph],[disable all rrd_gr
+ AC_ARG_ENABLE(rrd_restore,AS_HELP_STRING([--disable-rrd_restore],[disable rrd_restore XML import functions]),
+ [],[enable_rrd_restore=yes])
+ 
++AM_CONDITIONAL(BUILD_DOCS,[test $enable_docs != no])
+ AM_CONDITIONAL(BUILD_EXAMPLES,[test $enable_examples != no])
+ AM_CONDITIONAL(BUILD_RRDCGI,[test $enable_rrdcgi != no])
+ AM_CONDITIONAL(BUILD_RRDCACHED,[test $enable_rrdcached != no])
+@@ -945,6 +949,8 @@ fi
+ 
+ AC_SUBST(COMP_PYTHON)
+ 
++if test $enable_docs != no; then
++
+ dnl Check for nroff
+ AC_ARG_VAR(NROFF, [path to the local nroff version])
+ AC_PATH_PROGS(NROFF, [gnroff nroff])
+@@ -961,6 +967,8 @@ AC_ARG_VAR(RRDDOCDIR, [[DATADIR/doc/PACKAGE-VERSION] Documentation directory])
+ if test -z "$RRDDOCDIR"; then
+    RRDDOCDIR='${datadir}/doc/${PACKAGE}-${VERSION}'; fi
+ 
++fi
++
+ # systemd check
+ PKG_PROG_PKG_CONFIG
+ AC_ARG_WITH([systemdsystemunitdir],
+-- 
+2.4.10
+
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index bc2fa89..0bc7c38 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -9,6 +9,9 @@ RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
+# For 0001-Add-configure-option-to-disable-documentation.patch
+RRDTOOL_AUTORECONF = YES
+RRDTOOL_GETTEXTIZE = YES
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_OPTS = \
 	--disable-examples \
-- 
2.4.10
