From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:30:42 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20061202183042.C2119485E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:30:42 -0800 (Sat, 02 Dec 2006)
New Revision: 16758

Log:
- provide a 'make uclibc-config' target to make target specific configuration easy.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-02 18:14:38 UTC (rev 16757)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-12-02 18:30:42 UTC (rev 16758)
@@ -65,7 +65,7 @@
 	touch $(UCLIBC_DIR)/.unpacked
 
 uclibc-configured: dependencies kernel-headers $(UCLIBC_DIR)/.configured
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.unpacked
+$(UCLIBC_DIR)/.prepared: $(UCLIBC_DIR)/.unpacked
 	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
@@ -123,6 +123,9 @@
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/include
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/usr/lib
 	mkdir -p $(TOOL_BUILD_DIR)/uClibc_dev/lib
+	touch $(UCLIBC_DIR)/.prepared
+
+$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.prepared
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
@@ -140,6 +143,16 @@
 		all
 	touch -c $(UCLIBC_DIR)/lib/libc.a
 
+uclibc-menuconfig: $(UCLIBC_DIR)/.prepared
+	$(MAKE1) -C $(UCLIBC_DIR) \
+		PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(TOOL_BUILD_DIR)/uClibc_dev/ \
+		HOSTCC="$(HOSTCC)" \
+		menuconfig && \
+	touch $(UCLIBC_DIR)/.configured
+
+
 $(STAGING_DIR)/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		PREFIX= \
