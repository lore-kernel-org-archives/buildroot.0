From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:31:20 +0100
Subject: [Buildroot] [git commit] core/br2-external: restore compatibility
	with old distros
Message-ID: <20161123223124.7D33F81DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14b02698ecb6deb5b2676a0a7747b67ae19d709
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the br2-external script uses bash-4's associative arrays.

However, some oldish enterprise-class distros like RHEL5 still use
bash-3.1 which lacks associative arrays.

We restore compatibility with those oldish distros using 'eval' to
emulate associative arrays, as suggested by Arnout.

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/br2-external | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 055dc08..84bc334 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -1,10 +1,12 @@
 #!/bin/bash
 set -e
 
-# The names and locations of the br2-external trees, once validated.
+# This script must be able to run with bash-3.1, so it can't use
+# associative arrays. Instead, it emulates them using 'eval'. It
+# can however use indexed arrays, supported since at least bash-3.0.
+
+# The names of the br2-external trees, once validated.
 declare -a BR2_EXT_NAMES
-declare -A BR2_EXT_PATHS
-declare -A BR2_EXT_DESCS
 
 # URL to manual for help in converting old br2-external trees.
 # Escape '#' so that make does not consider it a comment.
@@ -68,7 +70,7 @@ do_validate() {
 
 do_validate_one() {
     local br2_ext="${1}"
-    local br2_name br2_desc n
+    local br2_name br2_desc n d
 
     if [ ! -d "${br2_ext}" ]; then
         error "'%s': no such file or directory\n" "${br2_ext}"
@@ -91,9 +93,10 @@ do_validate_one() {
         error "'%s': name '%s' contains invalid chars: '%s'\n" \
             "${br2_ext}" "${br2_name//\$/\$\$}" "${n//\$/\$\$}"
     fi
-    if [ -n "${BR2_EXT_PATHS["${br2_name}"]}" ]; then
+    eval d="\"\${BR2_EXT_PATHS_${br2_name}}\""
+    if [ -n "${d}" ]; then
         error "'%s': name '%s' is already used in '%s'\n" \
-            "${br2_ext}" "${br2_name}" "${BR2_EXT_PATHS["${br2_name}"]}"
+            "${br2_ext}" "${br2_name}" "${d}"
     fi
     br2_desc="$(sed -r -e '/^desc: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
     if [ ! -f "${br2_ext}/external.mk" ]; then
@@ -105,8 +108,8 @@ do_validate_one() {
 
     # Register this br2-external tree
     BR2_EXT_NAMES+=( "${br2_name}" )
-    BR2_EXT_PATHS["${br2_name}"]="${br2_ext}"
-    BR2_EXT_DESCS["${br2_name}"]="${br2_desc:-${br2_name}}"
+    eval BR2_EXT_PATHS_${br2_name}="\"\${br2_ext}\""
+    eval BR2_EXT_DESCS_${br2_name}="\"\${br2_desc:-\${br2_name}}\""
 }
 
 # Generate the .mk snippet that defines makefile variables
@@ -117,13 +120,10 @@ do_mk() {
     printf '#\n# Automatically generated file; DO NOT EDIT.\n#\n'
     printf '\n'
 
-    # We can't use ${BR2_EXT_NAMES[@]} directly: it is not guaranteed
-    # to be in the order paths were added (because it is an associative
-    # array). So we need to iterate on BR2_EXT_NAMES, which is sorted
-    # in the order names were added (because it is an indexed array).
     printf 'BR2_EXTERNAL ?='
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        printf ' %s' "${BR2_EXT_PATHS["${br2_name}"]}"
+        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
+        printf ' %s' "${br2_ext}"
     done
     printf '\n'
 
@@ -138,8 +138,8 @@ do_mk() {
     fi
 
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
-        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
+        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
+        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
         printf '\n'
         printf 'BR2_EXTERNAL_NAMES += %s\n' "${br2_name}"
         printf 'BR2_EXTERNAL_DIRS += %s\n' "${br2_ext}"
@@ -165,8 +165,8 @@ do_kconfig() {
     printf '\n'
 
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
-        br2_desc="${BR2_EXT_DESCS["${br2_name}"]}"
-        br2_ext="${BR2_EXT_PATHS["${br2_name}"]}"
+        eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
+        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
         if [ ${#BR2_EXT_NAMES[@]} -gt 1 ]; then
             printf 'menu "%s"\n' "${br2_desc}"
         fi
