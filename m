From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 17 Jul 2007 05:09:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070717120909.609D83006B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-17 05:09:07 -0700 (Tue, 17 Jul 2007)
New Revision: 19131

Log:
Ensure we use host 'make', even when building 'make' in buildroot

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-17 12:06:01 UTC (rev 19130)
+++ trunk/buildroot/package/Makefile.in	2007-07-17 12:09:07 UTC (rev 19131)
@@ -1,9 +1,14 @@
-ifndef MAKE
-MAKE=make
+ifndef	MAKE
+MAKE:=make
 endif
-MAKE1:=$(MAKE) MAKE="$(firstword $(MAKE)) -j1"
-MAKE:=$(MAKE) -j$(BR2_JLEVEL)
+ifndef HOSTMAKE
+HOSTMAKE=$(MAKE)
+endif
+HOSTMAKE :=$(shell $(CONFIG_SHELL) -c "which $(HOSTMAKE)"  || type -p $(HOSTMAKE)  || echo make)
 
+MAKE1:=$(HOSTMAKE) MAKE="$(firstword $(HOSTMAKE)) -j1"
+MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
+
 # Strip off the annoying quoting
 ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
 #"))
