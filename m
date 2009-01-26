From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 23:52:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: docs target
	target/device/Atmel target/ etc...
Message-ID: <20090126235232.92CF677458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 23:52:31 +0000 (Mon, 26 Jan 2009)
New Revision: 25071

Log:
Create a common BR2_COPYTO to prepare to replace
all the different COPYTOs spread out all over
Buildroot.
Generate COPY_FILE subroutine which can be used
to copy a file.

$(COPY_FILE , file, directory, filename)
This will copy to binary dir and to the selected
copy dir if set in new config (intended to replace
all old COPYTO configs)

This is overridden by BUILDROOT_COPYTO,
if set into the environment.







Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2009-01-26 21:19:05 UTC (rev 25070)
+++ trunk/buildroot/Config.in	2009-01-26 23:52:31 UTC (rev 25071)
@@ -69,6 +69,13 @@
 
 	  The default is $(BASE_DIR)/dl
 
+config BR2_COPYTO
+	string "Copy result to..."
+	default ""
+	help
+	  Setting this variable will (eventually) override 
+	  any other copyto configurations in buildroot.
+
 source	"target/device/Config.in.mirrors"
 
 config BR2_STAGING_DIR

Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-01-26 21:19:05 UTC (rev 25070)
+++ trunk/buildroot/docs/buildroot.html	2009-01-26 23:52:31 UTC (rev 25071)
@@ -247,6 +247,7 @@
     <li>HOSTCC</li>
     <li>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</li>
     <li>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</li>
+    <li>BUILDROOT_COPYTO</li>
     <li>BUILDROOT_DL_DIR</li>
     <li>BUILDROOT_LOCAL</li>
     <li>BUILDROOT_USE_XWINDOWS</li>
@@ -264,6 +265,16 @@
 $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 </pre>
 
