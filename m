From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Dec 2010 16:06:06 -0300
Subject: [Buildroot] [PATCH 10/13] gcc: cleanup and hook
In-Reply-To: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292353569-30172-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292353569-30172-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Clean up some unneeded steps in gcc build
* Hook up packaged binutils for target gcc
* Build tools are on HOST_DIR now so change it
* TARGET_CROSS is now in HOST_DIR too

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in             |    2 +-
 toolchain/Makefile.in           |    2 +-
 toolchain/gcc/Config.in.2       |    1 +
 toolchain/gcc/gcc-uclibc-4.x.mk |   66 +++++++++++++-------------------------
 4 files changed, 26 insertions(+), 45 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 3fa98fe..12a25f8 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -112,7 +112,7 @@ endif
 REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
+TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_EXTERNAL_PREFIX=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index 2cb6e95..a7ca558 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -1,6 +1,6 @@
 BR2_CONFIGURE_DEVEL_SYSROOT=--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/
 BR2_CONFIGURE_STAGING_SYSROOT=--with-sysroot=$(STAGING_DIR)
-BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
+BR2_CONFIGURE_BUILD_TOOLS=--with-build-time-tools=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
index d9ebfcd..4a81086 100644
--- a/toolchain/gcc/Config.in.2
+++ b/toolchain/gcc/Config.in.2
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GCC_TARGET
 	bool "native toolchain in the target filesystem"
 	depends on BR2_HAVE_DEVFILES
+	select BR2_PACKAGE_BINUTILS
 	help
 	  If you want the target system to be able to run
 	  binutils/gcc and compile native code, say Y here.
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 9e7127d..543454b 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -53,9 +53,6 @@ else
 GCC_OPTSPACE=--enable-target-optspace
 endif
 
-GCC_TARGET_PREREQ=
-GCC_STAGING_PREREQ=
-
 #############################################################
 #
 # Setup some initial stuff
@@ -203,17 +200,12 @@ endif
 #############################################################
 GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
 
-
-# The --without-headers option stopped working with gcc 3.0 and has never been
-# fixed, so we need to actually have working C library header files prior to
-# the step or libgcc will not build...
-
 $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR1)
 	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
+		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -243,7 +235,6 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 	touch $@
 
 $(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
-	# gcc >= 4.3.0 have to also build all-target-libgcc
 ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
 	$(GCC_CONF_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
 else
@@ -252,16 +243,11 @@ endif
 	touch $@
 
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
-$(gcc_initial) $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
-	# gcc >= 4.3.0 have to also install install-target-libgcc
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
-else
+$(gcc_initial) $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
-endif
 	touch $(gcc_initial)
 
-gcc_initial: binutils $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+gcc_initial: host-binutils $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 
 gcc_initial-clean:
 	rm -rf $(GCC_BUILD_DIR1)
@@ -276,22 +262,16 @@ gcc_initial-dirclean:
 #############################################################
 GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
 
-
 # The --without-headers option stopped working with gcc 3.0 and has never been
 # fixed, so we need to actually have working C library header files prior to
 # the step or libgcc will not build...
 
 $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 	mkdir -p $(GCC_BUILD_DIR2)
-	-rmdir $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	mkdir -p $(STAGING_DIR)/lib
-	ln -snf ../../lib $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib
-	$(if $(BR2_ARCH_IS_64),mkdir -p $(STAGING_DIR)/lib64)
-	$(if $(BR2_ARCH_IS_64),ln -snf ../../lib64 $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64)
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
+		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -338,7 +318,7 @@ else
 endif
 	touch $(gcc_intermediate)
 
-gcc_intermediate: uclibc-configured $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+gcc_intermediate: uclibc-configured $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 
 gcc_intermediate-clean:
 	rm -rf $(GCC_BUILD_DIR2)
@@ -363,11 +343,11 @@ GCC_BUILD_DIR3:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	# Important! Required for limits.h to be fixed.
-	ln -snf ../include/ $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
+	ln -snf ../include/ $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
-		--prefix=$(STAGING_DIR)/usr \
+		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
 		--target=$(REAL_GNU_TARGET_NAME) \
@@ -412,19 +392,19 @@ $(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
-	if [ ! -e $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
+	if [ ! -e $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
 		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
-			$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
+			$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc; \
+	if [ ! -e $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc; \
 	fi
 	# Set up the symlinks to enable lying about target name.
 	set -e; \
-	(cd $(STAGING_DIR)/usr; \
+	(cd $(HOST_DIR)/usr; \
 		ln -snf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
 		cd bin; \
 		for app in $(REAL_GNU_TARGET_NAME)-*; do \
@@ -438,31 +418,31 @@ endif
 
 $(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
-	# These are in /lib, so...
+	# These go in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(TARGET_DIR)/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	mkdir -p $(TARGET_DIR)/usr/lib
-	-cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
+	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 endif
 ifeq ($(BR2_INSTALL_LIBGCJ),y)
-	cp -dpf $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcj.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcj.so* $(TARGET_DIR)/usr/lib/
 	mkdir -p $(TARGET_DIR)/usr/lib/security
-	cp -dpf $(STAGING_DIR)/usr/lib/security/classpath.security \
+	cp -dpf $(HOST_DIR)/usr/lib/security/classpath.security \
 		$(TARGET_DIR)/usr/lib/security/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgcj.so*
 endif
 	mkdir -p $(@D)
 	touch $@
 
-cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+cross_compiler:=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc_intermediate \
 	$(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR3)/.installed \
 	$(STAMP_DIR)/gcc_libs_target_installed \
@@ -473,8 +453,8 @@ gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR3)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
-		rm -f $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
+		rm -f $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
+		rm -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
 gcc-dirclean: gcc_initial-dirclean
@@ -556,7 +536,7 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
 		echo "warning: working around missing syslimits.h"; \
-		cp -f $(STAGING_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
+		cp -f $(HOST_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
 			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/; \
 	fi
 	# Make sure we have 'cc'.
@@ -567,7 +547,7 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	#rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
 	touch -c $@
 
-gcc_target: uclibc_target binutils_target $(TARGET_DIR)/usr/bin/gcc
+gcc_target: uclibc_target binutils $(TARGET_DIR)/usr/bin/gcc
 
 gcc_target-clean:
 	rm -rf $(GCC_BUILD_DIR4)
-- 
1.7.2.2
