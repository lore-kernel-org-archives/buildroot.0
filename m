From: Herve Codina <herve.codina@bootlin.com>
Date: Tue,  6 Jul 2021 16:24:45 +0200
Subject: [Buildroot] [PATCH v2 02/18] package/pkg-generic.mk: Remove Info
 documents dir entry
In-Reply-To: <20210706142501.951345-1-herve.codina@bootlin.com>
References: <20210706142501.951345-1-herve.codina@bootlin.com>
Message-ID: <20210706142501.951345-3-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (autotools for instance) install documentation
files using install-info. This program adds an entry in
the Info directory file (share/info/dir) and this causes
TARGET_DIR and/or HOST_DIR overwrite.

In order to avoid this overwrite this patch removes the Info
directory file right after any installation.

In order to be as generic as possible, this patch introduces
a new tooling to remove useless and conflicting files based
on the file and/or directory list <PKG>_DROP_FILES_OR_DIRS.
share/info/dir file is added for every packages in this list.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
 - Reworked adding <PKG>_DROP_FILES_OR_DIRS and associated tooling.

 package/pkg-generic.mk | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 45589bcbb4..05b2095664 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -135,6 +135,22 @@ define check_bin_arch
 		-a $(BR2_READELF_ARCH_NAME)
 endef
 
+# Functions to remove conflicting and useless files
+
+# $1: base directory (target, staging, host)
+define remove-conflicting-useless-files
+	$(Q)$(RM) -rf $(patsubst %, $(1)/%, $($(PKG)_DROP_FILES_OR_DIRS))
+endef
+define REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
+	$(call remove-conflicting-useless-files,$(HOST_DIR))
+endef
+define REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
+	$(call remove-conflicting-useless-files,$(STAGING_DIR))
+endef
+define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
+	$(call remove-conflicting-useless-files,$(TARGET_DIR))
+endef
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -823,6 +839,16 @@ $$(error "Package $(1) defines host variant before target variant!")
 endif
 endif
 
+# Globaly remove following conflicting and useless files
+$(2)_DROP_FILES_OR_DIRS += /share/info/dir
+
+ifeq ($$($(2)_TYPE),host)
+$(2)_POST_INSTALL_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_HOST
+else
+$(2)_POST_INSTALL_STAGING_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_STAGING
+$(2)_POST_INSTALL_TARGET_HOOKS += REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
+endif
+
 # human-friendly targets and target sequencing
 $(1):			$(1)-install
 $(1)-install:		$$($(2)_TARGET_INSTALL)
-- 
2.31.1
