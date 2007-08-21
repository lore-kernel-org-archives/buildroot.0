From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 21 Aug 2007 21:35:26 +0200 (CEST)
Subject: [Buildroot] [patch] whitespace-cleanup
Message-ID: <0708212134150.11646@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There was also a missing ';' after an 'rm'.


Cheers,

-- 
Cristian
-------------- next part --------------
Index: toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- toolchain/gcc/gcc-uclibc-3.x.mk	(revision 19630)
+++ toolchain/gcc/gcc-uclibc-3.x.mk	(working copy)
@@ -188,7 +188,8 @@
 		$(MULTILIB) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS))
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
@@ -228,7 +229,7 @@
 	ln -snf ../include $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
 	#-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
 	#ln -snf ../lib/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	(cd $(GCC_BUILD_DIR2); rm -rf config.cache ; \
+	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		LDFLAGS_FOR_TARGET="$(patsubst %,LDFLAGS+=-Wl$(comma)%,$(TARGET_LDFLAGS)) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
 		$(GCC_DIR)/configure \
@@ -250,7 +251,8 @@
 		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS))
+		$(EXTRA_GCC_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
@@ -259,33 +261,33 @@
 
 $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) install
-	if [ -d "$(STAGING_DIR)/usr/lib64" ] ; then \
-		if [ ! -e "$(STAGING_DIR)/usr/lib" ] ; then \
-			mkdir "$(STAGING_DIR)/usr/lib" ; \
-		fi ; \
-		mv "$(STAGING_DIR)/usr/lib64/"* "$(STAGING_DIR)/usr/lib/" ; \
-		rmdir "$(STAGING_DIR)/usr/lib64" ; \
+	if [ -d "$(STAGING_DIR)/usr/lib64" ]; then \
+		if [ ! -e "$(STAGING_DIR)/usr/lib" ]; then \
+			mkdir "$(STAGING_DIR)/usr/lib"; \
+		fi; \
+		mv "$(STAGING_DIR)/usr/lib64/"* "$(STAGING_DIR)/usr/lib/"; \
+		rmdir "$(STAGING_DIR)/usr/lib64"; \
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
 	-strip --strip-all -R .note -R .comment $(STAGING_DIR)/usr/bin/*
 endif
 	# Make sure we have 'cc'.
-	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ] ; then \
+	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
-			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ; \
+			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/usr/bin/gcc ] ; then \
-		ln -snf gcc $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ; \
+	if [ ! -e $(STAGING_DIR)/usr/bin/gcc ]; then \
+		ln -snf gcc $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \
 	(cd $(STAGING_DIR)/usr; \
 		ln -snf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
 		cd bin; \
-		for app in $(REAL_GNU_TARGET_NAME)-* ; do \
+		for app in $(REAL_GNU_TARGET_NAME)-*; do \
 			ln -snf $${app} \
-		   	$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
+			$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
 		done; \
 	)
 	#
@@ -294,14 +296,14 @@
 ifeq ($(BR2_SOFT_FLOAT),y)
 ifeq ($(findstring 3.3.,$(GCC_VERSION)),3.3.)
 	# Make sure we have a soft float specs file for this arch
-	if [ ! -f toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float ] ; then \
-		echo soft float configured but no specs file for this arch ; \
-		/bin/false ; \
+	if [ ! -f toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float ]; then \
+		echo soft float configured but no specs file for this arch; \
+		/bin/false; \
 	fi
 	# Replace specs file with one that defaults to soft float mode.
-	if [ ! -f $(STAGING_DIR)/usr/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs ] ; then \
-		echo staging dir specs file is missing ; \
-		/bin/false ; \
+	if [ ! -f $(STAGING_DIR)/usr/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs ]; then \
+		echo staging dir specs file is missing; \
+		/bin/false; \
 	fi
 	cp toolchain/gcc/$(GCC_VERSION)/specs-$(ARCH)-soft-float $(STAGING_DIR)/usr/lib/gcc-lib/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)/specs
 endif
@@ -309,7 +311,7 @@
 	#
 	# Ok... that's enough of that.
 	#
-	-mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
 
 $(GCC_BUILD_DIR2)/.libs_installed: $(GCC_BUILD_DIR2)/.installed
@@ -342,8 +344,8 @@
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR2)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-	    rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog \
-	    rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
+		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
+		rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
 gcc-dirclean: gcc_initial-dirclean
@@ -361,7 +363,7 @@
 	touch $@
 
 $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
-	(cd $(GCC_BUILD_DIR3); rm -rf config.cache ; \
+	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS_FOR_BUILD="-g -O2 $(HOST_CFLAGS)" \
 		$(TARGET_GCC_FLAGS) \
@@ -385,7 +387,8 @@
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS))
+		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
+	)
 	touch $@
 
 $(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
@@ -446,14 +449,14 @@
 	#rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 	#	$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
 	# Work around problem of missing syslimits.h
-	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/syslimits.h ] ; then \
-		echo "warning: working around missing syslimits.h" ; \
+	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/syslimits.h ]; then \
+		echo "warning: working around missing syslimits.h"; \
 		cp -f $(STAGING_DIR)/usr/$(GCC_LIB_SUBDIR)/include/syslimits.h \
-			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/ ; \
+			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/include/; \
 	fi
 	# Make sure we have 'cc'.
-	if [ ! -e $(TARGET_DIR)/usr/bin/cc ] ; then \
-		ln -snf gcc $(TARGET_DIR)/usr/bin/cc ; \
+	if [ ! -e $(TARGET_DIR)/usr/bin/cc ]; then \
+		ln -snf gcc $(TARGET_DIR)/usr/bin/cc; \
 	fi
 	# These are in /lib, so...
 	#rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
