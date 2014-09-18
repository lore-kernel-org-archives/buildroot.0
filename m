From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 00:28:48 +0200
Subject: [Buildroot] [PATCH] pkg-utils: the MESSAGE macro already
	double-quotes the message
Message-ID: <1411079328-30097-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... so passing a double-quoted message to the macro defeats the quoting
altogether.

Remove double-quotation of messages. Change made with:
    $ sed -r -i -e 's/(call MESSAGE,)"(.*)"\)/\1\2)/g' \
          $(git grep -l -E 'call MESSAGE."')

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile                                           | 10 ++++-----
 docs/manual/manual.mk                              |  4 ++--
 fs/common.mk                                       |  2 +-
 fs/iso9660/iso9660.mk                              |  2 +-
 linux/linux.mk                                     |  4 ++--
 package/ccache/ccache.mk                           |  2 +-
 package/pkg-autotools.mk                           |  8 ++++----
 package/pkg-generic.mk                             | 24 +++++++++++-----------
 toolchain/toolchain-external/toolchain-external.mk | 14 ++++++-------
 9 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/Makefile b/Makefile
index e788f1b..6390322 100644
--- a/Makefile
+++ b/Makefile
@@ -556,7 +556,7 @@ endif
 $(TARGETS_ROOTFS): target-finalize
 
 target-finalize: $(TARGETS)
-	@$(call MESSAGE,"Finalizing target directory")
+	@$(call MESSAGE,Finalizing target directory)
 	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
 		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
@@ -611,18 +611,18 @@ endif
 	) >  $(TARGET_DIR)/etc/os-release
 
 	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
-		$(call MESSAGE,"Copying overlay $(d)"); \
+		$(call MESSAGE,Copying overlay $(d)); \
 		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 			--chmod=Du+w --exclude .empty --exclude '*~' \
 			$(d)/ $(TARGET_DIR)$(sep))
 
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
-		$(call MESSAGE,"Executing post-build script $(s)"); \
+		$(call MESSAGE,Executing post-build script $(s)); \
 		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 target-post-image: $(TARGETS_ROOTFS) target-finalize
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
-		$(call MESSAGE,"Executing post-image script $(s)"); \
+		$(call MESSAGE,Executing post-image script $(s)); \
 		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
 
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
@@ -634,7 +634,7 @@ legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
 
 legal-info-prepare: $(LEGAL_INFO_DIR)
-	@$(call MESSAGE,"Collecting legal info")
+	@$(call MESSAGE,Collecting legal info)
 	@$(call legal-license-file,buildroot,COPYING,COPYING,HOST)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
 	@$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 8d401a2..a9d717a 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,7 +1,7 @@
 # Packages included in BR2_EXTERNAL are not part of buildroot, so they
 # should not be included in the manual.
 manual-update-lists: manual-check-dependencies-lists
-	$(Q)$(call MESSAGE,"Updating the manual lists...")
+	$(Q)$(call MESSAGE,Updating the manual lists...)
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
 		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
@@ -66,7 +66,7 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 			   manual-check-dependencies \
 			   manual-check-dependencies-$(3) \
 			   manual-update-lists
-	$$(Q)$$(call MESSAGE,"Generating $(5) $(1)...")
+	$$(Q)$$(call MESSAGE,Generating $(5) $(1)...)
 	$$(Q)mkdir -p $$(@D)/.build
 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
diff --git a/fs/common.mk b/fs/common.mk
index 70198c0..cc4d395 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -67,7 +67,7 @@ ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
 endif
 
 $$(BINARIES_DIR)/rootfs.$(1): target-finalize $$(ROOTFS_$(2)_DEPENDENCIES)
-	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
+	@$$(call MESSAGE,Generating root filesystem image rootfs.$(1))
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),$$(call $$(hook))$$(sep))
 	rm -f $$(FAKEROOT_SCRIPT)
 	rm -f $$(TARGET_DIR_WARNING_FILE)
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index b0e755d..16fa35f 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -11,7 +11,7 @@ ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
 ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
 
 $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub
