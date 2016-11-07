From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 7 Nov 2016 02:19:59 +0100
Subject: [Buildroot] [PATCH v4 04/22] toolchain-external: introduce
	toolchain-external-package
In-Reply-To: <20161107012017.22505-1-arnout@mind.be>
References: <20161107012017.22505-1-arnout@mind.be>
Message-ID: <20161107012017.22505-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain-external-package infrastructure is just a copy of the
toolchain-external commands, replacing TOOLCHAIN_EXTERNAL by $(2)
and adding double-dollars everywhere.

toolchain-external itself is converted to a virtual package, but it
is faked a little to make sue the toolchains that haven't been
converted to toolchain-external-package yet keep on working.

The TOOLCHAIN_EXTERNAL_MOVE commands don't have to be redefined
for every toolchain-external-package instance, so that is moved
out into the common part of pkg-toolchain-external.mk.

The musl-compat-headers dependency stays in the toolchain-external
package itself.

The musl ld link is duplicated in the legacy toolchain-external and
the toolchain-external-package, because they have separate hooks.

The handling of TOOLCHAIN_EXTERNAL_BIN deserves some special attention,
because its value will be different for different
toolchain-external-package instances. However, the value only depends
on variables that are set by Kconfig (BR2_TOOLCHAIN_EXTERNAL_PREFIX
and BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD) so it can easily be used in
the generic part. So we don't have to do anything specific for this
variable after all.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
v4: Move all variables out of the toolchain-external-package infra,
    except for those that are explicitly needed by that infra.
---
 toolchain/toolchain-external/Config.in             |   8 ++
 .../toolchain-external/pkg-toolchain-external.mk   | 124 +++++++++++++++++++--
 toolchain/toolchain-external/toolchain-external.mk |  48 ++++++--
 3 files changed, 159 insertions(+), 21 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5324599..65a4216 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -667,6 +667,14 @@ config BR2_TOOLCHAIN_EXTERNAL_MUSL
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
 
