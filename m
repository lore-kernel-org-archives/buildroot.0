From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Mon, 30 May 2016 08:37:47 +0200
Subject: [Buildroot] [PATCH] mkusers: make it work with mksh
Message-ID: <20160530063747.GD31737@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use mksh as my /bin/sh.
I found that mkusers does not work.
This patch alters the script so that it works with mksh also.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 support/scripts/mkusers | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index e2c24c7..68fda99 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -370,9 +370,9 @@ main() {
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
-    while read line; do
-        LINES+=( "${line}" )
-    done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
+    #while read line; do
+    #    LINES+=( "${line}" )
+    #done < < ( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
     # We first create groups whose gid is not -1, and then we create groups
     # whose gid is -1 (automatic), so that, if a group is defined both with
@@ -380,24 +380,30 @@ main() {
     # used, rather than a different automatic gid is computed.
 
     # First, create all the main groups which gid is *not* automatic
-    for line in "${LINES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -ge 0 ] || continue    # Automatic gid
+    sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" | while 
+        read username uid group gid passwd home shell groups comment; do
+    #for line in "${LINES[@]}"; do
+        #read username uid group gid passwd home shell groups comment <<<"${line}"
+        [ "${gid}" -ge 0 ] || continue    # Automatic gid
         add_one_group "${group}" "${gid}"
     done
 
     # Then, create all the main groups which gid *is* automatic
-    for line in "${LINES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
+    sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" | while 
+        read username uid group gid passwd home shell groups comment; do
+    #for line in "${LINES[@]}"; do
+        #read username uid group gid passwd home shell groups comment <<<"${line}"
+        [ "${gid}" -eq -1 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
 
     # Then, create all the additional groups
     # If any additional group is already a main group, we should use
     # the gid of that main group; otherwise, we can use any gid
-    for line in "${LINES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+    sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" | while
+        read username uid group gid passwd home shell groups comment; do
+    #for line in "${LINES[@]}"; do
+        #read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
             for g in ${groups//,/ }; do
                 add_one_group "${g}" -1
@@ -411,17 +417,22 @@ main() {
     # uid be generated.
 
     # Now, add users whose uid is *not* automatic
-    for line in "${LINES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+    sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" | while
+        read username uid group gid passwd home shell groups comment; do
+
+    #for line in "${LINES[@]}"; do
+        #read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -ge 0         ] || continue # Automatic uid
+        [ "${uid}" -ge 0       ] || continue # Automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
     done
 
     # Finally, add users whose uid *is* automatic
-    for line in "${LINES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+    sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" | while
+        read username uid group gid passwd home shell groups comment; do
+    #for line in "${LINES[@]}"; do
+        #read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
         [ ${uid} -eq -1        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
-- 
1.8.5.rc3
