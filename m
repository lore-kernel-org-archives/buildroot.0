From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 21 Oct 2008 01:56:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package project
Message-ID: <20081021085626.D8EBA3C6C2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-21 01:56:26 -0700 (Tue, 21 Oct 2008)
New Revision: 23750

Log:
buildroot: add QUIET variable and use it for wget/git/svn/configure

A lot of tools take a -q option to be quiet.
Set this if make is called with the -s (silent) option and use for
wget, git, svn and configure.

Modified:
   trunk/buildroot/package/Makefile.autotools.in
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-10-21 08:56:15 UTC (rev 23749)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-10-21 08:56:26 UTC (rev 23750)
@@ -225,8 +225,7 @@
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
-		$(if $(findstring s,$(MAKEFLAGS)),--quiet,) \
-		$($(PKG)_CONF_OPT)
+		$(QUIET) $($(PKG)_CONF_OPT)
 	$(Q)touch $@
 
 # Build

Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2008-10-21 08:56:15 UTC (rev 23749)
+++ trunk/buildroot/project/Makefile.in	2008-10-21 08:56:26 UTC (rev 23750)
@@ -5,17 +5,19 @@
 BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 #"))
 
+# silent mode requested?
+QUIET:=$(if $(findstring s,$(MAKEFLAGS)),-q,)
 
 # Strip off the annoying quoting
 ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
 #"))
-WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER)
+WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER) $(QUIET)
 #"))
-SVN_CO:=$(strip $(subst ",, $(BR2_SVN_CO)))
+SVN_CO:=$(strip $(subst ",, $(BR2_SVN_CO))) $(QUIET)
 #"))
-SVN_UP:=$(strip $(subst ",, $(BR2_SVN_UP)))
+SVN_UP:=$(strip $(subst ",, $(BR2_SVN_UP))) $(QUIET)
 #"))
-GIT:=$(strip $(subst ",, $(BR2_GIT)))
+GIT:=$(strip $(subst ",, $(BR2_GIT))) $(QUIET)
 #"))
 ZCAT:=$(strip $(subst ",, $(BR2_ZCAT)))
 #"))
@@ -24,7 +26,6 @@
 TAR_OPTIONS=$(subst ",, $(BR2_TAR_OPTIONS)) -xf
 #")
 
-
 # Buildroot supports building out of tree similarly to the Linux kernel.
 # To use, add O= to the make command line (make O=/tmp/build)
 BASE_DIR:=$(shell pwd)
