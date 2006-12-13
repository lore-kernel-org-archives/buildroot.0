From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 03:51:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061213115142.C030C48571@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 03:51:42 -0800 (Wed, 13 Dec 2006)
New Revision: 16884

Log:
update ordering, automagically handle x86 subtypes


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 11:49:19 UTC (rev 16883)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-13 11:51:42 UTC (rev 16884)
@@ -68,11 +68,8 @@
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) toolchain/uClibc/ \*$(UCLIBC_VER)\*.patch
 	touch $(UCLIBC_DIR)/.unpacked
 
-# nothing to do -- some targets may wish to provide their own
-# and then use sed to hack up the default uClibc config...
-uclibc_config_file_prep::
-
-$(UCLIBC_DIR)/.prepared: $(UCLIBC_DIR)/.unpacked uclibc_config_file_prep
+# Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
+$(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.unpacked $(UCLIBC_CONFIG_FILE)
 	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
@@ -128,6 +125,37 @@
 else
 	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.config
 endif
+ifeq ("$(KERNEL_ARCH)","i386")
+	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_486 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_586 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_586MMX is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_686 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_PENTIUMII is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_PENTIUMIII is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_PENTIUM4 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_K6 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_K7 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_ELAN is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_CRUSOE is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_WINCHIPC6 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_WINCHIP2 is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_CYRIXIII is not set" >> $(UCLIBC_DIR)/.__config
+	/bin/echo "# CONFIG_NEHEMIAH is not set" >> $(UCLIBC_DIR)/.__config
+ifeq ($(BR2_x86_i386),y)
+	$(SED) 's,# CONFIG_386 is not set,CONFIG_386=y,g' $(UCLIBC_DIR)/.config
+endif
+ifeq ($(BR2_x86_i486),y)
+	$(SED) 's,# CONFIG_486 is not set,CONFIG_486=y,g' $(UCLIBC_DIR)/.config
+endif
+ifeq ($(BR2_x86_i586),y)
+	$(SED) 's,# CONFIG_586 is not set,CONFIG_586=y,g' $(UCLIBC_DIR)/.config
+endif
+ifeq ($(BR2_x86_i686),y)
+	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.config
+endif
+endif
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
@@ -137,9 +165,9 @@
 		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		HOSTCC="$(HOSTCC)" \
 		oldconfig
-	touch $(UCLIBC_DIR)/.prepared
+	touch $(UCLIBC_DIR)/.config
 
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.prepared kernel-headers
+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
 	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
@@ -162,7 +190,7 @@
 		all
 	touch -c $(UCLIBC_DIR)/lib/libc.a
 
-uclibc-menuconfig: $(UCLIBC_DIR)/.prepared
+uclibc-menuconfig: $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
@@ -172,7 +200,7 @@
 	touch $(UCLIBC_DIR)/.configured
 
 
-$(STAGING_DIR)/lib/libc.a: kernel-headers $(UCLIBC_DIR)/lib/libc.a
+$(STAGING_DIR)/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX= \
 		DEVEL_PREFIX=$(STAGING_DIR)/ \
@@ -212,7 +240,7 @@
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
 endif
 
-uclibc-configured: dependencies $(UCLIBC_DIR)/.configured
+uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
 
 
 uclibc: $(STAGING_DIR)/bin/$(REAL_GNU_TARGET_NAME)-gcc $(STAGING_DIR)/lib/libc.a \
@@ -244,6 +272,11 @@
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_dev
+	# Install the kernel headers to the target dir if necessary
+	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ] ; then \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/asm $(TARGET_DIR)/usr/include/ ; \
+		cp -pLR $(LINUX_HEADERS_DIR)/include/linux $(TARGET_DIR)/usr/include/ ; \
+	fi;
 	touch -c $(TARGET_DIR)/usr/lib/libc.a
 
 uclibc_target: gcc uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
