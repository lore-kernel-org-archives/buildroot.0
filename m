From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 22 Sep 2012 00:28:36 +0200
Subject: [Buildroot] [PATCH 4/6] newt: convert to generic-package
	infrastructure
In-Reply-To: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
References: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1348266518-27665-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index b10e4f8..9ec917c 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -3,80 +3,54 @@
 # newt
 #
 #############################################################
-NEWT_SOURCE=newt-0.51.0.tar.bz2
-NEWT_CAT:=$(BZCAT)
-NEWT_SITE=http://www.uclibc.org/
-NEWT_DIR=$(BUILD_DIR)/newt-0.51.0
-NEWT_VERSION=0.51.0
-NEWT_CFLAGS=-Os -g -fPIC
-
-$(DL_DIR)/$(NEWT_SOURCE):
-	$(call DOWNLOAD,$(NEWT_SITE)/$(NEWT_SOURCE))
-
-$(NEWT_DIR)/.source: $(DL_DIR)/$(NEWT_SOURCE)
-	$(NEWT_CAT) $(DL_DIR)/$(NEWT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(NEWT_DIR)/.source
-
-$(NEWT_DIR)/.configured: $(NEWT_DIR)/.source
-	(cd $(NEWT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" \
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
-	touch $(NEWT_DIR)/.configured
-
-$(NEWT_DIR)/libnewt.so.$(NEWT_VERSION): $(NEWT_DIR)/.configured
-	$(MAKE1) CFLAGS="$(TARGET_CFLAGS) $(NEWT_CFLAGS)" CC="$(TARGET_CC)" -C $(NEWT_DIR)
-	touch -c $@
-
-$(STAGING_DIR)/usr/lib/libnewt.a: $(NEWT_DIR)/libnewt.so.$(NEWT_VERSION)
-	cp -a $(NEWT_DIR)/libnewt.a $(STAGING_DIR)/usr/lib/
-	cp -a $(NEWT_DIR)/newt.h $(STAGING_DIR)/usr/include/
-	cp -a $(NEWT_DIR)/libnewt.so* $(STAGING_DIR)/usr/lib/
-	(cd $(STAGING_DIR)/usr/lib; ln -fs libnewt.so.$(NEWT_VERSION) libnewt.so)
-	(cd $(STAGING_DIR)/usr/lib; ln -fs libnewt.so.$(NEWT_VERSION) libnewt.so.0.51)
-	touch -c $@
-
-$(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION): $(STAGING_DIR)/usr/lib/libnewt.a
+NEWT_VERSION         = 0.51.0
+NEWT_SITE            = http://www.uclibc.org/
+NEWT_SOURCE          = newt-$(NEWT_VERSION).tar.bz2
+NEWT_LICENSE         = GPLv2
+NEWT_LICENSE_FILES   = COPYING
+NEWT_INSTALL_STAGING = YES
+
+NEWT_DEPENDENCIES = slang
+
+NEWT_CONFIGURE_ENV = \
+	$(TARGET_CONFIGURE_OPTS) \
+	$(TARGET_CONFIGURE_ARGS) \
+	CFLAGS="$(TARGET_CFLAGS)"
+
+NEWT_CONFIGURE_OPT = \
+	--prefix=/usr \
+	--exec-prefix=/usr \
+	--bindir=/usr/bin \
+	--sbindir=/usr/sbin \
+	--libdir=/lib \
+	--libexecdir=/usr/lib \
+	--sysconfdir=/etc \
+	--datadir=/usr/share \
+	--localstatedir=/var \
+	--mandir=/usr/man \
+	--infodir=/usr/info \
+	$(DISABLE_NLS)
+
+define NEWT_CONFIGURE_CMDS
+	( cd $(@D) ; $(NEWT_CONFIGURE_ENV) ./configure $(NEWT_CONFIGURE_OPT) )
+endef
+
+define NEWT_BUILD_CMDS
+	$(MAKE1) CFLAGS="$(TARGET_CFLAGS)" CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define NEWT_INSTALL_STAGING_CMDS
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/libnewt.so.$(NEWT_VERSION)
+	$(INSTALL) -D -m644 $(@D)/newt.h      $(STAGING_DIR)/usr/include/
+	$(INSTALL) -D -m644 $(@D)/libnewt.a   $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D -m755 $(@D)/libnewt.so* $(STAGING_DIR)/usr/lib/
+	ln -fs libnewt.so.$(NEWT_VERSION)     $(STAGING_DIR)/usr/lib/libnewt.so
+	ln -fs libnewt.so.$(NEWT_VERSION)     $(STAGING_DIR)/usr/lib/libnewt.so.0.51
+endef
+
+define NEWT_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/usr/include/
 	cp -a $(STAGING_DIR)/usr/lib/libnewt.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnewt.so*
-	touch -c $@
-
-newt-legal-info:
-	@$(call legal-warning-pkg,newt,legal-info not yet implemented)
-
-newt: slang $(TARGET_DIR)/usr/lib/libnewt.so.$(NEWT_VERSION)
+endef
 
-newt-source: $(DL_DIR)/$(NEWT_SOURCE)
-
-newt-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libnewt.so*
-	-$(MAKE) -C $(NEWT_DIR) clean
-
-newt-dirclean: slang-dirclean
-	rm -rf $(NEWT_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NEWT),y)
-TARGETS+=newt
-endif
+$(eval $(generic-package))
-- 
1.7.12.1
