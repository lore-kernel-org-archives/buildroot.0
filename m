From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Sep 2008 08:33:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iperf
Message-ID: <20080901153312.CAFEE3C6B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-01 08:33:12 -0700 (Mon, 01 Sep 2008)
New Revision: 23296

Log:
iperf: convert to Makefile.autotools.in format

Modified:
   trunk/buildroot/package/iperf/iperf.mk


Changeset:
Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2008-09-01 15:30:49 UTC (rev 23295)
+++ trunk/buildroot/package/iperf/iperf.mk	2008-09-01 15:33:12 UTC (rev 23296)
@@ -7,67 +7,13 @@
 IPERF_VERSION:=2.0.2
 IPERF_SOURCE:=iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
-IPERF_DIR:=$(BUILD_DIR)/iperf-$(IPERF_VERSION)
-IPERF_CAT:=$(ZCAT)
+IPERF_AUTORECONF:=NO
+IPERF_INSTALL_STAGING:=NO
+IPERF_INSTALL_TARGET:=YES
+IPERF_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip
+IPERF_CONF_ENV:=ac_cv_func_malloc_0_nonnull=yes
+IPERF_CONF_OPT:=--disable-dependency-tracking --disable-web100 $(DISABLE_IPV6)
 
-$(DL_DIR)/$(IPERF_SOURCE):
-	$(WGET) -P $(DL_DIR) $(IPERF_SITE)/$(IPERF_SOURCE)
+IPERF_DEPENDENCIES:=uclibc
 
-$(IPERF_DIR)/.unpacked: $(DL_DIR)/$(IPERF_SOURCE)
-	$(IPERF_CAT) $(DL_DIR)/$(IPERF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IPERF_DIR) package/iperf/ iperf\*.patch
-	$(CONFIG_UPDATE) $(IPERF_DIR)
-	touch $(IPERF_DIR)/.unpacked
-
-$(IPERF_DIR)/.configured: $(IPERF_DIR)/.unpacked
-	(cd $(IPERF_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_malloc_0_nonnull=yes \
-		./configure \
-		--with-gnu-ld \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		$(DISABLE_IPV6) \
-		--disable-dependency-tracking \
-		--disable-web100 \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/sbin \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		--includedir=$(STAGING_DIR)/usr/include \
-	)
-	touch $(IPERF_DIR)/.configured
-
-$(IPERF_DIR)/src/iperf: $(IPERF_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(IPERF_DIR)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(IPERF_DIR)/src/iperf
-
-$(TARGET_DIR)/usr/bin/iperf: $(IPERF_DIR)/src/iperf
-	cp $(IPERF_DIR)/src/iperf $(TARGET_DIR)/usr/bin/iperf
-
-iperf: $(TARGET_DIR)/usr/bin/iperf
-
-iperf-source: $(DL_DIR)/$(IPERF_SOURCE)
-
-iperf-clean:
-	rm -f $(TARGET_DIR)/usr/bin/iperf
-	-$(MAKE) -C $(IPERF_DIR) clean
-
-iperf-dirclean:
-	rm -rf $(IPERF_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_PACKAGE_IPERF)),y)
-TARGETS+=iperf
-endif
+$(eval $(call AUTOTARGETS,package,iperf))
