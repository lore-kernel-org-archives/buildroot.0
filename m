From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 30 Jan 2007 09:38:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070130173841.A6017485B8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-30 09:38:41 -0800 (Tue, 30 Jan 2007)
New Revision: 17675

Log:
- honor the given kernel format and fallback to zImage if none was specified


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-01-30 17:37:35 UTC (rev 17674)
+++ trunk/buildroot/target/linux26.mk	2007-01-30 17:38:41 UTC (rev 17675)
@@ -22,7 +22,12 @@
 
 #LINUX26_FORMAT=vmlinux
 #LINUX26_BINLOC=$(LINUX26_FORMAT)
-LINUX26_FORMAT=bzImage
+
+# Has to be set by the target/device
+# LINUX26_FORMAT=bzImage
+ifndef LINUX26_FORMAT
+LINUX26_FORMAT=zImage
+endif
 LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 
 # Linux kernel configuration file
@@ -72,6 +77,11 @@
 
 $(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
 	-cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
+	$(SED) 's,^CONFIG_EABI.*,# CONFIG_EABI is not set,g' \
+		$(LINUX26_DIR)/.config
+ifeq ($(BR2_ARM_EABI),y)
+	echo "CONFIG_EABI=y" >> $(LINUX26_DIR)/.config
+endif
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $(LINUX26_DIR)/.configured
 
@@ -80,7 +90,7 @@
 	touch $(LINUX26_DIR)/.depend_done
 
 $(LINUX26_KERNEL): $(LINUX26_DIR)/.depend_done
-	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT) bzImage
+	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(LINUX26_FORMAT)
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
 	cp -fa $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $(LINUX26_KERNEL)
