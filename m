From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 18:24:22 +0200
Subject: [Buildroot] [RFC] *clean targets
Message-ID: <20091007162422.GI10261@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Currently the clean target (as well as dirclean) does nothing useful.

I propose the following change:

# wipe target
clean:
# remove generated files, retain configs
realclean:
# remove generated files, including configs (but not DL_DIR!)
distclean:
# roll a release tarball, in gz, bz2, xz format
release:

hm, something like this as a base (probably incomplete, but better than
what we have now)
-------------- next part --------------
diff --git a/Makefile b/Makefile
index bbd49d4..ddd58ec 100644
--- a/Makefile
+++ b/Makefile
@@ -444,19 +444,20 @@ external-deps:
 # Cleanup and misc junk
 #
 #############################################################
+# wipe target
 clean: $(TARGETS_CLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
+	$(Q)rm -rf $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
 
-dirclean: $(TARGETS_DIRCLEAN)
-	rm -rf $(STAGING_DIR) $(TARGET_DIR) $(IMAGE) $(BUILD_DIR)/.root $(STAMP_DIR)
+# remove generated files, retain configs
+dirclean: clean $(TARGETS_DIRCLEAN)
+	$(Q)rm -rf $(STAGING_DIR) $(HOST_DIR) $(TOOLCHAIN_DIR)
 
-distclean:
-ifeq ($(DL_DIR),$(TOPDIR)/dl)
-	rm -rf $(DL_DIR)
-endif
-	rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
-	.config.cmd
-	$(MAKE) -C $(CONFIG) clean
+# remove generated files, including configs (but not DL_DIR!)
+distclean: clean dirclean
+	$(Q)$(MAKE) -C $(CONFIG) clean
+	$(Q)rm -rf $(TOOLCHAIN_DIR) $(BUILD_DIR) $(BINARIES_DIR) \
+		.config .config.cmd .config.old .auto.deps \
+		$(BR2_DEPENDS_DIR)
 
 else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -573,18 +574,7 @@ defconfig: $(CONFIG)/conf
 source-check: allyesconfig
 	$(MAKE) _source-check
 
-#############################################################
-#
-# Cleanup and misc junk
-#
-#############################################################
-clean:
-	rm -f .config .config.old .config.cmd .tmpconfig.h .lognr.*
-	-$(MAKE) -C $(CONFIG) clean
-
-distclean: clean
-	rm -rf sources/*
-
+clean dirclean distclean:
 
 endif # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
 
@@ -635,10 +625,11 @@ help:
 	@echo
 
 release: distclean
-	OUT=buildroot-$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
-	rm -rf ../$$OUT*; cp -al . ../$$OUT; cd ..; \
-	tar cfz $$OUT.tar.gz --exclude .svn --exclude .git --exclude \*~ $$OUT; \
-	rm -rf $$OUT
+	$(Q)BR2_VERSION=$$(grep -A2 BR2_VERSION $(CONFIG_CONFIG_IN)|grep default|cut -f2 -d\"); \
+	git archive HEAD --format=tar --prefix="buildroot-$$BR2_VERSION/" > ../buildroot-$$BR2_VERSION.tar; \
+	cat ../buildroot-$$BR2_VERSION.tar | bzip2 -9 > ../buildroot-$$BR2_VERSION.tar.bz2 || rm -f ../buildroot-$$BR2_VERSION.tar.bz2; \
+	cat ../buildroot-$$BR2_VERSION.tar | gzip -9 > ../buildroot-$$BR2_VERSION.tar.gz || rm -f ../buildroot-$$BR2_VERSION.tar.gz; \
+	cat ../buildroot-$$BR2_VERSION.tar | xz -9 > ../buildroot-$$BR2_VERSION.tar.xz || rm -f ../buildroot-$$BR2_VERSION.tar.xz
 
 .PHONY: $(noconfig_targets)
 
