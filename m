From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Dec 2011 17:45:48 -0300
Subject: [Buildroot] [PATCH 1/2] ipset: bump to version 6.10
Message-ID: <1322858749-16654-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipset/ipset-drop-modules.patch |  100 --------------------------------
 package/ipset/ipset.mk                 |    2 +-
 2 files changed, 1 insertions(+), 101 deletions(-)
 delete mode 100644 package/ipset/ipset-drop-modules.patch

diff --git a/package/ipset/ipset-drop-modules.patch b/package/ipset/ipset-drop-modules.patch
deleted file mode 100644
index ee29d43..0000000
--- a/package/ipset/ipset-drop-modules.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-Drop all the kernel checks and let the user deal with having a new enough
-version of the kernel to enjoy this.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-
-diff -Nura ipset-6.8.orig//Makefile.am ipset-6.8/Makefile.am
---- ipset-6.8.orig//Makefile.am	2011-08-17 16:10:41.999386034 -0300
-+++ ipset-6.8/Makefile.am	2011-08-17 16:17:34.108702969 -0300
-@@ -4,11 +4,6 @@
- 
- include $(top_srcdir)/Make_global.am
- 
--if ! WITH_KBUILDDIR
--KBUILD_OUTPUT=/lib/modules/`uname -r`/build
--else
--KBUILD_OUTPUT=$(KBUILDDIR)
--endif
- if ! WITH_MAXSETS
- IP_SET_MAX=256
- else
-@@ -22,23 +17,6 @@
- 
- SUBDIRS		= lib src
- 
--modules_sparse:
--	${MAKE} -C $(KBUILD_OUTPUT) M=$$PWD/kernel/net/netfilter \
--			V=$V C=2 CF=-D__CHECK_ENDIAN__ \
--			IP_SET_MAX=$(IP_SET_MAX) KDIR=$$PWD/kernel modules
--
--modules:
--	${MAKE} -C $(KBUILD_OUTPUT) M=$$PWD/kernel/net/netfilter V=$V \
--			IP_SET_MAX=$(IP_SET_MAX) KDIR=$$PWD/kernel modules
--
--modules_install:
--	${MAKE} -C $(KBUILD_OUTPUT) M=$$PWD/kernel/net/netfilter \
--			KDIR=$$PWD/kernel modules_install
--
--modules_clean:
--	${MAKE} -C $(KBUILD_OUTPUT) M=$$PWD/kernel/net/netfilter \
--			KDIR=$$PWD/kernel clean
--
- update_includes:
- 	./update ip_set.h
- 	./update ip_set_bitmap.h
-diff -Nura ipset-6.8.orig//configure.ac ipset-6.8/configure.ac
---- ipset-6.8.orig//configure.ac	2011-08-17 16:10:42.015387986 -0300
-+++ ipset-6.8/configure.ac	2011-08-17 16:18:01.578056869 -0300
-@@ -11,51 +11,6 @@
- *) AC_MSG_ERROR([Linux systems supported exclusively!]);;
- esac
- 
--dnl Additional arguments
--dnl Kernel build directory or source tree
--AC_ARG_WITH([kbuild],
--            AS_HELP_STRING([--with-kbuild=PATH],
--                           [Path to kernel build directory]),
--            [KBUILDDIR="$withval";])
--AC_ARG_WITH([ksource],
--            AS_HELP_STRING([--with-ksource=PATH],
--                           [Path to kernel source directory, if not the same as the kernel build directory]),
--            [KSOURCEDIR="$withval";])
--AM_CONDITIONAL(WITH_KBUILDDIR, test "$KBUILDDIR" != "")
--AC_SUBST(KBUILDDIR)
--
--dnl Sigh: check kernel version dependencies
--if test "$KBUILDDIR" != ""
--then
--	kbuilddir="$KBUILDDIR"
--else
--	kbuilddir="/lib/modules/`uname -r`/build"
--fi
--
--if test -n "$KSOURCEDIR"; then
--	ksourcedir="$KSOURCEDIR"
--elif test -e "$kbuilddir/include/linux/netfilter/nfnetlink.h"; then
--	ksourcedir="$kbuilddir"
--else
--	ksourcedir="/lib/modules/$(uname -r)/source"
--fi
--if test ! -e "$ksourcedir/include/linux/netfilter/nfnetlink.h"
--then
--	AC_MSG_ERROR([Invalid kernel source directory $ksourcedir])
--fi
--
--if test ! -e "$kbuilddir/.config"
--then
--	AC_MSG_ERROR([The kernel build directory $kbuilddir is not configured])
--fi
--
--AC_PROG_GREP
--
--if test "X`$GREP 'NFNL_SUBSYS_IPSET' $ksourcedir/include/linux/netfilter/nfnetlink.h`" = "X"
--then
--	AC_MSG_ERROR([The kernel source directory $ksourcedir is not patched with netlink.patch to support ipset])
--fi
--
- dnl Maximal number of sets supported by the kernel, default 256
- AC_ARG_WITH([maxsets],
- 	    AS_HELP_STRING([--with-maxsets=256],
diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index f98f73f..6294234 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPSET_VERSION = 6.9.1
+IPSET_VERSION = 6.10
 IPSET_SOURCE = ipset-$(IPSET_VERSION).tar.bz2
 IPSET_SITE = http://ipset.netfilter.org
 IPSET_AUTORECONF = YES
-- 
1.7.3.4
