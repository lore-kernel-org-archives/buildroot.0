From: kevint <kevint@lanl.gov>
Date: Thu, 3 Apr 2008 15:54:23 -0600
Subject: [Buildroot] patch: xcpu package
Message-ID: <DC83AAE2-FC9C-449B-A9BE-B7EBD21AB265@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(I think networking is the best place to put this- internally I've  
been using a drop down box for "Clustering Utilities", because I have  
several other patches that add packages like Perceus, bproc, etc)

Thanks,

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
********************************************

Explanation:

Added package to build several xcpu utilities:

xbootfs
xcpufs
statfs
utils (xrx and friends)

Signed-off-by:  Kevin Tegtmeier <kevint@lanl.gov>

--- cut here ----

Index: package/Config.in
===================================================================
--- package/Config.in   (revision 21627)
+++ package/Config.in   (working copy)
@@ -213,6 +213,7 @@
  source "package/wget/Config.in"
  endif
  source "package/wireless-tools/Config.in"
+source "package/xcpu/Config.in"

  endif

Index: package/xcpu/xcpu.mk
===================================================================
--- package/xcpu/xcpu.mk        (revision 0)
+++ package/xcpu/xcpu.mk        (revision 0)
@@ -0,0 +1,169 @@
+############################################################
+#
+# xcpu
+#
+#############################################################
+# http://xcpu.org/dl/xcpu-1.1/xcpu-1.1-s1.tar.gz
+XCPU_VERSION:=1.1-s1
+XCPU_SOURCE:=xcpu-$(XCPU_VERSION).tar.gz
+XCPU_SITE:=http://xcpu.org/dl/xcpu-1.1/
+XCPU_DIR:=$(BUILD_DIR)/xcpu-$(XCPU_VERSION)
+XCPU_CAT:=$(ZCAT)
+XBOOTFS_BINARY:=xbootfs/xbootfs
+XBOOTFS_TARGET_BINARY:=sbin/xbootfs
+XCPUFS_BINARY:=xcpufs/xcpufs
+XCPUFS_TARGET_BINARY:=sbin/xcpufs
+STATFS_BINARY:=statfs/statfs
+STATFS_TARGET_BINARY:=bin/statfs
+XCPU_BINARY:=utils/xrx
+XCPU_TARGET_BINARY:=bin/xrx
+
+XCPU_LIBXCPU:=$(XCPU_DIR)/libxcpu/libxcpu.a
+XCPU_LIBSPFS:=$(XCPU_DIR)/libspfs/libspfs.a
+XCPU_LIBSPCLIENT:=$(XCPU_DIR)/libspclient/libspclient.a
+XCPU_LIBNPFS:=$(XCPU_DIR)/libnpfs/libnpfs.a
+XCPU_LIBNPCLIENT:=$(XCPU_DIR)/libnpclient/libnpclient.a
+XCPU_LIBSTRUTIL:=$(XCPU_DIR)/libstrutil/libstrutil.a
+XCPU_LIBXAUTH:=$(XCPU_DIR)/libxauth/libxauth.a
+
+# some targets don't require openssl or libelf, so use reduced set  
of libs:
+XCPU_SP_LIBS:=$(XCPU_LIBSPFS) $(XCPU_LIBSPCLIENT) $(XCPU_LIBSTRUTIL)
+
+XCPU_LIBS:=\
+       $(XCPU_LIBXCPU) \
+       $(XCPU_LIBSPFS) \
+       $(XCPU_LIBSPCLIENT) \
+       $(XCPU_LIBNPFS) \
+       $(XCPU_LIBNPCLIENT) \
+       $(XCPU_LIBSTRUTIL) \
+       $(XCPU_LIBXAUTH) \
+
+XCPU_TARGET_UTILS:=\
+       $(TARGET_DIR)/bin/xrx \
+       $(TARGET_DIR)/bin/xps \
+       $(TARGET_DIR)/bin/xstat \
+       $(TARGET_DIR)/bin/xk \
+       $(TARGET_DIR)/bin/xuserset \
+       $(TARGET_DIR)/bin/xgroupset \
+
+.PHONY: xbootfs xcpufs statfs xcpu-utils xcpu-source \
+       xcpu-clean xbootfs-clean statfs-clean xcpufs-clean
+
+$(DL_DIR)/$(XCPU_SOURCE):
+       $(WGET) -P $(DL_DIR) "$(XCPU_SITE)/$(XCPU_SOURCE)"
+
+xcpu-source: $(DL_DIR)/$(XCPU_SOURCE)
+
+$(XCPU_DIR)/.unpacked: $(DL_DIR)/$(XCPU_SOURCE)
+       $(XCPU_CAT) $(DL_DIR)/$(XCPU_SOURCE) | tar -C $(BUILD_DIR) $ 
(TAR_OPTIONS) -
+       toolchain/patch-kernel.sh $(XCPU_DIR) package/xcpu/ xcpu-$ 
(XCPU_VERSION)\*.patch
+       touch $@
+
+
+# Library targets
+$(XCPU_LIBXCPU): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libxcpu
+
+$(XCPU_LIBSPFS): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libspfs
+
+$(XCPU_LIBSPCLIENT): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libspclient
+
+$(XCPU_LIBNPFS): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libnpfs
+
+$(XCPU_LIBNPCLIENT): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libnpclient
+
+$(XCPU_LIBSTRUTIL): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libstrutil
+
+$(XCPU_LIBXAUTH): $(XCPU_DIR)/.unpacked
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/libxauth
+
+
+# Binary targets
+$(XCPU_DIR)/$(XBOOTFS_BINARY): $(XCPU_DIR)/.unpacked $(XCPU_SP_LIBS)
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/xbootfs
+
+$(TARGET_DIR)/$(XBOOTFS_TARGET_BINARY): $(XCPU_DIR)/$(XBOOTFS_BINARY)
+       $(MAKE) INSTALLPREFIX=$(TARGET_DIR) -C $(XCPU_DIR)/xbootfs  
install
+       $(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$ 
(XBOOTFS_TARGET_BINARY)
+
+$(XCPU_DIR)/$(XCPUFS_BINARY): $(XCPU_DIR)/.unpacked $(XCPU_SP_LIBS) $ 
(XCPU_LIBXAUTH)
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/xcpufs
+
+$(TARGET_DIR)/$(XCPUFS_TARGET_BINARY): $(XCPU_DIR)/$(XCPUFS_BINARY)
+       $(MAKE) INSTALLPREFIX=$(TARGET_DIR) -C $(XCPU_DIR)/xcpufs  
install
+       $(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$ 
(XCPUFS_TARGET_BINARY)
+
+$(XCPU_DIR)/$(STATFS_BINARY): $(XCPU_DIR)/.unpacked $(XCPU_LIBS)
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/statfs
+
+$(TARGET_DIR)/$(STATFS_TARGET_BINARY): $(XCPU_DIR)/$(STATFS_BINARY)
+       $(MAKE) INSTALLPREFIX=$(TARGET_DIR) -C $(XCPU_DIR)/statfs  
install
+       $(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$ 
(STATFS_TARGET_BINARY)
+
+$(XCPU_DIR)/$(XCPU_BINARY): $(XCPU_DIR)/.unpacked $(XCPU_LIBS)
+       $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(XCPU_DIR)/utils
+
+$(TARGET_DIR)/$(XCPU_TARGET_BINARY): $(XCPU_DIR)/$(XCPU_BINARY)
+       $(MAKE) INSTALLPREFIX=$(TARGET_DIR) -C $(XCPU_DIR)/utils install
+       for util in $(XCPU_TARGET_UTILS); do\
+               $(STRIPCMD) $(STRIP_STRIP_ALL) $$util; \
+       done
+
+
+# Buildroot targets
+xbootfs: uclibc $(TARGET_DIR)/$(XBOOTFS_TARGET_BINARY)
+
+xcpufs: uclibc openssl $(TARGET_DIR)/$(XCPUFS_TARGET_BINARY)
+
+statfs: uclibc libelf openssl $(TARGET_DIR)/$(STATFS_TARGET_BINARY)
+
+xcpu-utils: uclibc libelf openssl $(TARGET_DIR)/bin/xrx
+
+
+# Clean targets
+xbootfs-clean:
+       $(MAKE) -C $(XCPU_DIR)/xbootfs clean
+       rm -f $(TARGET_DIR)/$(XBOOTFS_TARGET_BINARY)
+
+xcpufs-clean:
+       $(MAKE) -C $(XCPU_DIR)/xcpufs clean
+       rm -f $(TARGET_DIR)/$(XCPUFS_TARGET_BINARY)
+
+statfs-clean:
+       $(MAKE) -C $(XCPU_DIR)/statfs clean
+       rm -f $(TARGET_DIR)/$(STATFS_TARGET_BINARY)
+
+xcpu-clean:
+       $(MAKE) -C $(XCPU_DIR) clean
+       rm -f $(TARGET_DIR)/$(XBOOTFS_TARGET_BINARY)
+       rm -f $(TARGET_DIR)/$(XCPUFS_TARGET_BINARY)
+       rm -f $(TARGET_DIR)/$(STATFS_TARGET_BINARY)
+       for util in $(XCPU_TARGET_UTILS); do\
+               rm -f $$util; \
+       done
+
+xcpu-dirclean:
+       rm -rf $(XCPU_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_XCPU_XBOOTFS)),y)
+TARGETS+=xbootfs
+endif
+ifeq ($(strip $(BR2_PACKAGE_XCPU_XCPUFS)),y)
+TARGETS+=xcpufs
+endif
+ifeq ($(strip $(BR2_PACKAGE_XCPU_STATFS)),y)
+TARGETS+=statfs
+endif
+ifeq ($(strip $(BR2_PACKAGE_XCPU_UTILS)),y)
+TARGETS+=xcpu-utils
+endif
+
Index: package/xcpu/Config.in
===================================================================
--- package/xcpu/Config.in      (revision 0)
+++ package/xcpu/Config.in      (revision 0)
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_XCPU
+       bool "XCPU"
+       default n
+       help
+               An implementation of the 9P protocol.  Uses single  
threaded
+               9P libraries and allows user to specify clients built  
against
+               them.
+
+               http://xcpu.org
+
+config BR2_PACKAGE_XCPU_XBOOTFS
+       bool "xbootfs"
+       depends on BR2_PACKAGE_XCPU
+       default n
+       help
+               A tree spawn boot mechanism for large scale booting  
applications.
+
+config BR2_PACKAGE_XCPU_XCPUFS
+       bool "xcpufs"
+       depends on BR2_PACKAGE_XCPU
+       depends on BR2_PACKAGE_OPENSSL
+       default n
+       help
+               Provides a 9P interface that can be used to remotely  
execute
+               programs.  A machine running xcpufs can be controlled  
by a
+               machine using xcpu utils.
+
+comment "xcpufs       - disabled (requires openssl)"
+        depends BR2_PACKAGE_XCPU && (!BR2_PACKAGE_OPENSSL)
+
+config BR2_PACKAGE_XCPU_STATFS
+       bool "statfs"
+       depends on BR2_PACKAGE_XCPU
+       depends on BR2_PACKAGE_OPENSSL
+       depends on BR2_PACKAGE_LIBELF
+       default n
+       help
+               Provides status information about a set of nodes  
running xcpufs.
+
+comment "statfs       - disabled (requires openssl and libelf)"
+        depends BR2_PACKAGE_XCPU && (!BR2_PACKAGE_LIBELF || ! 
BR2_PACKAGE_OPENSSL)
+
+config BR2_PACKAGE_XCPU_UTILS
+       bool "utils"
+       depends on BR2_PACKAGE_XCPU
+       depends on BR2_PACKAGE_OPENSSL
+       depends on BR2_PACKAGE_LIBELF
+       default n
+       help
+               Commands to interact with nodes running xcpufs.   
Includes xrx, xk,
+               xgroupset, xuserset, xps, xstat.
+
+comment "utils        - disabled (requires openssl and libelf)"
+        depends BR2_PACKAGE_XCPU && (!BR2_PACKAGE_LIBELF || ! 
BR2_PACKAGE_OPENSSL)
+
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080403/438e345d/attachment-0001.htm 