-	@$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
+	@$(call MESSAGE,Generating root filesystem image rootfs.iso9660)
 	mkdir -p $(ISO9660_TARGET_DIR)
 	mkdir -p $(ISO9660_TARGET_DIR)/boot/grub
 	cp $(GRUB_DIR)/stage2/stage2_eltorito $(ISO9660_TARGET_DIR)/boot/grub/
diff --git a/linux/linux.mk b/linux/linux.mk
index 2fb7437..47251f1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -144,7 +144,7 @@ endif # BR2_LINUX_KERNEL_VMLINUX
 
 define LINUX_DOWNLOAD_PATCHES
 	$(if $(LINUX_PATCHES),
-		@$(call MESSAGE,"Download additional patches"))
+		@$(call MESSAGE,Download additional patches))
 	$(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
 		$(call DOWNLOAD,$(patch))$(sep))
 endef
@@ -336,7 +336,7 @@ endif
 # Support for rebuilding the kernel after the cpio archive has
 # been generated in $(BINARIES_DIR)/rootfs.cpio.
 $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LINUX_DIR)/.stamp_images_installed $(BINARIES_DIR)/rootfs.cpio
-	@$(call MESSAGE,"Rebuilding kernel with initramfs")
+	@$(call MESSAGE,Rebuilding kernel with initramfs)
 	# Build the kernel.
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
 	$(LINUX_APPEND_DTB)
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index f1ec162..1ed9de7 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -50,7 +50,7 @@ HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_MAKE_CACHE_DIR
 BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
 ifneq ($(BR_CCACHE_INITIAL_SETUP),)
 define HOST_CCACHE_DO_INITIAL_SETUP
