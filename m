From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Dec 2010 21:09:56 +0100
Subject: [Buildroot] [PATCH 1/1] ccache: rework ccache management
In-Reply-To: <cover.1291752554.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291752554.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f95ea74c56d256c55db89761b503d5716bf6d1b3.1291752554.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * ccache is now a normal package (both for the host and the target).

 * ccache option is now part of the "Build options" menu. It will
   automatically build ccache for the host before building anything,
   and will use it to cache builds for both host compilations and
   target compilations.

 * bump ccache to 3.1.3

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                |    8 ++
 Makefile                                 |   26 +++-
 docs/buildroot.html                      |   31 +++++-
 package/Config.in                        |    2 +-
 package/Makefile.in                      |   10 ++-
 package/ccache/Config.in                 |    9 ++
 package/ccache/ccache.mk                 |   33 +++++
 toolchain/ccache/Config.in               |   16 ---
 toolchain/ccache/Config.in.2             |   13 --
 toolchain/ccache/ccache.mk               |  196 ------------------------------
 toolchain/dependencies/dependencies.sh   |    2 +-
 toolchain/toolchain-buildroot.mk         |    1 -
 toolchain/toolchain-buildroot/Config.in  |    1 -
 toolchain/toolchain-crosstool-ng.mk      |    1 -
 toolchain/toolchain-external.mk          |    1 -
 toolchain/toolchain-external/ext-tool.mk |    2 +-
 16 files changed, 110 insertions(+), 242 deletions(-)
 create mode 100644 package/ccache/Config.in
 create mode 100644 package/ccache/ccache.mk
 delete mode 100644 toolchain/ccache/Config.in
 delete mode 100644 toolchain/ccache/Config.in.2
 delete mode 100644 toolchain/ccache/ccache.mk

diff --git a/Config.in b/Config.in
index a41cd3e..f6e894e 100644
--- a/Config.in
+++ b/Config.in
@@ -94,6 +94,14 @@ config BR2_JLEVEL
 	help
 	  Number of jobs to run simultaneously
 
+config BR2_CCACHE
+	bool "Enable compiler cache"
+	help
+	  This option will enable the use of ccache, a compiler
+	  cache. It will cache the result of previous builds to speed
+	  up future builds. The cache is stored in
+	  $HOME/.buildroot-ccache.
+
 config BR2_DEPRECATED
 	bool "Show packages that are deprecated or obsolete"
 	help
diff --git a/Makefile b/Makefile
index 596470f..3c23825 100644
--- a/Makefile
+++ b/Makefile
@@ -125,10 +125,13 @@ HOSTAS:=as
 endif
 ifndef HOSTCC
 HOSTCC:=gcc
-else
+HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCC_NOCCACHE:=$(HOSTCC)
 endif
 ifndef HOSTCXX
 HOSTCXX:=g++
+HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTCXX_NOCCACHE:=$(HOSTCXX)
 endif
 ifndef HOSTFC
 HOSTFC:=gfortran
@@ -147,8 +150,6 @@ HOSTNM:=nm
 endif
 HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
 HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
-HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
 HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
 HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
@@ -156,6 +157,7 @@ HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
+export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
 # bash prints the name of the directory on 'cd <dir>' if CDPATH is
 # set, so unset it here to not cause problems. Notice that the export
@@ -231,10 +233,15 @@ PREFERRED_LIB_FLAGS:=--enable-static --enable-shared
 # along with the packages to build for the target.
 #
 ##############################################################
+
+ifeq ($(BR2_CCACHE),y)
+BASE_TARGETS += host-ccache
+endif
+
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-BASE_TARGETS:=uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
+BASE_TARGETS += uclibc-configured binutils cross_compiler uclibc-target-utils kernel-headers
 else
-BASE_TARGETS:=uclibc
+BASE_TARGETS += uclibc
 endif
 TARGETS:=
 
@@ -276,6 +283,13 @@ TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 BR2_DEPENDS_DIR=$(BUILD_DIR)/buildroot-config
 
