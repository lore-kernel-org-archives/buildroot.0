From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 22:59:27 +0200
Subject: [Buildroot] [git commit] module-init-tools: remove package
Message-ID: <20130902213322.196C99B6B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94c72087f386cbb11bbb9011849508628503f316
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit removes the module-init-tools package and adds the
relevant Config.in.legacy entries to ease the migration for users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in.legacy                                   |   11 +++++
 package/Config.in                                  |    3 -
 package/module-init-tools/Config.in                |    9 ----
 ...nit-tools-3.15-add-manpages-config-option.patch |   47 --------------------
 package/module-init-tools/module-init-tools.mk     |   28 ------------
 5 files changed, 11 insertions(+), 87 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 30a44c6..4f30b2b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -45,6 +45,17 @@ comment "build, or run, in unpredictable ways.               "
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2013.11"
+
+config BR2_PACKAGE_MODULE_INIT_TOOLS
+	bool "module-init-tools replaced by kmod"
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_KMOD_TOOLS
+	help
+	  The 'module-init-tools' package has been removed, since it
+	  has been depracated upstream and replaced by 'kmod'.
+
+###############################################################################
 comment "Legacy options removed in 2013.08"
 
 config BR2_ARM_OABI
diff --git a/package/Config.in b/package/Config.in
index 9b8bc70..a94cb62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -907,9 +907,6 @@ source "package/htop/Config.in"
 source "package/keyutils/Config.in"
 source "package/kmod/Config.in"
 source "package/lxc/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-source "package/module-init-tools/Config.in"
-endif
 source "package/monit/Config.in"
 source "package/ncdu/Config.in"
 source "package/numactl/Config.in"
diff --git a/package/module-init-tools/Config.in b/package/module-init-tools/Config.in
deleted file mode 100644
index 77e3bce..0000000
--- a/package/module-init-tools/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_MODULE_INIT_TOOLS
-	bool "module-init-tools"
-	help
-	  The module-init-tools package contains a set of programs for
-	  loading, inserting, and removing kernel modules for Linux
-	  (versions 2.5.48 and above). It serves the same function that
-	  the "modutils" package serves for Linux 2.4.
-
-	  http://www.kernel.org/pub/linux/utils/kernel/module-init-tools/
diff --git a/package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch b/package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
deleted file mode 100644
index 28f51de..0000000
--- a/package/module-init-tools/module-init-tools-3.15-add-manpages-config-option.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Disable manual pages generation when docbook2man is not available.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.am  |    7 ++++++-
- configure.ac |    7 +++----
- 2 files changed, 9 insertions(+), 5 deletions(-)
-
-Index: module-init-tools-3.11/Makefile.am
-===================================================================
---- module-init-tools-3.11.orig/Makefile.am
-+++ module-init-tools-3.11/Makefile.am
-@@ -39,7 +39,12 @@
- MAN5 = modprobe.conf.5 modules.dep.5 depmod.conf.5 modprobe.d.5
- MAN8 = depmod.8 insmod.8 lsmod.8 rmmod.8 modprobe.8 modinfo.8
- SGML = $(addprefix doc/,  $(MAN5:%.5=%.sgml) $(MAN8:%.8=%.sgml))
--dist_man_MANS = $(MAN5) $(MAN8)
-+
-+if HAVE_DOCBOOKTOMAN
-+MANPAGES  = $(MAN5) $(MAN8)
-+endif
-+dist_man_MANS = $(MANPAGES)
-+
- # If they haven't overridden mandir, fix it (never /man!)
- mandir =$(shell if [ @mandir@ = $(prefix)/man ]; then if [ $(prefix) = / ]; then echo /usr/share/man; else echo $(prefix)/share/man; fi; else echo @mandir@; fi)
- 
-Index: module-init-tools-3.11/configure.ac
-===================================================================
---- module-init-tools-3.11.orig/configure.ac
-+++ module-init-tools-3.11/configure.ac
-@@ -29,13 +29,12 @@
- AC_PROG_CC
- AC_PROG_RANLIB
- 
--AC_CHECK_PROGS(DOCBOOKTOMAN, docbook-to-man docbook2man, [no],)
--if test x"$DOCBOOKTOMAN" = xno
-+AC_CHECK_PROGS(DOCBOOKTOMAN, docbook-to-man docbook2man)
-+if test x"$DOCBOOKTOMAN" = x
- then
- 	AC_MSG_WARN([docbook2man not found])
--	# fail with a meaningfull error if $DOCBOOKTOMAN called by the makefile
--	DOCBOOKTOMAN=docbook2man
- fi
-+AM_CONDITIONAL([HAVE_DOCBOOKTOMAN], [test "x$DOCBOOKTOMAN" != "x"])
-  
- # Delay adding the zlib_flags until after AC_PROG_CC, so we can distinguish
- # between a broken cc and a working cc but missing libz.a.
diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
deleted file mode 100644
index 88abec4..0000000
--- a/package/module-init-tools/module-init-tools.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# module-init-tools
-#
-################################################################################
-
-MODULE_INIT_TOOLS_VERSION = 3.15
-MODULE_INIT_TOOLS_SOURCE = module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
-MODULE_INIT_TOOLS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/module-init-tools/
-MODULE_INIT_TOOLS_LICENSE = GPLv2+
-MODULE_INIT_TOOLS_LICENSE_FILES = COPYING
-
-MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
-MODULE_INIT_TOOLS_CONF_OPT = \
-	--disable-static-utils \
-	--disable-builddir \
-	--program-transform-name=''
-
-# module-init-tools-3.15-add-manpages-config-option.patch is modifying
-# configure.ac and Makefile.am
-MODULE_INIT_TOOLS_AUTORECONF = YES
-HOST_MODULE_INIT_TOOLS_AUTORECONF = YES
-HOST_MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
-HOST_MODULE_INIT_TOOLS_CONF_OPT = --disable-static-utils
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-
