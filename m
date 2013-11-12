From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Nov 2013 23:20:37 +0100
Subject: [Buildroot] [git commit] legal info: fix saving of host package
	licenses
Message-ID: <20131112222456.9EC029BB31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=003d38da3a716b0a19e980fb69a6cd55b353f4f3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to some tricky make behavior, the license texts of host packages that
did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
The problem is that it is not straightforward to use a variable
defined/updated inside an evaluated block as input to a foreach statement.
If you try to use $(FOO) then only the original value of FOO is used for
foreach, any update inside the block is ignored. However, if you use
$$(FOO), the entire contents of FOO (typically a list of items) is passed
as one item to foreach, thus causing just one iteration instead of several.

From Arnout Vandecapelle's explanation:
Any variable referenced with a single $ inside the inner-generic-package
macro is expanded before the resulting contents are eval'ed. Therefore, it
is not possible to refer to variables defined by the inner-generic-package
macro from within a single-$ function call.

To fix the problem, one should defer the evaluation of the entire block
using double dollar signs.

Additionally, a few empty lines have been added to the legal-info-foo block
for clarity.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk |   17 +++++++++++++----
 1 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 75fda02..5111f31 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -502,26 +502,35 @@ $(2)_MANIFEST_TARBALL ?= not saved
 $(1)-legal-info:
 # Packages without a source are assumed to be part of Buildroot, skip them.
 ifneq ($(call qstrip,$$($(2)_SOURCE)),)
+
 ifeq ($$($(2)_SITE_METHOD),local)
 # Packages without a tarball: don't save and warn
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),local)
+
 else ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	@$(call legal-warning-pkg-savednothing,$$($(2)_RAWNAME),override)
+
 else
 # Other packages
+
 # Save license files if defined
 ifeq ($(call qstrip,$$($(2)_LICENSE_FILES)),)
 	@$(call legal-license-nofiles,$$($(2)_RAWNAME))
 	@$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
 else
-	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
-endif
+# Double dollar signs are really needed here, to catch host packages
+# without explicit HOST_FOO_LICENSE_FILES assignment, also in case they
+# have multiple license files.
+	@$$(foreach F,$$($(2)_LICENSE_FILES),$$(call legal-license-file,$$($(2)_RAWNAME),$$(F),$$($(2)_DIR)/$$(F))$$(sep))
+endif # license files
+
 ifeq ($$($(2)_REDISTRIBUTE),YES)
 # Copy the source tarball (just hardlink if possible)
 	@cp -l $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR) 2>/dev/null || \
 	   cp $(DL_DIR)/$$($(2)_SOURCE) $(REDIST_SOURCES_DIR)
-endif
-endif
+endif # redistribute
+
+endif # other packages
 	@$(call legal-manifest,$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_LICENSE),$$($(2)_MANIFEST_LICENSE_FILES),$$($(2)_MANIFEST_TARBALL))
 endif # ifneq ($(call qstrip,$$($(2)_SOURCE)),)
 	$(foreach hook,$($(2)_POST_LEGAL_INFO_HOOKS),$(call $(hook))$(sep))
