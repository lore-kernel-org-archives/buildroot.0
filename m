From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Thu, 26 Jul 2018 15:02:58 +0200
Subject: [Buildroot] [PATCH 1/1] Buildroot: add support for buildroot
 configuration fragments
Message-ID: <20180726130258.8283-1-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces the possibility to specify buildroot configuration
fragment files like it is already possible for kconfig based packages.

For this purpose, a new make variable BR2_CONFIG_FRAGMENT_FILES has been
introduced that may hold a space separated list of configuration files.
The mechanism to store this information is adopted from how it's done with
BR2_EXTERNAL: there is an additional makefile fragment called .br-fragments.mk
generated that holds the new variable.

To actually merge the .config with all fragments together, merge_config.sh
from the kconfig support is used. This requires a small extension to allow
config entries that do not start with the "CONFIG_" prefix.

Where possible, the behaviour of this fragmentation is adopted from how it's
done for kconfig based packages.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 Makefile                        | 53 +++++++++++++++---
 support/kconfig/merge_config.sh | 10 ++++
 support/scripts/br2-fragments   | 99 +++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+), 8 deletions(-)
 create mode 100755 support/scripts/br2-fragments

diff --git a/Makefile b/Makefile
index 8d25c8a239..ce506e5a43 100644
--- a/Makefile
+++ b/Makefile
@@ -146,7 +146,8 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig printvars
+	savedefconfig update-defconfig write-defconfig \
+	printvars
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -200,6 +201,21 @@ ifneq ($(BR2_EXTERNAL_ERROR),)
 $(error $(BR2_EXTERNAL_ERROR))
 endif
 
+# Handling of BR2_CONFIG_FRAGMENT_FILES.
+#
+# The values of BR2_CONFIG_FRAGMENT_FILES is stored in .br-fragments.mk in the
+# output directory. On subsequent invocations of make, this file is read in.
+# BR2_CONFIG_FRAGMENT_FILES can still be overridden on the command line,
+# therefore the file is re-created every time make is run.
+BR2_FRAGMENTS_FILE = $(BASE_DIR)/.br-fragments.mk
+-include $(BR2_FRAGMENTS_FILE)
+$(shell support/scripts/br2-fragments \
+	mk $(BR2_FRAGMENTS_FILE) $(BR2_CONFIG_FRAGMENT_FILES))
+include $(BR2_FRAGMENTS_FILE)
+ifneq ($(BR2_FRAGMENTS_ERROR),)
+$(error $(BR2_FRAGMENTS_ERROR))
+endif
+
 # To make sure that the environment variable overrides the .config option,
 # set this before including .config.
 ifneq ($(BR2_DL_DIR),)
@@ -871,6 +887,11 @@ export HOSTCFLAGS
 .PHONY: prepare-kconfig
 prepare-kconfig: outputmakefile $(BUILD_DIR)/.br2-external.in
 
+.PHONY: merge-br-config
+merge-br-config:
+	$(Q)support/scripts/br2-fragments \
+		conf $(BR2_CONFIG) $(BR2_CONFIG_FRAGMENT_FILES)
+
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
 	PKG_CONFIG_PATH="$(HOST_PKG_CONFIG_PATH)" $(MAKE) CC="$(HOSTCC_NOCCACHE)" HOSTCC="$(HOSTCC_NOCCACHE)" \
@@ -890,19 +911,19 @@ COMMON_CONFIG_ENV = \
 	BUILD_DIR=$(BUILD_DIR) \
 	SKIP_LEGACY=
 
-xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig
+xconfig: $(BUILD_DIR)/buildroot-config/qconf prepare-kconfig merge-br-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-gconfig: $(BUILD_DIR)/buildroot-config/gconf prepare-kconfig
+gconfig: $(BUILD_DIR)/buildroot-config/gconf prepare-kconfig merge-br-config
 	@$(COMMON_CONFIG_ENV) srctree=$(TOPDIR) $< $(CONFIG_CONFIG_IN)
 
-menuconfig: $(BUILD_DIR)/buildroot-config/mconf prepare-kconfig
+menuconfig: $(BUILD_DIR)/buildroot-config/mconf prepare-kconfig merge-br-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-nconfig: $(BUILD_DIR)/buildroot-config/nconf prepare-kconfig
+nconfig: $(BUILD_DIR)/buildroot-config/nconf prepare-kconfig merge-br-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
-config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+config: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig merge-br-config
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
 # For the config targets that automatically select options, we pass
@@ -936,13 +957,29 @@ define percent_defconfig
 endef
 $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
 
-savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
+# At the moment there is a difference of what buildroot does on "savedefconfig"
+# and what Kconfig packages do on "<pkg>-savedefconfig". The latter create files
+# named "defconfig" from the current configuration.
+# To update the reference defconfig file there are "<pkg>-update-defconfig"
+# targets that do so only if no fragment files have been specified.
+# So for now we emulate this behaviour also for safedefconfig here and introduce
+# another target that just writes a defconfig file.
+savedefconfig update-defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig merge-br-config
+	$(if $(BR2_CONFIG_FRAGMENT_FILES), \
+		echo "Unable to perform $(@) when fragment files are set"; exit 1)
 	@$(COMMON_CONFIG_ENV) $< \
 		--savedefconfig=$(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig) \
 		$(CONFIG_CONFIG_IN)
 	@$(SED) '/BR2_DEFCONFIG=/d' $(if $(DEFCONFIG),$(DEFCONFIG),$(CONFIG_DIR)/defconfig)
 
