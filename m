From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 16 Aug 2007 11:17:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/lzma target/linux
	toolchain/kern etc...
Message-ID: <20070816181741.AD51FA5E18@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-16 11:17:39 -0700 (Thu, 16 Aug 2007)
New Revision: 19531

Log:
Ensure lzma is built *before* linux, allow system installation in /usr/local/bin

Modified:
   trunk/buildroot/package/lzma/lzma.mk
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/package/lzma/lzma.mk
===================================================================
--- trunk/buildroot/package/lzma/lzma.mk	2007-08-16 11:29:08 UTC (rev 19530)
+++ trunk/buildroot/package/lzma/lzma.mk	2007-08-16 18:17:39 UTC (rev 19531)
@@ -48,11 +48,20 @@
 		$(STAGING_DIR)/lib/liblzmadec.la
 
 lzma-host: $(STAGING_DIR)/bin/lzma
+
 lzma-host-clean:
 	rm -f $(STAGING_DIR)/bin/lzma
 	-$(MAKE) -C $(LZMA_HOST_DIR) clean
 lzma-host-dirclean:
 	rm -rf $(LZMA_HOST_DIR)
+
+/usr/local/bin/lzma:	lzma_host
+	sudo 	$(MAKE) DESTDIR=/usr/local -C $(LZMA_HOST_DIR) install
+	sudo	$(SED) "s,^libdir=.*,libdir=\'/usr/local/lib\',g" \
+		/usr/local/lib/liblzmadec.la
+
+lzma-host-install:	/usr/local/bin/lzma
+
 ######################################################################
 #
 # lzma target

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-16 11:29:08 UTC (rev 19530)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-16 18:17:39 UTC (rev 19531)
@@ -59,6 +59,14 @@
 LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 endif
 
+ifeq ($(BR2_KERNEL_HEADERS_LZMA),y)
+ifeq ($(BR2_KERNEL_HEADERS_LZMA_INSTALL),y)
+DEPEND_ON_HOST_LZMA:=lzma-host-install
+else
+DEPEND_ON_HOST_LZMA:=lzma-host
+endif
+endif
+
 # Version of Linux AFTER patches
 LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
@@ -150,7 +158,7 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) menuconfig
 	-[ -f $(LINUX26_DIR)/.config ] && touch $(LINUX26_DIR)/.configured
 
-linux26: $(INITRAMFS_TARGET) $(LINUX26_KERNEL)
+linux26: $(DEPEND_ON_HOST_LZMA) $(INITRAMFS_TARGET) $(LINUX26_KERNEL)
 
 $(LINUX26_DIR)/.modules_installed: $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
 	touch $@

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-16 11:29:08 UTC (rev 19530)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-08-16 18:17:39 UTC (rev 19531)
@@ -66,6 +66,17 @@
 	  initramfs filesystems.  This requires the lzma
 	  program in your development environment.
 
+config BR2_KERNEL_HEADERS_LZMA_INSTALL
+	bool "Install lzma in /usr/local/bin (Requires system password) for sudo"
+	default n
+	help
+	  Install the lzma package in the /usr/local/bin directory
+	  so it is available for future builds.  This requires sudo.
+	  If you do not know the system password you should not set
+	  this option. If you do not have lzma installed the only way
+	  to complete the linux build, ifl you apply the lzma patches
+	  is to have '$(STAGING_DIR)/usr/bin' in your path.
+
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "2.4.25"    if BR2_KERNEL_HEADERS_2_4_25
