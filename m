From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun,  8 Jul 2007 12:23:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070708192300.A58CB3005E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-08 12:22:58 -0700 (Sun, 08 Jul 2007)
New Revision: 19046

Log:
- apply settings for initramfs


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-07-08 19:22:18 UTC (rev 19045)
+++ trunk/buildroot/target/linux26.mk	2007-07-08 19:22:58 UTC (rev 19046)
@@ -101,7 +101,7 @@
 	touch $@
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
-$(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG)
+$(LINUX26_DIR)/.configured:  $(LINUX26_DIR)/.patched  $(LINUX26_KCONFIG) $(INITRAMFS_TARGET)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
@@ -111,6 +111,14 @@
 else
 	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
 endif
+ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
+	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
+	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
+		$(LINUX26_DIR)/.config
+	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
+	echo "INITRAMFS_ROOT_UID=\"0\"" >> $(LINUX26_DIR)/.config
+	echo "INITRAMFS_ROOT_GID=\"0\"" >> $(LINUX26_DIR)/.config
+endif
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $@
 
