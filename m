From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2019 22:19:58 +0200
Subject: [Buildroot] [PATCH 08/13 v2] core: prepare for generating multiple
 kconfig fragments
In-Reply-To: <cover.1564431589.git.yann.morin.1998@free.fr>
References: <cover.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <2795810574c68f60b6017a52f1cd63d4d0b12e87.1564431589.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We currently redirect the output of each helper function. This was nice
as long as we were generating single .mk and .in fragments.

But we are soon to need more .in fragments.

So, do the redirection inside the .in helpers.

We do not (currently) need to generate more than one .mk fragment, but
for consistency, do the redirection in the .mk helper too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
---
 support/scripts/br2-external | 112 ++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 53 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 1840cc937b..0b83cf69ff 100755
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
@@ -111,73 +111,79 @@ do_validate_one() {
 # Generate the .mk snippet that defines makefile variables
 # for the br2-external tree
 do_mk() {
+    local outputdir="${1}"
     local br2_name br2_desc br2_ext
 
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
 
 # Generate the kconfig snippet for the br2-external tree.
 do_kconfig() {
+    local outputdir="${1}"
     local br2_name br2_desc br2_ext
 
-    printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
-    printf '\n'
-
-    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
-        printf '# No br2-external tree defined.\n'
-        return
-    fi
-
-    printf 'menu "External options"\n'
-    printf '\n'
+    {
+        printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+        printf '\n'
 
-    for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
-        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
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
+        if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+            printf '# No br2-external tree defined.\n'
+            return
         fi
+
+        printf 'menu "External options"\n'
         printf '\n'
-    done
 
-    printf "endmenu # User-provided options\n"
+        for br2_name in "${BR2_EXT_NAMES[@]}"; do
+            eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
+            eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+            if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+                printf 'menu "%s"\n' "${br2_desc}"
+            fi
+            printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
+            printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
+            printf '\tstring\n'
+            printf '\tdefault "%s"\n' "${br2_ext}"
+            printf 'source "%s/Config.in"\n' "${br2_ext}"
+            if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+                printf 'endmenu # %s\n' "${br2_name}"
+            fi
+            printf '\n'
+        done
+
+        printf "endmenu # User-provided options\n"
+    } >"${outputdir}/.br2-external.in"
 }
 
 error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
-- 
2.20.1
