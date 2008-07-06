From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  5 Jul 2008 23:23:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080706062322.87AFD3C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-05 23:23:21 -0700 (Sat, 05 Jul 2008)
New Revision: 22659

Log:
Avoid duplicate downloading, when rebuilding failed package like libgtk2

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-07-06 06:19:12 UTC (rev 22658)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-07-06 06:23:21 UTC (rev 22659)
@@ -132,7 +132,7 @@
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
 ifeq ($(MAKELEVEL),1)
-	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 else
 	$(call MESSAGE,"Downloading")
@@ -395,3 +395,5 @@
 endef
 
 # :mode=makefile:
+
+
