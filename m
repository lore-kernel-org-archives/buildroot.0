From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  8 Apr 2009 22:45:30 +0000 (UTC)
Subject: [Buildroot] svn commit: [26029] trunk/buildroot/package: lzo
	mtd/mtd-utils
Message-ID: <20090408224531.0569E76486@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-08 22:45:29 +0000 (Wed, 08 Apr 2009)
New Revision: 26029

Log:
jffs2root: build host version of lzo and use for host mkfs.jffs2

Modified:
   trunk/buildroot/package/lzo/lzo.mk
   trunk/buildroot/package/mtd/mtd-utils/mtd.mk


Changeset:
Modified: trunk/buildroot/package/lzo/lzo.mk
===================================================================
--- trunk/buildroot/package/lzo/lzo.mk	2009-04-08 21:51:33 UTC (rev 26028)
+++ trunk/buildroot/package/lzo/lzo.mk	2009-04-08 22:45:29 UTC (rev 26029)
@@ -14,3 +14,45 @@
 LZO_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,lzo))
+
+# lzo for the host
+LZO_HOST_DIR:=$(BUILD_DIR)/lzo-$(LZO_VERSION)-host
+
+$(DL_DIR)/$(LZO_SOURCE):
+	$(call DOWNLOAD,$(LZO_SITE),$(LZO_SOURCE))
+
+$(STAMP_DIR)/host_lzo_unpacked: $(DL_DIR)/$(LZO_SOURCE)
+	mkdir -p $(LZO_HOST_DIR)
+	$(INFLATE$(suffix $(LZO_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LZO_HOST_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LZO_HOST_DIR) package/lzo/ \*.patch
+	touch $@
+
+$(STAMP_DIR)/host_lzo_configured: $(STAMP_DIR)/host_lzo_unpacked
+	(cd $(LZO_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+	)
+	touch $@
+
+$(STAMP_DIR)/host_lzo_compiled: $(STAMP_DIR)/host_lzo_configured
+	$(MAKE) -C $(LZO_HOST_DIR)
+	touch $@
+
+$(STAMP_DIR)/host_lzo_installed: $(STAMP_DIR)/host_lzo_compiled
+	$(MAKE) -C $(LZO_HOST_DIR) install
+	touch $@
+
+host-lzo: $(STAMP_DIR)/host_lzo_installed
+
+host-lzo-clean:
+	rm -f $(addprefix $(STAMP_DIR)/host_lzo_,unpacked configured compiled installed)
+	-$(MAKE) -C $(LZO_HOST_DIR) uninstall
+	-$(MAKE) -C $(LZO_HOST_DIR) clean
+
+host-lzo-dirclean:
+	rm -rf $(LZO_HOST_DIR)

Modified: trunk/buildroot/package/mtd/mtd-utils/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2009-04-08 21:51:33 UTC (rev 26028)
+++ trunk/buildroot/package/mtd/mtd-utils/mtd.mk	2009-04-08 22:45:29 UTC (rev 26029)
@@ -34,16 +34,16 @@
 	touch $@
 
 
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) \
-		BUILDDIR=$(MTD_HOST_DIR) \
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked $(STAMP_DIR)/host_lzo_installed
+	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
+		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \
+		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
 		-C $(MTD_HOST_DIR) mkfs.jffs2
 
 $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
-	CC="$(HOSTCC)" CROSS= CFLAGS=-I$(LINUX_HEADERS_DIR)/include \
-		$(MAKE) LINUXDIR=$(LINUX_DIR) \
-		BUILDDIR=$(MTD_HOST_DIR) \
+	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
+		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \
+		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
 		-C $(MTD_HOST_DIR) sumtool
 
 mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
