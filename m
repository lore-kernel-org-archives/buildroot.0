From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Apr 2019 21:24:04 +0200
Subject: [Buildroot] [PATCH 08/12] core: split generated kconfig file
In-Reply-To: <cover.1555960978.git.yann.morin.1998@free.fr>
References: <cover.1555960978.git.yann.morin.1998@free.fr>
Message-ID: <9565680170ca66fdf077fc45c9b3b989af4534cb.1555960978.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the kconfig part contains two things: the kconfig option
with the paths to br2-external trees, and the kconfig menus for the
br2-external trees.

When we want to include more kconfig files from the br2-external tree
(e.g. to get definitions for pre-built toolchains), we will need to
have the paths defined earlier, so they can be used from the br2-external
tree to include files earlier than the existing menus.

Split the generated kconfig file in two: one to define the paths, which
gets included early in our main Config.in, and one to actually define
the existing menus, which still gets included at the same place.

For consistency, we also change the way the .mk file is generated, by
passing the output directory down to the function, rather than
redirecting the output of the macro.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in                    |   6 ++-
 support/scripts/br2-external | 113 ++++++++++++++++++++++++-------------------
 2 files changed, 69 insertions(+), 50 deletions(-)

diff --git a/Config.in b/Config.in
index c611bb7dec..e0c54a4bf1 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,9 @@ config BR2_BASE_DIR
 	string
 	option env="BASE_DIR"
 
+# br2-external paths definitions
+source "$BR2_BASE_DIR/.br2-external.paths.in"
+
 # Hidden config symbols for packages to check system gcc version
 config BR2_HOST_GCC_VERSION
 	string
@@ -865,4 +868,5 @@ source "package/Config.in.host"
 
 source "Config.in.legacy"
 
-source "$BR2_BASE_DIR/.br2-external.in"
+# br2-external menus definitions
+source "$BR2_BASE_DIR/.br2-external.menus.in"
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 91ce1801a9..60ae67c967 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -36,8 +36,8 @@ main() {
     do_validate ${@//:/ }
 
     mkdir -p "${outputdir}"
-    do_mk >"${outputdir}/.br2-external.mk"
-    do_kconfig >"${outputdir}/.br2-external.in"
+    do_mk "${outputdir}"
+    do_kconfig "${outputdir}"
 }
 
 # Validates the br2-external trees passed as arguments. Makes each of
@@ -111,73 +111,88 @@ do_validate_one() {
 # Generate the .mk snippet that defines makefile variables
 # for the br2-external tree
 do_mk() {
+    local outputdir="${1}"
     local br2_name br2_ext
 
-    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
-    printf '\n'
+    {
+        printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+        printf '\n'
 
-    printf 'BR2_EXTERNAL ?='
-    for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
-        printf ' %s' "${br2_ext}"
-    done
-    printf '\n'
+        printf 'BR2_EXTERNAL ?='
+        for br2_name in "${BR2_EXT_NAMES[@]}"; do
+            eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+            printf ' %s' "${br2_ext}"
+        done
+        printf '\n'
 
-    printf 'BR2_EXTERNAL_NAMES = \n'
-    printf 'BR2_EXTERNAL_DIRS = \n'
-    printf 'BR2_EXTERNAL_MKS = \n'
+        printf 'BR2_EXTERNAL_NAMES = \n'
+        printf 'BR2_EXTERNAL_DIRS = \n'
+        printf 'BR2_EXTERNAL_MKS = \n'
 
-    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
-        printf '\n'
-        printf '# No br2-external tree defined.\n'
-        return
-    fi
+        if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+            printf '\n'
+            printf '# No br2-external tree defined.\n'
+            return
+        fi
 
-    for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
-        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
-        printf '\n'
-        printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
-        printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
-        printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
-        printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
-        printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
-    done
+        for br2_name in "${BR2_EXT_NAMES[@]}"; do
+            eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
+            eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+            printf '\n'
+            printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
+            printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
+            printf 'BR2_EXTERNAL_MKS += %s/external.mk\n' "${br2_ext}"
+            printf 'export BR2_EXTERNAL_%s_PATH = %s\n' "${br2_name}" "${br2_ext}"
+            printf 'export BR2_EXTERNAL_%s_DESC = %s\n' "${br2_name}" "${br2_desc}"
+        done
+    } >"${outputdir}/.br2-external.mk"
 }
 
-# Generate the kconfig snippet for the br2-external tree.
+# Generate the kconfig snippets for the br2-external tree.
 do_kconfig() {
-    local br2_name br2_desc br2_ext
-
-    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
-    printf '\n'
+    local outputdir="${1}"
+    local br2_name br2_ext br2
 
+    for br2 in paths menus; do
+        {
+            printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+            printf '\n'
+            if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+                printf '# No br2-external tree defined.\n'
+            fi
+        } >"${outputdir}/.br2-external.${br2}.in"
+    done
     if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
-        printf '# No br2-external tree defined.\n'
         return
     fi
 
-    printf 'menu "External options"\n'
-    printf '\n'
+    printf 'menu "External options"\n\n' >>"${outputdir}/.br2-external.menus.in"
 
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
         eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
         eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
-        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
-            printf 'menu "%s"\n' "${br2_desc}"
-        fi
-        printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
-        printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
-        printf '\tstring\n'
-        printf '\tdefault "%s"\n' "${br2_ext}"
-        printf 'source "%s/Config.in"\n' "${br2_ext}"
-        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
-            printf 'endmenu # %s\n' "${br2_name}"
-        fi
-        printf '\n'
+
+        {
+            printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
+            printf '\tstring\n'
+            printf '\tdefault "%s"\n' "${br2_ext}"
+            printf '\n'
+        } >>"${outputdir}/.br2-external.paths.in"
+
+        {
+            if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+                printf 'menu "%s"\n' "${br2_desc}"
+            fi
+            printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
+            printf 'source "%s/Config.in"\n' "${br2_ext}"
+            if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+                printf 'endmenu # %s\n' "${br2_name}"
+            fi
+            printf '\n'
+        } >>"${outputdir}/.br2-external.menus.in"
     done
 
-    printf "endmenu # User-provided options\n"
+    printf 'endmenu\n' >>"${outputdir}/.br2-external.menus.in"
 }
 
 error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
-- 
2.14.1
