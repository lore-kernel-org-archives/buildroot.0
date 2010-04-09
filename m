From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] bzip2: convert to gentargets,
	add host package, bump version
Message-ID: <20100409142123.5C6CF20E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ea448feff70ba79166fc188fd0247b3d7127a6a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bzip2/bzip2.mk |  140 ++++++++++++++++++++---------------------------
 1 files changed, 60 insertions(+), 80 deletions(-)

diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
index 98de532..43ab5f2 100644
--- a/package/bzip2/bzip2.mk
+++ b/package/bzip2/bzip2.mk
@@ -3,65 +3,55 @@
 # bzip2
 #
 #############################################################
-BZIP2_VERSION:=1.0.4
+BZIP2_VERSION:=1.0.5
 BZIP2_SOURCE:=bzip2-$(BZIP2_VERSION).tar.gz
 BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VERSION)
-BZIP2_DIR:=$(BUILD_DIR)/bzip2-$(BZIP2_VERSION)
-BZIP2_CAT:=$(ZCAT)
-BZIP2_BINARY:=$(BZIP2_DIR)/bzip2
-BZIP2_TARGET_BINARY:=$(TARGET_DIR)/usr/bin/bzmore
+BZIP2_STAGING_INSTALL=YES
 
-$(DL_DIR)/$(BZIP2_SOURCE):
-	 $(call DOWNLOAD,$(BZIP2_SITE),$(BZIP2_SOURCE))
+define BZIP2_FIX_MAKEFILE
+	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
+	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
+	    libbz2.so,g" $(@D)/Makefile-libbz2_so
+	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile
+	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(@D)/Makefile-libbz2_so
+endef
 
-bzip2-source: $(DL_DIR)/$(BZIP2_SOURCE)
+BZIP2_POST_PATCH_HOOKS += BZIP2_FIX_MAKEFILE
+
+define BZIP2_NOLARGEFILE_FIX_MAKEFILE
+	$(SED) "s,^BIGFILES,#BIGFILES,g" $(@D)/Makefile
+	$(SED) "s,^BIGFILES,#BIGFILES,g" $(@D)/Makefile-libbz2_so
+endef
 
-$(BZIP2_DIR)/.unpacked: $(DL_DIR)/$(BZIP2_SOURCE)
-	$(BZIP2_CAT) $(DL_DIR)/$(BZIP2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(BZIP2_DIR)/Makefile
-	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
-	    libbz2.so,g" $(BZIP2_DIR)/Makefile-libbz2_so
 ifneq ($(BR2_LARGEFILE),y)
-	$(SED) "s,^BIGFILES,#BIGFILES,g" $(BZIP2_DIR)/Makefile
-	$(SED) "s,^BIGFILES,#BIGFILES,g" $(BZIP2_DIR)/Makefile-libbz2_so
+BZIP2_POST_PATCH_HOOKS += BZIP2_NOLARGEFILE_FIX_MAKEFILE
 endif
-	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile
-	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(BZIP2_DIR)/Makefile-libbz2_so
-	touch $@
 
-$(STAGING_DIR)/usr/lib/libbz2.so.$(BZIP2_VERSION): $(BZIP2_DIR)/.unpacked
-	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) \
-		-C $(BZIP2_DIR) -f Makefile-libbz2_so
-	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) CC=$(TARGET_CC) RANLIB=$(TARGET_RANLIB) AR=$(TARGET_AR) \
-		-C $(BZIP2_DIR) libbz2.a
-	cp $(BZIP2_DIR)/bzlib.h $(STAGING_DIR)/usr/include/
-	cp $(BZIP2_DIR)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
-	cp $(BZIP2_DIR)/libbz2.a $(STAGING_DIR)/usr/lib/
+define BZIP2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) \
+	$(MAKE) -C $(@D) -f Makefile-libbz2_so \
+	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)"
+	$(TARGET_MAKE_ENV) \
+	$(MAKE) -C $(@D) \
+	CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" AR="$(TARGET_AR)" \
+	libbz2.a bzip2 bzip2recover
+endef
+
+define BZIP2_INSTALL_STAGING_CMDS
+	cp $(@D)/bzlib.h $(STAGING_DIR)/usr/include/
+	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(STAGING_DIR)/usr/lib/
+	cp $(@D)/libbz2.a $(STAGING_DIR)/usr/lib/
 	(cd $(STAGING_DIR)/usr/lib/; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
-	)
-	(cd $(STAGING_DIR)/usr/lib; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1; \
 	)