-	@$(call MESSAGE,"Applying initial settings")
+	@$(call MESSAGE,Applying initial settings)
 	$(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
 	$(CCACHE) -s
 endef
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 4404f15..afed1da 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -183,7 +183,7 @@ endif
 # Hook to update config.sub and config.guess if needed
 #
 define UPDATE_CONFIG_HOOK
-       @$$(call MESSAGE,"Updating config.sub and config.guess")
+       @$$(call MESSAGE,Updating config.sub and config.guess)
        $$(call CONFIG_UPDATE,$$(@D))
 endef
 
@@ -193,7 +193,7 @@ $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 # Hook to patch libtool to make it work properly for cross-compilation
 #
 define LIBTOOL_PATCH_HOOK
-	@$$(call MESSAGE,"Patching libtool")
+	@$$(call MESSAGE,Patching libtool)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES" \
 		-a "$$($$(PKG)_AUTORECONF)" != "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
@@ -219,7 +219,7 @@ endif
 # Hook to gettextize the package if needed
 #
 define GETTEXTIZE_HOOK
-	@$$(call MESSAGE,"Gettextizing")
+	@$$(call MESSAGE,Gettextizing)
 	$(Q)cd $$($$(PKG)_SRCDIR) && $$(GETTEXTIZE) $$($$(PKG)_GETTEXTIZE_OPT)
 endef
 
@@ -227,7 +227,7 @@ endef
 # Hook to autoreconf the package if needed
 #
 define AUTORECONF_HOOK
-	@$$(call MESSAGE,"Autoreconfiguring")
+	@$$(call MESSAGE,Autoreconfiguring)
 	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d04fd36..c3897e2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -74,11 +74,11 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
 	$(Q)if test ! -e $(DL_DIR)/$($(PKG)_SOURCE); then \
-		$(call MESSAGE,"Downloading") ; \
+		$(call MESSAGE,Downloading) ; \
 	else \
 		for p in $($(PKG)_PATCH) ; do \
 			if test ! -e $(DL_DIR)/$$p ; then \
-				$(call MESSAGE,"Downloading") ; \
+				$(call MESSAGE,Downloading) ; \
 				break ; \
 			fi ; \
 		done ; \
@@ -101,7 +101,7 @@ endif
 # Unpack the archive
 $(BUILD_DIR)/%/.stamp_extracted:
 	@$(call step_start,extract)
-	@$(call MESSAGE,"Extracting")
+	@$(call MESSAGE,Extracting)
 	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
 	$($(PKG)_EXTRACT_CMDS)
@@ -114,7 +114,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 # Rsync the source directory if the <pkg>_OVERRIDE_SRCDIR feature is
 # used.
 $(BUILD_DIR)/%/.stamp_rsynced:
-	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
+	@$(call MESSAGE,Syncing from source dir $(SRCDIR))
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
 	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
@@ -144,7 +144,7 @@ $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
 	@$(call step_start,patch)
-	@$(call MESSAGE,"Patching")
+	@$(call MESSAGE,Patching)
 	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
 	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(notdir $(p))$(sep))
 	$(Q)( \
@@ -165,7 +165,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
 	@$(call step_start,configure)
-	@$(call MESSAGE,"Configuring")
+	@$(call MESSAGE,Configuring)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -175,7 +175,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 # Build
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
-	@$(call MESSAGE,"Building")
+	@$(call MESSAGE,Building)
 	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
@@ -185,7 +185,7 @@ $(BUILD_DIR)/%/.stamp_built::
 # Install to host dir
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
-	@$(call MESSAGE,"Installing to host directory")
+	@$(call MESSAGE,Installing to host directory)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
@@ -195,12 +195,12 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 # Install to staging dir
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
-	@$(call MESSAGE,"Installing to staging directory")
+	@$(call MESSAGE,Installing to staging directory)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
-		$(call MESSAGE,"Fixing package configuration files") ;\
+		$(call MESSAGE,Fixing package configuration files) ;\
 			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
 				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
@@ -217,7 +217,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
-	@$(call MESSAGE,"Installing to images directory")
+	@$(call MESSAGE,Installing to images directory)
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
@@ -226,7 +226,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 # Install to target dir
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
-	@$(call MESSAGE,"Installing to target")
+	@$(call MESSAGE,Installing to target)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 78c2273..3da6e56 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -560,7 +560,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 	fi ; \
 	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	if test -z "$(BR2_PREFER_STATIC_LIB)" ; then \
-		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
+		$(call MESSAGE,Copying external toolchain libraries to target...) ; \
 		for libs in $(LIB_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/lib); \
 		done ; \
@@ -568,10 +568,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_CORE
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
 	fi ; \
-	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
+	$(call MESSAGE,Copying external toolchain sysroot to staging...) ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
-		$(call MESSAGE,"Copying gdbserver") ; \
+		$(call MESSAGE,Copying gdbserver) ; \
 		gdbserver_found=0 ; \
 		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
 			if test -f $${d}/bin/gdbserver ; then \
@@ -593,7 +593,7 @@ endef
 # target filesystem.
 ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
+	$(Q)$(call MESSAGE,Install external toolchain FDPIC libraries to target...) ; \
 	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
 	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
@@ -621,7 +621,7 @@ endif
 # the standard C library. Customer libraries can use 4 and above.
 ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
-	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
+	$(Q)$(call MESSAGE,Install external toolchain FLAT libraries to target...) ; \
 	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
 	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
 	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
@@ -634,7 +634,7 @@ endif
 # symlinks for everything else. Skip gdb symlink when we are building our
 # own gdb to prevent two gdb's in output/host/usr/bin.
 define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
-	$(Q)$(call MESSAGE,"Building ext-toolchain wrapper")
+	$(Q)$(call MESSAGE,Building ext-toolchain wrapper)
 	mkdir -p $(HOST_DIR)/usr/bin; cd $(HOST_DIR)/usr/bin; \
 	for i in $(TOOLCHAIN_EXTERNAL_CROSS)*; do \
 		base=$${i##*/}; \
@@ -661,7 +661,7 @@ endef
 
 # This sed magic is taken from Linux headers_install.sh script.
 define TOOLCHAIN_EXTERNAL_SANITIZE_KERNEL_HEADERS
-	$(Q)$(call MESSAGE,"Sanitizing kernel headers");
+	$(Q)$(call MESSAGE,Sanitizing kernel headers);
 	find $(STAGING_DIR)/usr/include/linux/ -name "*.h" | xargs sed -r -i \
 		-e 's/([ \t(])(__user|__force|__iomem)[ \t]/\1/g' \
 		-e 's/__attribute_const__([ \t]|$$)/\1/g' \
-- 
1.9.1
