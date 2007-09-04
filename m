From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  4 Sep 2007 14:24:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070904212449.04FA5A6833@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-04 14:24:46 -0700 (Tue, 04 Sep 2007)
New Revision: 19784

Log:
- remove initramfs related config settings and configure them back if needed


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-04 19:33:22 UTC (rev 19783)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-04 21:24:46 UTC (rev 19784)
@@ -152,19 +152,20 @@
 else
 	echo "# CONFIG_IPV6 is not set" >> $(LINUX26_DIR)/.config
 endif
+	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
+	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_TARGET_ROOTFS_INITRAMFS),y)
-	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_SOURCE=\"$(INITRAMFS_TARGET)\"" >> \
 		$(LINUX26_DIR)/.config
-	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_INITRAMFS),y)
+	# precedence for a small initramfs
 	$(SED) '/CONFIG_INITRAMFS_SOURCE/d' $(LINUX26_DIR)/.config
+	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_SOURCE=\"$(BB_INITRAMFS_TARGET)\"" >> \
 		$(LINUX26_DIR)/.config
-	$(SED) '/INITRAMFS_ROOT_.ID/d' $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_UID=0" >> $(LINUX26_DIR)/.config
 	echo "CONFIG_INITRAMFS_ROOT_GID=0" >> $(LINUX26_DIR)/.config
 endif
