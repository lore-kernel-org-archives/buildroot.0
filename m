From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 10:30:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070922173040.8D6D7A65BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 10:30:38 -0700 (Sat, 22 Sep 2007)
New Revision: 19945

Log:
- put LZMA into generic flags
- some additional cleanups while at it


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-22 17:29:23 UTC (rev 19944)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-22 17:30:38 UTC (rev 19945)
@@ -79,12 +79,14 @@
 #"))
 endif
 endif
-__LINUX26_NO_PIC=-fPIC -fpic -DPIC
-LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS=$(HOSTCFLAGS) \
+__LINUX26_NO_PIC=-fPIC -fpic -DPIC -fwrapv -ftrapv
+LINUX26_MAKE_FLAGS = HOSTCC="$(HOSTCC)" HOSTCFLAGS="$(HOSTCFLAGS)" \
 	ARCH=$(KERNEL_ARCH) \
 	CFLAGS_KERNEL="$(filter-out $(__LINUX26_NO_PIC),$(TARGET_CFLAGS))" \
 	INSTALL_MOD_PATH=$(TARGET_DIR) \
-	CROSS_COMPILE=$(KERNEL_CROSS)
+	CROSS_COMPILE=$(KERNEL_CROSS) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LZMA="$(LZMA)" 
 
 $(LINUX26_KCONFIG):
 	@if [ ! -f "$(LINUX26_KCONFIG)" ] ; then \
@@ -181,7 +183,7 @@
 
 $(LINUX26_KERNEL): $(INITRAMFS_TARGET) $(BB_INITRAMFS_TARGET) \
 		$(LINUX26_DIR)/.depend_done
-	$(MAKE) $(LINUX26_MAKE_FLAGS) LZMA="$(LZMA)" \
+	$(MAKE) $(LINUX26_MAKE_FLAGS) \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
 	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
