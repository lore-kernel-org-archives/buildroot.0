From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Mar 2017 23:07:20 +0100
Subject: [Buildroot] [PATCH] support/mkusers: rename variable to avoid name
	clashing
Message-ID: <1488578840-11999-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The LINES variable is automatically set by bash to represent the number
of lines in the terminal. That variable can be set when the shell
receives SIGWINCH.

If the shell does receive SIGWINCH after our LINES array is filled, the
content of the array is mangled.

Rename the variable to avoid that.

Fixes #9456

Reported-by: George Y. <georgebrmz@oss3d.com>
Reported-by: Paul Stewart <paulstewartis@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/mkusers | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d834578..2ac76f9 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -359,7 +359,7 @@ add_one_user() {
 main() {
     local username uid group gid passwd home shell groups comment
     local line
-    local -a LINES
+    local -a ENTRIES
 
     # Some sanity checks
     if [ ${MIN_UID} -le 0 ]; then
@@ -371,7 +371,7 @@ main() {
 
     # Read in all the file in memory, exclude empty lines and comments
     while read line; do
-        LINES+=( "${line}" )
+        ENTRIES+=( "${line}" )
     done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
     # We first create groups whose gid is not -1, and then we create groups
@@ -380,14 +380,14 @@ main() {
     # used, rather than a different automatic gid is computed.
 
     # First, create all the main groups which gid is *not* automatic
-    for line in "${LINES[@]}"; do
+    for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ ${gid} -ge 0 ] || continue    # Automatic gid
         add_one_group "${group}" "${gid}"
     done
 
     # Then, create all the main groups which gid *is* automatic
-    for line in "${LINES[@]}"; do
+    for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ ${gid} -eq -1 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
@@ -396,7 +396,7 @@ main() {
     # Then, create all the additional groups
     # If any additional group is already a main group, we should use
     # the gid of that main group; otherwise, we can use any gid
-    for line in "${LINES[@]}"; do
+    for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
             for g in ${groups//,/ }; do
@@ -411,7 +411,7 @@ main() {
     # uid be generated.
 
     # Now, add users whose uid is *not* automatic
-    for line in "${LINES[@]}"; do
+    for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
         [ ${uid} -ge 0         ] || continue # Automatic uid
@@ -420,7 +420,7 @@ main() {
     done
 
     # Finally, add users whose uid *is* automatic
-    for line in "${LINES[@]}"; do
+    for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
         [ ${uid} -eq -1        ] || continue # Non-automatic uid
-- 
2.7.4
