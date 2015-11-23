From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:53 +0100
Subject: [Buildroot] [PATCH 23/51] package/gcc: rename gcc-final into plain
	gcc
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <2ec173fe5d52f4c08342b673ee1327c1a57bc1b5.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/4.9.3/860-cilk-wchar.patch             |   6 +-
 .../gcc/{gcc-final/gcc-final.hash => gcc/gcc.hash} |   0
 package/gcc/{gcc-final/gcc-final.mk => gcc/gcc.mk} | 136 ++++++++++-----------
 .../toolchain-buildroot/toolchain-buildroot.mk     |   4 +-
 4 files changed, 73 insertions(+), 73 deletions(-)
 rename package/gcc/{gcc-final/gcc-final.hash => gcc/gcc.hash} (100%)
 rename package/gcc/{gcc-final/gcc-final.mk => gcc/gcc.mk} (51%)

diff --git a/package/gcc/4.9.3/860-cilk-wchar.patch b/package/gcc/4.9.3/860-cilk-wchar.patch
index 1837405..30962bb 100644
--- a/package/gcc/4.9.3/860-cilk-wchar.patch
+++ b/package/gcc/4.9.3/860-cilk-wchar.patch
@@ -10,10 +10,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
  1 file changed, 8 insertions(+)
 
-Index: host-gcc-final-4.9.2/libcilkrts/include/cilk/reducer_min_max.h
+Index: host-gcc-4.9.2/libcilkrts/include/cilk/reducer_min_max.h
 ===================================================================
---- host-gcc-final-4.9.2.orig/libcilkrts/include/cilk/reducer_min_max.h
-+++ host-gcc-final-4.9.2/libcilkrts/include/cilk/reducer_min_max.h
+--- host-gcc-4.9.2.orig/libcilkrts/include/cilk/reducer_min_max.h
++++ host-gcc-4.9.2/libcilkrts/include/cilk/reducer_min_max.h
 @@ -3154,7 +3154,9 @@
  CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
  CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
diff --git a/package/gcc/gcc-final/gcc-final.hash b/package/gcc/gcc/gcc.hash
similarity index 100%
rename from package/gcc/gcc-final/gcc-final.hash
rename to package/gcc/gcc/gcc.hash
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc/gcc.mk
similarity index 51%
rename from package/gcc/gcc-final/gcc-final.mk
rename to package/gcc/gcc/gcc.mk
index c5da163..82db1c2 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc/gcc.mk
@@ -1,31 +1,31 @@
 ################################################################################
 #
-# gcc-final
+# gcc
 #
 ################################################################################
 
-HOST_GCC_FINAL_VERSION = $(HOST_GCC_COMMON_VERSION)
-HOST_GCC_FINAL_SITE = $(HOST_GCC_COMMON_SITE)
-HOST_GCC_FINAL_SOURCE = $(HOST_GCC_COMMON_SOURCE)
+HOST_GCC_VERSION = $(HOST_GCC_COMMON_VERSION)
+HOST_GCC_SITE = $(HOST_GCC_COMMON_SITE)
+HOST_GCC_SOURCE = $(HOST_GCC_COMMON_SOURCE)
 
-HOST_GCC_FINAL_DEPENDENCIES = \
+HOST_GCC_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
 	$(BR_LIBC)
 
-HOST_GCC_FINAL_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
+HOST_GCC_EXCLUDES = $(HOST_GCC_COMMON_EXCLUDES)
+HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_FAKE_TESTSUITE
 
 ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-HOST_GCC_FINAL_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
+HOST_GCC_POST_EXTRACT_HOOKS += HOST_GCC_COMMON_XTENSA_OVERLAY_EXTRACT
 endif
 
-HOST_GCC_FINAL_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
+HOST_GCC_POST_PATCH_HOOKS += HOST_GCC_COMMON_APPLY_PATCHES
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
-HOST_GCC_FINAL_SUBDIR = build
+HOST_GCC_SUBDIR = build
 
-HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
+HOST_GCC_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
 
 # We want to always build the static variants of all the gcc libraries,
 # of which libstdc++, libgomp, libmudflap...
@@ -41,12 +41,12 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_COMMON_CONFIGURE_SYMLINK
 # static), we reproduce the exact same command as the autotools infra
 # uses.
 #
