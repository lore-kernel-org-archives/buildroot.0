From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Wed, 10 Nov 2010 08:16:47 -0800
Subject: [Buildroot] Buildroot Patches I Use [7] - Valgrind Upgrade to 3.6.0
Message-ID: <1289405807.9910.15.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch upgrades to valgrind 3.6.0 and switches to the autotools
macros that simplify the makefile maintenance.  Only I have one problem.
I only needed to build valgrind so that something else would complete.
I don't know much what it is used for or how to use it let alone test
it.

Is there anyone interested in taking this on to test drive it?

The patch and instructions are below, but I would like at least one
additional "signed-off by" vote of confidence to be added to mine before
submitting/recommending it be merged into buildroot.

Regards,

Darcy

---

Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>

1.  Apply the patch below (changes package/valgrind/valgrind.mk)
2.  Manually remove package/valgrind/valgrind-largefile.patch
3.  Manually remove package/valgrind/valgrind.patch

I didn't include steps 2 and 3 in the patch so I could keep the email
size manageable.


Index: buildroot-2010.02_x86/package/valgrind/valgrind.mk
===================================================================
--- buildroot-2010.02_x86.orig/package/valgrind/valgrind.mk
+++ buildroot-2010.02_x86/package/valgrind/valgrind.mk
@@ -4,85 +4,39 @@
 #
 #############################################################
 
-VALGRIND_VERSION=3.2.3
-VALGRIND_SITE:=http://valgrind.org/downloads/
-VALGRIND_DIR:=$(BUILD_DIR)/valgrind-$(VALGRIND_VERSION)
-VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_CAT:=$(BZCAT)
-
-$(DL_DIR)/$(VALGRIND_SOURCE):
-	$(call DOWNLOAD,$(VALGRIND_SITE),$(VALGRIND_SOURCE))
-
-$(VALGRIND_DIR)/.unpacked: $(DL_DIR)/$(VALGRIND_SOURCE)
-	$(VALGRIND_CAT) $(DL_DIR)/$(VALGRIND_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(VALGRIND_DIR)/.unpacked
-
-$(VALGRIND_DIR)/.patched: $(VALGRIND_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(VALGRIND_DIR) package/valgrind/ valgrind\*.patch
-	touch $(VALGRIND_DIR)/.patched
-
-$(VALGRIND_DIR)/.configured: $(VALGRIND_DIR)/.patched
-	(cd $(VALGRIND_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
-		--without-uiout --disable-valgrindmi \
-		--disable-tui --disable-valgrindtk \
-		--without-x --without-included-gettext \
-		--disable-tls \
-	)
-	touch $(VALGRIND_DIR)/.configured
-
-$(VALGRIND_DIR)/coregrind/valgrind: $(VALGRIND_DIR)/.configured
-	$(MAKE) -C $(VALGRIND_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/usr/bin/valgrind: $(VALGRIND_DIR)/coregrind/valgrind
-	$(MAKE) \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    bindir=$(TARGET_DIR)/usr/bin \
-	    sbindir=$(TARGET_DIR)/usr/sbin \
-	    libexecdir=$(TARGET_DIR)/usr/lib \
-	    datadir=$(TARGET_DIR)/usr/share \
-	    sysconfdir=$(TARGET_DIR)/etc \
-	    sharedstatedir=$(TARGET_DIR)/usr/com \
-	    localstatedir=$(TARGET_DIR)/var \
-	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/info \
-	    mandir=$(TARGET_DIR)/usr/man \
-	    includedir=$(TARGET_DIR)/usr/include \
-	    -C $(VALGRIND_DIR) install
+VALGRIND_VERSION = 3.6.0
+VALGRIND_SITE = http://valgrind.org/downloads/
+VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
+
+VALGRIND_CONF_ENV = \
+	ac_cv_file__proc_self_fd=yes \
+	ac_cv_file__proc_self_exe=yes \
+	ac_cv_file__proc_self_maps=yes
+
+VALGRIND_CONF_OPT = \
+	--without-uiout \
+	--disable-valgrindmi \
+	--disable-tui \
+	--disable-valgrindtk \
+	--without-x \
+	--without-included-gettext \
+	--disable-tls
+
+define VALGRIND_EXTRA_INSTALL
 	mv $(TARGET_DIR)/usr/bin/valgrind $(TARGET_DIR)/usr/bin/valgrind.bin
 	cp package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/
 	cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind
 	chmod a+x $(TARGET_DIR)/usr/bin/valgrind
-	rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
-	touch -c $@
-
-valgrind: $(TARGET_DIR)/usr/bin/valgrind
+endef
 
-valgrind-source: $(DL_DIR)/$(VALGRIND_SOURCE)
+VALGRIND_POST_TARGET_INSTALL_HOOK += VALGRIND_EXTRA_INSTALL
 
-valgrind-clean:
-	-$(MAKE) -C $(VALGRIND_DIR) clean
-	-rm -f $(TARGET_DIR)/usr/bin/valgrind*
-	rm -rf $(TARGET_DIR)/usr/lib/valgrind
+define VALGRIND_EXTRA_UNINSTALL
+	rm -f $(TARGET_DIR)/usr/bin/valgrind.bin
+	rm -f $(TARGET_DIR)/usr/bin/valgrind/valgrind.sh
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/uclibc.supp
+endef
 
-valgrind-dirclean:
-	rm -rf $(VALGRIND_DIR)
+VALGRIND_POST_UNINSTALL_TARGET_HOOKS += VALGRIND_EXTRA_UNINSTALL
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-TARGETS+=valgrind
-endif
+$(eval $(call AUTOTARGETS,package,valgrind))
