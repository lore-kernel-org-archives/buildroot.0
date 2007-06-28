From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Jun 2007 03:47:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20070628104706.7B17DA4633@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-28 03:47:05 -0700 (Thu, 28 Jun 2007)
New Revision: 18957

Log:
- adjust infrastructure for new kconfig


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-06-28 10:46:19 UTC (rev 18956)
+++ trunk/buildroot/Makefile	2007-06-28 10:47:05 UTC (rev 18957)
@@ -37,6 +37,58 @@
 -include $(TOPDIR).config
 endif
 
+# To put more focus on warnings, be less verbose as default
+# Use 'make V=1' to see the full commands
+ifdef V
+  ifeq ("$(origin V)", "command line")
+    KBUILD_VERBOSE = $(V)
+  endif
+endif
+ifndef KBUILD_VERBOSE
+  KBUILD_VERBOSE = 0
+endif
+
+ifeq ($(KBUILD_VERBOSE),1)
+  quiet =
+  Q =
+else
+  quiet=quiet_
+  Q = @
+endif
+
+CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+	else if [ -x /bin/bash ]; then echo /bin/bash; \
+	else echo sh; fi ; fi)
+
+export CONFIG_SHELL quiet Q KBUILD_VERBOSE
+
+ifndef HOSTAR
+HOSTAR:=ar
+endif
+ifndef HOSTAS
+HOSTAS:=as
+endif
+ifndef HOSTCC
+HOSTCC:=gcc
+else
+endif
+ifndef HOSTCXX
+HOSTCXX:=g++
+endif
+ifndef HOSTLD
+HOSTLD:=ld
+endif
+HOSTAR:=$(shell $(CONFIG_SHELL) which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
+HOSTAS:=$(shell $(CONFIG_SHELL) which $(HOSTAS) || type -p $(HOSTAS) || echo as)
+HOSTCC:=$(shell $(CONFIG_SHELL) which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCXX:=$(shell $(CONFIG_SHELL) which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTLD:=$(shell $(CONFIG_SHELL) which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+ifndef CFLAGS_FOR_BUILD
+CFLAGS_FOR_BUILD:="-g -O2"
+endif
+export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
+
+
 ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
 
 # cc-option
@@ -212,12 +264,14 @@
 # ---------------------------------------------------------------------------
 
 $(CONFIG)/conf:
-	$(MAKE) -C $(CONFIG) conf
+	$(MAKE) CC="$(HOSTCC)" CFLAGS=$(CFLAGS_FOR_BUILD) MAKECMDGOALS="$(MAKECMDGOALS)" \
+		-C $(CONFIG) conf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi
 $(CONFIG)/mconf:
-	$(MAKE) -C $(CONFIG) ncurses conf mconf
+	$(MAKE) CC="$(HOSTCC)" CFLAGS=$(CFLAGS_FOR_BUILD) MAKECMDGOALS="$(MAKECMDGOALS)" \
+		-C $(CONFIG) conf mconf
 	- at if [ ! -f .config ] ; then \
 		cp $(CONFIG_DEFCONFIG) .config; \
 	fi

Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-06-28 10:46:19 UTC (rev 18956)
+++ trunk/buildroot/package/Makefile.in	2007-06-28 10:47:05 UTC (rev 18957)
@@ -48,31 +48,7 @@
 endif
 #########################################################################
 
-ifndef HOSTAR
-HOSTAR:=ar
-endif
-ifndef HOSTAS
-HOSTAS:=as
-endif
-ifndef HOSTCC
-HOSTCC:=gcc
-endif
-ifndef HOSTCXX
-HOSTCXX:=g++
-endif
-ifndef HOSTLD
-HOSTLD:=ld
-endif
-HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
-HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
-HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
-HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
-ifndef CFLAGS_FOR_BUILD
-CFLAGS_FOR_BUILD:="-g -O2"
-endif
 
-
 BASE_DIR:=$(shell pwd)
 
 TOPDIR_PREFIX:=$(strip $(subst ",, $(BR2_TOPDIR_PREFIX)))_
