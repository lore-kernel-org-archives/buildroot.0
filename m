From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 08:33:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/lzma target/linux
	toolchain/depe etc...
Message-ID: <20070821153335.50F83A463F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 08:33:33 -0700 (Tue, 21 Aug 2007)
New Revision: 19619

Log:
- add handling of lzma for the host (unconditionally for now)
- remove non-working attempt to install an lzma to the host via sudo


Added:
   trunk/buildroot/package/lzma/lzmacheck.sh
   trunk/buildroot/toolchain/dependencies/check-host-lzma.sh

Modified:
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/dependencies/dependencies.mk


Changeset:
Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-08-21 14:32:38 UTC (rev 19618)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-08-21 15:33:33 UTC (rev 19619)
@@ -15,6 +15,12 @@
 endif
 LZMA_TARGET_BINARY:=bin/lzma
 
+# lzma binary for use on the host
+LZMA=$(TOOL_BUILD_DIR)/bin/lzma
+HOST_LZMA_BINARY=$(shell $(CONFIG_SHELL) package/lzma/lzmacheck.sh)
+HOST_LZMA_IF_ANY=$(shell $(CONFIG_SHELL) toolchain/dependencies/check-host-lzma.sh)
+
+
 $(DL_DIR)/$(LZMA_SOURCE):
 	$(WGET) -P $(DL_DIR) $(LZMA_SITE)/$(LZMA_SOURCE)
 
@@ -47,6 +53,20 @@
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
 		$(STAGING_DIR)/lib/liblzmadec.la
 
+.PHONY: lzma-host use-lzma-host-binary
+use-lzma-host-binary:
+	if [ ! -f "$(TOOL_BUILD_DIR)/bin/lzma" ] ; then \
+		[ -d $(TOOL_BUILD_DIR)/bin ] || mkdir $(TOOL_BUILD_DIR)/bin ; \
+		ln -sf "$(HOST_LZMA_IF_ANY)" "$(TOOL_BUILD_DIR)/bin/lzma" ; \
+	fi
+
+build-lzma-host-binary: $(LZMA_HOST_DIR)/src/lzma/lzma
+	-rm -f $(TOOL_BUILD_DIR)/bin/lzma
+	[ -d $(TOOL_BUILD_DIR)/bin ] || mkdir $(TOOL_BUILD_DIR)/bin
+	cp -pf $(LZMA_HOST_DIR)/src/lzma/lzma $(TOOL_BUILD_DIR)/bin/lzma
+
+host-lzma: $(HOST_LZMA_BINARY)
+
 lzma-host: $(STAGING_DIR)/bin/lzma
 
 lzma-host-clean:
@@ -55,11 +75,6 @@
 lzma-host-dirclean:
 	rm -rf $(LZMA_HOST_DIR)
 
-/usr/local/bin/lzma: lzma_host
-	sudo 	$(MAKE) DESTDIR=/usr/local -C $(LZMA_HOST_DIR) install
-	sudo	$(SED) "s,^libdir=.*,libdir=\'/usr/local/lib\',g" \
-		/usr/local/lib/liblzmadec.la
-
 lzma-host-install: /usr/local/bin/lzma
 
 ######################################################################

Added: trunk/buildroot/package/lzma/lzmacheck.sh
===================================================================
--- trunk/buildroot/package/lzma/lzmacheck.sh	                        (rev 0)
+++ trunk/buildroot/package/lzma/lzmacheck.sh	2007-08-21 15:33:33 UTC (rev 19619)
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+bin=$(toolchain/dependencies/check-host-lzma.sh)
+if [ "x$bin" = "x" ] ; then
+  echo build-lzma-host-binary
+else
+  echo use-lzma-host-binary
+fi
+


Property changes on: trunk/buildroot/package/lzma/lzmacheck.sh
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-21 14:32:38 UTC (rev 19618)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-21 15:33:33 UTC (rev 19619)
@@ -143,7 +143,8 @@
 	touch $@
 
 $(LINUX26_KERNEL): $(LINUX26_DIR)/.depend_done
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT)
+	$(MAKE) $(LINUX26_MAKE_FLAGS) LZMA="$(LZMA)" \
+		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 

Added: trunk/buildroot/toolchain/dependencies/check-host-lzma.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/check-host-lzma.sh	                        (rev 0)
+++ trunk/buildroot/toolchain/dependencies/check-host-lzma.sh	2007-08-21 15:33:33 UTC (rev 19619)
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+ok=""
+
+for bin in /usr/bin/lzma $LZMA
+do
+# TODO: add check for proper functionality here..
+  $bin --version > /dev/null 2>&1 && ok="$bin"
+  if test "x$ok" != "x" ; then
+    break
+  fi
+done
+echo "$ok"


Property changes on: trunk/buildroot/toolchain/dependencies/check-host-lzma.sh
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 14:32:38 UTC (rev 19618)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2007-08-21 15:33:33 UTC (rev 19619)
@@ -5,7 +5,7 @@
 #
 ######################################################################
 
-dependencies: host-sed
+dependencies: host-sed host-lzma
 	@HOSTCC="$(firstword $(HOSTCC))" MAKE="$(MAKE)" \
 		HOST_SED_DIR="$(HOST_SED_DIR)" \
 		$(TOPDIR)/toolchain/dependencies/dependencies.sh
