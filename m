From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 00:34:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20070720073428.0CF43A6806@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 00:34:28 -0700 (Fri, 20 Jul 2007)
New Revision: 19166

Log:
make source-check without permanently changing WGET command

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-07-19 22:50:47 UTC (rev 19165)
+++ trunk/buildroot/Makefile	2007-07-20 07:34:28 UTC (rev 19166)
@@ -252,13 +252,9 @@
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
-.config.check: dependencies
-	$(SED) '/BR2_WGET/s/\"$$/ --spider\"/g' .config
-	touch $@
+_source-check: 
+	$(MAKE) SPIDER=--spider source
 
-_source-check: .config.check
-	$(MAKE) source
-
 #############################################################
 #
 # Cleanup and misc junk

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-19 22:50:47 UTC (rev 19165)
+++ trunk/buildroot/package/Makefile.in	2007-07-20 07:34:28 UTC (rev 19166)
@@ -12,7 +12,7 @@
 # Strip off the annoying quoting
 ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
 #"))
-WGET:=$(strip $(subst ",, $(BR2_WGET)))
+WGET:=$(strip $(subst ",, $(BR2_WGET))) $(SPIDER)
 #"))
 SVN:=$(strip $(subst ",, $(BR2_SVN)))
 #"))