+endef
 
-$(BZIP2_BINARY): $(STAGING_DIR)/usr/lib/libbz2.so.$(BZIP2_VERSION)
-	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) CC=$(TARGET_CC) -C $(BZIP2_DIR) bzip2 bzip2recover
-	touch -c $@
-
-$(BZIP2_TARGET_BINARY): $(BZIP2_BINARY)
-	(cd $(TARGET_DIR)/usr/bin; \
-		rm -f bzip2 bunzip2 bzcat bzip2recover \
-			bzgrep bzegrep bzfgrep bzmore bzless bzdiff bzcmp; \
-	)
-	$(TARGET_CONFIGURE_OPTS) \
-	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(BZIP2_DIR) install
-	rm -f $(TARGET_DIR)/usr/lib/libbz2.a
-	rm -f $(TARGET_DIR)/usr/include/bzlib.h
-	cp $(BZIP2_DIR)/libbz2.so.$(BZIP2_VERSION) $(TARGET_DIR)/usr/lib/
+define B2IP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+	cp $(@D)/libbz2.so.$(BZIP2_VERSION) $(TARGET_DIR)/usr/lib/
 	(cd $(TARGET_DIR)/usr/lib; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so.1.0; \
 		ln -snf libbz2.so.$(BZIP2_VERSION) libbz2.so; \
@@ -74,47 +64,37 @@ $(BZIP2_TARGET_BINARY): $(BZIP2_BINARY)
 		ln -snf bzgrep bzegrep; \
 		ln -snf bzgrep bzfgrep; \
 	)
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
-
-$(TARGET_DIR)/usr/lib/libbz2.a: $(STAGING_DIR)/usr/lib/libbz2.a
-	mkdir -p $(TARGET_DIR)/usr/include
-	cp $(STAGING_DIR)/usr/include/bzlib.h $(TARGET_DIR)/usr/include/
-	cp $(STAGING_DIR)/usr/lib/libbz2.a $(TARGET_DIR)/usr/lib/
-	rm -f $(TARGET_DIR)/lib/libbz2.so
-	(cd $(TARGET_DIR)/usr/lib; \
-		ln -fs /usr/lib/libbz2.so.1.0 libbz2.so; \
-	)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libbz2.so.1.0
-	touch -c $@
-
-bzip2-headers: $(TARGET_DIR)/usr/lib/libbz2.a
-
-bzip2: $(BZIP2_TARGET_BINARY)
+endef
 
-bzip2-clean:
+define BZIP2_CLEAN_CMDS
 	rm -f $(addprefix $(TARGET_DIR),/lib/libbz2.* \
 					/usr/lib/libbz2.* \
 					/usr/include/bzlib.h)
 	rm -f $(addprefix $(STAGING_DIR),/lib/libbz2.* \
 					/usr/lib/libbz2.* \
 					/usr/include/bzlib.h)
-	-$(MAKE) -C $(BZIP2_DIR) clean
+	-$(MAKE) -C $(@D) clean
+endef
 
-bzip2-dirclean:
-	rm -rf $(BZIP2_DIR)
+define HOST_BZIP2_FIX_MAKEFILE
+	$(SED) "s,ln \$$(,ln -snf \$$(,g" $(@D)/Makefile
+	$(SED) "s,ln -s (lib.*),ln -snf \$$1; ln -snf libbz2.so.$(BZIP2_VERSION) \
+	    libbz2.so,g" $(@D)/Makefile-libbz2_so
+	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile
+	$(SED) "s:-O2:$(HOST_CFLAGS):" $(@D)/Makefile-libbz2_so
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_BZIP2),y)
-TARGETS+=bzip2
-endif
+HOST_BZIP2_POST_PATCH_HOOKS += HOST_BZIP2_FIX_MAKEFILE
+
+define HOST_BZIP2_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) -f Makefile-libbz2_so
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) libbz2.a bzip2 bzip2recover
+endef
+
+define HOST_BZIP2_INSTALL_CMDS
+	$(HOST_MAKE_ENV) \
+	$(MAKE) PREFIX=$(HOST_DIR)/usr -C $(@D) install
+endef
+
+$(eval $(call GENTARGETS,package,bzip2))
+$(eval $(call GENTARGETS,package,bzip2,host))
\ No newline at end of file
-- 
1.6.3.3
