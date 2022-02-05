Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791FBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 22:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BC2581435;
	Sat,  5 Feb 2022 22:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iM7pkcrTBP2P; Sat,  5 Feb 2022 22:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B5981432;
	Sat,  5 Feb 2022 22:10:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 652F81BF2A5
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53BF240544
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 22:10:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zhMRpOSN3E13 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 22:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6EA64028C
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 22:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E60E882952; Sat,  5 Feb 2022 22:03:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 23:09:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f22bff4a79faee5e4501e0f7653c09e6dcf5387e
X-Git-Newrev: 41ea61d59c3e0261673be978bcfc779c8188e43f
X-Patchwork-Hint: ignore
Message-Id: <20220205220301.E60E882952@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/mkusers: allow option for
 system uid/gid
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=41ea61d59c3e0261673be978bcfc779c8188e43f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some software decides based on uid/gid whether a user is a system or
normal (human) user, with different behaviour for those flavors (example
journald [2]).

So adding logic to create system-users is necessary, we take the now
common ranges from [1].

This extends the mkusers script to allow -2 for uid/gid, this argument
will take an identifier from the user range. All identifiers used up to
now should have been from the system range, so -1 is now interpreted as
a system user/group.

Note that after this commit, all the UIDs and GIDs that are created
automatically (with -1) will change. That means if there is peristent
data on an existing system that was created by such an automatic user,
it will suddenly belong to a different user. However, this could already
happen before: if a USERS line is added to a package, then other UIDs
may change as well.

Add system/user ranges as variables, and the argument for user/system
uid variable as well. Thus some magic constants could be removed, some
further occurences of -1 were replaced with equivalent logic. For
consistency, the existing MIN/MAX_UID/GID variables are renamed to
FIRST/LAST_USER_UID/GID.

Update the documentation with the new automatic ranges.

[1] - https://systemd.io/UIDS-GIDS/
[2] - https://www.freedesktop.org/software/systemd/man/journald.conf.html

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Arnout: use -1 for system users; refactor the changes a bit]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/makeusers-syntax.txt | 11 ++++--
 support/scripts/mkusers          | 84 ++++++++++++++++++++++++++--------------
 2 files changed, 63 insertions(+), 32 deletions(-)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 467e596230..3d1013f447 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -20,13 +20,16 @@ Where:
   It can not be +root+, and must be unique. If set to +-+, then just a
   group will be created.
 - +uid+ is the desired UID for the user. It must be unique, and not
-  +0+. If set to +-1+, then a unique UID will be computed by Buildroot
-  in the range [1000...1999]
+  +0+. If set to +-1+ or +-2+, then a unique UID will be computed by
+  Buildroot, with +-1+ denoting a system UID from [100...999] and +-2+
+  denoting a user UID from [1000...1999]. 
 - +group+ is the desired name for the user's main group. It can not
   be +root+. If the group does not exist, it will be created.
 - +gid+ is the desired GID for the user's main group. It must be unique,
-  and not +0+. If set to +-1+, and the group does not already exist, then
-  a unique GID will be computed by Buildroot in the range [1000..1999]
+  and not +0+. If set to +-1+ or +-2+, and the group does not already
+  exist, then a unique GID will be computed by Buildroot, with +-1+
+  denoting a system GID from [100...999] and +-2+ denoting a user GID
+  from [1000...1999]. 
 - +password+ is the crypt(3)-encoded password. If prefixed with +!+,
   then login is disabled. If prefixed with +=+, then it is interpreted
   as clear-text, and will be crypt-encoded (using MD5). If prefixed with
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d00ba33823..4fc06f8fdf 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -4,10 +4,19 @@ myname="${0##*/}"
 
 #----------------------------------------------------------------------------
 # Configurable items
-MIN_UID=1000
-MAX_UID=1999
-MIN_GID=1000
-MAX_GID=1999
+FIRST_USER_UID=1000
+LAST_USER_UID=1999
+FIRST_USER_GID=1000
+LAST_USER_GID=1999
+# use names from /etc/adduser.conf
+FIRST_SYSTEM_UID=100
+LAST_SYSTEM_UID=999
+FIRST_SYSTEM_GID=100
+LAST_SYSTEM_GID=999
+# argument to automatically crease system/user id
+AUTO_SYSTEM_ID=-1
+AUTO_USER_ID=-2
+
 # No more is configurable below this point
 #----------------------------------------------------------------------------
 
