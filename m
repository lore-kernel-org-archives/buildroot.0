From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:52:21 +0200
Subject: [Buildroot] [git commit] support/mkusers: allow comments in users
	tables
Message-ID: <20151018155436.553127FE25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0c4456530b60e5b5119e74eb52c50cd7317792d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The format of the users table files is non trivial, so it is sometimes
handy to add comments explaining the syntax (or simply the reason for
the user) inline in the files.

Ignore empty lines and comment lines prefixed with '#' similar to shell
or makedevs files.

Packages that defined no user (the vast majority) would cause an empty
line to be present in the internal users table, hence the reason we
skipped empty usernames. Now that we ignore empty lines, we no longer
need to check for empty usernames.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/mkusers |   45 ++++++++++++++++++++++++++-------------------
 1 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 9c5c4dc..e2c24c7 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -358,6 +358,8 @@ add_one_user() {
 #----------------------------------------------------------------------------
 main() {
     local username uid group gid passwd home shell groups comment
+    local line
+    local -a LINES
 
     # Some sanity checks
     if [ ${MIN_UID} -le 0 ]; then
@@ -367,36 +369,41 @@ main() {
         fail "MIN_GID must be >0 (currently %d)\n" ${MIN_GID}
     fi
 
+    # Read in all the file in memory, exclude empty lines and comments
+    while read line; do
+        LINES+=( "${line}" )
+    done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
+
     # We first create groups whose gid is not -1, and then we create groups
     # whose gid is -1 (automatic), so that, if a group is defined both with
     # a specified gid and an automatic gid, we ensure the specified gid is
     # used, rather than a different automatic gid is computed.
 
     # First, create all the main groups which gid is *not* automatic
-    while read username uid group gid passwd home shell groups comment; do
-        [ -n "${username}" ] || continue    # Package with no user
-        [ ${gid} -ge 0     ] || continue    # Automatic gid
+    for line in "${LINES[@]}"; do
+        read username uid group gid passwd home shell groups comment <<<"${line}"
+        [ ${gid} -ge 0 ] || continue    # Automatic gid
         add_one_group "${group}" "${gid}"
-    done <"${USERS_TABLE}"
+    done
 
     # Then, create all the main groups which gid *is* automatic
-    while read username uid group gid passwd home shell groups comment; do
-        [ -n "${username}" ] || continue    # Package with no user
-        [ ${gid} -eq -1    ] || continue    # Non-automatic gid
+    for line in "${LINES[@]}"; do
+        read username uid group gid passwd home shell groups comment <<<"${line}"
+        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
-    done <"${USERS_TABLE}"
+    done
 
     # Then, create all the additional groups
     # If any additional group is already a main group, we should use
     # the gid of that main group; otherwise, we can use any gid
-    while read username uid group gid passwd home shell groups comment; do
-        [ -n "${username}" ] || continue    # Package with no user
+    for line in "${LINES[@]}"; do
+        read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
             for g in ${groups//,/ }; do
                 add_one_group "${g}" -1
             done
         fi
-    done <"${USERS_TABLE}"
+    done
 
     # When adding users, we do as for groups, in case two packages create
     # the same user, one with an automatic uid, the other with a specified
@@ -404,22 +411,22 @@ main() {
     # uid be generated.
 
     # Now, add users whose uid is *not* automatic
-    while read username uid group gid passwd home shell groups comment; do
-        [ -n "${username}" ] || continue    # Package with no user
+    for line in "${LINES[@]}"; do
+        read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -ge 0     ] || continue    # Automatic uid
+        [ ${uid} -ge 0         ] || continue # Automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
-    done <"${USERS_TABLE}"
+    done
 
     # Finally, add users whose uid *is* automatic
-    while read username uid group gid passwd home shell groups comment; do
-        [ -n "${username}" ] || continue    # Package with no user
+    for line in "${LINES[@]}"; do
+        read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -eq -1    ] || continue    # Non-automatic uid
+        [ ${uid} -eq -1        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
-    done <"${USERS_TABLE}"
+    done
 }
 
 #----------------------------------------------------------------------------
