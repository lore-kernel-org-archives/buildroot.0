Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329E2C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 004C1606EC;
	Sun, 28 Apr 2024 19:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaeaZmn4g-_V; Sun, 28 Apr 2024 19:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C056076D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C056076D;
	Sun, 28 Apr 2024 19:47:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BEC8B1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC4F81F71
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpCXgpOYqtj5 for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B411B81F8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B411B81F8A
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEE7A86234; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 21:44:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 96987026159c38af566d7f19d9b9bcf1c96cec97
X-Git-Newrev: 1f46f563465535b748db10863f7fae8b09cc7bbc
X-Patchwork-Hint: ignore
Message-Id: <20240428194630.AEE7A86234@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/scripts/mkusers:
 fix shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f46f563465535b748db10863f7fae8b09cc7bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

the user tables do not use trailing backslash \ to continue lines,
so we don't want them to be interpreted thusly, so we use 'read -r'
(SC2162).

Integer variables need not be quoted (SC2086). In any case, should
there be an actual issue and they be set empty, that would cause a
runtime issue, wether they be quoted or not.

The binary -o and -a ar perfectly defined in bash's test (SC2166).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 01b3053ceccad2486e25a17af6dfc5039b7eea3e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore     |  1 -
 support/scripts/mkusers | 27 +++++++++++++++++++++------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 829fd7d0f1..15ddbf8ea7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1466,7 +1466,6 @@ support/scripts/expunge-gconv-modules Shellcheck
 support/scripts/fix-configure-powerpc64.sh EmptyLastLine
 support/scripts/generate-gitlab-ci-yml Shellcheck
 support/scripts/mkmakefile ConsecutiveEmptyLines Shellcheck
-support/scripts/mkusers Shellcheck
 support/scripts/setlocalversion Shellcheck
 support/testing/tests/core/post-build.sh Shellcheck
 support/testing/tests/package/test_opkg/post-build.sh Shellcheck
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index d786943cf8..ee09bbd1f2 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -26,6 +26,7 @@ error() {
     shift
 
     printf "%s: " "${myname}" >&2
+    # shellcheck disable=SC2059  # fmt is the format passed to error()
     printf "${fmt}" "${@}" >&2
 }
 fail() {
@@ -145,6 +146,8 @@ check_user_validity() {
         fail "invalid username '%s\n'" "${username}"
     fi
 
+    # shellcheck disable=SC2086  # gid is a non-empty int
+    # shellcheck disable=SC2166  # [ .. -o .. ] works well in this case
     if [ ${gid} -lt -2 -o ${gid} -eq 0 ]; then
         fail "invalid gid '%d' for '%s'\n" ${gid} "${username}"
     elif [ ${gid} -ge 0 ]; then
@@ -171,6 +174,8 @@ check_user_validity() {
         fi
     fi
 
+    # shellcheck disable=SC2086  # uid is a non-empty int
+    # shellcheck disable=SC2166  # [ .. -o .. ] works well in this case
     if [ ${uid} -lt -2 -o ${uid} -eq 0 ]; then
         fail "invalid uid '%d' for '%s'\n" ${uid} "${username}"
     elif [ ${uid} -ge 0 ]; then
@@ -190,6 +195,7 @@ check_user_validity() {
     fi
 
     # check the user does not already exist in another group
+    # shellcheck disable=SC2166  # [ .. -a .. ] works well in this case
     if [ -n "${_ugroup}" -a "${_ugroup}" != "${group}" ]; then
         fail "user '%s' already exists with group '%s' (wants '%s')\n" \
              "${username}" "${_ugroup}" "${group}"
@@ -218,6 +224,7 @@ generate_gid() {
                 break
             fi
         done
+        # shellcheck disable=SC2086  # gid and maxgid are non-empty ints
         if [ ${gid} -gt ${maxgid} ]; then
             fail "can not allocate a GID for group '%s'\n" "${group}"
         fi
@@ -233,6 +240,7 @@ add_one_group() {
     local members
 
     # Generate a new GID if needed
+    # shellcheck disable=SC2086  # gid is a non-empty int
     if [ ${gid} -eq ${AUTO_USER_ID} ]; then
         gid="$( generate_gid "${group}" $FIRST_USER_GID $LAST_USER_GID )"
     elif [ ${gid} -eq ${AUTO_SYSTEM_ID} ]; then
@@ -272,6 +280,7 @@ generate_uid() {
                 break
             fi
         done
+        # shellcheck disable=SC2086  # uid is a non-empty int
         if [ ${uid} -gt ${maxuid} ]; then
             fail "can not allocate a UID for user '%s'\n" "${username}"
         fi
@@ -323,6 +332,7 @@ add_one_user() {
     check_user_validity "${username}" "${uid}" "${group}" "${gid}"
 
     # Generate a new UID if needed
+    # shellcheck disable=SC2086  # uid is a non-empty int
     if [ ${uid} -eq ${AUTO_USER_ID} ]; then
         uid="$( generate_uid "${username}" $FIRST_USER_UID $LAST_USER_UID )"
     elif [ ${uid} -eq ${AUTO_SYSTEM_ID} ]; then
@@ -399,7 +409,7 @@ main() {
     fi
 
     # Read in all the file in memory, exclude empty lines and comments
-    while read line; do
+    while read -r line; do
         ENTRIES+=( "${line}" )
     done < <( sed -r -e 's/#.*//; /^[[:space:]]*$/d;' "${USERS_TABLE}" )
 
@@ -410,14 +420,16 @@ main() {
 
     # First, create all the main groups which gid is *not* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
+        # shellcheck disable=SC2086  # gid is a non-empty int
         [ ${gid} -ge 0 ] || continue    # Automatic gid
         add_one_group "${group}" "${gid}"
     done
 
     # Then, create all the main groups which gid *is* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
+        # shellcheck disable=SC2086  # gid is a non-empty int
         [ ${gid} -lt 0 ] || continue    # Non-automatic gid
         add_one_group "${group}" "${gid}"
     done
@@ -428,8 +440,9 @@ main() {
     # system gid if the uid is a system user (<= LAST_SYSTEM_UID),
     # otherwise a user gid.
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
         if [ "${groups}" != "-" ]; then
+            # shellcheck disable=SC2086  # uid is a non-empty int
             if [ ${uid} -le 0 ]; then
                 auto_id=${uid}
             elif [ ${uid} -le ${LAST_SYSTEM_UID} ]; then
@@ -450,8 +463,9 @@ main() {
 
     # Now, add users whose uid is *not* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
+        # shellcheck disable=SC2086  # uid is a non-empty int
         [ ${uid} -ge 0         ] || continue # Automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
@@ -459,8 +473,9 @@ main() {
 
     # Finally, add users whose uid *is* automatic
     for line in "${ENTRIES[@]}"; do
-        read username uid group gid passwd home shell groups comment <<<"${line}"
+        read -r username uid group gid passwd home shell groups comment <<<"${line}"
         [ "${username}" != "-" ] || continue # Magic string to skip user creation
+        # shellcheck disable=SC2086  # uid is a non-empty int
         [ ${uid} -lt 0        ] || continue # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
