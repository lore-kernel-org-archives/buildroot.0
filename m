From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jan 2013 22:52:23 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain/crostool-ng: use newly-introduced
	BUILDROOT_CONFIG
In-Reply-To: <cover.1358113846.git.yann.morin.1998@free.fr>
References: <cover.1358113846.git.yann.morin.1998@free.fr>
Message-ID: <60d1f27fae90f06b20a2437f63a31cb4458e1d46.1358113846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No need to recreate a path we already have.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |  114 +++++++++++-----------
 1 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 553c9ee..c09f732 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -99,9 +99,9 @@ $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
 # - second for path options (because they have no prompt, they
 #                            always get set to the default value)
 # - third for C library .config (if it has one, eg. uClibc)
-CTNG_FIX_DOT_CONFIG_SED       :=
-CTNG_FIX_DOT_CONFIG_PATHS_SED :=
-CTNG_FIX_DOT_CONFIG_LIBC_SED  :=
+CTNG_FIX_BUILDROOT_CONFIG_SED       :=
+CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED :=
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED  :=
 
 #--------------
 # A few generic functions
@@ -200,72 +200,72 @@ endif
 # with BR2 config options.
 # Known missing: arch options, uClibc/eglibc config...
 #
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_INSTALL_DIR_RO)=y:\# \1 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="buildroot":;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(ARCH)-linux":;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_INSTALL_DIR_RO)=y:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_ARCH_[BL]E).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="buildroot":;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(ARCH)-linux":;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
 ifneq ($(call qstrip,$(BR2_USE_MMU)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
 else
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_USE_MMU)=y:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_ARCH_USE_MMU)=y:\# \1 is not set:;
 endif
 ifneq ($(call qstrip,$(BR2_PACKAGE_GDB_SERVER))$(call qstrip,$(BR2_PACKAGE_GDB_HOST)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_DEBUG_gdb)=.*:\# \1 is not set:;
 endif
 ifeq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_CXX)),y)
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_CC_LANG_CXX) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_CC_LANG_CXX) is not set:\1=y:;
 else
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_CC_LANG_CXX)=.*:\# \1 is not set:;
 endif
 
 # Shoe-horn CPU variant now
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_ARCH)=.*:\1=$(BR2_GCC_TARGET_ARCH):;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_ARCH_ARCH)=.*:\1=$(BR2_GCC_TARGET_ARCH):;
 endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_TUNE)=.*:\1=$(BR2_GCC_TARGET_TUNE):;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_ARCH_TUNE)=.*:\1=$(BR2_GCC_TARGET_TUNE):;
 endif
 
 # And floating point now
 ifeq ($(call qstrip,$(BR2_SOFT_FLOAT)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_FLOAT_HW) is not set:\1=y:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_FLOAT_SW)=y:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_FLOAT_HW) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_ARCH_FLOAT_SW)=y:\# \1 is not set:;
 else
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_ARCH_FLOAT_HW)=y:\# \1 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_FLOAT_SW) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_ARCH_FLOAT_HW)=y:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_ARCH_FLOAT_SW) is not set:\1=y:;
 endif
 
 # Thread implementation selection
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\# \2 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\# \2 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\# \2 is not set:;
 ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS))$(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\2=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_THREADS_LINUXTHREADS).*:\2=y:;
  ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc)),)
   ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\# \2 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\2=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\2=y:;
   else
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\# \2 is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\2=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_OLD).*:\# \2 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_LNXTHRD_NEW).*:\2=y:;
   endif
  endif
 else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NPTL)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\2=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NPTL).*:\2=y:;
 else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_THREADS_NONE)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\2=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(|\# )(CT_THREADS_NONE).*:\2=y:;
 endif
 
 #--------------
 # And the specials for paths
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(HOST_DIR)/usr":;
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_NAME)=.*:\1="sysroot":;
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
+CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED += s:^(CT_PREFIX_DIR)=.*:\1="$(HOST_DIR)/usr":;
+CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED += s:^(CT_LOCAL_TARBALLS_DIR)=.*:\1="$(DL_DIR)":;
+CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_NAME)=.*:\1="sysroot":;
+CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 
 #--------------
 # uClibc specific options
