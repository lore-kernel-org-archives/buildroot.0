From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:35 +0200
Subject: [Buildroot] [PATCH 07/11] ext-tool.mk: add fancy messages
In-Reply-To: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342963719-1810-8-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 293bf4f..0861673 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -65,6 +65,7 @@ INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+MESSAGE2    = echo "$(TERM_BOLD)>>> $(1) $(2)$(TERM_RESET)"
 TERM_BOLD  := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 3f58aad..6e23994 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -265,12 +265,14 @@ endif
 # components than usual.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1),y)
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1):
+	@$(call MESSAGE2,External toolchain,Downloading)
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_1)/$(TOOLCHAIN_EXTERNAL_SOURCE_1))
 
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2):
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE_2)/$(TOOLCHAIN_EXTERNAL_SOURCE_2))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_2)
+	@$(call MESSAGE2,External toolchain,Extracting)
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE_1))) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE_1) | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=3 --hard-dereference -C $(@D) $(TAR_OPTIONS) -
@@ -291,9 +293,11 @@ endif
 else
 # Download and extraction of a toolchain
 $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE):
+	@$(call MESSAGE2,External toolchain,Downloading)
 	$(call DOWNLOAD,$(TOOLCHAIN_EXTERNAL_SITE)$(TOOLCHAIN_EXTERNAL_SOURCE),$(TOOLCHAIN_EXTERNAL_SOURCE))
 
 $(TOOLCHAIN_EXTERNAL_DIR)/.extracted: $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE)
+	@$(call MESSAGE2,External toolchain,Extracting)
 	mkdir -p $(@D)
 	$(INFLATE$(suffix $(TOOLCHAIN_EXTERNAL_SOURCE))) $^ | \
 		$(TAR) $(TAR_STRIP_COMPONENTS)=1 --exclude='usr/lib/locale/*' -C $(@D) $(TAR_OPTIONS) -
@@ -305,7 +309,7 @@ endif
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # type of C library and all C library features.
 $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
-	@echo "Checking external toolchain settings"
+	@$(call MESSAGE2,External toolchain,Checking external toolchain settings)
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
 	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
@@ -394,7 +398,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	mkdir -p $(TARGET_DIR)/lib ; \
 	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
-		echo "Copy external toolchain libraries to target..." ; \
+		$(call MESSAGE2,External toolchain,Copying external toolchain libraries to target) ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
 		done ; \
@@ -402,7 +406,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
 	fi ; \
-	echo "Copy external toolchain sysroot to staging..." ; \
+	$(call MESSAGE2,External toolchain,Copying external toolchain sysroot to staging) ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
 	if [ -L $${ARCH_SYSROOT_DIR}/lib64 ] ; then \
 		$(call create_lib64_symlinks) ; \
@@ -426,6 +430,7 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 # Build toolchain wrapper for preprocessor, C and C++ compiler, and setup
 # symlinks for everything else
 $(HOST_DIR)/usr/bin/ext-toolchain-wrapper: $(STAMP_DIR)/ext-toolchain-installed
+	@$(call MESSAGE2,External toolchain,Installing toolchain wrapper) ; \
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
-- 
1.7.11.2
