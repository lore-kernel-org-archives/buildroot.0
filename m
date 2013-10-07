From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 07 Oct 2013 15:15:08 +0200
Subject: [Buildroot] [PATCH 1 of 6 v2] legal info: fix saving of host
	package licenses
In-Reply-To: <patchbomb.1381151707@argentina>
References: <patchbomb.1381151707@argentina>
Message-ID: <e07dc5f55104adb4a171.1381151708@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to some tricky make behavior, the license texts of host packages that
did not provide an explicit HOST_FOO_LICENSE_FILES definition was not saved.
The problem is that you cannot correctly use a variable defined/updated
inside a call'ed block as input to a foreach statement. If you try to use
$(FOO) then only the original value of FOO is used for foreach, any update
inside the call'ed block is ignored. However, if you use $$(FOO), the entire
contents of FOO (typically a list of items) is passed as one item to
foreach, thus causing just one iteration instead of several.

To fix the problem, one should only use values in foreach that have not
changed inside the call'ed block. In the case of (HOST_)FOO_LICENSE_FILES,
this means repeating the checks for a valid HOST_FOO_X and using FOO_X as
fallback.

Additionally, a few empty lines have been added to the legal-info-foo block
for clarity, as the amount of nested ifdef/ifeq statements have become very
high.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2:
- implement a solution for packages that have multiple license files.
- fix accidental mixup of code from another patch

 package/pkg-generic.mk |  23 ++++++++++++++++++++---
 1 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -499,26 +499,43 @@ endif
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
+# We cannot use $$($(2)_LICENSE_FILES) in the foreach below because it fails
+# for host packages that have no explicit HOST_FOO_LICENSE_FILES set. We have
+# to explicitly repeat the check for HOST_FOO_X and FOO_X.
+ifeq ($($(2)_LICENSE_FILES),)
+ifneq ($($(3)_LICENSE_FILES),)
+# Host package with no explicit HOST_FOO_LICENSE_FILES
+	@$(foreach F,$($(3)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
+endif
+else
+# Target package, or host package with explicit HOST_FOO_LICENSE_FILES
 	@$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
-endif
+endif # host/target distinction
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
