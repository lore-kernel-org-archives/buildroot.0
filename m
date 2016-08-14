From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Aug 2016 16:01:54 +0200
Subject: [Buildroot] [git commit] package/systemd-bootchart: don't build
	manpages
Message-ID: <20160814140232.AC5D680395@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2e56724a3348ecf1dc57fb683c1f22ac5334a8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the man pages requires xsltproc, which is not always available
on the build machine, so the build fails at configure:
    configure: error: *** xsltproc is required for man pages

But then, even when xsltproc is present, it can't actually build the man
pages, because it can't "download external entities":
    I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
    warning: failed to load external entity "http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
    compilation error: file ./man/custom-man.xsl line 27 element import

Add a patch (sent upstream) to allow not building the man pages.

Fixes:
    http://autobuild.buildroot.org/results/e2a/e2ae38775b6acff3c3a8ea233ec70dd68b017319/
    http://autobuild.buildroot.org/results/66d/66d85622db9f7ff5a4e8d6eed3fd3b32959685cf/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-add-option-to-not-build-manpages.patch | 59 ++++++++++++++++++++++
 package/systemd-bootchart/systemd-bootchart.mk     | 11 +++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch b/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
new file mode 100644
index 0000000..ea9f8f2
--- /dev/null
+++ b/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
@@ -0,0 +1,59 @@
+From 60a581253331ac38721a12495909d073eff703b7 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sat, 13 Aug 2016 18:47:17 +0200
+Subject: [PATCH] configure: add option to not build manpages
+
+Man pages are not always needed, especially on embedded systems.
+
+Add a configure option to not build them; by default, build them.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+Patch sent upstream:
+    https://github.com/systemd/systemd-bootchart/pull/14
+---
+ Makefile.am  |  5 ++++-
+ configure.ac | 10 +++++++++-
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a71f8d8..e6510d5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -74,7 +74,10 @@ EXTRA_DIST = \
+ MANPAGES = man/bootchart.conf.5 man/systemd-bootchart.1
+ MANPAGES_ALIAS = man/bootchart.conf.d.5
+ 
+-man_MANS = $(MANPAGES) $(MANPAGES_ALIAS)
++if COND_man
++MAYBE_MANPAGES = $(MANPAGES) $(MANPAGES_ALIAS)
++endif
++man_MANS = $(MAYBE_MANPAGES)
+ 
+ man/bootchart.conf.d.5: man/bootchart.conf.5
+ 
+diff --git a/configure.ac b/configure.ac
+index f8e62d8..90e8b03 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -167,8 +167,16 @@ AC_ARG_WITH([rootlibdir],
+ AC_SUBST([rootprefix], [$with_rootprefix])
+ AC_SUBST([rootlibdir], [$with_rootlibdir])
+ 
++AC_ARG_ENABLE([man],
++        AS_HELP_STRING([--diable-man],[Build the man pages (default: yes)]),
++        [build_man=$enableval],
++        [build_man=yes])
++
+ AC_PATH_PROG([XSLTPROC], [xsltproc])
+-AS_IF([test -z "$XSLTPROC"], AC_MSG_ERROR([*** xsltproc is required for man pages]))
++AS_IF([test -z "$XSLTPROC" -a "$build_man" = "yes"],
++                [AC_MSG_ERROR([*** xsltproc is required for man pages])])
++
++AM_CONDITIONAL([COND_man],[test "$build_man" = "yes"])
+ 
+ AC_CONFIG_FILES([
+         Makefile
+-- 
+2.7.4
+
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index 4fdd712..3d91b05 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -11,6 +11,15 @@ SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
 SYSTEMD_BOOTCHART_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(SYSTEMD_BOOTCHART_VERSION)
 SYSTEMD_BOOTCHART_LICENSE = LGPLv2.1+
 SYSTEMD_BOOTCHART_LICENSE_FILES = LICENSE.LGPL2.1
-SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
+SYSTEMD_BOOTCHART_DEPENDENCIES = host-intltool systemd
+
+# 0001-configure-add-option-to-not-build-manpages.patch
+SYSTEMD_BOOTCHART_AUTORECONF = YES
+SYSTEMD_BOOTCHART_CONF_OPTS = --disable-man
+
+define SYSTEMD_BOOTCHART_INTLTOOLIZE
+        cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
+endef
+SYSTEMD_BOOTCHART_PRE_CONFIGURE_HOOKS = SYSTEMD_BOOTCHART_INTLTOOLIZE
 
 $(eval $(autotools-package))
