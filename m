From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Sep 2016 16:52:55 +0200
Subject: [Buildroot] [PATCH 08/10] core: add support for multiple
	br2-external trees
In-Reply-To: <cover.1474815151.git.yann.morin.1998@free.fr>
References: <cover.1474815151.git.yann.morin.1998@free.fr>
Message-ID: <d3dfe195adbcec51f612e7cc94426e021c627000.1474815151.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only support at most one br2-external tree. Being able
to use more than one br2-external tree can be very useful.

A use-case would be for having a br2-external to contain the basic
packages, basic board defconfigs and board files, provided by one team
responsible for the "board-bringup", while other teams consume that
br2-external as a base, and complements it each with their own set of
packages, defconfigs and extra board files.

Another use-case would be for third-parties to provide their own
Buildroot packaging in a br2-external tree, along-side the archives for
their stuff.

Finally, another use-case is to be able to add FLOSS packages in a
br2-external tree, and proprietary packages in another. This allows
to not touch the Buildroot tree at all, and still be able to get in
compliance by providing only that br2-external tree(s) that contains
FLOSS packages, leaving aside the br2-external tree(s) with the
proprietary bits.

What we do is to treat BR2_EXTERNAL as a colon-separated (space-
separated also work, and we use that internally) list of paths, on which
we iterate to construct:

  - the list of all br2-external names, BR2_EXTERNAL_NAMES,

  - the per-br2-external tree BR2_EXTERNAL_$(NAME) variables, which
    point each to the actual location of the corresponding tree,

  - the list of paths to all the external.mk files, BR2_EXTERNAL_MKS,

  - the space-separated list of absolute paths to the external trees,
    BR2_EXTERNAL_DIRS.

Once we have all those variables, we replace references to BR2_EXTERNAL
with either one of those.

This cascades into how we display the list of defconfigs, so that it is
easy to see what br2-external tree provides what defconfigs. As
suggested by Arnout, tweak the comment from "User-provided configs" to
"External configs", on the assumption that some br2-external trees could
be provided by vendors, so not necessarily user-provided. Ditto the menu
in Kconfig, changed from "User-provided options" to "External options".

Now, when more than one br2-external tree is used, each gets its own
sub-menu in the "User-provided options" menu. The sub-menu is labelled
with that br2-external tree's name and the sub-menu's first item is a
comment with the path to that br2-external tree.

If there's only one br2-external tree, then there is no sub-menu; there
is a single comment that contains the name and path to the br2-external
tree.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
---
 Makefile                     |  57 +++++++++++++--------
 package/pkg-generic.mk       |   4 +-
 support/scripts/br2-external | 117 ++++++++++++++++++++++++++++---------------
 3 files changed, 113 insertions(+), 65 deletions(-)

diff --git a/Makefile b/Makefile
index b4bcca2..40e6b74 100644
--- a/Makefile
+++ b/Makefile
@@ -143,7 +143,7 @@ $(if $(BASE_DIR),, $(error output directory "$(O)" does not exist))
 # Handling of BR2_EXTERNAL.
 #
 # The value of BR2_EXTERNAL is stored in .br-external in the output directory.
-# The location of the external.mk makefile fragment is computed in that file.
+# The location of the external.mk makefile fragments is computed in that file.
 # On subsequent invocations of make, this file is read in. BR2_EXTERNAL can
 # still be overridden on the command line, therefore the file is re-created
 # every time make is run.
@@ -454,16 +454,15 @@ include boot/common.mk
 include linux/linux.mk
 include fs/common.mk
 
-# If using a br2-external tree, the BR2_EXTERNAL_$(NAME)_PATH variable
-# is also present in the .config file. Since .config is included after
-# we defined BR2_EXTERNAL_$(NAME)_PATH in the Makefile, the value in
-# that variable is quoted. We just include the generated Makefile fragment
-# .br2-external.mk a third time, which will set that variable to the
-# un-quoted value.
+# If using a br2-external tree, the BR2_EXTERNAL_$(NAME)_PATH variables
+# are also present in the .config file. Since .config is included after
+# we defined them in the Makefile, the values for those variables are
+# quoted. We just include the generated Makefile fragment .br2-external.mk
+# a third time, which will set those variables to the un-quoted values.
 include $(BR2_EXTERNAL_FILE)
 
 # Nothing to include if no BR2_EXTERNAL tree in use
-include $(BR2_EXTERNAL_MK)
+include $(BR2_EXTERNAL_MKS)
 
 # Now we are sure we have all the packages scanned and defined. We now
 # check for each package in the list of enabled packages, that all its
@@ -855,7 +854,7 @@ define percent_defconfig
 	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
 endef
