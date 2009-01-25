From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:14:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090125231456.B9B6F76D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:14:55 +0000 (Sun, 25 Jan 2009)
New Revision: 25028

Log:
Ensure /boot exists, Write linux version to file,in case the kernel version has changed after the first build

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-25 23:09:12 UTC (rev 25027)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-25 23:14:55 UTC (rev 25028)
@@ -227,6 +227,7 @@
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
 	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
 endif
 	touch $@
 
@@ -400,6 +401,7 @@
 
 # -----------------------------------------------------------------------------
 $(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured $(LINUX26_MKIMAGE_DEP)
+	mkdir -p $(TARGET_DIR)/boot
 	-mv $(LINUX26_DIR)/localversion* $(TARGET_DIR)/boot
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
