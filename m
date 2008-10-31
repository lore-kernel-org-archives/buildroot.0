From: correa at uclibc.org <correa@uclibc.org>
Date: Fri, 31 Oct 2008 05:14:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20081031121440.1F41B3C831@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-10-31 05:14:39 -0700 (Fri, 31 Oct 2008)
New Revision: 23880

Log:
Improve pciutils based on Bernhard Reutner-Fischer's git repository (http://repo.or.cz/w/buildroot.git?a=tree;f=package/pciutils;hb=HEAD). Thanks

Removed:
   trunk/buildroot/package/pciutils/pciutils.patch

Modified:
   trunk/buildroot/package/pciutils/Config.in
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/Config.in
===================================================================
--- trunk/buildroot/package/pciutils/Config.in	2008-10-31 12:10:10 UTC (rev 23879)
+++ trunk/buildroot/package/pciutils/Config.in	2008-10-31 12:14:39 UTC (rev 23880)
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
-	depends on BR2_PACKAGE_ZLIB
+	default n
 	help
 	  Various utilities dealing with the PCI bus.
 	  Provides things like setpci and lspci.

Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 12:10:10 UTC (rev 23879)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2008-10-31 12:14:39 UTC (rev 23880)
@@ -4,6 +4,7 @@
 #
 #############################################################
 PCIUTILS_VERSION:=2.2.10
+PCIUTILS_VERSION:=3.0.1
 PCIUTILS_SOURCE:=pciutils-$(PCIUTILS_VERSION).tar.gz
 PCIUTILS_CAT:=$(ZCAT)
 PCIUTILS_SITE:=ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
@@ -14,40 +15,55 @@
 PCIIDS_SOURCE:=pci.ids.bz2
 PCIIDS_CAT:=$(BZCAT)
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+PCIUTILS_HAVE_ZLIB=yes
+PCIIDS_FILE=pci.ids.gz
+else
+PCIUTILS_HAVE_ZLIB=no
+PCIIDS_FILE=pci.ids
+endif
+
 $(DL_DIR)/$(PCIUTILS_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(PCIUTILS_SITE)/$(PCIUTILS_SOURCE)
 
 $(DL_DIR)/$(PCIIDS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(PCIIDS_SITE)/$(PCIIDS_SOURCE)
 
-pciutils-source: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
-
 $(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
 	$(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) > $(PCIUTILS_DIR)/pci.ids
-	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils\*.patch
+	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) > $(PCIUTILS_DIR)/$(PCIIDS_FILE)
+	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils-$(PCIUTILS_VERSION)\*.patch
+	#$(CONFIG_UPDATE) $(@D)
+	$(SED) 's/uname -s/echo Linux/' \
+		-e 's/uname -r/echo $(LINUX_HEADERS_VERSION)/' \
+		$(PCIUTILS_DIR)/lib/configure
 	touch $@
 
 $(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
-	$(MAKE1) CC=$(TARGET_CC) OPT="$(TARGET_CFLAGS)" -C $(PCIUTILS_DIR) \
+	$(MAKE1) CC="$(TARGET_CC)" OPT="$(TARGET_CFLAGS)" -C $(PCIUTILS_DIR) \
 		SHAREDIR="/usr/share/misc" \
+		ZLIB=$(PCIUTILS_HAVE_ZLIB) \
 		PREFIX=/usr
 	touch $@
 
 $(TARGET_DIR)/sbin/lspci: $(PCIUTILS_DIR)/.compiled
-	install -c $(PCIUTILS_DIR)/lspci $(TARGET_DIR)/sbin/lspci
+	$(INSTALL) $(PCIUTILS_DIR)/lspci $(TARGET_DIR)/sbin/lspci
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
 $(TARGET_DIR)/sbin/setpci: $(PCIUTILS_DIR)/.compiled
-	install -c $(PCIUTILS_DIR)/setpci $(TARGET_DIR)/sbin/setpci
+	$(INSTALL) $(PCIUTILS_DIR)/setpci $(TARGET_DIR)/sbin/setpci
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
 
-$(TARGET_DIR)/usr/share/misc/pci.ids: $(PCIUTILS_DIR)/.unpacked
-	install -Dc $(PCIUTILS_DIR)/pci.ids $(TARGET_DIR)/usr/share/misc/pci.ids
+$(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE): $(PCIUTILS_DIR)/.unpacked
+	$(INSTALL) -D $(PCIUTILS_DIR)/$(PCIIDS_FILE) $(@D)
 
-pciutils: uclibc zlib $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/pci.ids
+pciutils: uclibc $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/usr/share/misc/$(PCIIDS_FILE)
 
+pciutils-source: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
+
 pciutils-clean:
-	rm $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/usr/share/misc/pci.ids
 	-$(MAKE) -C $(PCIUTILS_DIR) clean
+	rm -f $(TARGET_DIR)/sbin/lspci $(TARGET_DIR)/sbin/setpci $(TARGET_DIR)/usr/share/misc/pci.ids*
 
 pciutils-dirclean:
 	rm -rf $(PCIUTILS_DIR)
@@ -57,6 +73,6 @@
 # Toplevel Makefile options
 #
 #############################################################
-ifeq ($(strip $(BR2_PACKAGE_PCIUTILS)),y)
+ifeq ($(BR2_PACKAGE_PCIUTILS),y)
 TARGETS+=pciutils
 endif

Deleted: trunk/buildroot/package/pciutils/pciutils.patch
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.patch	2008-10-31 12:10:10 UTC (rev 23879)
+++ trunk/buildroot/package/pciutils/pciutils.patch	2008-10-31 12:14:39 UTC (rev 23880)
@@ -1,12 +0,0 @@
---- pciutils-2.2.6/lib/configure
-+++ pciutils-2.2.6/lib/configure
-@@ -12,7 +12,7 @@
- echo_n "Configuring libpci for your system..."
- sharedir=${1:-/usr/share}
- version=${2:-0.0}
--sys=`uname -s`
-+sys=Linux
- rel=`uname -r`
- if [ "$sys" = "AIX" -a -x /usr/bin/oslevel -a -x /usr/sbin/lsattr ]
- then
-
