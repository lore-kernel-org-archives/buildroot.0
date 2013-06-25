From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jun 2013 21:35:44 +0200
Subject: [Buildroot] [RFCv1 09/18] gcc-initial: new package
In-Reply-To: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372188953-29449-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc-initial/gcc-initial.mk | 141 +++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 package/gcc-initial/gcc-initial.mk

diff --git a/package/gcc-initial/gcc-initial.mk b/package/gcc-initial/gcc-initial.mk
new file mode 100644
index 0000000..bf776b1
--- /dev/null
+++ b/package/gcc-initial/gcc-initial.mk
@@ -0,0 +1,141 @@
+#############################################################
+#
+# gcc-initial
+#
+#############################################################
+
+# FIXME
+GCC_INITIAL_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
+GCC_INITIAL_SITE    = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_INITIAL_VERSION)
+GCC_INITIAL_SOURCE  = gcc-$(GCC_INITIAL_VERSION).tar.bz2
+
+HOST_GCC_INITIAL_DEPENDENCIES = host-binutils
+
+define HOST_GCC_INITIAL_XTENSA_OVERLAY_EXTRACT
+        tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
+                $(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
+endef
+
+ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
+HOST_GCC_INITIAL_POST_EXTRACT_CMDS += HOST_GCC_INITIAL_XTENSA_OVERLAY_EXTRACT
+endif
+
+# Share patches with the 'gcc' package
+define HOST_GCC_INITIAL_APPLY_PATCHES
+	support/scripts/apply-patches.sh $(@D) package/gcc/$(GCC_INITIAL_VERSION) \*.patch
+endef
+
+HOST_GCC_INITIAL_POST_PATCH_HOOKS += HOST_GCC_INITIAL_APPLY_PATCHES
+
+# gcc doesn't support in-tree build, so we create a 'build'
+# subdirectory in the gcc sources, and build from there.
+HOST_GCC_INITIAL_SUBDIR = build
+
+define HOST_GCC_INITIAL_CONFIGURE_SYMLINK
+	mkdir -p $(@D)/build
+	ln -s ../configure $(@D)/build/configure
+endef
+
+HOST_GCC_INITIAL_PRE_CONFIGURE_HOOKS += HOST_GCC_INITIAL_CONFIGURE_SYMLINK
+
+HOST_GCC_INITIAL_CONF_OPT = \
+	--target=$(GNU_TARGET_NAME) \
+	--enable-languages=c \
+	--with-sysroot=$(STAGING_DIR) \
+	--disable-__cxa_atexit \
+	--with-gnu-ld \
+	--disable-libssp \
+	--disable-multilib \
+	--with-gmp=$(HOST_DIR)/usr \
+	--with-mpfr=$(HOST_DIR)/usr \
+	--disable-shared \
+	--without-headers \
+	--with-newlib \
+	--disable-largefile \
+	--disable-nls
+
+# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
+# Workaround until it's fixed in 4.5.4 or later
+ifeq ($(ARCH),powerpc)
+ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
+HOST_GCC_INITIAL_CONF_OPT += --disable-target-optspace
+endif
+else
+HOST_GCC_INITIAL_CONF_OPT += --enable-target-optspace
+endif
+
+# gcc 4.6.x quadmath requires wchar
+ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
+HOST_GCC_INITIAL_CONF_OPT += --disable-libquadmath
+endif
+
+# Do we really care about OpenMP support in gcc-initial?
+ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
+HOST_GCC_INITIAL_CONF_OPT += --enable-libgomp
+else
+HOST_GCC_INITIAL_CONF_OPT += --disable-libgomp
+endif
+
+ifeq ($(BR2_GCC_ENABLE_TLS),y)
+HOST_GCC_INITIAL_CONF_OPT += --enable-tls
+else
+HOST_GCC_INITIAL_CONF_OPT += --disable-tls
+endif
+
+ifeq ($(BR2_PTHREADS_NONE),y)
+HOST_GCC_INITIAL_CONF_OPT += --disable-threads --disable-libitm --disable-libatomic
+else
+HOST_GCC_INITIAL_CONF_OPT += --enable-threads
+endif
+
+ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
+HOST_GCC_INITIAL_CONF_OPT += --disable-decimal-float
+endif
+
+ifeq ($(BR2_GCC_NEEDS_MPC),y)
+HOST_GCC_INITIAL_DEPENDENCIES += host-mpc
+HOST_GCC_INITIAL_CONF_OPT += --with-mpc=$(HOST_DIR)/usr
+endif
+
+ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
+HOST_GCC_INITIAL_DEPENDENCIES += host-flex host-bison
+endif
+
+# Determine soft-float options
+ifeq ($(BR2_SOFT_FLOAT),y)
+# only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
+# powerpc seems to be needing it as well
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
+HOST_GCC_INITIAL_CONF_OPT += --with-float=soft
+endif
+endif
+
+# Determine arch/tune/abi/cpu options
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
+HOST_GCC_INITIAL_CONF_OPT += --with-arch=$(BR2_GCC_TARGET_ARCH)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
+HOST_GCC_INITIAL_CONF_OPT += --with-tune=$(BR2_GCC_TARGET_TUNE)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
+HOST_GCC_INITIAL_CONF_OPT += --with-abi=$(BR2_GCC_TARGET_ABI)
+endif
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
+HOST_GCC_INITIAL_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
+else
+HOST_GCC_INITIAL_CONF_OPT += --with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+endif
+endif
+
+# Branding works on >= 4.3
+ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
+HOST_GCC_INITIAL_CONF_OPT += \
+	--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
+	--with-bugurl="http://bugs.buildroot.net/"
+endif
+
+HOST_GCC_INITIAL_MAKE_OPT = all-gcc
+HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
+
+$(eval $(host-autotools-package))
-- 
1.8.1.2
