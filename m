From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 2 Jul 2009 14:55:51 +0200
Subject: [Buildroot] [git commit] openvpn: convert to Makefile.autotools.in
	format
Message-ID: <20090702130017.67F92776E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=234fb283edd6ce50d9fa0b0673fb7ed7cf782a57
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #359, #413.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    1 +
 package/openvpn/openvpn.mk |  102 +++++++++++--------------------------------
 2 files changed, 27 insertions(+), 76 deletions(-)

diff --git a/CHANGES b/CHANGES
index 7e4facc..adcba7c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -5,6 +5,7 @@
 	#241: device mapper + lvm2: build together
 	#333: Bump sqlite package to 3.6.15
 	#349: update libsoup to version 2.26.2
+	#359,#413: Upgrade openvpn to Makefile.autotools.in
 	#367: linux kernel compile error for arm926t
 	#373: Support for building gstreamer without libxml
 	#379: update DirectFB to version 1.4.0
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e043b60..49584f8 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -2,85 +2,35 @@
 #
 # openvpn
 #
-# NOTE: Uses start-stop-daemon in init script, so be sure
-# to enable that within busybox
-#
 #############################################################
-OPENVPN_VERSION:=2.0.9
-OPENVPN_SOURCE:=openvpn-$(OPENVPN_VERSION).tar.gz
-OPENVPN_SITE:=http://openvpn.net/release/
-OPENVPN_DIR:=$(BUILD_DIR)/openvpn-$(OPENVPN_VERSION)
-OPENVPN_CAT:=$(ZCAT)
-OPENVPN_BINARY:=openvpn
-OPENVPN_TARGET_BINARY:=usr/sbin/openvpn
 
-#
-# Select thread model.
-#
+OPENVPN_VERSION = 2.0.9
+OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.gz
+OPENVPN_SITE = http://openvpn.net/release
+OPENVPN_DEPENDENCIES = lzo openssl uclibc
+
 ifeq ($(BR2_PTHREADS_NATIVE),y)
-THREAD_MODEL="--enable-threads=posix"
+	THREAD_MODEL="--enable-threads=posix"
 else
-THREAD_MODEL=--enable-pthread
+	THREAD_MODEL="--enable-pthread"
 endif
 
-$(DL_DIR)/$(OPENVPN_SOURCE):
-	 $(call DOWNLOAD,$(OPENVPN_SITE),$(OPENVPN_SOURCE))
-
-openvpn-source: $(DL_DIR)/$(OPENVPN_SOURCE)
-
-$(OPENVPN_DIR)/.unpacked: $(DL_DIR)/$(OPENVPN_SOURCE)
-	$(OPENVPN_CAT) $(DL_DIR)/$(OPENVPN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(OPENVPN_DIR)/.unpacked
-
-$(OPENVPN_DIR)/.configured: $(OPENVPN_DIR)/.unpacked
-	(cd $(OPENVPN_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
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
-		--program-prefix="" \
-		--enable-small \
-		$(THREAD_MODEL) \
-	)
-	touch $(OPENVPN_DIR)/.configured
-
-$(OPENVPN_DIR)/$(OPENVPN_BINARY): $(OPENVPN_DIR)/.configured
-	$(MAKE) -C $(OPENVPN_DIR)
-
-$(TARGET_DIR)/$(OPENVPN_TARGET_BINARY): $(OPENVPN_DIR)/$(OPENVPN_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENVPN_DIR) install
-	mkdir -p $(TARGET_DIR)/etc/openvpn
-	cp package/openvpn/openvpn.init $(TARGET_DIR)/etc/init.d/openvpn
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
-		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
-
-openvpn: uclibc lzo openssl $(TARGET_DIR)/$(OPENVPN_TARGET_BINARY)
-
-openvpn-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(OPENVPN_DIR) uninstall
-	-$(MAKE) -C $(OPENVPN_DIR) clean
-
-openvpn-dirclean:
-	rm -rf $(OPENVPN_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_OPENVPN),y)
-TARGETS+=openvpn
-endif
+OPENVPN_CONF_OPT = --enable-small $(THREAD_MODEL)
+
+$(eval $(call AUTOTARGETS,package,openvpn))
+
+$(OPENVPN_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing")
+	$(INSTALL) -m 755 $(OPENVPN_DIR)/openvpn \
+		$(TARGET_DIR)/usr/sbin/openvpn
+	if [ ! -f $(TARGET_DIR)/etc/init.d/openvpn ]; then \
+		$(INSTALL) -m 755 -D package/openvpn/openvpn.init \
+			$(TARGET_DIR)/etc/init.d/openvpn; \
+	fi
+	touch $@
+
+$(OPENVPN_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(TARGET_DIR)/usr/sbin/openvpn
+	rm -f $(TARGET_DIR)/etc/init.d/openvpn
+	rm -f $(OPENVPN_TARGET_INSTALL_TARGET) $(OPENVPN_HOOK_POST_INSTALL)
-- 
1.6.3.3
