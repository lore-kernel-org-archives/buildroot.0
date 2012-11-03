From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  3 Nov 2012 17:52:16 +0100
Subject: [Buildroot] [PATCH] legal-info: support per-package hooks
Message-ID: <1351961536-28699-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Useful to produce extra warnings for packages that have special
licensing-related issues.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/adding-packages-generic.txt |    4 +++-
 package/pkg-generic.mk                  |    2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index d3a4abb..e1b46b0 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -349,7 +349,8 @@ of the package construction. The hooks are more useful for packages
 using the autotools infrastructure described below.  However, since
 they are provided by the generic infrastructure, they are documented
 here. The exception is +LIBFOO_POST_PATCH_HOOKS+.  Patching the
-package is not user definable, so +LIBFOO_POST_PATCH_HOOKS+ will be
+package and producing legal info are not user definable, so
++LIBFOO_POST_PATCH_HOOKS+ and +LIBFOO_POST_LEGAL_INFO_HOOKS+ will be
 userful for generic packages.
 
 The following hook points are available:
@@ -361,6 +362,7 @@ The following hook points are available:
 * +LIBFOO_POST_INSTALL_HOOKS+ (for host packages only)
 * +LIBFOO_POST_INSTALL_STAGING_HOOKS+ (for target packages only)
 * +LIBFOO_POST_INSTALL_TARGET_HOOKS+ (for target packages only)
+* +LIBFOO_POST_LEGAL_INFO_HOOKS+
 
 These variables are 'lists' of variable names containing actions to be
 performed at this hook point. This allows several hooks to be
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 270da60..9c87aec 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -316,6 +316,7 @@ $(2)_POST_INSTALL_HOOKS         ?=
 $(2)_POST_INSTALL_STAGING_HOOKS ?=
 $(2)_POST_INSTALL_TARGET_HOOKS  ?=
 $(2)_POST_INSTALL_IMAGES_HOOKS  ?=
+$(2)_POST_LEGAL_INFO_HOOKS      ?=
 
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
@@ -488,6 +489,7 @@ endif
 endif
 	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
 endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
+	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
 
 # add package to the general list of targets if requested by the buildroot
 # configuration
-- 
1.7.9.5
