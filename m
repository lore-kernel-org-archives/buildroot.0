From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 31 Mar 2009 15:08:39 +0000 (UTC)
Subject: [Buildroot] svn commit: [25908] trunk/buildroot/package/iptables
Message-ID: <20090331150840.21F5B771EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-31 15:08:38 +0000 (Tue, 31 Mar 2009)
New Revision: 25908

Log:
iptables: unbreak build with ipv6 after r25897.

Modified:
   trunk/buildroot/package/iptables/iptables-optional-ipv6.patch


Changeset:
Modified: trunk/buildroot/package/iptables/iptables-optional-ipv6.patch
===================================================================
--- trunk/buildroot/package/iptables/iptables-optional-ipv6.patch	2009-03-31 14:29:38 UTC (rev 25907)
+++ trunk/buildroot/package/iptables/iptables-optional-ipv6.patch	2009-03-31 15:08:38 UTC (rev 25908)
@@ -1,9 +1,16 @@
 Make ipv6 support optional. Patch by Steffen Schulz <sf@cbg.dyndns.org>
 
 Submitted upstream as http://bugzilla.netfilter.org/show_bug.cgi?id=588
-diff -ru iptables-1.4.2/configure.ac iptables-1.4.2_patched/configure.ac
---- iptables-1.4.2/configure.ac	2009-03-29 15:49:24.764299587 +0000
-+++ iptables-1.4.2_patched/configure.ac	2009-03-29 15:38:29.082512186 +0000
+---
+ Makefile.am  |   16 +++++++++++++---
+ configure.ac |    4 ++++
+ xtables.c    |    3 +++
+ 3 files changed, 20 insertions(+), 3 deletions(-)
+
+Index: iptables-1.4.2/configure.ac
+===================================================================
+--- iptables-1.4.2.orig/configure.ac
++++ iptables-1.4.2/configure.ac
 @@ -37,6 +37,9 @@
  	[enable_devel="$enableval"], [enable_devel="yes"])
  AC_ARG_ENABLE([libipq],
@@ -22,12 +29,22 @@
  
  regular_CFLAGS="-D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 \
  	-D_REENTRANT -Wall -Waggregate-return -Wmissing-declarations \
-Only in iptables-1.4.2: configure.ac.orig
-Only in iptables-1.4.2: configure.ac.rej
-diff -ru iptables-1.4.2/Makefile.am iptables-1.4.2_patched/Makefile.am
---- iptables-1.4.2/Makefile.am	2008-10-08 16:31:58.000000000 +0000
-+++ iptables-1.4.2_patched/Makefile.am	2009-03-29 15:38:29.082512186 +0000
-@@ -80,11 +80,17 @@
+Index: iptables-1.4.2/Makefile.am
+===================================================================
+--- iptables-1.4.2.orig/Makefile.am
++++ iptables-1.4.2/Makefile.am
+@@ -3,6 +3,10 @@
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+ AM_CFLAGS        = ${regular_CFLAGS} -I${top_builddir}/include -I${top_srcdir}/include ${kinclude_CFLAGS}
++if ENABLE_IPV6
++AM_CFLAGS       += -DENABLE_IPV6=1
++endif
++
+ SUBDIRS         := extensions
+ if ENABLE_LIBIPQ
+ SUBDIRS         += libipq
+@@ -80,11 +84,17 @@
  endif
  
  if ENABLE_STATIC
@@ -48,9 +65,10 @@
  endif
  
  iptables.8: ${srcdir}/iptables.8.in extensions/matches4.man extensions/targets4.man
-diff -ru iptables-1.4.2/xtables.c iptables-1.4.2_patched/xtables.c
---- iptables-1.4.2/xtables.c	2008-10-08 16:31:58.000000000 +0000
-+++ iptables-1.4.2_patched/xtables.c	2009-03-29 15:38:29.082512186 +0000
+Index: iptables-1.4.2/xtables.c
+===================================================================
+--- iptables-1.4.2.orig/xtables.c
++++ iptables-1.4.2/xtables.c
 @@ -964,6 +964,8 @@
  	}
  }