@@ -136,9 +145,9 @@ check_user_validity() {
         fail "invalid username '%s\n'" "${username}"
     fi
 
-    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
+    if [ ${gid} -lt -2 -o ${gid} -eq 0 ]; then
         fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
-    elif [ ${gid} -ne -1 ]; then
+    elif [ ${gid} -ge 0 ]; then
         # check the gid is not already used for another group
         if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
             fail "gid '%d' for '%s' is already used by group '%s'\n" \
@@ -162,9 +171,9 @@ check_user_validity() {
         fi
     fi
 
-    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
+    if [ ${uid} -lt -2 -o ${uid} -eq 0 ]; then
         fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
-    elif [ ${uid} -ne -1 ]; then
+    elif [ ${uid} -ge 0 ]; then
         # check the uid is not already used for another user
         if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
             fail "uid '%d' for '%s' already used by user '%s'\n" \
@@ -194,20 +203,22 @@ check_user_validity() {
 # then simply report its current GID. Otherwise, generate the lowest GID
 # that is:
 #   - not 0
-#   - comprised in [MIN_GID..MAX_GID]
+#   - comprised in [$2..$3]
 #   - not already used by a group
 generate_gid() {
     local group="${1}"
+    local mingid="${2}"
+    local maxgid="${3}"
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
@@ -222,8 +233,10 @@ add_one_group() {
     local members
 
     # Generate a new GID if needed
-    if [ ${gid} -eq -1 ]; then
-        gid="$( generate_gid "${group}" )"
+    if [ ${gid} -eq ${AUTO_USER_ID} ]; then
+        gid="$( generate_gid "${group}" $FIRST_USER_GID $LAST_USER_GID )"
+    elif [ ${gid} -eq ${AUTO_SYSTEM_ID} ]; then
+        gid="$( generate_gid "${group}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
     fi
 
     members=$(get_members "$group")
@@ -243,20 +256,23 @@ add_one_group() {
 # then simply report its current UID. Otherwise, generate the lowest UID
 # that is:
 #   - not 0
-#   - comprised in [MIN_UID..MAX_UID]
+#   - comprised in [$2..$3]
 #   - not already used by a user
 generate_uid() {
     local username="${1}"
+    local minuid="${2}"
+    local maxuid="${3}"
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
@@ -307,8 +323,10 @@ add_one_user() {
     check_user_validity "${username}" "${uid}" "${group}" "${gid}"
 
     # Generate a new UID if needed
-    if [ ${uid} -eq -1 ]; then
-        uid="$( generate_uid "${username}" )"
+    if [ ${uid} -eq ${AUTO_USER_ID} ]; then
+        uid="$( generate_uid "${username}" $FIRST_USER_GID $LAST_USER_GID )"
+    elif [ ${uid} -eq ${AUTO_SYSTEM_ID} ]; then
+        uid="$( generate_uid "${username}" $FIRST_SYSTEM_GID $LAST_SYSTEM_GID )"
     fi
 
     # Remove any previous instance of this user
@@ -369,14 +387,15 @@ add_one_user() {
 main() {
     local username uid group gid passwd home shell groups comment
     local line
+    local auto_id
     local -a ENTRIES
 
     # Some sanity checks
-    if [ ${MIN_UID} -le 0 ]; then
-        fail "MIN_UID must be >0 (currently %d)\n" ${MIN_UID}
+    if [ ${FIRST_USER_UID} -le 0 ]; then
+        fail "FIRST_USER_UID must be >0 (currently %d)\n" ${FIRST_USER_UID}
     fi
-    if [ ${MIN_GID} -le 0 ]; then
-        fail "MIN_GID must be >0 (currently %d)\n" ${MIN_GID}
+    if [ ${FIRST_USER_GID} -le 0 ]; then
+        fail "FIRST_USER_GID must be >0 (currently %d)\n" ${FIRST_USER_GID}
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
@@ -384,8 +403,8 @@ main() {
         ENTRIES+=( "${line}" )
     done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
-    # We first create groups whose gid is not -1, and then we create groups
-    # whose gid is -1 (automatic), so that, if a group is defined both with
+    # We first create groups whose gid is positive, and then we create groups
+    # whose gid is automatic, so that, if a group is defined both with
     # a specified gid and an automatic gid, we ensure the specified gid is
     # used, rather than a different automatic gid is computed.
 
@@ -399,18 +418,27 @@ main() {
     # Then, create all the main groups which gid *is* automatic
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
-        [ ${gid} -eq -1 ] || continue    # Non-automatic gid
+        [ ${gid} -lt 0 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
 
     # Then, create all the additional groups
     # If any additional group is already a main group, we should use
-    # the gid of that main group; otherwise, we can use any gid
+    # the gid of that main group; otherwise, we can use any gid - a
+    # system gid if the uid is a system user (<= LAST_SYSTEM_UID),
+    # otherwise a user gid.
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
+            if [ ${uid} -le 0 ]; then
+                auto_id=${uid}
+            elif [ ${uid} -le ${LAST_SYSTEM_UID} ]; then
+                auto_id=${AUTO_SYSTEM_ID}
+            else
+                auto_id=${AUTO_USER_ID}
+            fi
             for g in ${groups//,/ }; do
-                add_one_group "${g}" -1
+                add_one_group "${g}" ${auto_id}
             done
         fi
     done
@@ -433,7 +461,7 @@ main() {
     for line in "${ENTRIES[@]}"; do
         read username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
-        [ ${uid} -eq -1        ] || continue # Non-automatic uid
+        [ ${uid} -lt 0        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
     done
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
