From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 27 Jun 2007 02:40:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpcap
Message-ID: <20070627094026.30D14A4649@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-27 02:40:25 -0700 (Wed, 27 Jun 2007)
New Revision: 18950

Log:
- use correct installation path


Modified:
   trunk/buildroot/package/libpcap/libpcap.mk


Changeset:
Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2007-06-27 09:18:58 UTC (rev 18949)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2007-06-27 09:40:25 UTC (rev 18950)
@@ -37,14 +37,13 @@
 	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ \*.patch
 	touch $@
 
+# XXX: FIXME: put the argus ac_cv_lbl_unaligned_fail setting to som commonly
+# seen place and introduce TARGET_CONFIGURE_HINTS or the like!
 $(LIBPCAP_DIR)/.configured: $(LIBPCAP_DIR)/.unpacked
-	( \
-		cd $(LIBPCAP_DIR) ; \
+	(cd $(LIBPCAP_DIR) ; rm -rf config.cache ; \
 		ac_cv_linux_vers=$(BR2_DEFAULT_KERNEL_HEADERS) \
 		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
@@ -53,33 +52,33 @@
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
 		--sbindir=/usr/sbin \
-		--libdir=/lib \
+		--libdir=/usr/lib \
 		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
 		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
+		--includedir=/usr/include \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-build-cc="$(HOSTCC)" \
 		--disable-yydebug \
 		--prefix=/usr \
 		--with-pcap=linux \
+		$(DISABLE_IPV6) \
 	)
 	touch $@
 
 $(LIBPCAP_DIR)/libpcap.a: $(LIBPCAP_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" \
-		AR="$(TARGET_CROSS)ar" \
-		-C $(LIBPCAP_DIR)
+	$(MAKE) AR=$(TARGET_CROSS)ar -C $(LIBPCAP_DIR)
 
-$(STAGING_DIR)/lib/libpcap.a: $(LIBPCAP_DIR)/libpcap.a
+$(STAGING_DIR)/usr/lib/libpcap.a: $(LIBPCAP_DIR)/libpcap.a
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBPCAP_DIR) install
 
-libpcap: uclibc zlib $(STAGING_DIR)/lib/libpcap.a
+libpcap: uclibc zlib $(STAGING_DIR)/usr/lib/libpcap.a
 
 libpcap-clean:
-	rm -f $(STAGING_DIR)/include/pcap*.h $(STAGING_DIR)/lib/libpcap.a
+	rm -f $(STAGING_DIR)/usr/include/pcap*.h \
+		$(STAGING_DIR)/usr/lib/libpcap.a
 	-$(MAKE) -C $(LIBPCAP_DIR) clean
 
 libpcap-dirclean:
