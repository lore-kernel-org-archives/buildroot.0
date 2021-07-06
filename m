From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:47 +0200
Subject: [Buildroot] [PATCH v2 04/18] package/pkg-generic: add post-prepare
 hooks
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-5-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when a package needs to modify files it inherits from its
dependencies, because they contain paths, we can only do that in a
pre- or post-configure hook.

However, whatever is done as part of those hooks, will be accounted
to the package itself, and thus will trigger file-overwrite detection.

So, we need a way to be able to actually modify files before we
start monitoring changes in those files.

We introduce a new set of hooks that an individual package can set,
or that a package infra can set, and that are called right before
we snapshot the state of target, and host (to which staging belongs),

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
 - Renamed <PKG>_PER_PACKAGE_TWEAK_HOOKS to <PKG>_POST_PREPARE_HOOKS.
 - Reworked commit message.

 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 88707e2f8d..6fbd4006da 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -254,6 +254,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -834,6 +835,7 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
+$(2)_POST_PREPARE_HOOKS         ?=
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
-- 
2.31.1
