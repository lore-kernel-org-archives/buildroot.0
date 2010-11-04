From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu,  4 Nov 2010 03:50:24 +0100
Subject: [Buildroot] [PATCH 05/12] package: move autoreconfigure step to pre
	configure hook
In-Reply-To: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
References: <1288839031-24277-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1288839031-24277-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/Makefile.autotools.in |    2 +-
 package/Makefile.package.in   |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 4a992d9..178e34c 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -194,7 +194,7 @@ define AUTORECONF_HOOK
 endef
 
 ifeq ($$($(2)_AUTORECONF),YES)
-$(2)_POST_PATCH_HOOKS += AUTORECONF_HOOK
+$(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
 
diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 377df65..816a013 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -261,6 +261,7 @@ $(BUILD_DIR)/%/.stamp_patched:
 
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
+	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Configuring")
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -410,6 +411,7 @@ $(2)_TARGET_DIRCLEAN =		$$($(2)_DIR)/.stamp_dircleaned
 # post-steps hooks
 $(2)_POST_EXTRACT_HOOKS         ?=
 $(2)_POST_PATCH_HOOKS           ?=
+$(2)_PRE_CONFIGURE_HOOKS        ?=
 $(2)_POST_CONFIGURE_HOOKS       ?=
 $(2)_POST_BUILD_HOOKS           ?=
 $(2)_POST_INSTALL_HOOKS         ?=
-- 
1.7.2.3
