From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Jul 2021 22:45:45 +0200
Subject: [Buildroot] [git commit] package/pkg-generic.mk: Remove Info
 documents dir entry
Message-ID: <20210706204015.10C9795464@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8898380984ff93c6064d971ba9282a5d1c0e81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998 at free.fr:
  - don't expand when nothing to remove
  - do not add '/' between $(1) and % as files' paths are
    already absolute
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 45589bcbb4..7afcd05de9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -135,6 +135,23 @@ define check_bin_arch
 		-a $(BR2_READELF_ARCH_NAME)
 endef
 
+# Functions to remove conflicting and useless files
+
+# $1: base directory (target, staging, host)
+define remove-conflicting-useless-files
+	$(if $(strip $($(PKG)_DROP_FILES_OR_DIRS)),
+		$(Q)$(RM) -rf $(patsubst %, $(1)%, $($(PKG)_DROP_FILES_OR_DIRS)))
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
@@ -823,6 +840,16 @@ $$(error "Package $(1) defines host variant before target variant!")
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
