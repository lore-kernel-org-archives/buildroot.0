From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:53 +0200
Subject: [Buildroot] [PATCH v2 10/18] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-11-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Without per-package directory support, a package can happily overwrite
files installed by other packages. Indeed, because the build order
between packages is always guaranteed, Buildroot will always produce
the same output.

However, with per-package directory support, it is absolutely critical
that a given package does not overwrite files already installed by
another package, due to how the final aggregation is done to create
the complete target/, staging/ and host/ folders. Unfortunately, we
currently don't have anything in Buildroot that detects this
situation.

We used to have check-uniq-files, but it was dropped in commit
2496189a4207173e4cd5bbab90256f911175ee57.

This commit is a new implementation of such a detection, which is
based on calculating and verifying MD5 hashes of installed files: the
calculation is done at the beginning of the configure step, the
verification during the newly introduced "install" step that takes
place after all installation steps.

Since preventing file overwrites is really only needed when
per-package directory support is used, and due to this verification
having some overhead, it is only enabled when
BR2_PER_PACKAGE_DIRECTORIES=y. This additional verification cost is
however not too bad as on average, with per-package directory support,
the per-package target/ and host/ directories will contain less files
than with a build that doesn't use per-package directory support. This
helps a bit in mitigating the additional cost of this verification.

Note that we are not handling separately HOST_DIR and STAGING_DIR,
like we're doing with the pkg_size_{before,after} functions. Instead,
the verification on HOST_DIR walks down into the STAGING_DIR.

During per-package build, original files are modified by
fixup-libtool-files and fixup-python-files calls.
But since these fixups modify files using sed --in-place, these
modifications are done using a temporary file and a call to rename.
Rename breaks the hardlink to the original file and leave the temporary
file in per-package TARGET dir.
As the original file is not modified, this is no longer considered as
an overwrite. This patch simply considers that what is done by
fixup-libtool-files and fixup-python-files is part of the original
snapshot used to detect overwrites. And so, the original snapshot is
taken after fixup-libtool-files and fixup-python-files calls.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
This commit is retreived from Thomas's work.
The first version was discussed
https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-9-thomas.petazzoni at bootlin.com/
This new version was not already submitted by Thomas or I missed it.
Compared to the first version, this patch has an improved commit message and
generates the md5sum snapshot using
 'LC_ALL=C find $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;'
instead of
 'cd $(1); LC_ALL=C find . -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5'

Changes v1 to v2:
 - Added note about why fixup-{libtool,python}-files are not considered overwrites
   and so take the overwrite snapshot after fixup-{libtool,python}-files call.
 - Removed 'LC_ALL=C'

 package/pkg-generic.mk | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8c19522fd8..3e1030a495 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -118,6 +118,25 @@ define fixup-python-files
 endef
 endif
 
+# Functions to detect overwritten files
+
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+# $(1): base directory to search in
+# $(2): suffix of file (optional)
+define pkg_detect_overwrite_before
+	find $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;
+endef
+
+# $(1): base directory to search in
+# $(2): suffix of file (optional)
+define pkg_detect_overwrite_after
+	if test -s $($(PKG)_DIR)/.files$(2).md5 ; then \
+		md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5 || \
+		{ echo "ERROR: package $($(PKG)_NAME) has overwritten files installed by a previous package, aborting."; exit 1; } ; \
+	fi
+endef
+endif
+
 # Functions to collect statistics about installed files
 
 # $(1): base directory to search in
@@ -272,6 +291,8 @@ $(BUILD_DIR)/%/.stamp_configured:
 	$(call fixup-python-files,$(NAME),$(HOST_DIR))
 	$(call fixup-python-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
+	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
+	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -396,6 +417,8 @@ $(BUILD_DIR)/%/.stamp_installed:
 	@$(call pkg_size_after,$(STAGING_DIR),-staging)
 	@$(call pkg_size_after,$(HOST_DIR),-host)
 	@$(call check_bin_arch)
+	@$(call pkg_detect_overwrite_after,$(TARGET_DIR))
+	@$(call pkg_detect_overwrite_after,$(HOST_DIR),-host)
 	$(Q)touch $@
 
 # Remove package sources
-- 
2.31.1
