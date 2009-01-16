From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Jan 2009 12:07:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: package/mpfr
	package/setserial target/li etc...
Message-ID: <20090116120755.83618774FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-16 12:07:53 +0000 (Fri, 16 Jan 2009)
New Revision: 24872

Log:
buildroot: convert remaining WGET users to DOWNLOAD helper

Modified:
   trunk/buildroot/package/mpfr/mpfr.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/target/linux/Makefile.in
   trunk/buildroot/target/linux/Makefile.in.advanced
   trunk/buildroot/target/u-boot/Makefile.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/package/mpfr/mpfr.mk
===================================================================
--- trunk/buildroot/package/mpfr/mpfr.mk	2009-01-16 11:48:43 UTC (rev 24871)
+++ trunk/buildroot/package/mpfr/mpfr.mk	2009-01-16 12:07:53 UTC (rev 24872)
@@ -21,7 +21,8 @@
 MPFR_PATCH_SOURCE:=$(DL_DIR)/$(MPFR_PATCH_FILE)
 
 $(MPFR_PATCH_SOURCE):
-	$(WGET) -O $@ $(MPFR_SITE),$(MPFR_PATCH)
+	$(call DOWNLOAD,$(MPFR_SITE),$(MPFR_PATCH))
+	mv $(DL_DIR)/$(MPFR_PATCH) $@
 endif
 
 $(DL_DIR)/$(MPFR_SOURCE):

Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2009-01-16 11:48:43 UTC (rev 24871)
+++ trunk/buildroot/package/setserial/setserial.mk	2009-01-16 12:07:53 UTC (rev 24872)
@@ -18,7 +18,7 @@
 ifneq ($(SETSERIAL_PATCH_FILE),)
 SETSERIAL_PATCH:=$(DL_DIR)/$(SETSERIAL_PATCH_FILE)
 $(SETSERIAL_PATCH):
-	$(WGET) -O $@ $(SETSERIAL_SITE),$(SETSERIAL_PATCH_FILE)
+	$(call DOWNLOAD,$(SETSERIAL_SITE),$(SETSERIAL_PATCH_FILE))
 else
 SETSERIAL_PATCH:=
 endif

Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2009-01-16 11:48:43 UTC (rev 24871)
+++ trunk/buildroot/target/linux/Makefile.in	2009-01-16 12:07:53 UTC (rev 24872)
@@ -108,7 +108,7 @@
 
 ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
 $(DL_DIR)/$(LINUX26_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
+	 $(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-16 11:48:43 UTC (rev 24871)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-16 12:07:53 UTC (rev 24872)
@@ -203,12 +203,12 @@
 
 ifneq ($(strip $(LINUX26_SOURCE)),$(strip $(LINUX_HEADERS_SOURCE)))
 $(DL_DIR)/$(LINUX26_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LINUX26_SITE)/$(LINUX26_SOURCE)
+	 $(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
 ifneq ($(strip $(LINUX26_PATCH_SOURCE)),)
 $(DL_DIR)/$(LINUX26_PATCH_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(LINUX26_PATCH_SITE)/$(LINUX26_PATCH_SOURCE)
+	 $(call DOWNLOAD,$(LINUX26_PATCH_SITE),$(LINUX26_PATCH_SOURCE))
 endif
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-16 11:48:43 UTC (rev 24871)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-16 12:07:53 UTC (rev 24872)
@@ -76,7 +76,7 @@
 #"))
 
 $(DL_DIR)/$(U_BOOT_SOURCE):
-	 $(WGET) -P $(DL_DIR) $(U_BOOT_SITE)/$(U_BOOT_SOURCE)
+	 $(call DOWNLOAD,$(U_BOOT_SITE),$(U_BOOT_SOURCE))
 
 $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
 	$(U_BOOT_CAT) $(DL_DIR)/$(U_BOOT_SOURCE) \

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-01-16 11:48:43 UTC (rev 24871)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2009-01-16 12:07:53 UTC (rev 24872)
@@ -45,7 +45,7 @@
 LINUX_RT_SITE:=$(BR2_KERNEL_MIRROR)/linux/kernel/projects/rt/older/
 LINUX_HEADERS_DEPENDS+=$(DL_DIR)/$(LINUX_RT_SOURCE)
 $(DL_DIR)/$(LINUX_RT_SOURCE):
-	$(WGET) -P $(DL_DIR) $(LINUX_RT_SITE)/$(LINUX_RT_SOURCE)
+	$(call DOWNLOAD,$(LINUX_RT_SITE),$(LINUX_RT_SOURCE))
 endif
 
 $(LINUX_HEADERS_UNPACK_DIR)/.unpacked: $(DL_DIR)/$(LINUX_HEADERS_SOURCE)
