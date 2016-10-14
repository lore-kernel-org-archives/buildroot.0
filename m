From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Oct 2016 16:39:23 +0200
Subject: [Buildroot] [PATCH 11/12] core: support description for
	br2-external trees
In-Reply-To: <cover.1476455955.git.yann.morin.1998@free.fr>
References: <cover.1476455955.git.yann.morin.1998@free.fr>
Message-ID: <ec512966ed2631a1db0a6b354d6aa37165d007aa.1476455955.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile                     |  5 +++--
 support/scripts/br2-external | 12 +++++++++---
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index a630752..75e1162 100644
--- a/Makefile
+++ b/Makefile
@@ -984,7 +984,7 @@ define list-defconfigs
 		[ -f "$${defconfig}" ] || continue; \
 		if $${first}; then \
 			if [ "$(2)" ]; then \
-				printf "External configs in $(2):\n"; \
+				printf 'External configs in "$(call qstrip,$(2))":\n'; \
 			else \
 				printf "Built-in configs:\n"; \
 			fi; \
@@ -1001,7 +1001,8 @@ endef
 list-defconfigs:
 	$(call list-defconfigs,$(TOPDIR))
 	$(foreach name,$(BR2_EXTERNAL_NAMES),\
-		$(call list-defconfigs,$(BR2_EXTERNAL_$(name)_PATH),$(name))$(sep))
+		$(call list-defconfigs,$(BR2_EXTERNAL_$(name)_PATH),\
+			$(BR2_EXTERNAL_$(name)_DESC))$(sep))
 
 release: OUT = buildroot-$(BR2_VERSION)
 
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index d634e69..038525e 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -4,6 +4,7 @@ set -e
 # The names and locations of the br2-external trees, once validated.
 declare -a BR2_EXT_NAMES
 declare -A BR2_EXT_PATHS
+declare -A BR2_EXT_DESCS
 
 # URL to manual for help in converting old br2-external trees.
 # Escape '#' so that make does not consider it a comment.
@@ -67,7 +68,7 @@ do_validate() {
 
 do_validate_one() {
     local br2_ext="${1}"
-    local br2_name n
+    local br2_name br2_desc n
 
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
@@ -94,6 +95,7 @@ do_validate_one() {
         error "'%s': name '%s' is already used in '%s'\n" \
             "${br2_ext}" "${br2_name}" "${BR2_EXT_PATHS["${br2_name}"]}"
     fi
+    br2_desc="$(sed -r -e '/^desc: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
     if [ ! -f "${br2_ext}/external.mk" ]; then
         error "'%s/external.mk': no such file or directory\n" "${br2_ext}"
     fi
@@ -104,6 +106,7 @@ do_validate_one() {
     # Register this br2-external tree
     BR2_EXT_NAMES+=( "${br2_name}" )
     BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
+    BR2_EXT_DESCS["${br2_name}"]="${br2_desc:-${br2_name}}"
 }
 
 # Generate the .mk snippet that defines makefile variables
@@ -135,10 +138,12 @@ do_mk() {
     fi
 
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
+        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
         br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
         printf '\n'
         printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
         printf 'BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
+        printf 'BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
         printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
         printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
     done
@@ -160,11 +165,12 @@ do_kconfig() {
     printf '\n'
 
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
+        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
         br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
         if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
-            printf 'menu "%s"\n' "${br2_name}"
+            printf 'menu "%s"\n' "${br2_desc}"
         fi
-        printf 'comment "%s (in %s)"\n' "${br2_name}" "${br2_ext}"
+        printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
         printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
         printf '\tstring\n'
         printf '\tdefault "%s"\n' "${br2_ext}"
-- 
2.7.4
