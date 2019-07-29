From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jul 2019 22:19:59 +0200
Subject: [Buildroot] [PATCH 09/13 v2] core: split generated kconfig file
In-Reply-To: <cover.1564431589.git.yann.morin.1998@free.fr>
References: <cover.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <5e1ebdbbc317cee7cc2fbb727589dc4a4ae8d1da.1564431589.git.yann.morin.1998@free.fr>
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
the existing menus, which still gets included at the same place they
currently are.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>

---
Changes v1 -> v2:
  - redirection is changed in its own patch now
---
 Config.in                    |  6 +++-
 support/scripts/br2-external | 63 ++++++++++++++++++++++--------------
 2 files changed, 44 insertions(+), 25 deletions(-)

diff --git a/Config.in b/Config.in
index c611bb7dec..512b5d003f 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,9 @@ config BR2_BASE_DIR
 	string
 	option env="BASE_DIR"
 
+# br2-external paths definitions
+source "$BR2_BASE_DIR/.br2-external.in.paths"
+
 # Hidden config symbols for packages to check system gcc version
 config BR2_HOST_GCC_VERSION
 	string
@@ -865,4 +868,5 @@ source "package/Config.in.host"
 
 source "Config.in.legacy"
 
-source "$BR2_BASE_DIR/.br2-external.in"
+# br2-external menus definitions
+source "$BR2_BASE_DIR/.br2-external.in.menus"
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 0b83cf69ff..da315d5c1d 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -148,42 +148,57 @@ do_mk() {
     } >"${outputdir}/.br2-external.mk"
 }
 
-# Generate the kconfig snippet for the br2-external tree.
+# Generate the kconfig snippets for the br2-external tree.
 do_kconfig() {
     local outputdir="${1}"
-    local br2_name br2_desc br2_ext
-
-    {
-        printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
-        printf '\n'
-
-        if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
-            printf '# No br2-external tree defined.\n'
-            return
-        fi
-
-        printf 'menu "External options"\n'
-        printf '\n'
-
-        for br2_name in "${BR2_EXT_NAMES[@]}"; do
-            eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
-            eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
-            if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
-                printf 'menu "%s"\n' "${br2_desc}"
+    local br2_name br2_desc br2_ext br2
+    local -a items
+
+    items=(
+        paths
+        menus
+    )
+
+    for br2 in "${items[@]}"; do
+        {
+            printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
+            printf '\n'
+            if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+                printf '# No br2-external tree defined.\n'
             fi
-            printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
+        } >"${outputdir}/.br2-external.in.${br2}"
+    done
+    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+        return
+    fi
+
+    printf 'menu "External options"\n\n' >>"${outputdir}/.br2-external.in.menus"
+
+    for br2_name in "${BR2_EXT_NAMES[@]}"; do
+        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
+        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+
+        {
             printf 'config BR2_EXTERNAL_%s_PATH\n' "${br2_name}"
             printf '\tstring\n'
             printf '\tdefault "%s"\n' "${br2_ext}"
+            printf '\n'
+        } >>"${outputdir}/.br2-external.in.paths"
+
+        {
+            if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+                printf 'menu "%s"\n' "${br2_desc}"
+            fi
+            printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
             printf 'source "%s/Config.in"\n' "${br2_ext}"
             if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
                 printf 'endmenu # %s\n' "${br2_name}"
             fi
             printf '\n'
-        done
+        } >>"${outputdir}/.br2-external.in.menus"
+    done
 
-        printf "endmenu # User-provided options\n"
-    } >"${outputdir}/.br2-external.in"
+    printf 'endmenu\n' >>"${outputdir}/.br2-external.in.menus"
 }
 
 error() { local fmt="${1}"; shift; printf "BR2_EXTERNAL_ERROR = ${fmt}" "${@}"; exit 1; }
-- 
2.20.1
