From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 11 Oct 2012 21:46:39 +0200
Subject: [Buildroot] [PATCH 1/1] newt: convert to autotools-package infra
Message-ID: <1349984799-25887-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 package/newt/newt-fix-makefile.patch

diff --git a/package/newt/newt-fix-makefile.patch b/package/newt/newt-fix-makefile.patch
new file mode 100644
index 0000000..227b0f3
--- /dev/null
+++ b/package/newt/newt-fix-makefile.patch
@@ -0,0 +1,42 @@
+Fix Makefile.in
+
+* Remove -Os from the CFLAGS (already handled by Buildroot)
+* Use $(CC) instead of $(CPP) to generate .depend file because
+  '$(CPP) -M' call does not support multiple input files.
+  This avoid the following error:
+
+make[1]: Entering directory `/opt/br/output/build/newt-0.51.0'
+/opt/br/output/host/usr/bin/arm-none-linux-gnueabi-cpp -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -M newt.c button.c form.c checkbox.c entry.c label.c listbox.c scrollbar.c textbox.c scale.c grid.c windows.c buttonbar.c checkboxtree.c > .depend
+arm-none-linux-gnueabi-cpp: too many input files
+make[1]: *** [depend] Error 1
+make[1]: Leaving directory 
+`/opt/br/output/build/newt-0.51.0'
+make: *** 
+[/opt/br/output/build/newt-0.51.0/.stamp_built] Error 2
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+---
+Index: newt-0.51.0/Makefile.in
+===================================================================
+--- newt-0.51.0.orig/Makefile.in	2012-10-10 22:43:42.042318041 +0200
++++ newt-0.51.0/Makefile.in	2012-10-11 21:25:44.063873277 +0200
+@@ -3,7 +3,7 @@ SHLIBS = -lslang -lm -lc
+ 
+ GPM_SUPPORT=@gpm_support@
+ 
+-CFLAGS = -Wall -Os -D_GNU_SOURCE
++CFLAGS += -D_GNU_SOURCE
+ 
+ VERSION = @VERSION@
+ CVSTAG = r$(subst .,-,$(VERSION))
+@@ -86,7 +86,7 @@ clean:
+ 		$(SHAREDOBJS) *.so*
+ 
+ depend:
+-	$(CPP) $(CFLAGS) -M $(SOURCES) > .depend
++	$(CC) $(CFLAGS) -M $(SOURCES) > .depend
+ 
+ $(SHAREDDIR):
+ 	mkdir -p $(SHAREDDIR)
diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index b10e4f8..a87db5c 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -3,80 +3,43 @@
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
+NEWT_CONF_OPT += \
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
+NEWT_MAKE_ENV += $(TARGET_CONFIGURE_OPTS)
+NEWT_MAKE = $(MAKE1)
+
+define NEWT_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m644 $(@D)/newt.h    $(STAGING_DIR)/usr/include/newt.h
+	$(INSTALL) -D -m644 $(@D)/libnewt.a $(STAGING_DIR)/usr/lib/libnewt.a
+	$(INSTALL) -m755 $(@D)/libnewt.so*  $(STAGING_DIR)/usr/lib/
+	ln -fs libnewt.so.$(NEWT_VERSION)   $(STAGING_DIR)/usr/lib/libnewt.so
+	ln -fs libnewt.so.$(NEWT_VERSION)   $(STAGING_DIR)/usr/lib/libnewt.so.0.51
+endef
+
+define NEWT_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/usr/lib/
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
+$(eval $(autotools-package))
-- 
1.7.12.2