+    <p>If you want the result of your build to be copied to another directory
+    like /tftpboot for downloading to a board using tftp, then you
+    can use BUILDROOT_COPYTO to specify your location</p>
+    <p>Typically, this is set in your ~/.bashrc file
+
+<pre>
+$ export BUILDROOT_COPYTO=/tftpboot
+</pre>
+
+
     <h3><a name="helper_completion" id="helper_completion"></a>
     Using auto-completion</h3>
 

Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2009-01-26 21:19:05 UTC (rev 25070)
+++ trunk/buildroot/target/Makefile.in	2009-01-26 23:52:31 UTC (rev 25071)
@@ -3,6 +3,56 @@
 BR2_PACKAGE_LINUX_KCONFIG:=$(strip $(subst ",,$(BR2_PACKAGE_LINUX_KCONFIG)))
 #"))
 
+
+# COPY_FILE absolute_path_to_file, target_directory, filename
+ifneq ($(strip $(subst ",,$(BUILDROOT_COPYTO))),)	# Use shell definition
+#"))
+define COPY_FILE
+	@echo "BUILDROOT_COPYTO: Copy to $(BUILDROOT_COPYTO)/$(strip $(3))" ; \
+	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
+	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
+		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
+	fi ; \
+	mkdir -p $(BUILDROOT_COPYTO) || echo "Could not create $(BUILDROOT_COPYTO)" ; \
+	if [ -d $(BUILDROOT_COPYTO) -o  -w $(BUILDROOT_COPYTO) ] ; then \
+		cp $(1) $(BUILDROOT_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
+	fi
+endef
+COPYTO=$(strip $(subst ",,$(BUILDROOT_COPYTO)))
+else ifneq ($(strip $(subst ",,$(BR2_COPYTO))),)	# Global override
+#"))
+define COPY_FILE
+	@echo "BR2_COPYTO: Copy to $(BR2_COPYTO)/$(strip $(3))" ; \
+	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
+	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
+		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
+	fi ; \
+	if [ "$(strip $(subst ",,$(BR2_COPYTO)))X" != "X" ] ; then \
+		mkdir -p $(BR2_COPYTO)  || echo "Could not create $(BR2_COPYTO)" ; \
+		if [ -d $(BR2_COPYTO) -o -w $(BR2_COPYTO) ] ; then \
+			cp $(1) $(BR2_COPYTO)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
+		fi ; \
+	fi
+endef
+#"))
+COPYTO=$(strip $(subst ",,$(BR2_COPYTO)))
+else	# Package specific copyto, or empty
+define COPY_FILE
+	@echo "Copy to $(2)/$(strip $(3))" ; \
+	mkdir -p $(BINARIES_DIR) || echo "Could not create $(BINARIES_DIR)" ; \
+	if [ -w $(BINARIES_DIR) -o -w $(BINARIES_DIR)  ] ; then \
+		cp $(1) $(BINARIES_DIR)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
+	fi ; \
+	if [ "$(strip $(subst ",,$(2)))X" != "X" ] ; then \
+		mkdir -p $(2) || echo "Could not create $(2)" ; \
+		if [ -d $(2) -o  -w $(2) ] ; then \
+			cp $(1) $(2)/$(strip $(3)) || echo "Could not copy $(3)" ;  \
+		fi ; \
+	fi
+endef
+#"))
+endif
+
 # make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
 

Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2009-01-26 21:19:05 UTC (rev 25070)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2009-01-26 23:52:31 UTC (rev 25071)
@@ -7,7 +7,7 @@
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
 ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
 # "))
-DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)/Source
+DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
 DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin
@@ -32,12 +32,9 @@
 	rm -rf $(DATAFLASHBOOT_DIR)
 
 dataflash:	 $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)
-	mkdir -p $(BINARIES_DIR)
-	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	$(BINARIES_DIR)/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
-ifneq	($(TARGET_ATMEL_COPYTO),)
-	cp $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY)	$(TARGET_ATMEL_COPYTO)/$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY)
-endif
+	$(call COPY_FILE, $(DATAFLASHBOOT_DIR)/$(DATAFLASHBOOT_BINARY), $(TARGET_ATMEL_COPYTO),	$(BOARD_NAME)-$(DATAFLASHBOOT_BINARY))
 
+
 #############################################################
 #
 # Toplevel Makefile options

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2009-01-26 21:19:05 UTC (rev 25070)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2009-01-26 23:52:31 UTC (rev 25071)
@@ -13,7 +13,11 @@
 TARGET_DEVICE_TABLE:=$(ATMEL_TARGET)/device_table.txt
 TARGET_SKELETON_LINKS:=$(ATMEL_TARGET)/skel.tar.gz
 
+ifneq ($(COPYTO),)
+TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_COPYTO)))
+else
 TARGET_ATMEL_COPYTO:=$(strip $(subst ",, $(BR2_TARGET_ATMEL_COPYTO)))
+endif
 
 # These are set by Config.in
 DOWNLOAD_LINUX26_VERSION:= $(strip $(subst ",, $(BR2_DOWNLOAD_LINUX26_VERSION)))

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-26 21:19:05 UTC (rev 25070)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2009-01-26 23:52:31 UTC (rev 25071)
@@ -71,14 +71,18 @@
 	mkdir -p $(BINARIES_DIR)
 ifeq	($(AT91BOOTSTRAP_VERSION),2.3)
 	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
-	cp $(AT91BOOTSTRAP_TARGET) $(BR2_TARGET_ATMEL_COPYTO)/$(AT91BOOTSTRAP_BINARY)
+	$(call COPY_FILE, $(AT91BOOTSTRAP_TARGET), $(BR2_TARGET_ATMEL_COPYTO), $(AT91BOOTSTRAP_BINARY))
 else
 	make MEMORY=$(AT91BOOTSTRAP_MEMORY) \
 		CROSS_COMPILE=$(TARGET_CROSS) \
 		-C $(AT91BOOTSTRAP_DIR) boot
-	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install
-	make DESTDIR=$(BR2_TARGET_ATMEL_COPYTO) -C $(AT91BOOTSTRAP_DIR) install
+	make DESTDIR=$(BINARIES_DIR) -C $(AT91BOOTSTRAP_DIR) install || ?
+		echo "Could not copy bootstrap to BINARIES_DIR"
+ifneq ($(BR2_TARGET_ATMEL_COPYTO),)
+	make DESTDIR=$(BR2_TARGET_ATMEL_COPYTO) -C $(AT91BOOTSTRAP_DIR) install || \
+		echo "Could not copy bootstrap to BR2_ATMEL_COPYTO"
 endif
+endif
 	touch $@
 
 #	cp $(AT91BOOTSTRAP_TARGET) $(BINARIES_DIR)/$(AT91BOOTSTRAP_BINARY)