+ifeq ($(BR2_CCACHE),y)
+CCACHE:=$(HOST_DIR)/usr/bin/ccache
+CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
+HOSTCC  := $(CCACHE) $(HOSTCC)
+HOSTCXX := $(CCACHE) $(HOSTCXX)
+endif
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -480,7 +494,7 @@ export HOSTCFLAGS
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
-	$(MAKE) CC="$(HOSTCC)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
+	$(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
 
 COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOCONFIG=$(BUILD_DIR)/buildroot-config/auto.conf \
diff --git a/docs/buildroot.html b/docs/buildroot.html
index f471962..b6cf578 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -29,6 +29,7 @@
       <li><a href="#buildroot_innards">How Buildroot works</a></li>
       <li><a href="#using_toolchain">Using the uClibc toolchain outside Buildroot</a></li>
       <li><a href="#external_toolchain">Use an external toolchain</a></li>
+      <li><a href="#ccache-support">Using <code>ccache</code> in Buildroot</li>
       <li><a href="#downloaded_packages">Location of downloaded packages</a></li>
       <li><a href="#add_packages">Adding new packages to Buildroot</a></li>
       <li><a href="#board_support">Creating your own board support</a></li>
@@ -523,9 +524,8 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     <ul>
       <li><b>toolchain</b> (in the <code>toolchain/</code> directory) contains
       the Makefiles and associated files for all software related to the
-      cross-compilation toolchain: <code>binutils</code>, <code>ccache</code>,
-      <code>gcc</code>, <code>gdb</code>, <code>kernel-headers</code> and
-      <code>uClibc</code>.</li>
+      cross-compilation toolchain: <code>binutils</code>, <code>gcc</code>,
+      <code>gdb</code>, <code>kernel-headers</code> and <code>uClibc</code>.</li>
 
       <li><b>package</b> (in the <code>package/</code> directory) contains the
       Makefiles and associated files for all user-space tools that Buildroot
@@ -681,6 +681,31 @@ endif
     Build options -&gt; Toolchain and header file location</code> options.
     This could be useful if the toolchain must be shared with other users.</p>
 
+    <h2 id="ccache-support">Using <code>ccache</code> in Buildroot</h2>
+
+    <p><a href="http://ccache.samba.org">ccache</a> is a compiler
+    cache. It stores the object files resulting from each compilation
+    process, and is able to skip future compilation of the same source
+    file (with same compiler and same arguments) by using the
+    pre-existing object files. When doing almost identical builds from
+    scratch a number of times, it can nicely speed up the build
+    process.</p>
+
+    <p><code>ccache</code> support is integrated in Buildroot. You
+    just have to enable <code>Enable compiler cache</code>
+    in <code>Build options</code>. This will automatically build
+    <code>ccache</code> and use it for every host and target
+    compilation.</p>
+
+    <p>The cache is located
+    in <code>$HOME/.buildroot-ccache</code>. It is stored outside of
+    Buildroot output directory so that it can be shared by separate
+    Buildroot builds. If you want to get rid of the cache, simply
+    remove this directory.</p>
+
+    <p>You can get statistics on the cache (its size, number of hits,
+    misses, etc.) by running <code>make ccache-stats</code>.</p>
+
     <h2 id="downloaded_packages">Location of downloaded packages</h2>
 
     <p>It might be useful to know that the various tarballs that are
diff --git a/package/Config.in b/package/Config.in
index 03e580a..e551c0c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,7 +35,7 @@ source "package/autoconf/Config.in"
 source "package/automake/Config.in"
 source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
-source "toolchain/ccache/Config.in.2"
+source "package/ccache/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/coreutils/Config.in"
 endif
diff --git a/package/Makefile.in b/package/Makefile.in
index 2ca8c31..d448a7e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -142,6 +142,14 @@ TARGET_RANLIB   = $(TARGET_CROSS)ranlib
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
+TARGET_CC_NOCCACHE  := $(TARGET_CC)
+TARGET_CXX_NOCCACHE := $(TARGET_CXX)
+
+ifeq ($(BR2_CCACHE),y)
+TARGET_CC  := $(CCACHE) $(TARGET_CC)
+TARGET_CXX := $(CCACHE) $(TARGET_CXX)
+endif
+
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_DISCARD_ALL:=--discard-all
 STRIP_STRIP_UNNEEDED:=--strip-unneeded
@@ -175,7 +183,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/
 HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 
 # hostcc version as an integer - E.G. 4.3.2 => 432
-HOSTCC_VERSION:=$(shell $(HOSTCC) --version | \
+HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
diff --git a/package/ccache/Config.in b/package/ccache/Config.in
new file mode 100644
index 0000000..f4f7f8f
--- /dev/null
+++ b/package/ccache/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CCACHE
+	bool "ccache"
+	help
+	  ccache is a compiler cache. It speeds up recompilation by
+	  caching previous compilations and detecting when the same
+	  compilation is being done again
+
+	  http://samba.ccache.org
+
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
new file mode 100644
index 0000000..1d0a560
--- /dev/null
+++ b/package/ccache/ccache.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# ccache
+#
+#############################################################
+
+CCACHE_VERSION = 3.1.3
+CCACHE_SITE    = http://samba.org/ftp/ccache
+CCACHE_SOURCE  = ccache-$(CCACHE_VERSION).tar.bz2
+
+# When ccache is being built for the host, ccache is not yet
+# available, so we have to use the special C compiler without the
+# cache.
+HOST_CCACHE_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)"
+
+# We directly hardcode the cache location into the binary, as it is
+# much easier to handle than passing an environment variable.
+define HOST_CCACHE_FIX_CCACHE_DIR
+	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
+endef
+
+HOST_CCACHE_POST_CONFIGURE_HOOKS += \
+	HOST_CCACHE_FIX_CCACHE_DIR
+
+$(eval $(call AUTOTARGETS,package,ccache))
+$(eval $(call AUTOTARGETS,package,ccache,host))
+
+ifeq ($(BR2_CCACHE),y)
+ccache-stats: host-ccache
+	$(Q)$(CCACHE) -s
+endif
+
diff --git a/toolchain/ccache/Config.in b/toolchain/ccache/Config.in
deleted file mode 100644
index 6f36650..0000000
--- a/toolchain/ccache/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-#
-
-comment "Ccache Options"
-
-config BR2_CCACHE
-	bool "Enable ccache support?"
-	help
-	    Enable ccache support?
-
-config BR2_CCACHE_DIR
-	string "ccache dir location?"
-	depends on BR2_CCACHE
-	default "$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)/cache"
-	help
-	    Where ccache should store cached files.
-
diff --git a/toolchain/ccache/Config.in.2 b/toolchain/ccache/Config.in.2
deleted file mode 100644
index 6a6c789..0000000
--- a/toolchain/ccache/Config.in.2
+++ /dev/null
@@ -1,13 +0,0 @@
-#
-
-config BR2_PACKAGE_CCACHE_TARGET
-	bool "ccache"
-	depends on BR2_PACKAGE_GCC_TARGET
-	help
-	  ccache is a compiler cache. It speeds up recompilation of
-	  C/C++ code by caching previous compiles and detecting when
-	  the same compile is being done again.
-
-	  http://ccache.samba.org
-
-
diff --git a/toolchain/ccache/ccache.mk b/toolchain/ccache/ccache.mk
deleted file mode 100644
index 8e414b2..0000000
--- a/toolchain/ccache/ccache.mk
+++ /dev/null
@@ -1,196 +0,0 @@
-#############################################################
-#
-# build ccache to make recompiles faster on the build system
-#
-#############################################################
-CCACHE_VER:=2.4
-CCACHE_SITE:=http://samba.org/ftp/ccache
-CCACHE_SOURCE:=ccache-$(CCACHE_VER).tar.gz
-CCACHE_DIR1:=$(TOOLCHAIN_DIR)/ccache-$(CCACHE_VER)
-CCACHE_DIR2:=$(BUILD_DIR)/ccache-$(CCACHE_VER)
-CCACHE_CAT:=$(ZCAT)
-CCACHE_BINARY:=ccache
-CCACHE_TARGET_BINARY:=usr/bin/ccache
-
-$(DL_DIR)/$(CCACHE_SOURCE):
-	$(call DOWNLOAD,$(CCACHE_SITE),$(CCACHE_SOURCE))
-
-$(CCACHE_DIR1)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
-	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(CCACHE_DIR1)/.patched: $(CCACHE_DIR1)/.unpacked
-	# WARNING - this will break if the toolchain is moved.
-	# Should probably patch things to use a relative path.
-	$(SED) "s,getenv(\"CCACHE_PATH\"),\"$(STAGING_DIR)/usr/bin-ccache\",g" \
-		$(CCACHE_DIR1)/execute.c
-	# WARNING - this will break if the toolchain build dir is deleted
-	#	when using the default cache dir location.
-	$(SED) "s,getenv(\"CCACHE_DIR\"),\"$(BR2_CCACHE_DIR)\",g" \
-		$(CCACHE_DIR1)/ccache.c
-	mkdir -p $(CCACHE_DIR1)/cache
-	$(CONFIG_UPDATE) $(@D)
-	touch $@
-
-$(CCACHE_DIR1)/.configured: $(CCACHE_DIR1)/.patched
-	mkdir -p $(CCACHE_DIR1)
-	(cd $(CCACHE_DIR1); rm -rf config.cache; \
-		CC="$(HOSTCC)" \
-		$(CCACHE_DIR1)/configure $(QUIET) \
-		--target=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(QUIET) \
-	)
-	touch $@
-
-$(CCACHE_DIR1)/$(CCACHE_BINARY): $(CCACHE_DIR1)/.configured
-	$(MAKE) CC="$(HOSTCC)" -C $(CCACHE_DIR1)
-
-$(STAGING_DIR)/$(CCACHE_TARGET_BINARY): $(CCACHE_DIR1)/$(CCACHE_BINARY)
-	mkdir -p $(STAGING_DIR)/usr/bin
-	cp $(CCACHE_DIR1)/ccache $(STAGING_DIR)/usr/bin
-	# Keep the actual toolchain binaries in a directory at the same level.
-	# Otherwise, relative paths for include dirs break.
-	mkdir -p $(STAGING_DIR)/usr/bin-ccache
-	(cd $(STAGING_DIR)/usr/bin-ccache; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-gcc; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(GNU_TARGET_NAME)-cc; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-gcc $(REAL_GNU_TARGET_NAME)-cc; \
-	)
-	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc \
-			$(STAGING_DIR)/usr/bin-ccache/
-	(cd $(STAGING_DIR)/usr/bin; \
-		ln -fs ccache $(GNU_TARGET_NAME)-cc; \
-		ln -fs ccache $(GNU_TARGET_NAME)-gcc; \
-		ln -fs ccache $(REAL_GNU_TARGET_NAME)-cc; \
-		ln -fs ccache $(REAL_GNU_TARGET_NAME)-gcc; \
-	)
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++ \
-			$(STAGING_DIR)/usr/bin-ccache/
-	[ -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ ] && \
-		mv $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++ \
-			$(STAGING_DIR)/usr/bin-ccache/
-	(cd $(STAGING_DIR)/usr/bin; \
-		ln -fs ccache $(GNU_TARGET_NAME)-c++; \
-		ln -fs ccache $(GNU_TARGET_NAME)-g++;\
-		ln -fs ccache $(REAL_GNU_TARGET_NAME)-c++; \
-		ln -fs ccache $(REAL_GNU_TARGET_NAME)-g++; \
-	)
-	(cd $(STAGING_DIR)/usr/bin-ccache; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-c++ $(GNU_TARGET_NAME)-c++; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++; \
-	)
-endif
-
-ccache: gcc $(STAGING_DIR)/$(CCACHE_TARGET_BINARY)
-
-ccache-clean:
-	rm -rf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc
-	rm -rf $(STAGING_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
-	rm -rf $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-cc
-	rm -rf $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
-	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc ]; then \
-		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-gcc \
-			$(STAGING_DIR)/usr/bin/; \
-		(cd $(STAGING_DIR)/usr/bin; \
-			ln -fs $(REAL_GNU_TARGET_NAME)-gcc \
-				$(REAL_GNU_TARGET_NAME)-cc; \
-			ln -fs $(REAL_GNU_TARGET_NAME)-gcc \
-				$(GNU_TARGET_NAME)-cc; \
-			ln -fs $(REAL_GNU_TARGET_NAME)-gcc \
-				$(GNU_TARGET_NAME)-gcc; \
-		); \
-	fi
-	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ ]; then \
-		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-c++; \
-		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-c++ \
-			$(STAGING_DIR)/usr/bin/; \
-	fi
-	if [ -f $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ ]; then \
-		rm -f $(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-g++; \
-		mv $(STAGING_DIR)/usr/bin-ccache/$(REAL_GNU_TARGET_NAME)-g++ \
-			$(STAGING_DIR)/usr/bin/; \
-	fi
-	rm -rf $(STAGING_DIR)/usr/bin-ccache/*
-	(cd $(STAGING_DIR)/usr/bin; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-c++; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(GNU_TARGET_NAME)-g++; \
-		ln -fs $(REAL_GNU_TARGET_NAME)-g++ $(REAL_GNU_TARGET_NAME)-c++; \
-	)
-	-$(MAKE) -C $(CCACHE_DIR1) clean
-
-ccache-dirclean:
-	rm -rf $(CCACHE_DIR1)
-
-
-
-
-#############################################################
-#
-# build ccache for use on the target system
-#
-#############################################################
-
-$(CCACHE_DIR2)/.unpacked: $(DL_DIR)/$(CCACHE_SOURCE)
-	$(CCACHE_CAT) $(DL_DIR)/$(CCACHE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-$(CCACHE_DIR2)/.patched: $(CCACHE_DIR2)/.unpacked
-	touch $@
-
-$(CCACHE_DIR2)/.configured: $(CCACHE_DIR2)/.patched
-	mkdir -p $(CCACHE_DIR2)
-	(cd $(CCACHE_DIR2); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(CCACHE_DIR2)/configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		$(DISABLE_NLS) \
-		$(QUIET) \
-	)
-	touch $@
-
-$(CCACHE_DIR2)/$(CCACHE_BINARY): $(CCACHE_DIR2)/.configured
-	$(MAKE) -C $(CCACHE_DIR2) CFLAGS="$(TARGET_CFLAGS)"
-
-$(TARGET_DIR)/$(CCACHE_TARGET_BINARY): $(CCACHE_DIR2)/$(CCACHE_BINARY)
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(CCACHE_DIR2) install
-	# put a bunch of symlinks into /bin, since that is earlier
-	# in the default PATH than /usr/bin where gcc lives
-	(cd $(TARGET_DIR)/bin; \
-		ln -fs /usr/bin/ccache cc; \
-		ln -fs /usr/bin/ccache gcc; \
-		ln -fs /usr/bin/ccache c++; \
-		ln -fs /usr/bin/ccache g++; \
-	)
-
-ccache_target: uclibc $(TARGET_DIR)/$(CCACHE_TARGET_BINARY)
-
-ccache_target-sources: $(DL_DIR)/$(CCACHE_SOURCE)
-
-ccache_target-clean:
-	rm -f $(TARGET_DIR)/$(CCACHE_TARGET_BINARY) \
-	      $(addprefix $(TARGET_DIR)/bin/,cc gcc c++ g++)
-	-$(MAKE) -C $(CCACHE_DIR2) clean
-
-ccache_target-dirclean:
-	rm -rf $(CCACHE_DIR2)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_CCACHE),y)
-TARGETS+=ccache
-endif
-ifeq ($(BR2_PACKAGE_CCACHE_TARGET),y)
-TARGETS+=ccache_target
-endif
diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index ee21b37..1aa013f 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -79,7 +79,7 @@ if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
 fi;
 
 # Check host gcc
-COMPILER=$(which $HOSTCC 2> /dev/null)
+COMPILER=$(which $HOSTCC_NOCCACHE 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc 2> /dev/null)
 fi;
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index d879697..44044d7 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -2,7 +2,6 @@
 
 include toolchain/dependencies/dependencies.mk
 include toolchain/binutils/binutils.mk
-include toolchain/ccache/ccache.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/gdb/gdb.mk
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index a9dd192..c458251 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -5,5 +5,4 @@ source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"
 source "toolchain/gcc/Config.in"
-source "toolchain/ccache/Config.in"
 endif
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index 81fce18..1c80300 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -3,7 +3,6 @@
 # Explicit ordering:
 include toolchain/helpers.mk
 include toolchain/binutils/binutils.mk
-include toolchain/ccache/ccache.mk
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 6f1f641..f90b6f1 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -2,7 +2,6 @@
 
 include toolchain/helpers.mk
 include toolchain/binutils/binutils.mk
-include toolchain/ccache/ccache.mk
 include toolchain/dependencies/dependencies.mk
 include toolchain/elf2flt/elf2flt.mk
 include toolchain/gcc/gcc-uclibc-4.x.mk
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 7e4645d..53ad636 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -62,7 +62,7 @@ endif # ! no threads
 # could select a multilib variant as we want the "main" sysroot, which
 # contains all variants of the C library in the case of multilib
 # toolchains.
-TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC))
+TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
 SYSROOT_DIR=$(shell $(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null)
 ifeq ($(SYSROOT_DIR),)
 SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC_NO_SYSROOT) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;')
-- 
1.7.0.4
