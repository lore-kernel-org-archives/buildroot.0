From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jan 2017 09:02:59 +0100
Subject: [Buildroot] [git commit] package/systemd-bootchart: bump version
Message-ID: <20170101080322.23BA68184E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d7b6a470f5ed006dfd48c7c8ee504f02677c812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get rid of our patch, applied upstream. Which means we no longer need to
run intltoolize. So drop the dependency on host-intltool

Fixes:
    http://autobuild.buildroot.net/results/696/696254009f830134ef9398369ca2cbb257b33f52/
    http://autobuild.buildroot.org/results/aca/aca210de7d3f2eda54e5630206e9ff80d72d85c5/
    http://autobuild.buildroot.org/results/e5d/e5df8d11bfce4ba7a4c5c760b4784c31c506d8d4/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure-add-option-to-not-build-manpages.patch | 59 ----------------------
 package/systemd-bootchart/systemd-bootchart.hash   |  2 +-
 package/systemd-bootchart/systemd-bootchart.mk     | 16 ++----
 3 files changed, 6 insertions(+), 71 deletions(-)

diff --git a/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch b/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
deleted file mode 100644
index ea9f8f2..0000000
--- a/package/systemd-bootchart/0001-configure-add-option-to-not-build-manpages.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 60a581253331ac38721a12495909d073eff703b7 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 13 Aug 2016 18:47:17 +0200
-Subject: [PATCH] configure: add option to not build manpages
-
-Man pages are not always needed, especially on embedded systems.
-
-Add a configure option to not build them; by default, build them.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
-Patch sent upstream:
-    https://github.com/systemd/systemd-bootchart/pull/14
----
- Makefile.am  |  5 ++++-
- configure.ac | 10 +++++++++-
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index a71f8d8..e6510d5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -74,7 +74,10 @@ EXTRA_DIST = \
- MANPAGES = man/bootchart.conf.5 man/systemd-bootchart.1
- MANPAGES_ALIAS = man/bootchart.conf.d.5
- 
--man_MANS = $(MANPAGES) $(MANPAGES_ALIAS)
-+if COND_man
-+MAYBE_MANPAGES = $(MANPAGES) $(MANPAGES_ALIAS)
-+endif
-+man_MANS = $(MAYBE_MANPAGES)
- 
- man/bootchart.conf.d.5: man/bootchart.conf.5
- 
-diff --git a/configure.ac b/configure.ac
-index f8e62d8..90e8b03 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -167,8 +167,16 @@ AC_ARG_WITH([rootlibdir],
- AC_SUBST([rootprefix], [$with_rootprefix])
- AC_SUBST([rootlibdir], [$with_rootlibdir])
- 
-+AC_ARG_ENABLE([man],
-+        AS_HELP_STRING([--diable-man],[Build the man pages (default: yes)]),
-+        [build_man=$enableval],
-+        [build_man=yes])
-+
- AC_PATH_PROG([XSLTPROC], [xsltproc])
--AS_IF([test -z "$XSLTPROC"], AC_MSG_ERROR([*** xsltproc is required for man pages]))
-+AS_IF([test -z "$XSLTPROC" -a "$build_man" = "yes"],
-+                [AC_MSG_ERROR([*** xsltproc is required for man pages])])
-+
-+AM_CONDITIONAL([COND_man],[test "$build_man" = "yes"])
- 
- AC_CONFIG_FILES([
-         Makefile
--- 
-2.7.4
-
diff --git a/package/systemd-bootchart/systemd-bootchart.hash b/package/systemd-bootchart/systemd-bootchart.hash
index c347ef5..2d2175a 100644
--- a/package/systemd-bootchart/systemd-bootchart.hash
+++ b/package/systemd-bootchart/systemd-bootchart.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 8cfea4f604c00289394a4429f934e19f80dceafbe0ae1846e00997f70d81a20f systemd-bootchart-230.tar.xz
+sha256 1ef7b4f440bf53aced26979cf8153482840699c556700671eb5dadb4222c70bd systemd-bootchart-231.tar.xz
diff --git a/package/systemd-bootchart/systemd-bootchart.mk b/package/systemd-bootchart/systemd-bootchart.mk
index 354270e..31b9413 100644
--- a/package/systemd-bootchart/systemd-bootchart.mk
+++ b/package/systemd-bootchart/systemd-bootchart.mk
@@ -4,22 +4,16 @@
 #
 ################################################################################
 
-SYSTEMD_BOOTCHART_VERSION = 230
+SYSTEMD_BOOTCHART_VERSION = 231
 SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
-# Do not use the github helper here, the generated tarball is *NOT* the same
-# as the one uploaded by upstream for the release.
+# Do not use the github helper here: the uploaded release tarball already
+# contains the generated autotools scripts. It also slightly differs with
+# two missing source files... :-/
 SYSTEMD_BOOTCHART_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(SYSTEMD_BOOTCHART_VERSION)
 SYSTEMD_BOOTCHART_LICENSE = LGPLv2.1+
 SYSTEMD_BOOTCHART_LICENSE_FILES = LICENSE.LGPL2.1
-SYSTEMD_BOOTCHART_DEPENDENCIES = host-intltool systemd
+SYSTEMD_BOOTCHART_DEPENDENCIES = systemd
 
-# 0001-configure-add-option-to-not-build-manpages.patch
-SYSTEMD_BOOTCHART_AUTORECONF = YES
 SYSTEMD_BOOTCHART_CONF_OPTS = --disable-man
 
-define SYSTEMD_BOOTCHART_INTLTOOLIZE
-	cd $(@D) && $(HOST_DIR)/usr/bin/intltoolize --force --automake
-endef
-SYSTEMD_BOOTCHART_PRE_CONFIGURE_HOOKS = SYSTEMD_BOOTCHART_INTLTOOLIZE
-
 $(eval $(autotools-package))
