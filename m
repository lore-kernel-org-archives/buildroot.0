From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Fri,  2 Jan 2009 12:01:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
Message-ID: <20090102120150.7B84B769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2009-01-02 12:01:49 +0000 (Fri, 02 Jan 2009)
New Revision: 24647

Log:
* Fix format of the pciutils pci.ids.gz data file
- If ZLIB is present the filename of pci.ids is changed to pci.ids.gz but its not compressed, add a compressor to ensure its gzipped


Modified:
   trunk/buildroot/package/pciutils/pciutils.mk


Changeset:
Modified: trunk/buildroot/package/pciutils/pciutils.mk
===================================================================
--- trunk/buildroot/package/pciutils/pciutils.mk	2009-01-02 11:18:09 UTC (rev 24646)
+++ trunk/buildroot/package/pciutils/pciutils.mk	2009-01-02 12:01:49 UTC (rev 24647)
@@ -17,9 +17,11 @@
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 PCIUTILS_HAVE_ZLIB=yes
 PCIIDS_FILE=pci.ids.gz
+PCIIDS_COMPRESSOR=gzip -9 -c
 else
 PCIUTILS_HAVE_ZLIB=no
 PCIIDS_FILE=pci.ids
+PCIIDS_COMPRESSOR=cat
 endif
 
 $(DL_DIR)/$(PCIUTILS_SOURCE):
@@ -30,7 +32,7 @@
 
 $(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(PCIUTILS_SOURCE) $(DL_DIR)/$(PCIIDS_SOURCE)
 	$(PCIUTILS_CAT) $(DL_DIR)/$(PCIUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) > $(PCIUTILS_DIR)/$(PCIIDS_FILE)
+	$(PCIIDS_CAT) $(DL_DIR)/$(PCIIDS_SOURCE) | $(PCIIDS_COMPRESSOR) > $(PCIUTILS_DIR)/$(PCIIDS_FILE)
 	toolchain/patch-kernel.sh $(PCIUTILS_DIR) package/pciutils pciutils-$(PCIUTILS_VERSION)\*.patch
 	#$(CONFIG_UPDATE) $(@D)
 	$(SED) 's/uname -s/echo Linux/' \
