From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 23 Sep 2007 02:58:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070923095847.0E10030058@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-23 02:58:47 -0700 (Sun, 23 Sep 2007)
New Revision: 19960

Log:
Use correct path to vmlinux, Fix bad SED of config

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-23 09:56:21 UTC (rev 19959)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-23 09:58:47 UTC (rev 19960)
@@ -56,8 +56,12 @@
 # Has to be set by the target/device
 ifndef LINUX26_BINLOC
 # default:
+ifeq ($(LINUX26_FORMAT),vmlinux)
+LINUX26_BINLOC=$(LINUX26_FORMAT)
+else
 LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
 endif
+endif
 
 # File name for the Linux kernel binary
 ifndef LINUX26_KERNEL
@@ -143,7 +147,7 @@
 
 $(LINUX26_DIR)/.configured: $(LINUX26_DIR)/.patched $(LINUX26_KCONFIG)
 	cp -dpf $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
-	$(SED) '/CONFIG_AEABI/d' $(LINUX26_DIR)/.config
+	$(SED) '/CONFIG_AEABI=y/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_ARM_EABI),y)
 	echo "CONFIG_AEABI=y" >> $(LINUX26_DIR)/.config
 	$(SED) '/CONFIG_OABI_COMPAT/d' $(LINUX26_DIR)/.config
@@ -151,7 +155,7 @@
 else
 	echo "# CONFIG_AEABI is not set" >> $(LINUX26_DIR)/.config
 endif
-	$(SED) '/CONFIG_IPV6/d' $(LINUX26_DIR)/.config
+	$(SED) '/CONFIG_IPV6=y/d' $(LINUX26_DIR)/.config
 ifeq ($(BR2_INET_IPV6),y)
 	echo "CONFIG_IPV6=y" >> $(LINUX26_DIR)/.config
 else