-define  HOST_GCC_FINAL_CONFIGURE_CMDS
-	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
+define  HOST_GCC_CONFIGURE_CMDS
+	(cd $(HOST_GCC_SRCDIR) && rm -rf config.cache; \
 	$(HOST_CONFIGURE_OPTS) \
 	CFLAGS="$(HOST_CFLAGS)" \
 	LDFLAGS="$(HOST_LDFLAGS)" \
-	$(HOST_GCC_FINAL_CONF_ENV) \
+	$(HOST_GCC_CONF_ENV) \
 	CONFIG_SITE=/dev/null \
 	./configure \
 		--prefix="$(HOST_DIR)/usr" \
@@ -61,157 +61,157 @@ define  HOST_GCC_FINAL_CONFIGURE_CMDS
 		--disable-debug \
 		--with-xmlto=no \
 		--with-fop=no \
-		$(QUIET) $(HOST_GCC_FINAL_CONF_OPTS) \
+		$(QUIET) $(HOST_GCC_CONF_OPTS) \
 	)
 endef
 
 
 # Languages supported by the cross-compiler
-HOST_GCC_FINAL_CROSS_LANGUAGES-y = c
-HOST_GCC_FINAL_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
-HOST_GCC_FINAL_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
-HOST_GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(HOST_GCC_FINAL_CROSS_LANGUAGES-y))
+HOST_GCC_CROSS_LANGUAGES-y = c
+HOST_GCC_CROSS_LANGUAGES-$(BR2_INSTALL_LIBSTDCPP) += c++
+HOST_GCC_CROSS_LANGUAGES-$(BR2_TOOLCHAIN_BUILDROOT_FORTRAN) += fortran
+HOST_GCC_CROSS_LANGUAGES = $(subst $(space),$(comma),$(HOST_GCC_CROSS_LANGUAGES-y))
 
-HOST_GCC_FINAL_CONF_OPTS = \
+HOST_GCC_CONF_OPTS = \
 	$(HOST_GCC_COMMON_CONF_OPTS) \
-	--enable-languages=$(HOST_GCC_FINAL_CROSS_LANGUAGES) \
+	--enable-languages=$(HOST_GCC_CROSS_LANGUAGES) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
+HOST_GCC_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*
 # The kernel wants to use the -m4-nofpu option to make sure that it
 # doesn't use floating point operations.
 ifeq ($(BR2_sh4)$(BR2_sh4eb),y)
-HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+HOST_GCC_CONF_OPTS += "--with-multilib-list=m4,m4-nofpu"
+HOST_GCC_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 ifeq ($(BR2_sh4a)$(BR2_sh4aeb),y)
-HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
-HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
+HOST_GCC_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
+HOST_GCC_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-shared
+HOST_GCC_CONF_OPTS += --disable-shared
 else
-HOST_GCC_FINAL_CONF_OPTS += --enable-shared
+HOST_GCC_CONF_OPTS += --enable-shared
 endif
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-HOST_GCC_FINAL_CONF_OPTS += --enable-libgomp
+HOST_GCC_CONF_OPTS += --enable-libgomp
 else
-HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
+HOST_GCC_CONF_OPTS += --disable-libgomp
 endif
 
 # End with user-provided options, so that they can override previously
 # defined options.
-HOST_GCC_FINAL_CONF_OPTS += \
+HOST_GCC_CONF_OPTS += \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
-HOST_GCC_FINAL_CONF_ENV = \
+HOST_GCC_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
-HOST_GCC_FINAL_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
+HOST_GCC_MAKE_OPTS += $(HOST_GCC_COMMON_MAKE_OPTS)
 
 # Make sure we have 'cc'
-define HOST_GCC_FINAL_CREATE_CC_SYMLINKS
+define HOST_GCC_CREATE_CC_SYMLINKS
 	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
 		ln -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc \
 			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
 	fi
 endef
 
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_CREATE_CC_SYMLINKS
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_CREATE_CC_SYMLINKS
 
-HOST_GCC_FINAL_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
-HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
+HOST_GCC_TOOLCHAIN_WRAPPER_ARGS += $(HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS)
+HOST_GCC_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
 # Note: this must be done after CREATE_CC_SYMLINKS, otherwise the
 # -cc symlink to the wrapper is not created.
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_COMMON_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_COMMON_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
 # In gcc 4.7.x, the ARM EABIhf library loader path for (e)glibc was not
 # correct, so we create a symbolic link to make things work
 # properly. eglibc installs the library loader as ld-linux-armhf.so.3,
 # but gcc creates binaries that reference ld-linux.so.3.
 ifeq ($(BR2_arm)$(BR2_ARM_EABIHF)$(BR2_GCC_VERSION_4_7_X)$(BR2_TOOLCHAIN_USES_GLIBC),yyyy)
