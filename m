From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Oct 2016 13:01:02 +0200
Subject: [Buildroot] [git commit] core: introduce per br2-external NAME
Message-ID: <20161016110154.4F1478211D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc34cf772cfb37b9d082e0fba480eb190c66e39c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This unique NAME is used to construct a per br2-external tree variable,
BR2_EXTERNAL_$(NAME)_PATH, which contains the path to the br2-external
tree.

This variable is available both from Kconfig (set in the Kconfig
snippet) and from the .mk files.

Also, display the NAME and its path as a comment in the menuconfig.

This will ultimately allow us to support multiple br2-external trees at
once, with that NAME (and thus BR2_EXTERNAL_$(NAME)) uniquely defining
which br2-external tree is being used.

The obvious outcome is that BR2_EXTERNAL should now no longer be used to
refer to the files in the br2-external tree; that location is now known
from the BR2_EXTERNAL_$(NAME)_PATH variable instead. This means we no
longer need to expose, and must stop from from exposing BR2_EXTERNAL as
a Kconfig variable.

Finally, this also fixes a latent bug in the pkg-generic infra, where we
would so far always refer to BR2_EXTERNAL (even if not set) to filter
the names of packages (to decide whether they are a bootloader, a
toolchain or a simple package).

Note: since the variables in the Makefile and in Kconfig are named the
same, the one we computed early on in the Makefile will be overridden by
the one in .config when we have it. Thus, even though they are set to
the same raw value, the one from .config is quoted and, being included
later in the Makefile, will take precedence, so we just re-include the
generated Makefile fragment a third time before includeing the
br2-external's Makefiles. That's unfortunate, but there is no easy way
around that as we do want the two variables to be named the same in
Makefile and Kconfig (and we can't ask the user to un-quote that variable
himself either), hence this little dirty triple-inclusion trick.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile                           | 19 ++++++++++++++-----
 boot/barebox/barebox-aux/Config.in |  3 +--
 boot/barebox/barebox/Config.in     |  3 +--
 package/Makefile.in                |  3 +--
 package/pkg-generic.mk             |  4 ++--
 support/scripts/br2-external       | 38 +++++++++++++++++++++++++++++---------
 6 files changed, 48 insertions(+), 22 deletions(-)

diff --git a/Makefile b/Makefile
index ff93cae..e263b54 100644
--- a/Makefile
+++ b/Makefile
@@ -448,6 +448,14 @@ include boot/common.mk
 include linux/linux.mk
 include fs/common.mk
 
+# If using a br2-external tree, the BR2_EXTERNAL_$(NAME)_PATH variable
+# is also present in the .config file. Since .config is included after
+# we defined BR2_EXTERNAL_$(NAME)_PATH in the Makefile, the value in
+# that variable is quoted. We just include the generated Makefile fragment
+# .br2-external.mk a third time, which will set that variable to the
+# un-quoted value.
+include $(BR2_EXTERNAL_FILE)
+
 # Nothing to include if no BR2_EXTERNAL tree in use
 include $(BR2_EXTERNAL_MK)
 
@@ -763,7 +771,6 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_AUTOHEADER=$(BUILD_DIR)/buildroot-config/autoconf.h \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
-	BR2_EXTERNAL=$(BR2_EXTERNAL) \
 	HOST_GCC_VERSION="$(HOSTCC_VERSION)" \
 	BUILD_DIR=$(BUILD_DIR) \
 	SKIP_LEGACY=
@@ -842,7 +849,7 @@ define percent_defconfig
 	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
 		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
 endef
-$(eval $(foreach d,$(TOPDIR) $(BR2_EXTERNAL),$(call percent_defconfig,$(d))$(sep)))
+$(eval $(foreach d,$(TOPDIR) $(if $(BR2_EXTERNAL_NAME),$(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)),$(call percent_defconfig,$(d))$(sep)))
 
 savedefconfig: $(BUILD_DIR)/buildroot-config/conf prepare-kconfig
 	@$(COMMON_CONFIG_ENV) $< \
