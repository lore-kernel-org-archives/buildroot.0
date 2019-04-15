From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 15 Apr 2019 03:26:35 +0300
Subject: [Buildroot] [RFC 1/1] infra/pkg-generic: Add rootfs post gen hook
Message-ID: <20190415002635.3656-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add ability to generate image by custom package, and one of the
way to do it - is to add new $(PKG)_ROOTFS_POST_GEN_HOOK which will be
called after rootfs image is ready. This allows to have easier
alternative to post-image script in form of package, which might be
just selected by the user (or this package might be automatically
selected already already).

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 fs/common.mk           | 1 +
 package/pkg-generic.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 4ad51fdd0a..3288406af6 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -152,6 +152,7 @@ ifneq ($$(ROOTFS_$(2)_COMPRESS_CMD),)
 	PATH=$$(BR_PATH) $$(ROOTFS_$(2)_COMPRESS_CMD) $$@ > $$@$$(ROOTFS_$(2)_COMPRESS_EXT)
 endif
 	$$(foreach hook,$$(ROOTFS_$(2)_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
+	$$(foreach hook,$$(ROOTFS_POST_GEN_HOOKS),$$(call $$(hook))$$(sep))
 
 rootfs-$(1)-show-depends:
 	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a83813e28d..332e3c3cc1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -724,6 +724,7 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
+$(2)_ROOTFS_POST_GEN_HOOKS      ?=
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
@@ -1052,6 +1053,7 @@ PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 endif
 TARGET_FINALIZE_HOOKS += $$($(2)_TARGET_FINALIZE_HOOKS)
 ROOTFS_PRE_CMD_HOOKS += $$($(2)_ROOTFS_PRE_CMD_HOOKS)
+ROOTFS_POST_GEN_HOOKS += $$($(2)_ROOTFS_POST_GEN_HOOKS)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
-- 
2.14.1
