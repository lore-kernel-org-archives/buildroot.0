From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue,  7 Oct 2008 00:20:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20081007072032.7918CF8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-07 00:20:32 -0700 (Tue, 07 Oct 2008)
New Revision: 23613

Log:
uclibc: add kconfig option and make stuff for installing the uClibc test suite

This patch adds the possibility to install the uClibc test suite to the target
file system. This is useful if you need to debug or test your uClibc.

The option is defaulted to no, and is not needed for a normal running Linux
system. The test suite is installed to /root/uClibc

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2008-10-07 07:11:15 UTC (rev 23612)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2008-10-07 07:20:32 UTC (rev 23613)
@@ -83,3 +83,21 @@
 	  program_invocation_short_name strings.  Some GNU packages
 	  (like tar and coreutils) utilize these for extra useful
 	  output, but in general are not required.
+
+config BR2_UCLIBC_INSTALL_TEST_SUITE
+	bool "Compile and install uClibc tests"
+	default n
+	select BR2_PACKAGE_MAKE
+	help
+	  Enabling this option will compile and install the uClibc test suite.
+	  This is useful if you want to check if the uClibc library is working
+	  for your architecture and/or help developing uClibc.
+
+	  The test suite will be installed into /root/uClibc directory. To run
+	  the test suite enter the /root/uClibc/test directory and type
+	  "make UCLIBC_ONLY=1 CC=/bin/true check".
+
+	  See the /root/uClibc/test/README for additional information.
+
+	  This is not needed at all for normal builds, so you can safely say no
+	  if you do not plan to dig into your C library.

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-07 07:11:15 UTC (rev 23612)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-10-07 07:20:32 UTC (rev 23613)
@@ -549,7 +549,10 @@
 	touch -c $@
 
 UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
+ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
+UCLIBC_TARGETS+=uclibc-test
 endif
+endif
 
 uclibc: $(cross_compiler) $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
 
@@ -568,11 +571,11 @@
 
 uclibc-configured-source: uclibc-source
 
-uclibc-clean:
+uclibc-clean: uclibc-test-clean
 	-$(MAKE1) -C $(UCLIBC_DIR) clean
 	rm -f $(UCLIBC_DIR)/.config
 
-uclibc-dirclean:
+uclibc-dirclean: uclibc-test-dirclean
 	rm -rf $(UCLIBC_DIR)
 
 uclibc-target-utils:
@@ -580,6 +583,28 @@
 
 uclibc-target-utils-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
+$(UCLIBC_DIR)/test/unistd/errno:
+	$(MAKE) -C $(UCLIBC_DIR)/test \
+	ARCH_CFLAGS=-I$(STAGING_DIR)/include \
+	UCLIBC_ONLY=1 TEST_INSTALLED_UCLIBC=1 compile
+
+$(TARGET_DIR)/root/uClibc/test/unistd/errno: $(UCLIBC_DIR)/test/unistd/errno
+	mkdir -p $(TARGET_DIR)/root/uClibc
+	cp -rdpf $(UCLIBC_DIR)/test $(TARGET_DIR)/root/uClibc
+	$(INSTALL) $(UCLIBC_DIR)/Rules.mak $(TARGET_DIR)/root/uClibc
+	$(INSTALL) $(UCLIBC_DIR)/.config $(TARGET_DIR)/root/uClibc
+
+uclibc-test: uclibc $(TARGET_DIR)/root/uClibc/test/unistd/errno
+
+uclibc-test-source: uclibc-source
+
+uclibc-test-clean:
+	-$(MAKE) -C $(UCLIBC_DIR)/test clean
+	rm -rf $(TARGET_DIR)/root/uClibc
+
+uclibc-test-dirclean:
+	rm -rf $(TARGET_DIR)/root/uClibc
+
 #############################################################
 #
 # uClibc for the target just needs its header files
@@ -615,11 +640,11 @@
 
 uclibc_target: cross_compiler uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
-uclibc_target-clean:
+uclibc_target-clean: uclibc-test-clean
 	rm -rf $(TARGET_DIR)/usr/include \
 		$(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
 
-uclibc_target-dirclean:
+uclibc_target-dirclean: uclibc-test-dirclean
 	rm -rf $(TARGET_DIR)/usr/include
 
 endif
