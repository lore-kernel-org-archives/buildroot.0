From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 16 Feb 2007 12:16:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  iperf
Message-ID: <20070216201625.ADF17485A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-16 12:16:24 -0800 (Fri, 16 Feb 2007)
New Revision: 17913

Log:
iperf package. Closes #0001224

Added:
   trunk/buildroot/package/iperf/
   trunk/buildroot/package/iperf/Config.in
   trunk/buildroot/package/iperf/iperf.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-02-16 18:32:20 UTC (rev 17912)
+++ trunk/buildroot/package/Config.in	2007-02-16 20:16:24 UTC (rev 17913)
@@ -128,6 +128,7 @@
 source "package/ethtool/Config.in"
 source "package/haserl/Config.in"
 source "package/hostap/Config.in"
+source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"

Added: trunk/buildroot/package/iperf/Config.in
===================================================================
--- trunk/buildroot/package/iperf/Config.in	                        (rev 0)
+++ trunk/buildroot/package/iperf/Config.in	2007-02-16 20:16:24 UTC (rev 17913)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IPERF
+	bool "iperf"
+	default n
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Internet Protocol bandwidth measuring tool for measuring
+	  TCP/UDP performance.
+
+	  http://dast.nlanr.net/projects/iperf/

Added: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	                        (rev 0)
+++ trunk/buildroot/package/iperf/iperf.mk	2007-02-16 20:16:24 UTC (rev 17913)
@@ -0,0 +1,73 @@
+#############################################################
+#
+# iperf
+#
+#############################################################
+
+IPERF_VERSION:=2.0.2
+IPERF_SOURCE:=iperf-$(IPERF_VERSION).tar.gz
+IPERF_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
+IPERF_DIR:=$(BUILD_DIR)/iperf-$(IPERF_VERSION)
+IPERF_CAT:=$(ZCAT)
+
+$(DL_DIR)/$(IPERF_SOURCE):
+	$(WGET) -P $(DL_DIR) $(IPERF_SITE)/$(IPERF_SOURCE)
+
+$(IPERF_DIR)/.unpacked: $(DL_DIR)/$(IPERF_SOURCE)
+	$(IPERF_CAT) $(DL_DIR)/$(IPERF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(IPERF_DIR) package/iperf/ iperf\*.patch
+	touch $(IPERF_DIR)/.unpacked
+
+$(IPERF_DIR)/.configured: $(IPERF_DIR)/.unpacked
+	(	cd $(IPERF_DIR); rm -rf config.cache;  \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		ac_cv_func_malloc_0_nonnull=yes \
+		./configure \
+		--with-gnu-ld \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--disable-ipv6 \
+		--disable-dependency-tracking \
+		--disable-web100 \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/sbin \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--includedir=$(STAGING_DIR)/include \
+	);
+	touch $(IPERF_DIR)/.configured
+
+$(IPERF_DIR)/src/iperf: $(IPERF_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(IPERF_DIR)
+	-$(STRIP) --strip-unneeded $(IPERF_DIR)/src/iperf
+
+$(TARGET_DIR)/usr/bin/iperf: $(IPERF_DIR)/src/iperf
+	cp $(IPERF_DIR)/src/iperf $(TARGET_DIR)/usr/bin/iperf
+
+iperf: $(TARGET_DIR)/usr/bin/iperf
+
+iperf-source: $(DL_DIR)/$(IPERF_SOURCE)
+
+iperf-clean:
+	@if [ -d $(IPERF_KDIR)/Makefile ] ; then \
+		$(MAKE) -C $(IPERF_DIR) clean ; \
+	fi;
+
+iperf-dirclean:
+	rm -rf $(IPERF_DIR)
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_IPERF)),y)
+TARGETS+=iperf
+endif