@@ -969,12 +976,14 @@ list-defconfigs:
 	@echo 'Built-in configs:'
 	@$(foreach b, $(sort $(notdir $(wildcard $(TOPDIR)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
-ifneq ($(wildcard $(BR2_EXTERNAL)/configs/*_defconfig),)
+ifneq ($(BR2_EXTERNAL_NAME),)
+ifneq ($(wildcard $(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)/configs/*_defconfig),)
 	@echo
 	@echo 'User-provided configs:'
-	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL)/configs/*_defconfig))), \
+	@$(foreach b, $(sort $(notdir $(wildcard $(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)/configs/*_defconfig))), \
 	  printf "  %-35s - Build for %s\\n" $(b) $(b:_defconfig=);)
 endif
+endif
 	@echo
 
 release: OUT = buildroot-$(BR2_VERSION)
@@ -994,7 +1003,7 @@ print-version:
 	@echo $(BR2_VERSION_FULL)
 
 include docs/manual/manual.mk
--include $(BR2_EXTERNAL)/docs/*/*.mk
+-include $(if $(BR2_EXTERNAL_NAME),$(BR2_EXTERNAL_$(BR2_EXTERNAL_NAME)_PATH)/docs/*/*.mk)
 
 .PHONY: $(noconfig_targets)
 
diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
index 315e1a3..ec3b97c 100644
--- a/boot/barebox/barebox-aux/Config.in
+++ b/boot/barebox/barebox-aux/Config.in
@@ -67,8 +67,7 @@ config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
 	  invalid. This option sets the barebox Kconfig option
 	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This
 	  way it is possible to use Buildroot variables like
-	  BR2_EXTERNAL, TOPDIR etc. to refer to the custom
-	  environment.
+	  TOPDIR etc. to refer to the custom environment.
 
 	  Depending on your setup, the custom embedded environment
 	  will probably be based on either the content of the
diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
index f5e3bae..3d8d014 100644
--- a/boot/barebox/barebox/Config.in
+++ b/boot/barebox/barebox/Config.in
@@ -73,8 +73,7 @@ config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
 	  invalid. This option sets the barebox Kconfig option
 	  CONFIG_DEFAULT_ENVIRONMENT_PATH to the specified path. This
 	  way it is possible to use Buildroot variables like
-	  BR2_EXTERNAL, TOPDIR etc. to refer to the custom
-	  environment.
+	  TOPDIR etc. to refer to the custom environment.
 
 	  Depending on your setup, the custom embedded environment
 	  will probably be based on either the content of the
diff --git a/package/Makefile.in b/package/Makefile.in
index 98e30b4..5d591e9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -311,8 +311,7 @@ HOST_CONFIGURE_OPTS = \
 EXTRA_ENV = \
 	PATH=$(BR_PATH) \
 	BR2_DL_DIR=$(BR2_DL_DIR) \
-	BUILD_DIR=$(BUILD_DIR) \
-	BR2_EXTERNAL=$(BR2_EXTERNAL)
+	BUILD_DIR=$(BUILD_DIR)
 
 ################################################################################
 # settings we need to pass to configure
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 12ae86f..a13e34f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -767,9 +767,9 @@ $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 # kernel case, the bootloaders case, and the normal packages case.
 ifeq ($(1),linux)
 $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
-else ifneq ($$(filter boot/% $(BR2_EXTERNAL)/boot/%,$(pkgdir)),)
+else ifneq ($$(filter boot/% $$(if $$(BR2_EXTERNAL_NAME),$$(BR2_EXTERNAL_$$(BR2_EXTERNAL_NAME)_PATH)/boot/%),$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
-else ifneq ($$(filter toolchain/% $(BR2_EXTERNAL)/toolchain/%,$(pkgdir)),)
+else ifneq ($$(filter toolchain/% $$(if $$(BR2_EXTERNAL_NAME),$$(BR2_EXTERNAL_$$(BR2_EXTERNAL_NAME)_PATH)/toolchain/%),$(pkgdir)),)
 $(2)_KCONFIG_VAR = BR2_$(2)
 else
 $(2)_KCONFIG_VAR = BR2_PACKAGE_$(2)
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 1a0c743..21d7351 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -1,7 +1,8 @@
 #!/bin/bash
 set -e
 
-# The location of the br2-external tree, once validated.
+# The name and location of the br2-external tree, once validated.
+declare BR2_NAME
 declare BR2_EXT
 
 main() {
@@ -55,6 +56,7 @@ main() {
 #
 do_validate() {
     local br2_ext="${1}"
+    local br2_name n
 
     # No br2-external tree is valid
     if [ -z "${br2_ext}" ]; then
@@ -67,6 +69,20 @@ do_validate() {
     if [ ! -r "${br2_ext}" -o ! -x "${br2_ext}" ]; then
         error "'%s': permission denied\n" "${br2_ext}"
     fi
+    if [ ! -f "${br2_ext}/external.desc" ]; then
+        error "'%s': does not have a name (in 'external.desc')\n" "${br2_ext}"
+    fi
+    br2_name="$(sed -r -e '/^name: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
+    if [ -z "${br2_name}" ]; then
+        error "'%s/external.desc': does not define the name\n" "${br2_ext}"
+    fi
+    # Only ASCII chars in [A-Za-z0-9_] are permitted
+    n="$(sed -r -e 's/[A-Za-z0-9_]//g' <<<"${br2_name}" )"
+    if [ -n "${n}" ]; then
+        # Escape '$' so that it gets printed
+        error "'%s': name '%s' contains invalid chars: '%s'\n" \
+            "${br2_ext}" "${br2_name//\$/\$\$}" "${n//\$/\$\$}"
+    fi
     if [ ! -f "${br2_ext}/external.mk" ]; then
         error "'%s/external.mk': no such file or directory\n" "${br2_ext}"
     fi
@@ -74,27 +90,29 @@ do_validate() {
         error "'%s/Config.in': no such file or directory\n" "${br2_ext}"
     fi
 
+    BR2_NAME="${br2_name}"
     BR2_EXT="$(cd "${br2_ext}"; pwd -P )"
 }
 
 # Generate the .mk snippet that defines makefile variables
 # for the br2-external tree
 do_mk() {
-    local BR2_EXT="${1}"
-
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
     printf 'BR2_EXTERNAL ?= %s\n' "${BR2_EXT}"
+    printf 'BR2_EXTERNAL_NAME = \n'
     printf 'BR2_EXTERNAL_MK =\n'
     printf '\n'
 
-    if [ -z "${BR2_EXT}" ]; then
+    if [ -z "${BR2_NAME}" ]; then
         printf '# No br2-external tree defined.\n'
         return
     fi
 
+    printf 'BR2_EXTERNAL_NAME = %s\n' "${BR2_NAME}"
     printf 'BR2_EXTERNAL_MK = %s/external.mk\n' "${BR2_EXT}"
+    printf 'BR2_EXTERNAL_%s_PATH = %s\n' "${BR2_NAME}" "${BR2_EXT}"
 }
 
 # Generate the kconfig snippet for the br2-external tree.
@@ -102,18 +120,20 @@ do_kconfig() {
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
-    if [ -z "${BR2_EXT}" ]; then
+    if [ -z "${BR2_NAME}" ]; then
         printf '# No br2-external tree defined.\n'
         return
     fi
 
-    printf 'config BR2_EXTERNAL\n'
+    printf 'menu "User-provided options"\n'
+    printf '\n'
+    printf 'comment "%s (in %s)"\n' "${BR2_NAME}" "${BR2_EXT}"
+    printf '\n'
+    printf 'config BR2_EXTERNAL_%s_PATH\n' "${BR2_NAME}"
     printf '\tstring\n'
     printf '\tdefault "%s"\n' "${BR2_EXT}"
     printf '\n'
-    printf 'menu "User-provided options"\n'
-    printf '\n'
-    printf 'source "%s/Config.in"\n' "${BR2_EXT}"
+    printf 'source "$BR2_EXTERNAL_%s_PATH/Config.in"\n' "${BR2_NAME}"
     printf '\n'
     printf "endmenu # User-provided options\n"
 }