-.PHONY: defconfig savedefconfig
+# Writes a defconfig file@$(CONFIG_DIR)/defconfig.
+# This target should be renamed to savedefconfig in the future.
+write-defconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig merge-br-config
+	@$(COMMON_CONFIG_ENV) $< \
+		--savedefconfig=$(CONFIG_DIR)/defconfig \
+		$(CONFIG_CONFIG_IN)
+
+.PHONY: defconfig savedefconfig update-defconfig write-defconfig
 
 ################################################################################
 #
diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index e1d7ffa7b5..9c1bf4ccc6 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -32,6 +32,7 @@ usage() {
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
+	echo "  -p    do not restrict config prefix to CONFIG_"
 	echo "  -O    dir to put generated output files"
 	echo "  -e    colon-separated list of br2-external trees to use (optional)"
 }
@@ -39,6 +40,7 @@ usage() {
 MAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
+ALLPREFIXES=false
 OUTPUT=.
 
 while true; do
@@ -62,6 +64,11 @@ while true; do
 		shift
 		continue
 		;;
+	"-p")
+		ALLPREFIXES=true
+		shift
+		continue
+		;;
 	"-O")
 		if [ -d $2 ];then
 			OUTPUT=$(echo $2 | sed 's/\/*$//')
@@ -88,6 +95,9 @@ shift;
 
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+if [ "$ALLPREFIXES" = "true" ]; then
+	SED_CONFIG_EXP="s/^\(# \)\{0,1\}\([a-zA-Z][a-zA-Z0-9_]*\)[= ].*/\2/p"
+fi
 TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
diff --git a/support/scripts/br2-fragments b/support/scripts/br2-fragments
new file mode 100755
index 0000000000..fd18873a52
--- /dev/null
+++ b/support/scripts/br2-fragments
@@ -0,0 +1,99 @@
+#!/usr/bin/env sh
+
+set -e
+
+# This script is POSIX compliant and thus runs in any shell.
+
+THIS_FILE=$(basename "${0}")
+SUPPORT_DIR=$(cd $(dirname "${0}") && cd .. && pwd)
+KCONFIG_SUPPORT_DIR="${SUPPORT_DIR}/kconfig"
+
+fail_msg() {
+    printf "%s\n" "${1}" 1>&2
+    exit 1
+}
+
+
+help() {
+    cat <<-_EOF_
+	Usage:
+	    ${THIS_FILE} <mk|conf> FILE FRAGMENT...
+
+	With mk, ${THIS_FILE} generates the makefile fragment that
+	defines the BR2_CONFIG_FRAGMENT_FILES variable and associated
+	targets.
+
+	With conf, ${THIS_FILE} merges the buildroot configuration and
+	the fragments. The buildroot configuration is only updated if
+	the merge introduced changes.
+
+	Commands:
+	    mk     Generate the makefile fragment
+
+	    conf   Join the buildroot configuration and fragments
+
+	Arguments:
+	    FILE   File in which the makefile fragment is generated or
+	           where the buildroot config is updated.
+
+	Returns:
+	    0      If no error
+	    !0     If any error
+	_EOF_
+}
+
+
+gen_mk() {
+    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+    printf '\n'
+
+    printf 'BR2_CONFIG_FRAGMENT_FILES ?= %s\n' "$*"
+    printf 'BR2_FRAGMENTS_MISSING = $(strip $(foreach f,$(BR2_CONFIG_FRAGMENT_FILES),\\\n'
+    printf '\t$(if $(wildcard $(f)),,$(f))))\n'
+    printf 'BR2_FRAGMENTS_ERROR = $(if $(BR2_FRAGMENTS_MISSING),\\\n'
+    printf '\t"$(firstword $(BR2_FRAGMENTS_MISSING))": config fragment missing)\n'
+}
+
+
+merge_config() {
+    TMP_DIR=$(mktemp -d --suffix -br-config-merge)
+    trap "rm -rf ${TMP_DIR:-XxXbe-safeXxX}" EXIT INT TERM
+
+    FRAGMENTS=$(printf "%s" "$*" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
+    if [ -z "${FRAGMENTS}" ]; then
+        printf "${THIS_FILE}: nothing to merge\n"
+        exit 0
+    fi
+
+    MERGE_FILES="${FRAGMENTS}"
+    if [ -f "${FILE}" ]; then
+        MERGE_FILES="${FILE} ${MERGE_FILES}"
+    fi
+
+    ${KCONFIG_SUPPORT_DIR}/merge_config.sh -m -p -O "${TMP_DIR}" ${MERGE_FILES}
+
+    # update .config file only if required
+    diff "${TMP_DIR}/.config" "${FILE}" >/dev/null 2>&1 || cp "${TMP_DIR}"/.config "${FILE}"
+}
+
+
+# check commandline
+[ "${#}" -lt 2 ] && help && exit 1
+
+COMMAND="${1}"
+FILE="${2}"
+shift; shift
+
+case "${COMMAND}" in
+    mk)
+        gen_mk "${@}" > "${FILE}"
+    ;;
+    conf)
+        merge_config "${@}"
+    ;;
+    *)
+        help; exit 0
+    ;;
+esac
+
+exit 0
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
