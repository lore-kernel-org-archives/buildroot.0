From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:35:46 +0200
Subject: [Buildroot] [RFCv1 11/18] gcc: new package
In-Reply-To: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372188953-29449-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 128 ++++++++++++++++++++++++
 package/gcc/gcc.mk         | 239 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 367 insertions(+)
 create mode 100644 package/gcc/Config.in.host
 create mode 100644 package/gcc/gcc.mk

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
new file mode 100644
index 0000000..7ecf2fb
--- /dev/null
+++ b/package/gcc/Config.in.host
@@ -0,0 +1,128 @@
+comment "GCC Options"
+
+config BR2_GCC_NEEDS_MPC
+	bool
+
+choice
+	prompt "GCC compiler Version"
+	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
+	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr3
+	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc
+	default BR2_GCC_VERSION_4_7_X
+	help
+	  Select the version of gcc you wish to use.
+
+	config BR2_GCC_VERSION_4_4_7_ARC
+		depends on BR2_arc
+		bool "gcc 4.4.7-arc"
+
+	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+		depends on BR2_avr32
+		bool "gcc 4.2.2-avr32-2.1.5"
+
+	config BR2_GCC_VERSION_4_3_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		bool "gcc 4.3.x"
+
+	config BR2_GCC_VERSION_4_4_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		bool "gcc 4.4.x"
+
+	config BR2_GCC_VERSION_4_5_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.5.x"
+
+	config BR2_GCC_VERSION_4_6_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.6.x"
+
+	config BR2_GCC_VERSION_4_7_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.7.x"
+
+	config BR2_GCC_VERSION_4_8_X
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc 4.8.x"
+
+	config BR2_GCC_VERSION_SNAP
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
+		bool "gcc snapshot"
+endchoice
+
+config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
+	bool
+	default y if !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+
+config BR2_GCC_SNAP_DATE
+	string "GCC snapshot date"
+	default "4.8-20120429"
+	depends on BR2_GCC_VERSION_SNAP
+	help
+	  Enter snapshot date to use for gcc.
+	  Format is: A.B-YYYYMMDD
+
+	  A is GCC major version, for example 4.
+	  B is GCC minor version, for example 7.
+	  YYYYMMDD is snapshot date, for example 20110430.
+
+	  This way we'd get version 4.7-20110430
+
+config BR2_GCC_VERSION
+	string
+	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
+	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.7-arc" if BR2_GCC_VERSION_4_4_7_ARC
+	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
+	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
+	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
+	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
+	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
+
+config BR2_EXTRA_GCC_CONFIG_OPTIONS
+	string "Additional gcc options"
+	default ""
+	help
+	  Any additional gcc configure options you may want to include....
+
+config BR2_INSTALL_OBJC
+	bool "Build/install Objective-C compiler and runtime?"
+	depends on !BR2_avr32
+	help
+	  Build/install Objective-C compiler and runtime?
+
+config BR2_INSTALL_FORTRAN
+	bool "Build/install Fortran compiler and runtime?"
+	depends on !BR2_avr32
+	select BR2_PACKAGE_LIBMPFR
+	help
+	  Build/install Fortran compiler and runtime?
+	  Note that it is highly recommended NOT to use gfortran
+	  from gcc older than 4.2.0
+
+config BR2_GCC_SHARED_LIBGCC
+	bool "Build/install a shared libgcc?"
+	depends on !BR2_PREFER_STATIC_LIB
+	default y
+	depends on !BR2_sparc
+	help
+	  Build/install a shared libgcc library
+
+config BR2_GCC_ENABLE_TLS
+	bool "Enable compiler tls support"
+	default y
+	depends on BR2_PTHREADS_NATIVE
+	help
+	  Enable the compiler to generate code for accessing
+	  thread local storage variables
+
+config BR2_GCC_ENABLE_OPENMP
+	bool "Enable compiler OpenMP support"
+	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
+	help
+	  Enable OpenMP support for the compiler
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
new file mode 100644
index 0000000..e07e6ea
--- /dev/null
+++ b/package/gcc/gcc.mk
@@ -0,0 +1,239 @@
+#############################################################
+#
+# gcc
+#
+#############################################################
+
+GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
+
+ifeq ($(BR2_GCC_VERSION_SNAP),y)
+GCC_SNAP_DATE = $(call qstrip,$(BR2_GCC_SNAP_DATE))
+endif
+
+ifneq ($(GCC_SNAP_DATE),)
+GCC_SITE = ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
+else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
+GCC_SITE = ftp://www.at91.com/pub/buildroot/
+else
+GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
+endif
+
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
+
+HOST_GCC_DEPENDENCIES = host-gmp host-mpfr uclibc
+
+define HOST_GCC_XTENSA_OVERLAY_EXTRACT
+        tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
+                $(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
+endef
+
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+HOST_GCC_POST_EXTRACT_CMDS += HOST_GCC_XTENSA_OVERLAY_EXTRACT
+endif
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_SUBDIR = build
+
+define HOST_GCC_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -s ../configure $(@D)/build/configure
+endef
+
+HOST_GCC_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
+
+# Languages supported by the cross-compiler
+GCC_CROSS_LANGUAGES-y = c
+GCC_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+GCC_CROSS_LANGUAGES-$(BR2_GCC_CROSS_FORTRAN) += fortran
+GCC_CROSS_LANGUAGES-$(BR2_GCC_CROSS_OBJC)    += objc
+GCC_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_CROSS_LANGUAGES-y))
+
+HOST_GCC_CONF_OPT = \
+	--target=$(GNU_TARGET_NAME) \
+	--enable-languages=$(GCC_CROSS_LANGUAGES) \
+	--with-sysroot=$(STAGING_DIR) \
+	--disable-__cxa_atexit \
+	--with-gnu-ld \
+	--disable-libssp \
+	--disable-multilib \
+	--with-gmp=$(HOST_DIR)/usr \
+	--with-mpfr=$(HOST_DIR)/usr \
+	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
+
+# Dependency on MPC
+ifeq ($(BR2_GCC_NEEDS_MPC),y)
+HOST_GCC_DEPENDENCIES += host-mpc
+HOST_GCC_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
+endif
+
+ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
+HOST_GCC_DEPENDENCIES += host-flex host-bison
+endif
+
+# Branding works on >= 4.3
+ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
+HOST_GCC_CONF_OPT += \
+	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
+	--with-bugurl="http://bugs.buildroot.net/"
+endif
+
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
+# Workaround until it's fixed in 4.5.4 or later
+ifeq ($(ARCH),powerpc)
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+HOST_GCC_CONF_OPT += --disable-target-optspace
+endif
+else
+HOST_GCC_CONF_OPT += --enable-target-optspace
+endif
+
+# gcc 4.6.x quadmath requires wchar
+ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
+HOST_GCC_CONF_OPT += --disable-libquadmath
+endif
+
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+HOST_GCC_CONF_OPT += --enable-libgomp
+else
+HOST_GCC_CONF_OPT += --disable-libgomp
+endif
+
+ifeq ($(BR2_GCC_ENABLE_TLS),y)
+HOST_GCC_CONF_OPT += --enable-tls
+else
+HOST_GCC_CONF_OPT += --disable-tls
+endif
+
+ifeq ($(BR2_PTHREADS_NONE),y)
+HOST_GCC_CONF_OPT += --disable-threads --disable-libitm --disable-libatomic
+else
+HOST_GCC_CONF_OPT += --enable-threads
+endif
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+# only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
+# powerpc seems to be needing it as well
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
+HOST_GCC_CONF_OPT += --with-float=soft
+endif
+endif
+
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+HOST_GCC_CONF_OPT += --disable-decimal-float
+endif
+
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+HOST_GCC_CONF_OPT += --enable-shared
+else
+HOST_GCC_CONF_OPT += --disable-shared
+endif
+
+# Determine arch/tune/abi/cpu options
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+HOST_GCC_CONF_OPT += --with-arch=$(BR2_GCC_TARGET_ARCH)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
+HOST_GCC_CONF_OPT += --with-tune=$(BR2_GCC_TARGET_TUNE)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
+HOST_GCC_CONF_OPT += --with-abi=$(BR2_GCC_TARGET_ABI)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+HOST_GCC_CONF_OPT += --with-cpu=$(BR2_GCC_TARGET_CPU)
+endif
+
+# AVR32 GCC special configuration
+ifeq ($(BR2_avr32),y)
+HOST_GCC_CONF_OPT += --disable-libmudflap
+endif
+
+# Disable mudflap and enable proper double/long double for SPE ABI
+ifeq ($(BR2_powerpc_SPE),y)
+HOST_GCC_CONF_OPT += \
+	--disable-libmudflap \
+	--enable-e500_double \
+	--with-long-double-128
+endif
+
+# End with user-provided options, so that they can override previously
+# defined options.
+HOST_GCC_CONF_OPT += \
+	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
+
+# Handle lib64
+define HOST_GCC_HANDLE_LIB64
+	if [ -d "$(STAGING_DIR)/lib64" ]; then \
+		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
+			mkdir -p "$(STAGING_DIR)/lib"; \
+		fi; \
+		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
+		rmdir "$(STAGING_DIR)/lib64"; \
+		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
+	fi
+endef
+
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_HANDLE_LIB64
+
+# Make sure we have 'cc'
+define HOST_GCC_CREATE_CC_SYMLINKS
+	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
+		ln -snf $(GNU_TARGET_NAME)-gcc \
+			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
+	fi
+	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
+	fi
+endef
+
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_CREATE_CC_SYMLINKS
+
+# Create <arch>-linux-<tool> symlinks
+define HOST_GCC_CREATE_SIMPLE_SYMLINKS
+	(cd $(HOST_DIR)/usr/bin; for i in $(GNU_TARGET_NAME)-*; do \
+		ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
+	done)
+endef
+
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_CREATE_SIMPLE_SYMLINKS
+
+# Cannot use the HOST_GCC_USR_LIBS mechanism below, because we want
+# libgcc_s to be installed in /lib and not /usr/lib. We add +x on
+# libgcc_s to ensure it will be stripped.
+ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
+define HOST_GCC_INSTALL_LIBGCC
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
+		$(STAGING_DIR)/lib/
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
+		$(TARGET_DIR)/lib/
+	chmod +x $(TARGET_DIR)/lib/libgcc_s.so.1
+endef
+
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_LIBGCC
+endif
+
+# Handle the installation of libraries in /usr/lib
+HOST_GCC_USR_LIBS =
+
+ifeq ($(BR2_GCC_SHARED_LIBGCC)$(BR2_INSTALL_LIBSTDCPP),yy)
+HOST_GCC_USR_LIBS += libstdc++
+endif
+
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+HOST_GCC_USR_LIBS += libgomp
+endif
+
+ifneq ($(HOST_GCC_USR_LIBS),)
+define HOST_GCC_INSTALL_USR_LIBS
+	for i in $(HOST_GCC_USR_LIBS) ; do \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+			$(STAGING_DIR)/usr/lib/ ; \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+			$(TARGET_DIR)/usr/lib/ ; \
+	done
+endef
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_USR_LIBS
+endif
+
+
+$(eval $(host-autotools-package))
-- 
1.8.1.2