-$(eval $(foreach d,$(TOPDIR) $(if $(BR2_EXTERNAL_NAME),$(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)),$(call percent_defconfig,$(d))$(sep)))
+$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL_DIRS),$(call percent_defconfig,$(d))$(sep)))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
@@ -978,19 +977,33 @@ help:
 	@echo 'it on-line@http://buildroot.org/docs.html'
 	@echo
 
+# List the defconfig files
+# $(1): base directory
+# $(2): br2-external name, empty for bundled
+define list-defconfigs
+	@first=true; \
+	for defconfig in $(1)/configs/*_defconfig; do \
+		[ -f "$${defconfig}" ] || continue; \
+		if $${first}; then \
+			if [ "$(2)" ]; then \
+				printf "External configs in $(2):\n"; \
+			else \
+				printf "Built-in configs:\n"; \
+			fi; \
+			first=false; \
+		fi; \
+		defconfig="$${defconfig##*/}"; \
+		printf "  %-35s - Build for %s\n" "$${defconfig}" "$${defconfig%_defconfig}"; \
+	done; \
+	$${first} || printf "\n"
+endef
+
+# We iterate over BR2_EXTERNAL_NAMES rather than BR2_EXTERNAL_DIRS,
+# because we want to display the name of the br2-external tree.
 list-defconfigs:
-	@echo 'Built-in configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
-	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
-ifneq ($(BR2_EXTERNAL_NAME),)
-ifneq ($(wildcard $(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)/configs/*_defconfig),)
-	@echo
-	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)/configs/*_defconfig))), \
-	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
-endif
-endif
-	@echo
+	$(call list-defconfigs,$(TOPDIR))
+	$(foreach name,$(BR2_EXTERNAL_NAMES),\
+		$(call list-defconfigs,$(BR2_EXTERNAL_$(name)_PATH),$(name))$(sep))
 
 release: OUT = buildroot-$(BR2_VERSION)
 
@@ -1009,7 +1022,7 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
--include $(if $(BR2_EXTERNAL_NAME),$(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)/docs/*/*.mk)
+-include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(dir)/docs/*/*.mk)
 
 .PHONY: $(noconfig_targets)
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 946244e..0737fa1 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -767,9 +767,9 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifneq ($$(filter boot/% $$(if $$(BR2_EXTERNAL_NAME),$$(BR2_EXTERNAL_$$(BR2_EXTERNAL_NAME)_PATH)/boot/%),$(pkgdir)),)
+else ifneq ($$(filter boot/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/boot/%),$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
-else ifneq ($$(filter toolchain/% $$(if $$(BR2_EXTERNAL_NAME),$$(BR2_EXTERNAL_$$(BR2_EXTERNAL_NAME)_PATH)/toolchain/%),$(pkgdir)),)
+else ifneq ($$(filter toolchain/% $$(foreach dir,$$(BR2_EXTERNAL_DIRS),$$(dir)/toolchain/%),$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 5ffae60..e4b119e 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -1,9 +1,9 @@
 #!/bin/bash
 set -e
 
-# The name and location of the br2-external tree, once validated.
-declare BR2_NAME
-declare BR2_EXT
+# The names and locations of the br2-external trees, once validated.
+declare -a BR2_EXT_NAMES
+declare -A BR2_EXT_PATHS
 
 # URL to manual for help in converting old br2-external trees.
 # Escape '#' so that make does not consider it a comment.
@@ -26,13 +26,6 @@ main() {
     # Forget options; keep only positional args
     shift $((OPTIND-1))
 
-    # Accept 0 or 1 br2-external tree.
-    if [ ${#} -gt 1 ]; then
-        error "only zero or one br2-external tree allowed.\n"
-    fi
-
-    br2_ext="${1}"
-
     case "${ofmt}" in
     mk)
         error() {
@@ -52,13 +45,14 @@ main() {
 
     exec >"${ofile}"
 
-    do_validate "${br2_ext}"
+    do_validate ${@//:/ }
 
     do_${ofmt}
 }
 
-# Validates the br2-external tree passed as argument. Makes it cannonical
-# and store it in global variable BR2_EXT.
+# Validates the br2-external trees passed as arguments. Makes each of
+# them canonical and store them in the global arrays BR2_EXT_NAMES
+# and BR2_EXT_PATHS.
 #
 # Note: since this script is always first called from Makefile context
 # to generate the Makefile fragment before it is called to generate the
@@ -67,14 +61,22 @@ main() {
 # snippet means that there were no error.
 #
 do_validate() {
+    local br2_ext
+
+    if [ ${#} -eq 0 ]; then
+        # No br2-external tree is valid
+        return
+    fi
+
+    for br2_ext in "${@}"; do
+        do_validate_one "${br2_ext}"
+    done
+}
+
+do_validate_one() {
     local br2_ext="${1}"
     local br2_name n
 
-    # No br2-external tree is valid
-    if [ -z "${br2_ext}" ]; then
-        return
-    fi
-
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
     fi
@@ -93,6 +95,10 @@ do_validate() {
         error "'%s': name '%s' contains invalid chars: '%s'\n" \
             "${br2_ext}" "${br2_name//\$/\$\$}" "${n//\$/\$\$}"
     fi
+    if [ -n "${BR2_EXT_PATHS["${br2_name}"]}" ]; then
+        error "'%s': name '%s' is already used in '%s'\n" \
+            "${br2_ext}" "${br2_name}" "${BR2_EXT_PATHS["${br2_name}"]}"
+    fi
     if [ ! -f "${br2_ext}/external.mk" ]; then
         error "'%s/external.mk': no such file or directory\n" "${br2_ext}"
     fi
@@ -100,51 +106,80 @@ do_validate() {
         error "'%s/Config.in': no such file or directory\n" "${br2_ext}"
     fi
 
-    BR2_NAME="${br2_name}"
-    BR2_EXT="$(cd "${br2_ext}"; pwd -P )"
+    # Register this br2-external tree
+    BR2_EXT_NAMES+=( "${br2_name}" )
+    BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
 }
 
 # Generate the .mk snippet that defines makefile variables
 # for the br2-external tree
 do_mk() {
+    local br2_name br2_ext
+
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
-    printf 'BR2_EXTERNAL ?= %s\n' "${BR2_EXT}"
-    printf 'BR2_EXTERNAL_NAME = \n'
-    printf 'BR2_EXTERNAL_MK =\n'
+    # We can't use ${BR2_EXT_NAMES[@]} directly: it is not guaranteed
+    # to be in the order paths were added (because it is an associative
+    # array). So we need to iterate on BR2_EXT_NAMES, which is sorted
+    # in the order names were added (because it is an indexed array).
+    printf 'BR2_EXTERNAL ?='
+    for br2_name in "${BR2_EXT_NAMES[@]}"; do
+        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
+    done
     printf '\n'
 
-    if [ -z "${BR2_NAME}" ]; then
+    printf 'BR2_EXTERNAL_NAMES = \n'
+    printf 'BR2_EXTERNAL_DIRS = \n'
+    printf 'BR2_EXTERNAL_MKS = \n'
+
+    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+        printf '\n'
         printf '# No br2-external tree defined.\n'
         return
     fi
 
-    printf 'BR2_EXTERNAL_NAME = %s\n' "${BR2_NAME}"
-    printf 'BR2_EXTERNAL_MK = %s/external.mk\n' "${BR2_EXT}"
-    printf 'BR2_EXTERNAL_%s_PATH = %s\n' "${BR2_NAME}" "${BR2_EXT}"
+    for br2_name in "${BR2_EXT_NAMES[@]}"; do
+        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
+        printf '\n'
+        printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
+        printf 'BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
+        printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
+        printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
+    done
 }
 
 # Generate the kconfig snippet for the br2-external tree.
 do_kconfig() {
+    local br2_name br2_ext
+
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
-    if [ -z "${BR2_NAME}" ]; then
+    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
         printf '# No br2-external tree defined.\n'
         return
     fi
 
-    printf 'menu "User-provided options"\n'
-    printf '\n'
-    printf 'comment "%s (in %s)"\n' "${BR2_NAME}" "${BR2_EXT}"
-    printf '\n'
-    printf 'config BR2_EXTERNAL_%s_PATH\n' "${BR2_NAME}"
-    printf '\tstring\n'
-    printf '\tdefault "%s"\n' "${BR2_EXT}"
-    printf '\n'
-    printf 'source "$BR2_EXTERNAL_%s_PATH/Config.in"\n' "${BR2_NAME}"
+    printf 'menu "External options"\n'
     printf '\n'
+
+    for br2_name in "${BR2_EXT_NAMES[@]}"; do
+        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
+        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+            printf 'menu "%s"\n' "${br2_name}"
+        fi
+        printf 'comment "%s (in %s)"\n' "${br2_name}" "${br2_ext}"
+        printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
+        printf '\tstring\n'
+        printf '\tdefault "%s"\n' "${br2_ext}"
+        printf 'source "%s/Config.in"\n' "${br2_ext}"
+        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+            printf 'endmenu # %s\n' "${br2_name}"
+        fi
+        printf '\n'
+    done
+
     printf "endmenu # User-provided options\n"
 }
 
@@ -154,12 +189,12 @@ help() {
 	    ${my_name} <-m|-k> -o FILE PATH
 
 	With -m, ${my_name} generates the makefile fragment that defines
-	variables related to the br2-external tree passed as positional
-	argument.
+	variables related to the br2-external trees passed as positional
+	arguments.
 
 	With -k, ${my_name} generates the kconfig snippet to include the
-	configuration options specified in the br2-external tree passed
-	as positional argument.
+	configuration options specified in the br2-external trees passed
+	as positional arguments.
 
 	Using -k and -m together is not possible. The last one wins.
 
-- 
2.7.4
