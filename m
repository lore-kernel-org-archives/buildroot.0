From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2015 22:27:12 +0100
Subject: [Buildroot] [PATCH] pkg-generic: improve incorrectly used package
	detection
Message-ID: <1451510832-16499-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

The package infrastructure now detects when a target package is being
built even if its corresponding Config.in option is not enabled, and
aborts with an error. However, it does not indicate *which* package is
improperly depending on the current package without selecting it at
the kconfig level.

So, in this commit, in addition to displaying an error, we try to help
the user by saying which packages could be the culprit.

To achieve this, we first register the reverse dependencies of each
package in a variable called <pkg>_DEPENDENT_OF.

Then, we add two macros:
  - the first will recursively expand all the dependency chain of
    potential cuplrits,
  - the second will filter only enabled packages

Eventually, we display the list of potential culprits, which more often
than not will be a singleton.

We do the check at the configure time, because we can't do it while
parsing the packages. That's because, at the moment we scan the
problematic package, the offending package might not yet be parsed, so
it is not yet in the <pkg>_DEPENDENT_OF list.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr:
  - only dump enabled culprits
  - allow dumping culprits that are two-level-or-deeper in the depenency
    chain
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9e88423..bc4e487 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -180,6 +180,17 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
 	$(if $(wildcard $(dir)),,\
 		$(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
 
+define EXPAND_DEPENDENCY_CULPRITS
+	$(foreach c,$(1),\
+		$(c) \
+		$(call EXPAND_DEPENDENCY_CULPRITS,$($(call UPPERCASE,$(c))_DEPENDENT_OF)))
+endef
+
+define DEPENDENCY_CULPRITS
+	$(foreach c,$(call EXPAND_DEPENDENCY_CULPRITS,$(1)),\
+		$(if $($($(call UPPERCASE,$(c))_KCONFIG_VAR)),$(c)))
+endef
+
 # Configure
 $(BUILD_DIR)/%/.stamp_configured:
 # Only trigger the check for default builds. If the user forces
@@ -193,6 +204,8 @@ ifeq ($(MAKECMDGOALS),)
 		echo "ERROR: $($(PKG)_NAME) is in the dependency chain of a package that has" ; \
 		echo "added it to its _DEPENDENCIES variable (directly or indirectly)" ; \
 		echo "without selecting it from Config.in." ; \
+		echo "Potential culprits:" ; \
+		printf '  - %s\n' $(call DEPENDENCY_CULPRITS,$($(PKG)_DEPENDENT_OF)); \
 		exit 1 ; \
 	fi
 endif
@@ -828,6 +841,12 @@ endif # other packages
 endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
 	$$(foreach hook,$$($(2)_POST_LEGAL_INFO_HOOKS),$$(call $$(hook))$$(sep))
 
+# Store reverse build-dependency information: we add the name of the
+# current package to the <pkg>_DEPENDENT_OF variable of all packages
+# the current package depends on.
+$$(eval $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),\
+	$$(call UPPERCASE,$$(d))_DEPENDENT_OF += $(1)$$(sep)))
+
 # add package to the general list of targets if requested by the buildroot
 # configuration
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
-- 
1.9.1