+# Make sure the virtual-package infra checks the provider
+config BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL
+	bool
+	default y
+
+config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+	string
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 583b0d6..3cac520 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -98,6 +98,17 @@ TOOLCHAIN_EXTERNAL_CXX = $(TOOLCHAIN_EXTERNAL_CROSS)g++$(TOOLCHAIN_EXTERNAL_SUFF
 TOOLCHAIN_EXTERNAL_FC = $(TOOLCHAIN_EXTERNAL_CROSS)gfortran$(TOOLCHAIN_EXTERNAL_SUFFIX)
 TOOLCHAIN_EXTERNAL_READELF = $(TOOLCHAIN_EXTERNAL_CROSS)readelf$(TOOLCHAIN_EXTERNAL_SUFFIX)
 
+# Normal handling of downloaded toolchain tarball extraction.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+# As a regular package, the toolchain gets extracted in $(@D), but
+# since it's actually a fairly special package, we need it to be moved
+# into TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
+define TOOLCHAIN_EXTERNAL_MOVE
+	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
+	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
+	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
+endef
+endif
 
 #
 # Definitions of the list of libraries that should be copied to the target.
@@ -474,15 +485,6 @@ endef
 
 # Various utility functions used by the external toolchain based on musl.
 
-# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
-# So, add the musl-compat-headers package that will install those files,
-# into the staging directory:
-#   sys/queue.h:  header from NetBSD
-#   sys/cdefs.h:  minimalist header bundled in Buildroot
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
-endif
-
 # With the musl C library, the libc.so library directly plays the role
 # of the dynamic library loader. We just need to create a symbolic
 # link to libc.so with the appropriate name.
@@ -501,7 +503,6 @@ endif
 define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
 	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(MUSL_ARCH).so.1
 endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
 endif
 
 #
@@ -568,3 +569,106 @@ define TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO
 		ln -sf ld64-uClibc.so.1 $(TARGET_DIR)/lib/ld64-uClibc.so.0 ; \
 	fi
 endef
+
+
+################################################################################
+# inner-toolchain-external-package -- defines the generic installation rules
+# for external toolchain packages
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including a HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the type (target or host)
+################################################################################
+define inner-toolchain-external-package
+
+$(2)_INSTALL_STAGING = YES
+$(2)_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+# In fact, we don't need to download the toolchain, since it is already
+# available on the system, so force the site and source to be empty so
+# that nothing will be downloaded/extracted.
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
+$(2)_SITE =
+$(2)_SOURCE =
+endif
+
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
+$(2)_EXCLUDES = usr/lib/locale/*
+
+$(2)_POST_EXTRACT_HOOKS += \
+	TOOLCHAIN_EXTERNAL_MOVE
+endif
+
+# Checks for an already installed toolchain: check the toolchain
+# location, check that it is usable, and then verify that it
+# matches the configuration provided in Buildroot: ABI, C++ support,
+# kernel headers version, type of C library and all C library features.
+define $(2)_CONFIGURE_CMDS
+	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
+	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
+	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
+	$$(call check_kernel_headers_version,\
+		$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC)),\
+		$$(call qstrip,$$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))); \
+	$$(call check_gcc_version,$$(TOOLCHAIN_EXTERNAL_CC),\
+		$$(call qstrip,$$(BR2_TOOLCHAIN_GCC_AT_LEAST))); \
+	if test "$$(BR2_arm)" = "y" ; then \
+		$$(call check_arm_abi,\
+			"$$(TOOLCHAIN_EXTERNAL_CC) $$(TOOLCHAIN_EXTERNAL_CFLAGS)",\
+			$$(TOOLCHAIN_EXTERNAL_READELF)) ; \
+	fi ; \
+	if test "$$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
+		$$(call check_cplusplus,$$(TOOLCHAIN_EXTERNAL_CXX)) ; \
+	fi ; \
+	if test "$$(BR2_TOOLCHAIN_HAS_FORTRAN)" = "y" ; then \
+		$$(call check_fortran,$$(TOOLCHAIN_EXTERNAL_FC)) ; \
+	fi ; \
+	if test "$$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
+		$$(call check_uclibc,$$$${SYSROOT_DIR}) ; \
+	elif test "$$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
+		$$(call check_musl,$$$${SYSROOT_DIR}) ; \
+	else \
+		$$(call check_glibc,$$$${SYSROOT_DIR}) ; \
+	fi
+	$$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC))
+endef
+
+$(2)_TOOLCHAIN_WRAPPER_ARGS += $$(TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS)
+
+$(2)_BUILD_CMDS = $$(TOOLCHAIN_WRAPPER_BUILD)
+
+define $(2)_INSTALL_STAGING_CMDS
+	$$(TOOLCHAIN_WRAPPER_INSTALL)
+	$$(TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+endef
+
+ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+$(2)_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+endif
+
+# Even though we're installing things in both the staging, the host
+# and the target directory, we do everything within the
+# install-staging step, arbitrarily.
+define $(2)_INSTALL_TARGET_CMDS
+	$$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
+	$$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT)
+	$$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
+endef
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4))
+
+endef
+
+toolchain-external-package = $(call inner-toolchain-external-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index be1b5e4..bcbcb2e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -4,12 +4,31 @@
 #
 ################################################################################
 
+TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+# musl does not provide an implementation for sys/queue.h or sys/cdefs.h.
+# So, add the musl-compat-headers package that will install those files,
+# into the staging directory:
+#   sys/queue.h:  header from NetBSD
+#   sys/cdefs.h:  minimalist header bundled in Buildroot
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
+endif
+
 # All the definition that are common between the toolchain-external
 # generic package and the toolchain-external-package infrastructure
 # can be found in pkg-toolchain-external.mk
 
+# Legacy toolchains that don't use the toolchain-external-package infrastructure
+# yet. We can recognise that because no provider is set.
+ifeq ($(call qstrip,$(BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL)),)
+
+# Now we are the provider. However, we can't set it to ourselves or we'll get a
+# circular dependency. Let's set it to a target that we always depend on
+# instead.
+BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL = skeleton
+
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
-TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 # In fact, we don't need to download the toolchain, since it is already
 # available on the system, so force the site and source to be empty so
@@ -201,18 +220,9 @@ TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
 	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
 endif
 
-# Normal handling of downloaded toolchain tarball extraction.
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD),y)
 TOOLCHAIN_EXTERNAL_EXCLUDES = usr/lib/locale/*
 
-# As a regular package, the toolchain gets extracted in $(@D), but
-# since it's actually a fairly special package, we need it to be moved
-# into TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR.
-define TOOLCHAIN_EXTERNAL_MOVE
-	rm -rf $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-	mkdir -p $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)
-	mv $(@D)/* $(TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR)/
-endef
 TOOLCHAIN_EXTERNAL_POST_EXTRACT_HOOKS += \
 	TOOLCHAIN_EXTERNAL_MOVE
 endif
@@ -262,6 +272,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
 	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+endif
+
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
@@ -274,5 +288,17 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
-$(eval $(generic-package))
+endif # BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
+
 
+# Since a virtual package is just a generic package, we can still
+# define commands for the legacy toolchains.
+$(eval $(virtual-package))
+
+# Ensure the external-toolchain package has a prefix defined.
+# This comes after the virtual-package definition, which checks the provider.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+ifeq ($(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX)),)
+$(error No prefix selected for external toolchain package $(BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL). Configuration error)
+endif
+endif
-- 
2.10.2
