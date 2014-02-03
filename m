From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Feb 2014 02:18:31 +0100
Subject: [Buildroot] [PATCH 1/2] package: Add PRE_BUILD_HOOKS
Message-ID: <1391390312-15662-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This hooks, even though it is preceded by the POST_CONFIGURE_HOOKS,
this hooks is semantically different and allow for a nice separation.

While adding libenca, this step was not present and I needed to build a
tool which generates a header files for the build.
And I had to add it to the POST_CONFIGURE_HOOKS which make little sense
since it has nothing to do with the configure step.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/manual/adding-packages-hooks.txt | 1 +
 package/pkg-generic.mk                | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index d96c991..ec709ab 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -21,6 +21,7 @@ The following hook points are available:
 * +LIBFOO_POST_PATCH_HOOKS+
 * +LIBFOO_PRE_CONFIGURE_HOOKS+
 * +LIBFOO_POST_CONFIGURE_HOOKS+
+* +LIBFOO_PRE_BUILD_HOOKS+
 * +LIBFOO_POST_BUILD_HOOKS+
 * +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
 * +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b99c2a..b6ed122 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -172,6 +172,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 # Build
 $(BUILD_DIR)/%/.stamp_built::
 	@$(call step_start,build)
+	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Building")
 	$($(PKG)_BUILD_CMDS)
 	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
-- 
1.8.5.3
