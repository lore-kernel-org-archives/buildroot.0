From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 14 Mar 2007 04:15:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/sed
	toolchain/uClibc
Message-ID: <20070314111509.777C9485EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-14 04:15:08 -0700 (Wed, 14 Mar 2007)
New Revision: 18099

Log:
- s/HOST_SED_TARGET/HOST_SED_BINARY/g for clarity
- make sure that we have a working sed for the uclibc-menuconfig target


Modified:
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-03-14 08:52:28 UTC (rev 18098)
+++ trunk/buildroot/package/sed/sed.mk	2007-03-14 11:15:08 UTC (rev 18099)
@@ -17,7 +17,7 @@
 #HOST_SED_DIR:=$(STAGING_DIR)
 HOST_SED_DIR:=$(TOOL_BUILD_DIR)
 SED:=$(HOST_SED_DIR)/bin/sed -i -e
-HOST_SED_TARGET=$(shell package/sed/sedcheck.sh)
+HOST_SED_BINARY=$(shell package/sed/sedcheck.sh)
 HOST_SED_IF_ANY=$(shell toolchain/dependencies/check-host-sed.sh)
 
 $(DL_DIR)/$(SED_SOURCE):
@@ -63,15 +63,15 @@
 		    $(HOST_SED_DIR)/usr/man $(HOST_SED_DIR)/usr/share/doc; fi
 
 use-sed-host-binary:
-	@if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
+	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ] ; then \
 		mkdir -p "$(HOST_SED_DIR)/bin"; \
 		rm -f "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 		ln -sf "$(HOST_SED_IF_ANY)" "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)"; \
 	fi
 
-host-sed: $(HOST_SED_TARGET)
+host-sed: $(HOST_SED_BINARY)
 
-ifeq ($(HOST_SED_TARGET),build-sed-host-binary)
+ifeq ($(HOST_SED_BINARY),build-sed-host-binary)
 host-sed-clean:
 	$(MAKE) DESTDIR=$(HOST_SED_DIR) -C $(SED_DIR1) uninstall
 	-$(MAKE) -C $(SED_DIR1) clean

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-03-14 08:52:28 UTC (rev 18098)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-03-14 11:15:08 UTC (rev 18099)
@@ -254,7 +254,7 @@
 		all
 	touch -c $(UCLIBC_DIR)/lib/libc.a
 
-uclibc-menuconfig: $(UCLIBC_DIR)/.config host-sed
+uclibc-menuconfig: host-sed $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
