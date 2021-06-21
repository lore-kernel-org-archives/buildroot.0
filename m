From: Herve Codina <herve.codina@bootlin.com>
Date: Mon, 21 Jun 2021 16:11:25 +0200
Subject: [Buildroot] [PATCH 10/15] package/pkg-generic.mk: Move python fixup
 to generic package infrastructure
In-Reply-To: <20210621141130.48654-1-herve.codina@bootlin.com>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
Message-ID: <20210621141130.48654-11-herve.codina@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixing _sysconfigdata*.{py,pyc} was previously done by python package
infrastructure. Some packages use python stuff without using python
package infrastructure.
These packages perform overwrites and need the specific python fixup
to fix them.

In order to be sure to fix all of these packages, the python fixup
is moved to the generic package infrastructure and applied to all
packages.
This follows the same principle as for the .la libtool files fixup.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-generic.mk | 17 +++++++++++++++++
 package/pkg-python.mk  | 12 ------------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4069d2cf3c..918e2381af 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -103,6 +103,21 @@ define fixup-libtool-files
 endef
 endif
 
+# Make sure python _sysconfigdata*.py files only reference the current
+# per-package directory.
+
+# $1: package name (lower case)
+# $2: staging or host directory of the package
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define fixup-python-files
+	$(Q)find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
+		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
+		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$(1)/:g" ;\
+	find $(2) \( -path '$(2)/lib/python*' -o -path '$(2)/usr/lib/python*' \) \
+		-name "_sysconfigdata*.pyc" -print0 | xargs -0 -r rm -f
+endef
+endif
+
 # Functions to detect overwritten files
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
@@ -257,6 +272,8 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call pkg_size_before,$(HOST_DIR),-host)
 	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
 	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(call fixup-python-files,$(NAME),$(HOST_DIR))
+	$(call fixup-python-files,$(NAME),$(STAGING_DIR))
 	$(foreach hook,$($(PKG)_PER_PACKAGE_TWEAK_HOOKS),$(call $(hook))$(sep))
 	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
 	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index b3fde77da5..e6b81bdfd3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -92,16 +92,6 @@ HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
 	--root=/ \
 	--single-version-externally-managed
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define PKG_PYTHON_FIXUP_SYSCONFIGDATA
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/$($(PKG)_NAME)/:g" ;\
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.pyc" -print0 | xargs -0 -r rm -f
-endef
-endif
-
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -246,8 +236,6 @@ $(2)_PYTHON_INTERPRETER = $$(HOST_DIR)/bin/$$($(2)_NEEDS_HOST_PYTHON)
 endif
 endif
 
-$(2)_PRE_CONFIGURE_HOOKS += PKG_PYTHON_FIXUP_SYSCONFIGDATA
-
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
-- 
2.31.1
