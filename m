From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 21 Jan 2007 04:58:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package toolchain
	toolchain/gcc toolchai etc...
Message-ID: <20070121125852.7783048587@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-21 04:58:51 -0800 (Sun, 21 Jan 2007)
New Revision: 17433

Log:
- provide means to "install uClibc headers in the target filesystem" without a native compiler


Added:
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
--- trunk/buildroot/package/Config.in	2007-01-21 11:50:10 UTC (rev 17432)
+++ trunk/buildroot/package/Config.in	2007-01-21 12:58:51 UTC (rev 17433)
@@ -21,6 +21,7 @@
 source "package/gawk/Config.in"
 endif
 source "toolchain/gcc/Config.in.2"
+source "toolchain/uClibc/Config.in.2"
 source "toolchain/ccache/Config.in.2"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/grep/Config.in"
@@ -185,6 +186,7 @@
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
+#source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libpcap/Config.in"
@@ -237,6 +239,7 @@
 	  Support for X and related packages
 
 if BR2_X_WINDOW_SYSTEM
+#source "package/microwin/Config.in"
 comment "X server"
 source "package/xorg/Config.in"
 source "package/tinyx/Config.in"
@@ -250,7 +253,6 @@
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
 comment "Window managers"
-source "package/microwin/Config.in"
 source "package/metacity/Config.in"
 comment "X applications"
 source "package/dillo/Config.in"

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2007-01-21 11:50:10 UTC (rev 17432)
+++ trunk/buildroot/toolchain/Makefile.in	2007-01-21 12:58:51 UTC (rev 17433)
@@ -16,3 +16,5 @@
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
+
+include toolchain/uClibc/Makefile.in

Modified: trunk/buildroot/toolchain/gcc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in.2	2007-01-21 11:50:10 UTC (rev 17432)
+++ trunk/buildroot/toolchain/gcc/Config.in.2	2007-01-21 12:58:51 UTC (rev 17433)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "native toolchain in the target filesystem"
 	default n
+	select BR2_PACKAGE_UCLIBC_TARGET_HEADERS
 	help
 	  If you want the target system to be able to run 
 	  binutils/gcc and compile native code, say Y here.

Added: trunk/buildroot/toolchain/uClibc/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in.2	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/Config.in.2	2007-01-21 12:58:51 UTC (rev 17433)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UCLIBC_TARGET_HEADERS
+	bool "install uClibc headers in the target filesystem"
+	default n
+	help
+	  Install the uClibc headers and kernel-headers in the
+	  target filesystem.

Added: trunk/buildroot/toolchain/uClibc/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Makefile.in	                        (rev 0)
+++ trunk/buildroot/toolchain/uClibc/Makefile.in	2007-01-21 12:58:51 UTC (rev 17433)
@@ -0,0 +1,4 @@
+
+ifeq ($(strip $(BR2_PACKAGE_UCLIBC_TARGET_HEADERS)),y)
+TARGETS+=uclibc_target_headers
+endif

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-21 11:50:10 UTC (rev 17432)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-21 12:58:51 UTC (rev 17433)
@@ -315,11 +315,37 @@
 	fi;
 	touch -c $(TARGET_DIR)/usr/lib/libc.a
 
+$(TARGET_DIR)/usr/include/libc-internal.h: $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/lib/libc.a
+	$(MAKE1) -C $(UCLIBC_DIR) \
+		PREFIX=$(TARGET_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=/ \
+		install_headers
+	# Install the kernel headers to the target dir if necessary
+	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ] ; then \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TARGET_DIR)/usr/include/ ; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TARGET_DIR)/usr/include/ ; \
+		if [ -d $(LINUX_HEADERS_DIR)/include/asm-generic ] ; then \
+			cp -pLR $(LINUX_HEADERS_DIR)/include/asm-generic \
+				$(TARGET_DIR)/usr/include/ ; \
+		fi; \
+	fi;
+
+ifeq ($(BR2_PACKAGE_UCLIBC_TARGET_HEADERS),y)
+uclibc_target_headers: $(TARGET_DIR)/usr/include/libc-internal.h
+uclibc_target_headers-clean:
+	rm -rf $(TARGET_DIR)/usr/include
+uclibc_target_headers-dirclean:
+	rm -rf $(TARGET_DIR)/usr/include
+else
+uclibc_target_headers: ;
+endif
+
 uclibc_target: gcc uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
 uclibc_target-clean:
-	rm -f $(TARGET_DIR)/include
+	rm -rf $(TARGET_DIR)/usr/include
 
 uclibc_target-dirclean:
-	rm -f $(TARGET_DIR)/include
+	rm -rf $(TARGET_DIR)/usr/include
 
