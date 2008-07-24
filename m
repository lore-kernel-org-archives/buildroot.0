From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 24 Jul 2008 06:38:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20080724133848.ABE913C884@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-24 06:38:39 -0700 (Thu, 24 Jul 2008)
New Revision: 22940

Log:
Makefile.autotools.in: fix make source-check/external-deps differently

The MAKELEVEL test is not that robust; It fails with the recent log
support or if buildroot is driven from an external Makefile.

Rework it to instead detect source-check/external-deps by the fact that
they set SPIDER.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-24 11:34:27 UTC (rev 22939)
+++ trunk/buildroot/Makefile	2008-07-24 13:38:39 UTC (rev 22940)
@@ -350,7 +350,7 @@
 
 external-deps:
 	@$(MAKE) -Bs BR2_WGET=$(TOPDIR)/toolchain/wget-show-external-deps.sh \
-	source
+		SPIDER=--spider source
 
 #############################################################
 #

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-07-24 11:34:27 UTC (rev 22939)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-07-24 13:38:39 UTC (rev 22940)
@@ -131,7 +131,7 @@
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
-ifeq ($(MAKELEVEL),1)
+ifneq ($(SPIDER),)
 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 else
