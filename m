From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 13:39:25 +0200
Subject: [Buildroot] [git commit] support/mkusers: enhance error messages
Message-ID: <20150329113930.1EE6B80795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96a8321a3c3edc8f696e14bbd07556582bb5b133
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current error messages are a bit terse, and do not provide all the
required information.

Expand them to provide more context.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Tom Elliott <tommygunsster@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/mkusers |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index b003330..026519e 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -129,47 +129,53 @@ check_user_validity() {
     fi
 
     if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
-        fail "invalid gid '%d'\n" ${gid}
+        fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
     elif [ ${gid} -ne -1 ]; then
         # check the gid is not already used for another group
         if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
-            fail "gid is already used by group '${_group}'\n"
+            fail "gid '%d' for '%s' is already used by group '%s'\n" \
+                 ${gid} "${username}" "${_group}"
         fi
 
         # check the group does not already exists with another gid
         # Need to split the check in two, otherwise '[' complains it
         # is missing arguments when _gid is empty
         if [ -n "${_gid}" ] && [ ${_gid} -ne ${gid} ]; then
-            fail "group already exists with gid '${_gid}'\n"
+            fail "group '%s' for '%s' already exists with gid '%d' (wants '%d')\n" \
+                 "${group}" "${username}" ${_gid} ${gid}
         fi
 
         # check the user does not already exists with another gid
         # Need to split the check in two, otherwise '[' complains it
         # is missing arguments when _ugid is empty
         if [ -n "${_ugid}" ] && [ ${_ugid} -ne ${gid} ]; then
-            fail "user already exists with gid '${_ugid}'\n"
+            fail "user '%s' already exists with gid '%d' (wants '%d')\n" \
+                 "${username}" ${_ugid} ${gid}
         fi
     fi
 
     if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
-        fail "invalid uid '%d'\n" ${uid}
+        fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
     elif [ ${uid} -ne -1 ]; then
         # check the uid is not already used for another user
         if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
-            fail "uid is already used by user '${_username}'\n"
+            fail "uid '%d' for '%s' already used by user '%s'\n" \
+                 ${uid} "${username}" "${_username}"
         fi
 
         # check the user does not already exists with another uid
         # Need to split the check in two, otherwise '[' complains it
         # is missing arguments when _uid is empty
         if [ -n "${_uid}" ] && [ ${_uid} -ne ${uid} ]; then
-            fail "user already exists with uid '${_uid}'\n"
+            fail "user '%s' already exists with uid '%d' (wants '%d')\n" \
+                 "${username}" ${_uid} ${uid}
         fi
     fi
 
     # check the user does not already exist in another group
     if [ -n "${_ugroup}" -a "${_ugroup}" != "${group}" ]; then
-        fail "user already exists with group '${_ugroup}'\n"
+        fail "user '%s' already exists with group '%s' (wants '%s')\n" \
+             "${username}" "${_ugroup}" "${group}"
     fi
 
     return 0
