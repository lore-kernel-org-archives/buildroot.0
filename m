From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 10 Aug 2006 14:00:24 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/module-init-tools
Message-ID: <20060810210024.0D9A6485CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-08-10 14:00:23 -0700 (Thu, 10 Aug 2006)
New Revision: 15799

Log:
Use http.  Add support for building cross depmod for 2.6 kernels.
Don't hard code version numbers all over the place.


Modified:
   trunk/buildroot/package/module-init-tools/module-init-tools.mk


Changeset:
Modified: trunk/buildroot/package/module-init-tools/module-init-tools.mk
===================================================================
--- trunk/buildroot/package/module-init-tools/module-init-tools.mk	2006-08-10 20:58:14 UTC (rev 15798)
+++ trunk/buildroot/package/module-init-tools/module-init-tools.mk	2006-08-10 21:00:23 UTC (rev 15799)
@@ -3,10 +3,12 @@
 # module-init-tools
 #
 #############################################################
-MODULE_INIT_TOOLS_SOURCE=module-init-tools-3.2.2.tar.bz2
-MODULE_INIT_TOOLS_SITE=ftp://ftp.kernel.org/pub/linux/utils/kernel/module-init-tools/
-MODULE_INIT_TOOLS_DIR=$(BUILD_DIR)/module-init-tools-3.2.2
-MODULE_INIT_TOOLS_BINARY=modprobe
+MODULE_INIT_TOOLS_VERSION=3.2.2
+MODULE_INIT_TOOLS_SOURCE=module-init-tools-$(MODULE_INIT_TOOLS_VERSION).tar.bz2
+MODULE_INIT_TOOLS_SITE=http://ftp.kernel.org/pub/linux/utils/kernel/module-init-tools/
+MODULE_INIT_TOOLS_DIR=$(BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
+MODULE_INIT_TOOLS_DIR2=$(TOOL_BUILD_DIR)/module-init-tools-$(MODULE_INIT_TOOLS_VERSION)
+MODULE_INIT_TOOLS_BINARY=depmod
 MODULE_INIT_TOOLS_TARGET_BINARY=$(TARGET_DIR)/sbin/$(MODULE_INIT_TOOLS_BINARY)
 
 STRIPPROG=$(STRIP)
@@ -16,8 +18,7 @@
 
 $(MODULE_INIT_TOOLS_DIR)/.unpacked: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
 	bzcat $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR) \
-		package/module-init-tools \*.patch
+	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR) package/module-init-tools \*.patch
 	touch $(MODULE_INIT_TOOLS_DIR)/.unpacked
 
 $(MODULE_INIT_TOOLS_DIR)/.configured: $(MODULE_INIT_TOOLS_DIR)/.unpacked
@@ -66,6 +67,44 @@
 	rm -rf $(MODULE_INIT_TOOLS_DIR)
 
 #############################################################
+
+
+$(MODULE_INIT_TOOLS_DIR2)/.source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
+	bzcat $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE) | tar -C $(TOOL_BUILD_DIR) -xvf -
+	toolchain/patch-kernel.sh $(MODULE_INIT_TOOLS_DIR2) package/module-init-tools \*.patch
+	touch $(MODULE_INIT_TOOLS_DIR2)/.source
+
+$(MODULE_INIT_TOOLS_DIR2)/.configured: $(MODULE_INIT_TOOLS_DIR2)/.source
+	(cd $(MODULE_INIT_TOOLS_DIR2); \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_HOST_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--sysconfdir=/etc \
+		--program-transform-name='' \
+	);
+	touch $(MODULE_INIT_TOOLS_DIR2)/.configured;
+
+$(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY): $(MODULE_INIT_TOOLS_DIR2)/.configured
+	$(MAKE) -C $(MODULE_INIT_TOOLS_DIR2)
+	touch -c $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY)
+
+
+$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26: $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY)
+	cp $(MODULE_INIT_TOOLS_DIR2)/$(MODULE_INIT_TOOLS_BINARY) $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
+
+cross-depmod26: $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
+
+cross-depmod26-source: $(DL_DIR)/$(MODULE_INIT_TOOLS_SOURCE)
+
+cross-depmod26-clean:
+	rm -f $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26
+	-$(MAKE) -C $(MODULE_INIT_TOOLS_DIR2) clean
+
+cross-depmod26-dirclean:
+	rm -rf $(MODULE_INIT_TOOLS_DIR2)
+
+#############################################################
 #
 ## Toplevel Makefile options
 #