-define HOST_GCC_FINAL_LD_LINUX_LINK
+define HOST_GCC_LD_LINUX_LINK
 	ln -sf ld-linux-armhf.so.3 $(TARGET_DIR)/lib/ld-linux.so.3
 	ln -sf ld-linux-armhf.so.3 $(STAGING_DIR)/lib/ld-linux.so.3
 endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_LD_LINUX_LINK
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_LD_LINUX_LINK
 endif
 
-# Cannot use the HOST_GCC_FINAL_USR_LIBS mechanism below, because we want
+# Cannot use the HOST_GCC_USR_LIBS mechanism below, because we want
 # libgcc_s to be installed in /lib and not /usr/lib.
-define HOST_GCC_FINAL_INSTALL_LIBGCC
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libgcc_s* \
+define HOST_GCC_INSTALL_LIBGCC
+	-cp -dpf $(HOST_GCC_GCC_LIB_DIR)/libgcc_s* \
 		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libgcc_s* \
+	-cp -dpf $(HOST_GCC_GCC_LIB_DIR)/libgcc_s* \
 		$(TARGET_DIR)/lib/
 endef
 
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_LIBGCC
 
-define HOST_GCC_FINAL_INSTALL_LIBATOMIC
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
+define HOST_GCC_INSTALL_LIBATOMIC
+	-cp -dpf $(HOST_GCC_GCC_LIB_DIR)/libatomic* \
 		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/libatomic* \
+	-cp -dpf $(HOST_GCC_GCC_LIB_DIR)/libatomic* \
 		$(TARGET_DIR)/lib/
 endef
 
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_LIBATOMIC
 
 # Handle the installation of libraries in /usr/lib
-HOST_GCC_FINAL_USR_LIBS =
+HOST_GCC_USR_LIBS =
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-HOST_GCC_FINAL_USR_LIBS += libstdc++
+HOST_GCC_USR_LIBS += libstdc++
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_FORTRAN),y)
-HOST_GCC_FINAL_USR_LIBS += libgfortran
+HOST_GCC_USR_LIBS += libgfortran
 endif
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-HOST_GCC_FINAL_USR_LIBS += libgomp
+HOST_GCC_USR_LIBS += libgomp
 endif
 
 ifeq ($(BR2_GCC_ENABLE_LIBMUDFLAP),y)
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-HOST_GCC_FINAL_USR_LIBS += libmudflapth
+HOST_GCC_USR_LIBS += libmudflapth
 else
-HOST_GCC_FINAL_USR_LIBS += libmudflap
+HOST_GCC_USR_LIBS += libmudflap
 endif
 endif
 
-ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
-define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
-	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.a \
+ifneq ($(HOST_GCC_USR_LIBS),)
+define HOST_GCC_INSTALL_STATIC_LIBS
+	for i in $(HOST_GCC_USR_LIBS) ; do \
+		cp -dpf $(HOST_GCC_GCC_LIB_DIR)/$${i}.a \
 			$(STAGING_DIR)/usr/lib/ ; \
 	done
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
-	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
+define HOST_GCC_INSTALL_SHARED_LIBS
+	for i in $(HOST_GCC_USR_LIBS) ; do \
+		cp -dpf $(HOST_GCC_GCC_LIB_DIR)/$${i}.so* \
 			$(STAGING_DIR)/usr/lib/ ; \
-		cp -dpf $(HOST_GCC_FINAL_GCC_LIB_DIR)/$${i}.so* \
+		cp -dpf $(HOST_GCC_GCC_LIB_DIR)/$${i}.so* \
 			$(TARGET_DIR)/usr/lib/ ; \
 	done
 endef
 endif
 
-define HOST_GCC_FINAL_INSTALL_USR_LIBS
+define HOST_GCC_INSTALL_USR_LIBS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	$(HOST_GCC_FINAL_INSTALL_STATIC_LIBS)
-	$(HOST_GCC_FINAL_INSTALL_SHARED_LIBS)
+	$(HOST_GCC_INSTALL_STATIC_LIBS)
+	$(HOST_GCC_INSTALL_SHARED_LIBS)
 endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
+HOST_GCC_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_USR_LIBS
 endif
 
 ifeq ($(BR2_xtensa),y)
-HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
+HOST_GCC_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
 endif
 
 $(eval $(host-autotools-package))
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc33..e1f51e9 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -6,11 +6,11 @@
 
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
-# Triggering the build of the host-gcc-final will automatically do the
+# Triggering the build of the host-gcc will automatically do the
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
 
-TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
+TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc
 
 TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
 
-- 
1.9.1
