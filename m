From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 27 Sep 2007 14:24:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot
Message-ID: <20070927212415.2BFF5A67FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-27 14:24:15 -0700 (Thu, 27 Sep 2007)
New Revision: 20072

Log:
- for various reasons i will need an explicit ordering of the toolchain includes


Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-09-27 21:23:25 UTC (rev 20071)
+++ trunk/buildroot/Makefile	2007-09-27 21:24:15 UTC (rev 20072)
@@ -202,7 +202,18 @@
 # in the .config file.
 ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 # avoid pulling in external toolchain which is broken for toplvl parallel builds
-include $(filter-out $(wildcard toolchain/external-toolchain/*),$(wildcard toolchain/*/*.mk))
+# Explicit ordering:
+include toolchain/dependencies/dependencies.mk
+include toolchain/binutils/binutils.mk
+include toolchain/ccache/ccache.mk
+include toolchain/elf2flt/elf2flt.mk
+include toolchain/gcc/gcc-uclibc-3.x.mk
+include toolchain/gcc/gcc-uclibc-4.x.mk
+include toolchain/gdb/gdb.mk
+include toolchain/kernel-headers/kernel-headers.mk
+include toolchain/mklibs/mklibs.mk
+include toolchain/sstrip/sstrip.mk
+include toolchain/uClibc/uclibc.mk
 else
 include toolchain/*/*.mk
 endif
