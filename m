From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  8 Mar 2019 16:04:23 -0600
Subject: [Buildroot] [PATCH v8 5/9] toolchain/toolchain-ext: glibc cpe-info
 support
In-Reply-To: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1552082667-46877-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1552082667-46877-6-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Shruthi Singh <shruthi.singh@rockwellcollins.com>

This commit adds the correct CPE string for glibc, describing CPE ID,
VERSION, PACKAGE NAME and URL.

Signed-off-by: Shruthi Singh shruthi.singh at rockwellcollins.com
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Changes

v8
 - No change

v7
 - New
---
 package/pkg-generic.mk                                 | 14 ++++++++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b895d0..f9cedd2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -924,8 +924,22 @@ $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
 endif
 
 $(1)-cpe-info: PKG=$(2)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
+$(1)-cpe-info: toolchain
+endif
 $(1)-cpe-info:
 ifeq ($$($(2)_TYPE),target)
+ifneq ($$($(2)_NAME),toolchain-external)
+ifneq ($(findstring TOOLCHAIN_EXTERNAL, $(2)),)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
+	$$(eval $(2)_VERSION = $$(shell $$(call TOOLCHAIN_CPE_INFO)))
+	$$(eval $(2)_CPE_ID_VENDOR = gnu)
+	$$(eval $(2)_CPE_ID_NAME = glibc)
+	$$(eval $(2)_ACTUAL_SOURCE_SITE = https://github.com/bminor/glibc/releases)
+	$$(eval $(2)_RAWNAME = glibc)
+endif # ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC),y)
+endif # ifneq ($(findstring TOOLCHAIN_EXTERNAL, $(2)),)
+endif # ifneq ($$($(2)_NAME),toolchain-external)
 ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	@$$(call MESSAGE,"Collecting cpe info")
 	$(Q)$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$($(2)_CPE_ID):$(CPE_SUFFIX),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index db3570d..aed06c5 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -440,6 +440,13 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
 
+define TOOLCHAIN_CPE_INFO
+	ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	MAJ=`awk '{ if ($$1 = /#define/ && ($$2= /__GLIBC__/)){printf $$3};}' $${ARCH_SYSROOT_DIR}/usr/include/features.h` ; \
+	MIN=`awk '{ if ($$1 = /#define/ && ($$2 = /_GLIBC_MINOR/)){printf $$3};}' $${ARCH_SYSROOT_DIR}/usr/include/features.h` ; \
+	echo $${MAJ}.$${MIN}
+endef
+
 # Create a symlink from (usr/)$(ARCH_LIB_DIR) to lib.
 # Note: the skeleton package additionally creates lib32->lib or lib64->lib
 # (as appropriate)
-- 
1.9.1
