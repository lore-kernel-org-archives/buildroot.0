From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 08:17:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel
Message-ID: <20071012151754.2C350A6AA9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 08:17:53 -0700 (Fri, 12 Oct 2007)
New Revision: 20235

Log:
Use correct uImage location for AVR32

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2007-10-12 15:16:51 UTC (rev 20234)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2007-10-12 15:17:53 UTC (rev 20235)
@@ -41,7 +41,15 @@
 
 #LINUX26_BINLOC=$(LINUX26_FORMAT)
 #LINUX26_BINLOC:=$(BINARIES_DIR)/$(LINUX26_KERNEL)
+ifeq ($(BR2_avr32),y)
+AVR32_FORMAT:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT)))
+#"))
+ifeq ($(AVR32_FORMAT),uImage)
+LINUX26_BINLOC=arch/$(KERNEL_ARCH)/boot/images/$(AVR32_FORMAT)
+endif
+endif
 
+
 LINUX26_COPYTO:=/tftpboot
 
 ifeq ($(DEFAULT_KERNEL_HEADERS),2.6.22.1)
@@ -101,6 +109,9 @@
 	@echo LINUX_SOURCE=$(LINUX_SOURCE)
 	@echo TARGETS=$(TARGETS)
 	@echo LINUX26_HEADERS_PATCH_DIR=$(LINUX26_HEADERS_PATCH_DIR)
+	@echo LINUX26_BINLOC=$(LINUX26_BINLOC)
+	@echo LINUX26_FORMAT=$(LINUX26_FORMAT)
+	@echo LINUX26_KERNEL=$(LINUX26_KERNEL)
 
 #TARGETS+=atmel_status
 endif
