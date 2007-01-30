From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 30 Jan 2007 09:33:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070130173353.AD755485BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-30 09:33:53 -0800 (Tue, 30 Jan 2007)
New Revision: 17672

Log:
- make absolutely sure that we are not trying to go into jobserver mode for MAKE1


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-01-30 17:26:38 UTC (rev 17671)
+++ trunk/buildroot/package/Makefile.in	2007-01-30 17:33:53 UTC (rev 17672)
@@ -1,5 +1,8 @@
-MAKE1=make
-MAKE=make -j$(BR2_JLEVEL)
+ifndef MAKE
+MAKE=make
+endif
+MAKE1:=$(MAKE) MAKE="$(firstword $(MAKE)) -j1"
+MAKE:=$(MAKE) -j$(BR2_JLEVEL)
 
 # Strip off the annoying quoting
 ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
