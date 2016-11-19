From: Cam Hutchison <camh@xdna.net>
Date: Sat, 19 Nov 2016 22:53:11 -0000
Subject: [Buildroot] [PATCH] core/br2-external: restore compatibility
	with old distros
References: <1479552746-21355-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <564d.5830d7d7.de49@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Since eval is kind of icky, how about something like this patch instead?


Currently, the br2-external script uses bash-4's associative arrays.

However, some oldish enterprise-class distros like RHEL5 still use
bash-3.1 which lacks associative arrays.

Remove the arrays by reading the external.desc files as we generate the
output file.

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: "Cam Hutchison" <camh@xdna.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 support/scripts/br2-external | 94 +++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 055dc08..2afc88e 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -1,11 +1,6 @@
 #!/bin/bash
 set -e
 
-# The names and locations of the br2-external trees, once validated.
-declare -a BR2_EXT_NAMES
-declare -A BR2_EXT_PATHS
-declare -A BR2_EXT_DESCS
-
 # URL to manual for help in converting old br2-external trees.
 # Escape '#' so that make does not consider it a comment.
 MANUAL_URL='https://buildroot.org/manual.html\#br2-external-converting'
@@ -38,14 +33,15 @@ main() {
 
     exec >"${ofile}"
 
-    do_validate ${@//:/ }
+    # Split $PATH style argument into multiple arguments
+    set -- ${@//:/ }
 
-    do_${ofmt}
+    do_validate "${@}"
+
+    do_${ofmt} "${@}"
 }
 
-# Validates the br2-external trees passed as arguments. Makes each of
-# them canonical and store them in the global arrays BR2_EXT_NAMES
-# and BR2_EXT_PATHS.
+# Validates the br2-external trees passed as arguments.
 #
 # Note: since this script is always first called from Makefile context
 # to generate the Makefile fragment before it is called to generate the
@@ -61,14 +57,16 @@ do_validate() {
         return
     fi
 
-    for br2_ext in "${@}"; do
+    for br2_ext; do
         do_validate_one "${br2_ext}"
     done
+
+    validate_unique_names "${@}"
 }
 
 do_validate_one() {
     local br2_ext="${1}"
-    local br2_name br2_desc n
+    local br2_name n
 
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
@@ -80,7 +78,7 @@ do_validate_one() {
         error "'%s': does not have a name (in 'external.desc'). See %s\n" \
             "${br2_ext}" "${MANUAL_URL}"
     fi
-    br2_name="$(sed -r -e '/^name: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
+    br2_name="$(get_field "${br2_ext}" 'name')"
     if [ -z "${br2_name}" ]; then
         error "'%s/external.desc': does not define the name\n" "${br2_ext}"
     fi
@@ -91,55 +89,69 @@ do_validate_one() {
         error "'%s': name '%s' contains invalid chars: '%s'\n" \
             "${br2_ext}" "${br2_name//\$/\$\$}" "${n//\$/\$\$}"
     fi
-    if [ -n "${BR2_EXT_PATHS["${br2_name}"]}" ]; then
-        error "'%s': name '%s' is already used in '%s'\n" \
-            "${br2_ext}" "${br2_name}" "${BR2_EXT_PATHS["${br2_name}"]}"
-    fi
-    br2_desc="$(sed -r -e '/^desc: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
     if [ ! -f "${br2_ext}/external.mk" ]; then
         error "'%s/external.mk': no such file or directory\n" "${br2_ext}"
     fi
     if [ ! -f "${br2_ext}/Config.in" ]; then
         error "'%s/Config.in': no such file or directory\n" "${br2_ext}"
     fi
+}
 
-    # Register this br2-external tree
-    BR2_EXT_NAMES+=( "${br2_name}" )
-    BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
-    BR2_EXT_DESCS["${br2_name}"]="${br2_desc:-${br2_name}}"
+validate_unique_names() {
+    # If there are any duplicate names across the external.desc files,
+    # generate_dupes will output at least two lines of the form:
+    # <br2_ext_1> name
+    # <br2_ext_2> name
+    # If there is more that one duplicate, extra lines will be output but
+    # we do not include them in the error message due to formatting limitations
+    # of the error message. Once one duplicate is fixed, subsequent runs will
+    # identify the next duplicate(s).
+    set -- $(generate_dupes "${@}")
+    if [ ${#} -ne 0  ]; then
+        error "'%s': name '%s' is already used in '%s'\n" \
+            "${1}" "${2}" "${3}"
+    fi
+}
+
+generate_dupes() {
+    for br2_ext; do
+        printf '%s %s\n' ${br2_ext} "$(get_field "${br2_ext}" 'name')"
+    done | sort -k2,2 | uniq --skip-fields=1 --all-repeated
+}
+
+# Get a field by name from an external.desc file
+get_field() {
+    local br2_ext="${1}"
+    local field="${2}"
+
+    sed -n -r -e "s/^${field}"': +(.*)$/\1/p' "${br2_ext}/external.desc"
 }
 
 # Generate the .mk snippet that defines makefile variables
 # for the br2-external tree
 do_mk() {
-    local br2_name br2_ext
+    local br2_ext br2_name br2_desc
 
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
-    # We can't use ${BR2_EXT_NAMES[@]} directly: it is not guaranteed
-    # to be in the order paths were added (because it is an associative
-    # array). So we need to iterate on BR2_EXT_NAMES, which is sorted
-    # in the order names were added (because it is an indexed array).
     printf 'BR2_EXTERNAL ?='
-    for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
-    done
+    printf ' %s' "${@}"
     printf '\n'
 
     printf 'BR2_EXTERNAL_NAMES = \n'
     printf 'BR2_EXTERNAL_DIRS = \n'
     printf 'BR2_EXTERNAL_MKS = \n'
 
-    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+    if [ ${#} -eq 0 ]; then
         printf '\n'
         printf '# No br2-external tree defined.\n'
         return
     fi
 
-    for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
-        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
+    for br2_ext; do
+        br2_name="$(get_field "${br2_ext}" 'name')"
+        br2_desc="$(get_field "${br2_ext}" 'desc')"
         printf '\n'
         printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
         printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
@@ -151,12 +163,12 @@ do_mk() {
 
 # Generate the kconfig snippet for the br2-external tree.
 do_kconfig() {
-    local br2_name br2_ext
+    local br2_ext br2_name br2_desc
 
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
-    if [ ${#BR2_EXT_NAMES[@]} -eq 0 ]; then
+    if [ ${#} -eq 0 ]; then
         printf '# No br2-external tree defined.\n'
         return
     fi
@@ -164,10 +176,10 @@ do_kconfig() {
     printf 'menu "External options"\n'
     printf '\n'
 
-    for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
-        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
-        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+    for br2_ext; do
+        br2_name="$(get_field "${br2_ext}" 'name')"
+        br2_desc="$(get_field "${br2_ext}" 'desc')"
+        if [ ${#} -gt 1 ]; then
             printf 'menu "%s"\n' "${br2_desc}"
         fi
         printf 'comment "%s (in %s)"\n' "${br2_desc}" "${br2_ext}"
@@ -175,7 +187,7 @@ do_kconfig() {
         printf '\tstring\n'
         printf '\tdefault "%s"\n' "${br2_ext}"
         printf 'source "%s/Config.in"\n' "${br2_ext}"
-        if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
+        if [ ${#} -gt 1 ]; then
             printf 'endmenu # %s\n' "${br2_name}"
         fi
         printf '\n'
-- 
2.1.4
