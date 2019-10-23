From: Stephan Henningsen <stephan@asklandd.dk>
Date: Wed, 23 Oct 2019 23:13:13 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts: added support for system
 and normal uid/gid.
Message-ID: <20191023211313.6758-1-stephan+buildroot@asklandd.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stephan Henningsen <stephan+buildroot@asklandd.dk>
---
 docs/manual/makeusers-syntax.txt |  18 +--
 support/scripts/mkusers          | 196 ++++++++++++++++++++++++-------
 2 files changed, 162 insertions(+), 52 deletions(-)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 467e596230..2c57df1a13 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -20,13 +20,17 @@ Where:
   It can not be +root+, and must be unique. If set to +-+, then just a
   group will be created.
 - +uid+ is the desired UID for the user. It must be unique, and not
-  +0+. If set to +-1+, then a unique UID will be computed by Buildroot
-  in the range [1000...1999]
+  +0+. If set to +-1+, then a unique systen UID will be computed by
+  Buildroot in the range [100...499].  If set to +-2+, then a unique
+  normal UID will be computed by Buildroot in the range [1000...1999]
 - +group+ is the desired name for the user's main group. It can not
   be +root+. If the group does not exist, it will be created.
 - +gid+ is the desired GID for the user's main group. It must be unique,
   and not +0+. If set to +-1+, and the group does not already exist, then
-  a unique GID will be computed by Buildroot in the range [1000..1999]
+  a unique system GID will be computed by Buildroot in the range
+  [100..499].  If set to +-2+, and the group does not already exist,
+  then a unique normal GID will be computed by Buildroot in the range
+  [1000..1999].
 - +password+ is the crypt(3)-encoded password. If prefixed with +!+,
   then login is disabled. If prefixed with +=+, then it is interpreted
   as clear-text, and will be crypt-encoded (using MD5). If prefixed with
@@ -57,16 +61,16 @@ will belong to the user and its main group.
 Examples:
 
 ----
-foo -1 bar -1 !=blabla /home/foo /bin/sh alpha,bravo Foo user
+foo -1 bar -1 !=secret123 /home/foo /bin/sh alpha,bravo Foo user
 ----
 
 This will create this user:
 
 - +username+ (aka login name) is: +foo+
-- +uid+ is computed by Buildroot
+- +uid+ is a system uid computed by Buildroot
 - main +group+ is: +bar+
-- main group +gid+ is computed by Buildroot
-- clear-text +password+ is: +blabla+, will be crypt(3)-encoded, and login is disabled.
+- main group +gid+ is a system uid computed by Buildroot
+- clear-text +password+ is: +secret123+, will be crypt(3)-encoded, and login is disabled.
 - +home+ is: +/home/foo+
 - +shell+ is: +/bin/sh+
 - +foo+ is also a member of +groups+: +alpha+ and +bravo+
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d00ba33823..ff13e81160 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -4,10 +4,25 @@ myname="${0##*/}"
 
 #----------------------------------------------------------------------------
 # Configurable items
-MIN_UID=1000
-MAX_UID=1999
-MIN_GID=1000
-MAX_GID=1999
+NEW_SYSTEM_UID=-1
+NEW_SYSTEM_GID=-1
+
+MIN_SYSTEM_UID=100
+MAX_SYSTEM_UID=499
+MIN_SYSTEM_GID=100
+MAX_SYSTEM_GID=499
+
+NEW_NORMAL_UID=-2
+NEW_NORMAL_GID=-2
+
+MIN_NORMAL_UID=1000
+MAX_NORMAL_UID=1999
+MIN_NORMAL_GID=1000
+MAX_NORMAL_GID=1999
+
+MIN_UID=-2
+MIN_GID=-2
+
 # No more is configurable below this point
 #----------------------------------------------------------------------------
 
@@ -19,11 +34,19 @@ error() {
     printf "%s: " "${myname}" >&2
     printf "${fmt}" "${@}" >&2
 }
+
 fail() {
     error "$@"
     exit 1
 }
 