@@ -273,53 +273,53 @@ ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
 # Handle the locales option
 ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_LOCALE)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA)=.*:\# \1 is not set:;
 else
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES)=.*:\# \1 is not set:;
 endif
 
 # Handle the wide-char option
 ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_WCHAR)),)
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_WCHAR) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_WCHAR) is not set:\1=y:;
 else
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_WCHAR)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_WCHAR)=.*:\# \1 is not set:;
 endif
 
 # Handle the LFS option
 ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE)),)
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_LFS) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_LFS) is not set:\1=y:;
 else
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_LFS)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_LFS)=.*:\# \1 is not set:;
 endif
 
 # Handle the IPv6 option
 ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6)),)
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_IPV6) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_IPV6) is not set:\1=y:;
 else
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_IPV6)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_IPV6)=.*:\# \1 is not set:;
 endif
 
 # Handle the RPC option
 ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC)),)
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_RPC) is not set:\1=y\nUCLIBC_HAS_FULL_RPC=y\nUCLIBC_HAS_REENTRANT_RPC=y:;
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_FULL_RPC) is not set:\1=y:;
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_REENTRANT_RPC) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_RPC) is not set:\1=y\nUCLIBC_HAS_FULL_RPC=y\nUCLIBC_HAS_REENTRANT_RPC=y:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_FULL_RPC) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_REENTRANT_RPC) is not set:\1=y:;
 else
-CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_RPC)=.*:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_RPC)=.*:\# \1 is not set:;
 endif
 
 # Instruct CT-NG's .config where to find the uClibc's .config
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
+CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
 
 # And add this to the toolchain build dependency
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/libc.config
 
 # And here is how we get this uClibc's .config
-$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(CONFIG_DIR)/.config
+$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE) $(BUILDROOT_CONFIG)
 	-$(Q)cp -a $@ $@.timestamp
 	$(Q)cp -f $< $@
-	$(call ctng-fix-dot-config,$@,$(CTNG_FIX_DOT_CONFIG_LIBC_SED))
+	$(call ctng-fix-dot-config,$@,$(CTNG_FIX_BUILDROOT_CONFIG_LIBC_SED))
 	$(call ctng-check-config-changed,$@,$@.timestamp)
 	$(Q)rm -f $@.timestamp
 
@@ -330,10 +330,10 @@ endif # LIBC is uClibc
 ifeq ($(BR2_TOOLCHAIN_CTNG_glibc)$(BR2_TOOLCHAIN_CTNG_eglibc),y)
 
 # Force unwind support
-CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^\# (CT_LIBC_GLIBC_FORCE_UNWIND) is not set:\1=y:;
 
 # Force non-fortified build
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_ENABLE_FORTIFIED_BUILD)=y:\# \1 is not set:;
+CTNG_FIX_BUILDROOT_CONFIG_SED += s:^(CT_LIBC_ENABLE_FORTIFIED_BUILD)=y:\# \1 is not set:;
 
 endif # LIBC is glibc or eglibc
 
@@ -347,14 +347,14 @@ endif # LIBC is glibc or eglibc
 # or a feature of kconfig?)
 # $1: the .config file to munge
 define ctng-oldconfig
-	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_SED))
+	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_BUILDROOT_CONFIG_SED))
 	$(Q)yes ''                                             |\
 	$(call ctng,CT_IS_A_BACKEND=y                           \
 	            CT_BACKEND_ARCH=$(CTNG_ARCH)                \
 	            CT_BACKEND_KERNEL=linux                     \
 	            CT_BACKEND_LIBC=$(BR2_TOOLCHAIN_CTNG_LIBC)  \
 	            oldconfig                                   )
-	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_PATHS_SED))
+	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_BUILDROOT_CONFIG_PATHS_SED))
 endef
 
 # We need the host crosstool-NG before we can even begin working
@@ -372,7 +372,7 @@ $(CTNG_DIR)/.config: | host-crosstool-ng
 # can't do anything about it ) Ideally, this should go in oldconfig
 # itself, but it's much easier to handle here.
 
-$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(CONFIG_DIR)/.config
+$(CTNG_DIR)/.config: $(CTNG_CONFIG_FILE) $(BUILDROOT_CONFIG)
 	$(Q)if [ ! -f $@ ]; then                                                        \
 	        mkdir -p "$(CTNG_DIR)";                                                 \
 	        libc="$$(awk -F '"' '$$1=="CT_LIBC=" { print $$2; }' "$<")";            \
-- 
1.7.2.5
