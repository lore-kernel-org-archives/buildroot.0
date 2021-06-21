From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:21 +0200
Subject: [Buildroot] [PATCH 06/15] package/pkg-generic.mk: Introduce
 <PKG>_PER_PACKAGE_TWEAK_HOOKS
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-7-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This hook will be used by package infrastucture or some packages to tweak
external files (ie files not provides by the package itself) when we build
with BR2_PER_PACKAGE_DIRECTORIES set.

This allows to have these tweaks in a specific hook instead of
<PKG>_POST_CONFIGURE_HOOK. And so we can call these specific tweaks
whenever we need them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e437050175..4069d2cf3c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -257,6 +257,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(foreach hook,$($(PKG)_PER_PACKAGE_TWEAK_HOOKS),$(call $(hook))$(sep))
 	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
 	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -844,6 +845,7 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
+$(2)_PER_PACKAGE_TWEAK_HOOKS    ?=
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
-- 
2.31.1
