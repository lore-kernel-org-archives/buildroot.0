From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 06:30:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080701133028.9A3773C64F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 06:30:26 -0700 (Tue, 01 Jul 2008)
New Revision: 22590

Log:
package/Makefile.in: propagate -s make flag to sub makes

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2008-07-01 12:54:49 UTC (rev 22589)
+++ trunk/buildroot/package/Makefile.in	2008-07-01 13:30:26 UTC (rev 22590)
@@ -6,15 +6,14 @@
 endif
 HOSTMAKE :=$(shell $(CONFIG_SHELL) -c "which $(HOSTMAKE)" || type -p $(HOSTMAKE) || echo make)
 
-MAKE1:=$(HOSTMAKE) MAKE="$(firstword $(HOSTMAKE)) -j1"
-MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
-
 # honor silent mode
 ifeq (s,$(findstring s,$(MAKEFLAGS)))
-MAKE1+= -s
-MAKE+= -s
+MAKESILENT:=-s
 endif
 
+MAKE1:=$(HOSTMAKE) MAKE='$(firstword $(HOSTMAKE)) -j1 $(MAKESILENT)'
+MAKE:=$(HOSTMAKE) MAKE='$(firstword $(HOSTMAKE)) -j$(BR2_JLEVEL) $(MAKESILENT)'
+
 ifeq ($(BR2_OPTIMIZE_0),y)
 TARGET_OPTIMIZATION=-O0
 endif
