From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 13 Jan 2020 16:35:13 +0100
Subject: [Buildroot] [PATCH 1/3] support/scripts/mkusers: allow option for
 system uid/gid
Message-ID: <20200113153516.486106-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend the mkusers script to allow -2 for uid/gid.
This value will take an identifier from the system range.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 support/scripts/mkusers | 49 +++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d00ba33823..1bf1336e48 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -8,6 +8,12 @@ MIN_UID=1000
 MAX_UID=1999
 MIN_GID=1000
 MAX_GID=1999
+# use names from /etc/adduser.conf
+FIRST_SYSTEM_UID=100
+LAST_SYSTEM_UID=999
+FIRST_SYSTEM_GID=100
+LAST_SYSTEM_GID=999
+
 # No more is configurable below this point
 #----------------------------------------------------------------------------
 
@@ -136,9 +142,9 @@ check_user_validity() {
         fail "invalid username '%s\n'" "${username}"
     fi
 
-    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
+    if [ ${gid} -lt -2 -o ${gid} -eq 0 ]; then
         fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
-    elif [ ${gid} -ne -1 ]; then
+    elif [ ${gid} -gt -1 ]; then
         # check the gid is not already used for another group
         if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
             fail "gid '%d' for '%s' is already used by group '%s'\n" \
@@ -162,9 +168,9 @@ check_user_validity() {
         fi
     fi
 
-    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
+    if [ ${uid} -lt -2 -o ${uid} -eq 0 ]; then
         fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
-    elif [ ${uid} -ne -1 ]; then
+    elif [ ${uid} -gt -1 ]; then
         # check the uid is not already used for another user
         if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
             fail "uid '%d' for '%s' already used by user '%s'\n" \
@@ -198,16 +204,18 @@ check_user_validity() {
 #   - not already used by a group
 generate_gid() {
     local group="${1}"
+    local mingid="${2:-$MIN_UID}"
+    local maxgid="${3:-$MAX_UID}"
     local gid
 
     gid="$( get_gid "${group}" )"
     if [ -z "${gid}" ]; then
-        for(( gid=MIN_GID; gid<=MAX_GID; gid++ )); do
+        for(( gid=mingid; gid<=maxgid; gid++ )); do
             if [ -z "$( get_group "${gid}" )" ]; then
                 break
             fi
         done
-        if [ ${gid} -gt ${MAX_GID} ]; then
+        if [ ${gid} -gt ${maxgid} ]; then
             fail "can not allocate a GID for group '%s'\n" "${group}"
         fi
     fi
@@ -222,8 +230,13 @@ add_one_group() {
     local members
 
     # Generate a new GID if needed
-    if [ ${gid} -eq -1 ]; then
-        gid="$( generate_gid "${group}" )"
+    if [ ${gid} -le -1 ]; then
+        if [ ${gid} -eq -1 ]; then
+            gid="$( generate_gid "${group}" )"
+        else
+            gid="$( generate_gid "${group}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
+
+        fi
     fi
 
     members=$(get_members "$group")
@@ -247,16 +260,19 @@ add_one_group() {
 #   - not already used by a user
 generate_uid() {
     local username="${1}"
+    local minuid="${2:-$MIN_UID}"
+    local maxuid="${3:-$MAX_UID}"
+
     local uid
 
     uid="$( get_uid "${username}" )"
     if [ -z "${uid}" ]; then
-        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
+        for(( uid=minuid; uid<=maxuid; uid++ )); do
             if [ -z "$( get_username "${uid}" )" ]; then
                 break
             fi
         done
-        if [ ${uid} -gt ${MAX_UID} ]; then
+        if [ ${uid} -gt ${maxuid} ]; then
             fail "can not allocate a UID for user '%s'\n" "${username}"
         fi
     fi
@@ -307,8 +323,13 @@ add_one_user() {
     check_user_validity "${username}" "${uid}" "${group}" "${gid}"
 
     # Generate a new UID if needed
-    if [ ${uid} -eq -1 ]; then
-        uid="$( generate_uid "${username}" )"
+    if [ ${uid} -le -1 ]; then
+        if [ ${uid} -eq -1 ]; then
+            uid="$( generate_uid "${username}" )"
+        else
+            uid="$( generate_uid "${username}" $FIRST_SYSTEM_UID $LAST_SYSTEM_UID )"
+
+        fi
     fi
 
     # Remove any previous instance of this user
@@ -399,7 +420,7 @@ main() {
     # Then, create all the main groups which gid *is* automatic
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
+        [ ${gid} -le -1 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
 
@@ -433,7 +454,7 @@ main() {
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -eq -1        ] || continue # Non-automatic uid
+        [ ${uid} -le -1        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
     done
-- 
2.24.1
