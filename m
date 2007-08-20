From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 20 Aug 2007 02:25:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20070820092547.D34AFA459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-20 02:25:47 -0700 (Mon, 20 Aug 2007)
New Revision: 19589

Log:
Cleanup dnsmasq

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-08-20 07:24:10 UTC (rev 19588)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-08-20 09:25:47 UTC (rev 19589)
@@ -24,19 +24,20 @@
 	$(ZCAT) $(DL_DIR)/$(DNSMASQ_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(DNSMASQ_DIR) package/dnsmasq/ \
 		$(DNSMASQ_VERSION)\*.patch
-	touch $(DNSMASQ_DIR)/.source
+	touch $@
 
 $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source
 	$(MAKE) CC=$(TARGET_CC) CFLAGS="$(TARGET_CFLAGS)" \
-		BINDIR=/usr/sbin MANDIR=/usr/man -C $(DNSMASQ_DIR)
+		PREFIX=/usr -C $(DNSMASQ_DIR)
 
 $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY): $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY)
-	$(MAKE) BINDIR=/usr/sbin MANDIR=/usr/man \
-		DESTDIR=$(TARGET_DIR) -C $(DNSMASQ_DIR) install
+	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(DNSMASQ_DIR) install
 	$(STRIP) $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 	mkdir -p $(TARGET_DIR)/var/lib/misc
+	# Isn't this vulverable to symlink attacks?
 	ln -sf /tmp/dnsmasq.leases $(TARGET_DIR)/var/lib/misc/dnsmasq.leases
-	rm -rf $(TARGET_DIR)/usr/man
+	# Another questionable wipe out :(
+	#rm -rf $(TARGET_DIR)/usr/share/man
 
 dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 
@@ -45,7 +46,9 @@
 dnsmasq-source: $(DL_DIR)/$(DNSMASQ_SOURCE)
 
 dnsmasq-clean:
-	#$(MAKE) prefix=$(TARGET_DIR)/usr -C $(DNSMASQ_DIR) uninstall
+	rm -f $(addprefix $(TARGET_DIR)/,var/lib/misc/dnsmasq.leases \
+					 usr/share/man/man?/dnsmasq.* \
+					 $(DNSMASQ_TARGET_BINARY))
 	-$(MAKE) -C $(DNSMASQ_DIR) clean
 
 dnsmasq-dirclean:
