From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:44 -0000
Subject: [Buildroot] [git commit branch/next] Remove REAL_GNU_TARGET_NAME
Message-ID: <20120802195242.64E658E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7b640d8126659ca0803d8bad158917f50d43298
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of providing two variables, make GNU_TARGET_NAME give the real
target name, and remove REAL_GNU_TARGET_NAME altogether.

Signed-off-by: Richard Braun <rbraun@sceen.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in                              |   12 ++--
 package/binutils/binutils.mk                     |    6 +-
 package/microperl/microperl.mk                   |    4 +-
 package/sstrip/sstrip.mk                         |    2 +-
 toolchain/elf2flt/elf2flt.mk                     |    5 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                  |   71 +++++++++-------------
 toolchain/gdb/gdb.mk                             |   16 ++---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 +-
 toolchain/uClibc/uclibc.mk                       |    3 +-
 9 files changed, 52 insertions(+), 71 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index df7042c..57599c5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -9,8 +9,8 @@ HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 MAKE1:=$(HOSTMAKE) -j1
 MAKE:=$(HOSTMAKE) -j$(BR2_JLEVEL)
 
-# Compute GNU_TARGET_NAME and REAL_GNU_TARGET_NAME
-GNU_TARGET_NAME=$(ARCH)-linux
+# Compute GNU_TARGET_NAME
+GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 LIBC=uclibc
@@ -46,9 +46,7 @@ TARGET_ABI+=-mabi=spe -mfloat-gprs=double -Wa,-me500mc
 endif
 endif
 
-REAL_GNU_TARGET_NAME=$(ARCH)-unknown-linux-$(LIBC)$(ABI)
-
-STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
+STAGING_DIR=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sysroot
 
 TARGET_OPTIMIZATION:=$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
@@ -97,7 +95,7 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=$(call qstrip,$(BR2_TARGET_LDFLAGS))
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG),y)
-TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
+TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-
 else
 TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))-
 endif
@@ -137,7 +135,7 @@ endif
 ifeq ($(BR2_STRIP_sstrip),y)
 STRIP_STRIP_UNNEEDED:=
 STRIP_STRIP_ALL:=
-TARGET_STRIP=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
+TARGET_STRIP=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-sstrip
 STRIPCMD=$(TARGET_STRIP)
 KSTRIPCMD=$(TARGET_CROSS)strip --remove-section=.comment --remove-section=.note --strip-unneeded
 endif
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 1c8a79d..3293e18 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -27,8 +27,8 @@ BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl)
 
 # We need to specify host & target to avoid breaking ARM EABI
 BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--enable-shared \
 		$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
@@ -40,7 +40,7 @@ endif
 # "host" binutils should actually be "cross"
 # We just keep the convention of "host utility" for now
 HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
-			--target=$(REAL_GNU_TARGET_NAME) \
+			--target=$(GNU_TARGET_NAME) \
 			--disable-shared --enable-static \
 			--with-sysroot=$(STAGING_DIR) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index 5bf4a2e..61187ea 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -9,7 +9,7 @@ MICROPERL_SITE = http://www.cpan.org/src/5.0
 MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
 MICROPERL_DEPENDENCIES = host-microperl
 MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
-MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(REAL_GNU_TARGET_NAME)
+MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(GNU_TARGET_NAME)
 MICROPERL_MODS = $(call qstrip,$(BR2_PACKAGE_MICROPERL_MODULES))
 
 # Minimal set of modules required for 'perl -V' to work
@@ -72,7 +72,7 @@ define MICROPERL_CONFIGURE_CMDS
 	echo "archlib='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
 	echo "archlibexp='$(MICROPERL_ARCH_DIR)'" >>$(@D)/uconfig.sh
 	echo "d_archlib='define'" >>$(@D)/uconfig.sh
-	echo "archname='$(REAL_GNU_TARGET_NAME)'" >>$(@D)/uconfig.sh
+	echo "archname='$(GNU_TARGET_NAME)'" >>$(@D)/uconfig.sh
 	echo "osname='linux'" >>$(@D)/uconfig.sh
 	echo "cc='$(TARGET_CC)'" >>$(@D)/uconfig.sh
 	echo "ccflags='$(TARGET_CFLAGS)'" >>$(@D)/uconfig.sh
diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index 9a5aede..a1447d8 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -6,7 +6,7 @@
 
 SSTRIP_SITE = svn://dev.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
-HOST_SSTRIP_BINARY = $(REAL_GNU_TARGET_NAME)-sstrip
+HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
 # This is a kludge to get host-ccache built before us or it fails
 ifeq ($(BR2_CCACHE),y)
diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
index 84a2c01..134034b 100644
--- a/toolchain/elf2flt/elf2flt.mk
+++ b/toolchain/elf2flt/elf2flt.mk
@@ -23,7 +23,7 @@ $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
 		$(ELF2FLT_DIR)/configure $(QUIET) \
 		--with-bfd-include-dir=$(HOST_BINUTILS_DIR)/bfd/ \
 		--with-binutils-include-dir=$(HOST_BINUTILS_DIR)/include/ \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--with-libbfd=$(HOST_BINUTILS_DIR)/bfd/libbfd.a \
 		--with-libiberty=$(HOST_BINUTILS_DIR)/libiberty/libiberty.a \
 		--prefix=$(HOST_DIR)/usr)
@@ -32,9 +32,6 @@ $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
 $(ELF2FLT_DIR)/$(ELF2FLT_BINARY): $(ELF2FLT_DIR)/.configured
 	$(MAKE) -C $(ELF2FLT_DIR) all
 	$(MAKE) -C $(ELF2FLT_DIR) install
-	ln -snf $(REAL_GNU_TARGET_NAME)-elf2flt $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-elf2flt
-	ln -snf $(REAL_GNU_TARGET_NAME)-flthdr  $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-flthdr
-	ln -snf $(REAL_GNU_TARGET_NAME)-ld.real $(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-ld.real
 
 elf2flt: uclibc_target uclibc-configured binutils gcc $(ELF2FLT_DIR)/$(ELF2FLT_BINARY)
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index a2975dc..57f4f8a 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -104,7 +104,7 @@ SOFT_FLOAT_CONFIG_OPTION:=
 EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
 	--disable-libmudflap
 EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
-	--with-build-time-tools=$(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/bin
+	--with-build-time-tools=$(STAGING_DIR)/$(GNU_TARGET_NAME)/bin
 EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
 	--with-as=$(TARGET_CROSS)as
 endif
@@ -287,7 +287,7 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--enable-languages=c \
 		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		--disable-__cxa_atexit \
@@ -322,11 +322,11 @@ endif
 	touch $@
 
 gcc_initial=$(GCC_BUILD_DIR1)/.installed
-$(gcc_initial) $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
+$(gcc_initial) $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
 	PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
 	touch $(gcc_initial)
 
-gcc_initial: $(GCC_HOST_PREREQ) host-binutils $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+gcc_initial: $(GCC_HOST_PREREQ) host-binutils $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 
 gcc_initial-clean:
 	rm -rf $(GCC_BUILD_DIR1)
@@ -353,7 +353,7 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--enable-languages=c \
 		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		--disable-__cxa_atexit \
@@ -397,7 +397,7 @@ else
 endif
 	touch $(gcc_intermediate)
 
-gcc_intermediate: uclibc-configured $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+gcc_intermediate: uclibc-configured $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 
 gcc_intermediate-clean:
 	rm -rf $(GCC_BUILD_DIR2)
@@ -422,17 +422,17 @@ GCC_BUILD_DIR3:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
 $(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 	mkdir -p $(GCC_BUILD_DIR3)
 	# Important! Required for limits.h to be fixed.
-	ln -snf ../include/ $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sys-include
+	ln -snf ../include/ $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sys-include
 	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=$(HOST_DIR)/usr \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--enable-languages=$(GCC_CROSS_LANGUAGES) \
 		--with-sysroot=$(STAGING_DIR) \
-		--with-build-time-tools=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin \
+		--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin \
 		--disable-__cxa_atexit \
 		$(GCC_OPTSPACE) \
 		$(GCC_QUADMATH) \
@@ -468,30 +468,20 @@ $(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
 		fi; \
 		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
 		rmdir "$(STAGING_DIR)/lib64"; \
-		rm "$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib64";\
+		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
 	fi
 	# Strip the host binaries
 ifeq ($(GCC_STRIP_HOST_BINARIES),true)
-	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-*))
+	strip --strip-all -R .note -R .comment $(filter-out %-gccbug %-embedspu,$(wildcard $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-*))
 endif
 	# Make sure we have 'cc'.
-	if [ ! -e $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc ]; then \
-		ln -snf $(REAL_GNU_TARGET_NAME)-gcc \
-			$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc; \
+	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
+		ln -snf $(GNU_TARGET_NAME)-gcc \
+			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
 	fi
-	if [ ! -e $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/cc; \
+	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
+		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
 	fi
-	# Set up the symlinks to enable lying about target name.
-	set -e; \
-	(cd $(HOST_DIR)/usr; \
-		ln -snf $(REAL_GNU_TARGET_NAME) $(GNU_TARGET_NAME); \
-		cd bin; \
-		for app in $(REAL_GNU_TARGET_NAME)-*; do \
-			ln -snf $${app} \
-			$(GNU_TARGET_NAME)$${app##$(REAL_GNU_TARGET_NAME)}; \
-		done; \
-	)
 
 	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
 	touch $@
@@ -500,31 +490,31 @@ $(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	# These go in /lib, so...
 	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgcc_s* \
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
 		$(TARGET_DIR)/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
 endif
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
 	mkdir -p $(TARGET_DIR)/usr/lib
-	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libstdc++.so* \
 		$(STAGING_DIR)/usr/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libstdc++.so* \
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libstdc++.so* \
 		$(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
 endif
 endif
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgomp.so* $(STAGING_DIR)/usr/lib/
-	cp -dpf $(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/lib*/libgomp.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgomp.so* $(STAGING_DIR)/usr/lib/
+	cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgomp.so* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgomp.so*
 endif
 	mkdir -p $(@D)
 	touch $@
 
-cross_compiler:=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
+cross_compiler:=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
 cross_compiler gcc: gcc_intermediate \
 	$(LIBFLOAT_TARGET) uclibc $(GCC_BUILD_DIR3)/.installed \
 	$(STAMP_DIR)/gcc_libs_target_installed \
@@ -535,7 +525,6 @@ gcc-source: $(DL_DIR)/$(GCC_SOURCE)
 gcc-clean:
 	rm -rf $(GCC_BUILD_DIR3)
 	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-		rm -f $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-$$prog; \
 		rm -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
 	done
 
@@ -567,8 +556,8 @@ $(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
 		$(GCC_SRC_DIR)/configure $(QUIET) \
 		--prefix=/usr \
 		--build=$(GNU_HOST_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--enable-languages=$(GCC_TARGET_LANGUAGES) \
 		--with-gxx-include-dir=/usr/include/c++ \
 		--disable-__cxa_atexit \
@@ -596,7 +585,7 @@ $(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
 	$(MAKE) -C $(GCC_BUILD_DIR4) all
 	touch $@
 
-GCC_LIB_SUBDIR=lib/gcc/$(REAL_GNU_TARGET_NAME)/$(GCC_VERSION)
+GCC_LIB_SUBDIR=lib/gcc/$(GNU_TARGET_NAME)/$(GCC_VERSION)
 ifeq ($(findstring x4.2,x$(GCC_VERSION)),x4.2)
 GCC_INCLUDE_DIR:=include
 else
@@ -610,9 +599,9 @@ $(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
 	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
 
 	# Remove useless copies of gcc, c++, g++
-	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc*
-	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++*
-	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++*
+	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc*
+	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)-g++*
+	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)-c++*
 
 	# Work around problem of missing syslimits.h
 	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
@@ -637,7 +626,7 @@ gcc_target: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ) binutils
 
 gcc_target-clean:
 	rm -rf $(GCC_BUILD_DIR4)
-	rm -f $(TARGET_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)*
+	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)*
 
 gcc_target-dirclean:
 	rm -rf $(GCC_BUILD_DIR4)
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 0b85180..5673cf1 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -71,8 +71,8 @@ $(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
 		$(GDB_DIR)/configure $(QUIET) \
 		--cache-file=/dev/null \
 		--build=$(GNU_HOST_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--prefix=/usr \
 		$(DISABLE_NLS) \
 		--without-uiout $(DISABLE_GDBMI) \
@@ -124,8 +124,8 @@ $(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
 		$(GDB_DIR)/gdb/gdbserver/configure $(QUIET) \
 		--cache-file=/dev/null \
 		--build=$(GNU_HOST_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
 		--bindir=/usr/bin \
@@ -150,9 +150,9 @@ $(GDB_SERVER_DIR)/gdbserver: $(GDB_SERVER_DIR)/.configured
 
 $(TARGET_DIR)/usr/bin/gdbserver: $(GDB_SERVER_DIR)/gdbserver
 ifeq ($(BR2_CROSS_TOOLCHAIN_TARGET_UTILS),y)
-	mkdir -p $(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils
+	mkdir -p $(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/target_utils
 	install -c $(GDB_SERVER_DIR)/gdbserver \
-		$(STAGING_DIR)/usr/$(REAL_GNU_TARGET_NAME)/target_utils/gdbserver
+		$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/target_utils/gdbserver
 endif
 	install -c -D $(GDB_SERVER_DIR)/gdbserver $(TARGET_DIR)/usr/bin/gdbserver
 
@@ -185,7 +185,7 @@ $(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
 		--prefix=$(STAGING_DIR) \
 		--build=$(GNU_HOST_NAME) \
 		--host=$(GNU_HOST_NAME) \
-		--target=$(REAL_GNU_TARGET_NAME) \
+		--target=$(GNU_TARGET_NAME) \
 		$(DISABLE_NLS) \
 		--without-uiout $(DISABLE_GDBMI) \
 		--disable-tui --disable-gdbtk --without-x \
@@ -203,8 +203,6 @@ $(GDB_HOST_DIR)/gdb/gdb: $(GDB_HOST_DIR)/.configured
 
 $(TARGET_CROSS)gdb: $(GDB_HOST_DIR)/gdb/gdb
 	install -c $(GDB_HOST_DIR)/gdb/gdb $(TARGET_CROSS)gdb
-	ln -snf $(REAL_GNU_TARGET_NAME)-gdb \
-		$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gdb
 
 gdbhost: host-expat $(TARGET_CROSS)gdb
 
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 25d2a16..625796a 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -187,7 +187,7 @@ endif
 # CT_LOCAL_TARBALLS_DIR     : share downloads with BR
 # CT_SYSROOT_DIR_PREFIX     : no prefix needed, really
 # CT_TARGET_VENDOR          : try to set a unique vendor string, to avoid clashing with BR's vendor string
-# CT_TARGET_ALIAS           : set the target tuple alias to REAL_GNU_TARGET_NAME so that packages' ./configure find the compiler
+# CT_TARGET_ALIAS           : set the target tuple alias to GNU_TARGET_NAME so that packages' ./configure find the compiler
 # CT_DEBUG_gdb              : deselect gdb+gdbserver if buildroot builds its own
 # CT_CC_LANG_CXX            : required if we copy libstdc++.so, and build C++
 # CT_LIBC_UCLIBC_CONFIG_FILE: uClibc config file, if needed
@@ -202,7 +202,7 @@ CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_ENDIAN)) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_ARCH_(32|64)).*:\# \2 is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_$(CTNG_BIT)) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_VENDOR)=.*:\1="unknown":;
-CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(GNU_TARGET_NAME)":;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TARGET_ALIAS)=.*:\1="$(ARCH)-linux":;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_TOOLCHAIN_PKGVERSION)="(.*)":\1="buildroot $(BR2_VERSION_FULL)":;
 ifneq ($(call qstrip,$(BR2_USE_MMU)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_ARCH_USE_MMU) is not set:\1=y:;
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 0728135..f40fe36 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -474,11 +474,10 @@ $(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
 		hostutils
 	if [ -f $(UCLIBC_DIR)/utils/ldd.host ]; then \
 		install -D $(UCLIBC_DIR)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd; \
-		ln -sf ldd $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldd; \
+		ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd; \
 	fi
 	if [ -f $(UCLIBC_DIR)/utils/ldconfig.host ]; then \
 		install -D $(UCLIBC_DIR)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig; \
-		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-ldconfig; \
 		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
 	fi
 	touch -c $@
