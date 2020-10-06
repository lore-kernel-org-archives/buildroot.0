From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue,  6 Oct 2020 15:42:38 +0200
Subject: [Buildroot] [PATCH 05/17] toolchain/toolchain-ext: glibc cpe-info
 support
In-Reply-To: <20201006134250.22738-1-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
Message-ID: <20201006134250.22738-6-gregory.clement@bootlin.com>
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
 package/pkg-generic.mk                             | 14 ++++++++++++++
 .../toolchain-external/pkg-toolchain-external.mk   |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 489918b1eb..dba03a8119 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -983,8 +983,22 @@ $(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
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
index 6d91cb5d1e..14065345d7 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -453,6 +453,13 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
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
2.28.0