+# Verbose debugging, enable with e.g.: V=1 make
+v() {
+    if [ -n "${V}" ] && [ ${V} -ge 1 ]; then
+        printf "${@}\\n" >&2
+    fi
+}
+
 #----------------------------------------------------------------------------
 if [ ${#} -ne 2 ]; then
     fail "usage: %s USERS_TABLE TARGET_DIR\n"
@@ -125,6 +148,8 @@ check_user_validity() {
     local gid="${4}"
     local _uid _ugid _gid _username _group _ugroup
 
+    v "check_user_validity: username=$username, uid=$uid, group=$group, gid=$gid"
+
     _group="$( get_group "${gid}" )"
     _gid="$( get_gid "${group}" )"
     _ugid="$( get_ugid "${username}" )"
@@ -132,13 +157,15 @@ check_user_validity() {
     _uid="$( get_uid "${username}" )"
     _ugroup="$( get_ugroup "${username}" )"
 
+    v "... _group=$_group, _gid=$_gid, _ugid=$_ugid, _uid=$_uid, _username=$_username, _ugroup=$_ugroup"
+
     if [ "${username}" = "root" ]; then
         fail "invalid username '%s\n'" "${username}"
     fi
 
-    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
+    if [ ${gid} -lt ${MIN_GID} -o ${gid} -eq 0 ]; then
         fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
-    elif [ ${gid} -ne -1 ]; then
+    elif [ ${gid} -ne ${NEW_NORMAL_GID} -a ${gid} -ne ${NEW_SYSTEM_GID} ]; then
         # check the gid is not already used for another group
         if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
             fail "gid '%d' for '%s' is already used by group '%s'\n" \
@@ -149,7 +176,7 @@ check_user_validity() {
         # Need to split the check in two, otherwise '[' complains it
         # is missing arguments when _gid is empty
         if [ -n "${_gid}" ] && [ ${_gid} -ne ${gid} ]; then
-            fail "group '%s' for '%s' already exists with gid '%d' (wants '%d')\n" \
+            fail "group '%s' for user '%s' already exists with gid '%d' (wants '%d')\n" \
                  "${group}" "${username}" ${_gid} ${gid}
         fi
 
@@ -162,9 +189,9 @@ check_user_validity() {
         fi
     fi
 
-    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
+    if [ ${uid} -lt ${MIN_UID} -o ${uid} -eq 0 ]; then
         fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
-    elif [ ${uid} -ne -1 ]; then
+    elif [ ${uid} -ne ${NEW_NORMAL_UID} -o ${uid} -ne ${NEW_SYSTEM_UID} ]; then
         # check the uid is not already used for another user
         if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
             fail "uid '%d' for '%s' already used by user '%s'\n" \
@@ -190,30 +217,56 @@ check_user_validity() {
 }
 
 #----------------------------------------------------------------------------
-# Generate a unique GID for given group. If the group already exists,
-# then simply report its current GID. Otherwise, generate the lowest GID
-# that is:
+# Generate a unique *normal* GID for given group. If the group already
+# exists, then simply report its current GID. Otherwise, generate the lowest
+# GID that is:
+#   - not 0
+#   - comprised in [MIN_NORMAL_GID..MAX_NORMAL_GID]
+#   - not already used by a group
+generate_normal_gid() {
+    local group="${1}"
+    local gid
+
+    gid="$( get_gid "${group}" )"
+    if [ -z "${gid}" ]; then
+        for(( gid=MIN_NORMAL_GID; gid<=MAX_NORMAL_GID; gid++ )); do
+            if [ -z "$( get_group "${gid}" )" ]; then
+                break
+            fi
+        done
+        if [ ${gid} -gt ${MAX_NORMAL_GID} ]; then
+            fail "can not allocate a GID for normal group '%s'\n" "${group}"
+        fi
+    fi
+    printf "%d\n" "${gid}"
+}
+
+#----------------------------------------------------------------------------
+# Generate a unique *system* GID for given group. If the group already
+# exists, then simply report its current GID. Otherwise, generate the lowest
+# GID that is:
 #   - not 0
-#   - comprised in [MIN_GID..MAX_GID]
+#   - comprised in [MIN_SYSTEM_GID..MAX_SYSTEM_GID]
 #   - not already used by a group
-generate_gid() {
+generate_system_gid() {
     local group="${1}"
     local gid
 
     gid="$( get_gid "${group}" )"
     if [ -z "${gid}" ]; then
-        for(( gid=MIN_GID; gid<=MAX_GID; gid++ )); do
+        for(( gid=MIN_SYSTEM_GID; gid<=MAX_SYSTEM_GID; gid++ )); do
             if [ -z "$( get_group "${gid}" )" ]; then
                 break
             fi
         done
-        if [ ${gid} -gt ${MAX_GID} ]; then
-            fail "can not allocate a GID for group '%s'\n" "${group}"
+        if [ ${gid} -gt ${MAX_SYSTEM_GID} ]; then
+            fail "can not allocate a GID for system group '%s'\n" "${group}"
         fi
     fi
     printf "%d\n" "${gid}"
 }
 
+
 #----------------------------------------------------------------------------
 # Add a group; if it does already exist, remove it first
 add_one_group() {
@@ -221,11 +274,17 @@ add_one_group() {
     local gid="${2}"
     local members
 
+    v "add_one_group: group=$group, gid=$gid"
+
     # Generate a new GID if needed
-    if [ ${gid} -eq -1 ]; then
-        gid="$( generate_gid "${group}" )"
+    if [ ${gid} -eq ${NEW_NORMAL_GID} ]; then
+        gid="$( generate_normal_gid "${group}" )"
+    elif [ ${gid} -eq ${NEW_SYSTEM_GID} ]; then
+        gid="$( generate_system_gid "${group}" )"
     fi
 
+    v "...gid=$gid"
+
     members=$(get_members "$group")
     # Remove any previous instance of this group, and re-add the new one
     sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GROUP}"
@@ -239,25 +298,50 @@ add_one_group() {
 }
 
 #----------------------------------------------------------------------------
-# Generate a unique UID for given username. If the username already exists,
-# then simply report its current UID. Otherwise, generate the lowest UID
-# that is:
+# Generate a unique *normal* UID for given username. If the username already
+# exists then simply report its current UID. Otherwise, generate the lowest
+# UID that is:
+#   - not 0
+#   - comprised in [MIN_NORMAL_UID..MAX_NORMAL_UID]
+#   - not already used by a user
+generate_normal_uid() {
+    local username="${1}"
+    local uid
+
+    uid="$( get_uid "${username}" )"
+    if [ -z "${uid}" ]; then
+        for(( uid=MIN_NORMAL_UID; uid<=MAX_NORMAL_UID; uid++ )); do
+            if [ -z "$( get_username "${uid}" )" ]; then
+                break
+            fi
+        done
+        if [ ${uid} -gt ${MAX_NORMAL_UID} ]; then
+            fail "can not allocate a UID for normal user '%s'\n" "${username}"
+        fi
+    fi
+    printf "%d\n" "${uid}"
+}
+
+#----------------------------------------------------------------------------
+# Generate a unique *system* UID for given username. If the username already
+# exists then simply report its current UID. Otherwise, generate the lowest
+# UID that is:
 #   - not 0
-#   - comprised in [MIN_UID..MAX_UID]
+#   - comprised in [MIN_SYSTEM_UID..MAX_SYSTEM_UID]
 #   - not already used by a user
-generate_uid() {
+generate_system_uid() {
     local username="${1}"
     local uid
 
     uid="$( get_uid "${username}" )"
     if [ -z "${uid}" ]; then
-        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
+        for(( uid=MIN_SYSTEM_UID; uid<=MAX_SYSTEM_UID; uid++ )); do
             if [ -z "$( get_username "${uid}" )" ]; then
                 break
             fi
         done
-        if [ ${uid} -gt ${MAX_UID} ]; then
-            fail "can not allocate a UID for user '%s'\n" "${username}"
+        if [ ${uid} -gt ${MAX_SYSTEM_UID} ]; then
+            fail "can not allocate a UID for system user '%s'\n" "${username}"
         fi
     fi
     printf "%d\n" "${uid}"
@@ -303,12 +387,16 @@ add_one_user() {
     local comment="${9}"
     local _f _group _home _shell _gid _passwd
 
+    v "add_one_user: username=$username, uid=$uid, group=$group, gid=$gid, groups=$groups"
+
     # First, sanity-check the user
     check_user_validity "${username}" "${uid}" "${group}" "${gid}"
 
     # Generate a new UID if needed
-    if [ ${uid} -eq -1 ]; then
-        uid="$( generate_uid "${username}" )"
+    if [ ${uid} -eq ${NEW_NORMAL_UID} ]; then
+        uid="$( generate_normal_uid "${username}" )"
+    elif [ ${uid} -eq ${NEW_SYSTEM_UID} ]; then
+        uid="$( generate_system_uid "${username}" )"
     fi
 
     # Remove any previous instance of this user
@@ -372,11 +460,18 @@ main() {
     local -a ENTRIES
 
     # Some sanity checks
-    if [ ${MIN_UID} -le 0 ]; then
-        fail "MIN_UID must be >0 (currently %d)\n" ${MIN_UID}
+    if [ ${MIN_NORMAL_UID} -le 0 ]; then
+        fail "MIN_NORMAL_UID must be >0 (currently %d)\n" ${MIN_NORMAL_UID}
+    fi
+    if [ ${MIN_NORMAL_GID} -le 0 ]; then
+        fail "MIN_NORMAL_GID must be >0 (currently %d)\n" ${MIN_NORMAL_GID}
+    fi
+
+    if [ ${MIN_SYSTEM_UID} -le 0 ]; then
+        fail "MIN_SYSTEM_UID must be >0 (currently %d)\n" ${MIN_SYSTEM_UID}
     fi
-    if [ ${MIN_GID} -le 0 ]; then
-        fail "MIN_GID must be >0 (currently %d)\n" ${MIN_GID}
+    if [ ${MIN_SYSTEM_GID} -le 0 ]; then
+        fail "MIN_SYSTEM_GID must be >0 (currently %d)\n" ${MIN_SYSTEM_GID}
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
@@ -384,33 +479,44 @@ main() {
         ENTRIES+=( "${line}" )
     done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
-    # We first create groups whose gid is not -1, and then we create groups
-    # whose gid is -1 (automatic), so that, if a group is defined both with
-    # a specified gid and an automatic gid, we ensure the specified gid is
-    # used, rather than a different automatic gid is computed.
+    # We first create groups whose gid is specific (not ANY_*_GID),
+    # and then we create groups whose gid is automatic (is ANY_*_GID,
+    # so that, if a group is defined both with a specified gid and an
+    # automatic gid, we ensure the specified gid is used, rather than
+    # a different automatic gid is computed.
 
-    # First, create all the main groups which gid is *not* automatic
+    # First, create all the main groups where gid is *specific*.
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -ge 0 ] || continue    # Automatic gid
+        [ ${gid} -ge 0 ] || continue # Automatic gid
         add_one_group "${group}" "${gid}"
     done
 
-    # Then, create all the main groups which gid *is* automatic
+    # Then, create all the main groups where gid is *automatic*.
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
+        [ ${gid} -eq ${NEW_NORMAL_GID} -o ${gid} -eq ${NEW_SYSTEM_GID} ] || continue # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
 
-    # Then, create all the additional groups
+    # Then, create all the additional groups.
     # If any additional group is already a main group, we should use
-    # the gid of that main group; otherwise, we can use any gid
+    # the gid of that main group; otherwise, we create a normal or system gid, see below.
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
             for g in ${groups//,/ }; do
-                add_one_group "${g}" -1
+                # If the uid or gid is already a system uid or gid, then create a system gid too;
+                # otherwise create normal gid
+                if [ ${uid} -eq ${NEW_SYSTEM_GID} -o ${gid} -eq ${NEW_SYSTEM_GID} ]; then
+                    v "creating system group, uid=$uid, gid=$gid"
+                    gid=${NEW_SYSTEM_GID}
+                else
+                    v "creating normal group, uid=$uid, gid=$gid"
+                    gid=${NEW_NORMAL_GID}
+                fi
+
+                add_one_group "${g}" ${gid}
             done
         fi
     done
@@ -433,7 +539,7 @@ main() {
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -eq -1        ] || continue # Non-automatic uid
+        [ ${uid} -eq ${NEW_NORMAL_UID} -o ${uid} -eq ${NEW_SYSTEM_UID} ] || continue # Non-automatic gid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
     done
-- 
2.17.1
