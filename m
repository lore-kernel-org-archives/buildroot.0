From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 18 Oct 2013 11:34:14 +0200
Subject: [Buildroot] [PATCH v8 RESEND 2/8] package: add toolchain dependency
	to every target package
In-Reply-To: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1382088860-30524-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes the dependency from the target toolchain explicit.
This way we can buid from command line a package that use
innger-generic-package right after the configuration phase, example:

	make clean <package-name>

Also remove TARGETS_ALL because the only purpose was to add toolchain
dependency so it's superseded by this commit.

To prevent circular dependency add the new variable <pkgname>_TOOLCHAIN
for not adding the toolchain dependency for toolchain packages.

This is also a step forward supporting top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile                                             |  8 ++------
 package/glibc/glibc.mk                               |  3 +++
 package/linux-headers/linux-headers.mk               |  3 +++
 package/pkg-autotools.mk                             |  3 ++-
 package/pkg-generic.mk                               | 12 ++++++++++--
 package/uclibc/uclibc.mk                             |  3 +++
 toolchain/toolchain-buildroot/toolchain-buildroot.mk |  2 ++
 toolchain/toolchain-external/toolchain-external.mk   |  2 ++
 toolchain/toolchain/toolchain.mk                     |  2 ++
 9 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index f266e2d..ebecec4 100644
--- a/Makefile
+++ b/Makefile
@@ -352,7 +352,6 @@ TARGETS+=target-post-image
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
-TARGETS_ALL:=$(patsubst %,__real_tgt_%,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
 # visible in Kconfig and hence not added to a variable like TARGETS.
@@ -375,9 +374,6 @@ HOST_SOURCE += $(addsuffix -source,$(sort $(TARGETS_HOST_DEPS) $(HOST_DEPS)))
 TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
 		$(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
 
-# all targets depend on the crosscompiler and it's prerequisites
-$(TARGETS_ALL): __real_tgt_%: $(BASE_TARGETS) %
-
 dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -386,11 +382,11 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BUILDROOT_CONFIG)
 
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 
-world: $(BASE_TARGETS) $(TARGETS_ALL)
+world: $(TARGETS)
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars \
-	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
+	$(BASE_TARGETS) $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
 	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BINARIES_DIR) $(STAMP_DIR)
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0dab492..68b98a9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -19,6 +19,9 @@ endif
 GLIBC_LICENSE = GPLv2+ (programs), LGPLv2.1+, BSD-3c, MIT (library)
 GLIBC_LICENSE_FILES = $(addprefix $(GLIBC_SRC_SUBDIR)/,COPYING COPYING.LIB LICENSES)
 
+# glibc is part of the toolchain so disable the toolchain dependency
+GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 # Before (e)glibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
 GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-gawk
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 30d3076..6dac9e3 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -17,6 +17,9 @@ LINUX_HEADERS_SOURCE = linux-$(LINUX_HEADERS_VERSION).tar.xz
 
 LINUX_HEADERS_INSTALL_STAGING = YES
 
+# linux-headers is part of the toolchain so disable the toolchain dependency
+LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(MAKE) \
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 9523529..f58570d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -209,7 +209,8 @@ endef
 # This must be repeated from inner-generic-package, otherwise we get an empty
 # _DEPENDENCIES if _AUTORECONF is YES.  Also filter the result of _AUTORECONF
 # away from the non-host rule
-$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool $(1),\
+$(2)_DEPENDENCIES ?= $(filter-out host-automake host-autoconf host-libtool \
+				host-toolchain $(1),\
     $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
 
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1e7154e..3f19aea 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -307,8 +307,16 @@ endif
 
 $(2)_REDISTRIBUTE		?= YES
 
-
-$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+# When a target package is a toolchain dependency set this variable to
+# 'NO' so the 'toolchain' dependency is not added to prevent a circular
+# dependency
+$(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
+
+$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
+	$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
+ifeq ($$($(2)_TYPE)-$$($(2)_ADD_TOOLCHAIN_DEPENDENCY),target-YES)
+$(2)_DEPENDENCIES += toolchain
+endif
 
 $(2)_INSTALL_STAGING		?= NO
 $(2)_INSTALL_IMAGES		?= NO
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 20d3bb6..0d12afd 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -18,6 +18,9 @@ endif
 
 UCLIBC_INSTALL_STAGING = YES
 
+# uclibc is part of the toolchain so disable the toolchain dependency
+UCLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 # Before uClibc is configured, we must have the first stage
 # cross-compiler and the kernel headers
 UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index f1f07a9..d941854 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -14,4 +14,6 @@ BUILDROOT_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
 TOOLCHAIN_BUILDROOT_DEPENDENCIES = host-gcc-final
 
+TOOLCHAIN_BUILDROOT_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 $(eval $(generic-package))
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index d41cc7c..2076cf7 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -340,6 +340,8 @@ TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 endif
 
+TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
diff --git a/toolchain/toolchain/toolchain.mk b/toolchain/toolchain/toolchain.mk
index 8559ac9..7241fe7 100644
--- a/toolchain/toolchain/toolchain.mk
+++ b/toolchain/toolchain/toolchain.mk
@@ -12,6 +12,8 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
 TOOLCHAIN_DEPENDENCIES += toolchain-external
 endif
 
+TOOLCHAIN_ADD_TOOLCHAIN_DEPENDENCY = NO
+
 $(eval $(generic-package))
 
 toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
-- 
1.8.4
