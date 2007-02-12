From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 12 Feb 2007 05:38:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/setserial
	toolchain toolchain/g etc...
Message-ID: <20070212133807.CCB58C80CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-12 05:38:06 -0800 (Mon, 12 Feb 2007)
New Revision: 17864

Log:
- add cc-option and use it to check for stuff that is benefical for PREFER_IMA
- backport the libbackend.o gcov-iov.h dependency fixup from 4.2 to 4.0


Added:
   trunk/buildroot/toolchain/gcc/4.0.4/402-libbackend_dep_gcov-iov.h.patch

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/toolchain/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-02-12 12:57:38 UTC (rev 17863)
+++ trunk/buildroot/Makefile	2007-02-12 13:38:06 UTC (rev 17864)
@@ -38,6 +38,13 @@
 
 ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
 
+# cc-option
+# Usage: cflags-y += $(call cc-option, -march=winchip-c6, -march=i586)
+# sets -march=winchip-c6 if supported else falls back to -march=i586
+# without checking the latter.
+cc-option = $(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev/null \
+	> /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
+
 #############################################################
 #
 # The list of stuff to build for the target toolchain

Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2007-02-12 12:57:38 UTC (rev 17863)
+++ trunk/buildroot/package/setserial/setserial.mk	2007-02-12 13:38:06 UTC (rev 17864)
@@ -27,7 +27,7 @@
 	touch $@
 
 ifeq ($(BR2_PREFER_IMA),y)
-SETSERIAL_CFLAGS=--combine -fwhole-program
+SETSERIAL_CFLAGS=--combine $(CFLAGS_WHOLE_PROGRAM)
 endif
 
 $(SETSERIAL_DIR)/.configured: $(SETSERIAL_DIR)/.unpacked

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-02-12 12:57:38 UTC (rev 17863)
+++ trunk/buildroot/toolchain/Makefile.in	2007-02-12 13:38:06 UTC (rev 17864)
@@ -14,5 +14,8 @@
 # FIXME -- this is temporary
 OPTIMIZE_FOR_CPU=$(ARCH)
 
+# late binding check to see if the target cc supports -fwhole-program
+CFLAGS_WHOLE_PROGRAM = $(call cc-option,-fwhole-program,)
+
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in

Added: trunk/buildroot/toolchain/gcc/4.0.4/402-libbackend_dep_gcov-iov.h.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.0.4/402-libbackend_dep_gcov-iov.h.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.0.4/402-libbackend_dep_gcov-iov.h.patch	2007-02-12 13:38:06 UTC (rev 17864)
@@ -0,0 +1,11 @@
+--- gcc-4.0.4.orig/gcc/Makefile.in	2007-02-12 11:35:43.000000000 +0100
++++ gcc-4.0.4/gcc/Makefile.in	2007-02-12 11:38:04.000000000 +0100
+@@ -2202,7 +2202,7 @@ mips-tdump.o : mips-tdump.c $(CONFIG_H) 
+ # FIXME: writing proper dependencies for this is a *LOT* of work.
+ libbackend.o : $(OBJS-common:.o=.c) $(out_file) \
+   insn-config.h insn-flags.h insn-codes.h insn-constants.h \
+-  insn-attr.h
++  insn-attr.h gcov-iov.h
+ 	$(CC) $(ALL_CFLAGS) $(ALL_CPPFLAGS) \
+ 	  -DTARGET_NAME=\"$(target_noncanonical)\" \
+ 	  -DLOCALEDIR=\"$(localedir)\" \
