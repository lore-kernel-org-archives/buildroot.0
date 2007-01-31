From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 31 Jan 2007 02:10:07 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain
	toolchain/gcc toolchai etc...
Message-ID: <20070131101007.2F29348569@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-31 02:10:06 -0800 (Wed, 31 Jan 2007)
New Revision: 17684

Log:
- remove the '"install uClibc headers in the target filesystem" without a native compiler' option.


Removed:
   trunk/buildroot/toolchain/uClibc/Config.in.2
   trunk/buildroot/toolchain/uClibc/Makefile.in

Modified:
   trunk/buildroot/package/Config.in
   trunk/buildroot/toolchain/Makefile.in
   trunk/buildroot/toolchain/gcc/Config.in.2
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-30 22:44:07 UTC (rev 17683)
+++ trunk/buildroot/package/Config.in	2007-01-31 10:10:06 UTC (rev 17684)
@@ -32,7 +32,6 @@
 endif
 
 comment "Other development stuff"
-source "toolchain/uClibc/Config.in.2"
 source "package/autoconf/Config.in"
 source "package/automake/Config.in"
 source "package/bison/Config.in"

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-01-30 22:44:07 UTC (rev 17683)
+++ trunk/buildroot/toolchain/Makefile.in	2007-01-31 10:10:06 UTC (rev 17684)
@@ -16,5 +16,3 @@
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-
-include toolchain/uClibc/Makefile.in

Modified: trunk/buildroot/toolchain/gcc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in.2	2007-01-30 22:44:07 UTC (rev 17683)
+++ trunk/buildroot/toolchain/gcc/Config.in.2	2007-01-31 10:10:06 UTC (rev 17684)
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "native toolchain in the target filesystem"
 	default n
-	select BR2_PACKAGE_UCLIBC_TARGET_HEADERS
 	help
 	  If you want the target system to be able to run 
 	  binutils/gcc and compile native code, say Y here.

Deleted: trunk/buildroot/toolchain/uClibc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in.2	2007-01-30 22:44:07 UTC (rev 17683)
+++ trunk/buildroot/toolchain/uClibc/Config.in.2	2007-01-31 10:10:06 UTC (rev 17684)
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_UCLIBC_TARGET_HEADERS
-	bool "install uClibc headers in the target filesystem"
-	default n
-	help
-	  Install the uClibc headers and kernel-headers in the
-	  target filesystem.

Deleted: trunk/buildroot/toolchain/uClibc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Makefile.in	2007-01-30 22:44:07 UTC (rev 17683)
+++ trunk/buildroot/toolchain/uClibc/Makefile.in	2007-01-31 10:10:06 UTC (rev 17684)
@@ -1,4 +0,0 @@
-
-ifeq ($(strip $(BR2_PACKAGE_UCLIBC_TARGET_HEADERS)),y)
-TARGETS+=uclibc_target_headers
-endif

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-30 22:44:07 UTC (rev 17683)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-31 10:10:06 UTC (rev 17684)
@@ -323,32 +323,6 @@
 	fi;
 	touch -c $(TARGET_DIR)/usr/lib/libc.a
 
-$(TARGET_DIR)/usr/include/libc-internal.h: $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libc.a
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		PREFIX=$(TARGET_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=/ \
-		install_headers
-	# Install the kernel headers to the target dir if necessary
-	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ] ; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TARGET_DIR)/usr/include/ ; \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TARGET_DIR)/usr/include/ ; \
-		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] ; then \
-			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
-				$(TARGET_DIR)/usr/include/ ; \
-		fi; \
-	fi;
-
-ifeq ($(BR2_PACKAGE_UCLIBC_TARGET_HEADERS),y)
-uclibc_target_headers: $(TARGET_DIR)/usr/include/libc-internal.h
-uclibc_target_headers-clean:
-	rm -rf $(TARGET_DIR)/usr/include
-uclibc_target_headers-dirclean:
-	rm -rf $(TARGET_DIR)/usr/include
-else
-uclibc_target_headers: ;
-endif
-
 uclibc_target: gcc uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
 uclibc_target-clean:
