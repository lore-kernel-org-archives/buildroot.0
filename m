From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Mar 2010 23:09:05 +0100
Subject: [Buildroot] [git commit master] Bump pppd to 2.4.5 and convert to
	Makefile.autotools.in
Message-ID: <20100318220933.23FDC776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d63e78cddc4ac217372fd5990d6f99d687c1116b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pppd/Config.in              |    1 -
 package/pppd/pppd-2.4.4-nobsd.patch |   21 -----
 package/pppd/pppd.mk                |  139 +++++++++++++++--------------------
 3 files changed, 58 insertions(+), 103 deletions(-)
 delete mode 100644 package/pppd/pppd-2.4.4-nobsd.patch

diff --git a/package/pppd/Config.in b/package/pppd/Config.in
index 960640d..daca876 100644
--- a/package/pppd/Config.in
+++ b/package/pppd/Config.in
@@ -13,4 +13,3 @@ config BR2_PACKAGE_PPPD_FILTER
 	  Packet filtering abilities for pppd. If enabled,
 	  the pppd active-filter and pass-filter options
 	  are available.
-
diff --git a/package/pppd/pppd-2.4.4-nobsd.patch b/package/pppd/pppd-2.4.4-nobsd.patch
deleted file mode 100644
index 7ffc1b5..0000000
--- a/package/pppd/pppd-2.4.4-nobsd.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -Nura ppp-2.4.4/pppd/plugins/rp-pppoe/discovery.c ppp-2.4.4-nobsd/pppd/plugins/rp-pppoe/discovery.c
---- ppp-2.4.4/pppd/plugins/rp-pppoe/discovery.c	2005-03-22 07:22:32.000000000 -0300
-+++ ppp-2.4.4-nobsd/pppd/plugins/rp-pppoe/discovery.c	2009-02-17 09:01:27.000000000 -0200
-@@ -598,7 +598,7 @@
-     do {
- 	padiAttempts++;
- 	if (padiAttempts > MAX_PADI_ATTEMPTS) {
--	    warn("Timeout waiting for PADO packets");
-+	    syslog(LOG_WARNING, "Timeout waiting for PADO packets");
- 	    close(conn->discoverySocket);
- 	    conn->discoverySocket = -1;
- 	    return;
-@@ -627,7 +627,7 @@
-     do {
- 	padrAttempts++;
- 	if (padrAttempts > MAX_PADI_ATTEMPTS) {
--	    warn("Timeout waiting for PADS packets");
-+	    syslog(LOG_WARNING, "Timeout waiting for PADS packets");
- 	    close(conn->discoverySocket);
- 	    conn->discoverySocket = -1;
- 	    return;
diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 46d5b6f..6620abc 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -3,95 +3,72 @@
 # pppd
 #
 #############################################################
-PPPD_VERSION:=2.4.4
-PPPD_SOURCE:=ppp-$(PPPD_VERSION).tar.gz
-PPPD_SITE:=ftp://ftp.samba.org/pub/ppp
-PPPD_DIR:=$(BUILD_DIR)/ppp-$(PPPD_VERSION)
-PPPD_CAT:=$(ZCAT)
-PPPD_BINARY:=pppd/pppd
-PPPD_TARGET_BINARY:=usr/sbin/pppd
 
+PPPD_VERSION = 2.4.5
+PPPD_SOURCE = ppp-$(PPPD_VERSION).tar.gz
+PPPD_SITE = ftp://ftp.samba.org/pub/ppp
+PPPD_TARGET_BINS = chat pppd pppdump pppstats
+PPPD_MANPAGES = chat pppd pppdump pppstats
+PPPD_MAKE = $(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_MAKE_OPT)
 
-$(DL_DIR)/$(PPPD_SOURCE):
-	 $(call DOWNLOAD,$(PPPD_SITE),$(PPPD_SOURCE))
+ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
+	PPPD_DEPENDENCIES += libpcap
+	PPPD_MAKE_OPT += FILTER=y
+endif
 
-pppd-source: $(DL_DIR)/$(PPPD_SOURCE)
+ifeq ($(BR2_INET_IPV6),y)
+	PPPD_MAKE_OPT += HAVE_INET6=y
+endif
 
-PPPD_OPTIONS_$(BR2_INET_IPV6) += HAVE_INET6=y
-PPPD_OPTIONS_$(BR2_PACKAGE_PPPD_FILTER) += FILTER=y
+$(eval $(call AUTOTARGETS,package,pppd))
 
-$(PPPD_DIR)/.unpacked: $(DL_DIR)/$(PPPD_SOURCE)
-	$(PPPD_CAT) $(DL_DIR)/$(PPPD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PPPD_DIR) package/pppd/ pppd\*.patch
-	$(SED) 's/ -DIPX_CHANGE -DHAVE_MMAP//' $(PPPD_DIR)/pppd/Makefile.linux
+$(PPPD_HOOK_POST_EXTRACT):
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
-	$(SED) 's,(INSTALL) -s,(INSTALL),' $(PPPD_DIR)/*/Makefile.linux
-	$(SED) 's,(INSTALL) -s,(INSTALL),' $(PPPD_DIR)/pppd/plugins/*/Makefile.linux
-	$(SED) 's/ -o root//' $(PPPD_DIR)/*/Makefile.linux
-	$(SED) 's/ -g daemon//' $(PPPD_DIR)/*/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
 	touch $@
 
-$(PPPD_DIR)/.configured: $(PPPD_DIR)/.unpacked
-	(cd $(PPPD_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-	)
+$(PPPD_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing to target")
+	for sbin in $(PPPD_TARGET_BINS); do \
+		$(INSTALL) -D $(PPPD_DIR)/$$sbin/$$sbin \
+			$(TARGET_DIR)/usr/sbin/$$sbin; \
+	done
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/minconn.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/minconn.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/passprompt.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/passprompt.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/passwordfd.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/passwordfd.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppoatm/pppoatm.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppoatm.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/rp-pppoe/rp-pppoe.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/rp-pppoe.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/rp-pppoe/pppoe-discovery \
+		$(TARGET_DIR)/usr/sbin/pppoe-discovery
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/winbind.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/winbind.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/openl2tp.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/openl2tp.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/pppol2tp/pppol2tp.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/pppol2tp.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
+	for m in $(PPPD_MANPAGES); do \
+		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
+			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
+	done
 	touch $@
 
-$(PPPD_DIR)/$(PPPD_BINARY): $(PPPD_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) COPTS="$(TARGET_CFLAGS)" -C $(PPPD_DIR) $(PPPD_OPTIONS_y)
-
-$(TARGET_DIR)/$(PPPD_TARGET_BINARY): $(PPPD_DIR)/$(PPPD_BINARY)
-	$(MAKE1) DESTDIR=$(TARGET_DIR)/usr CC=$(TARGET_CC) -C $(PPPD_DIR) install $(PPPD_OPTIONS_y)
-ifneq ($(BR2_ENABLE_LOCALE),y)
-	rm -rf $(TARGET_DIR)/usr/share/locale
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-	rm -rf $(TARGET_DIR)/usr/share/doc
-	rm -rf $(TARGET_DIR)/usr/include/pppd
-
-pppd: $(TARGET_DIR)/$(PPPD_TARGET_BINARY)
-
-pppd-clean:
-	rm -f $(TARGET_DIR)/usr/sbin/pppd
-	rm -f $(TARGET_DIR)/usr/sbin/chat
-	rm -f $(TARGET_DIR)/usr/sbin/pppstatus
-	rm -f $(TARGET_DIR)/usr/sbin/pppdump
-	rm -rf $(TARGET_DIR)/etc/ppp
-	rm -rf $(TARGET_DIR)/usr/include/pppd
-	-$(MAKE) -C $(PPPD_DIR) clean
-
-pppd-dirclean:
-	rm -rf $(PPPD_DIR)
-
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PPPD),y)
-TARGETS+=pppd
-endif
+$(PPPD_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(addprefix $(TARGET_DIR)/usr/sbin/, $(PPPD_TARGET_BINS))
+	rm -f $(TARGET_DIR)/usr/sbin/pppoe-discovery
+	for m in $(PPPD_MANPAGES); do \
+		rm -f $(TARGET_DIR)/usr/share/man/man8/$$m.8; \
+	done
+	rm -rf $(TARGET_DIR)/usr/lib/pppd
+	rm -f $(PPPD_TARGET_INSTALL_TARGET) $(PPPD_HOOK_POST_INSTALL)
-- 
1.6.3.3
