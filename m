From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 22:53:22 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: add post-prepare hooks
Message-ID: <20210706204015.1A2A591302@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80168aa3c65d019df1619fc31e72c98d279e80c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ff877598e3..97ee204b80 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -255,6 +255,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -835,6 +836,7 @@ $(2)_PRE_LEGAL_INFO_HOOKS       ?=
 $(2)_POST_LEGAL_INFO_HOOKS      ?=
 $(2)_TARGET_FINALIZE_HOOKS      ?=
 $(2)_ROOTFS_PRE_CMD_HOOKS       ?=
+$(2)_POST_PREPARE_HOOKS         ?=
 
 ifeq ($$($(2)_TYPE),target)
 ifneq ($$(HOST_$(2)_KCONFIG_VAR),)
