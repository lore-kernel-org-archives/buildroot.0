Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9393EC4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 19:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C6C60635;
	Sun, 28 Apr 2024 19:46:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd0Bki0Vz1Su; Sun, 28 Apr 2024 19:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD5C46071B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD5C46071B;
	Sun, 28 Apr 2024 19:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF6FF1BF3DB
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB7FC606B3
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 19:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WKjWpxRufHB for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6D8E60665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6D8E60665
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9E7D86239; Sun, 28 Apr 2024 19:46:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Apr 2024 21:45:59 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1f46f563465535b748db10863f7fae8b09cc7bbc
X-Git-Newrev: 4a27953e8b679a461713e86bc51a8564ca4aed56
X-Patchwork-Hint: ignore
Message-Id: <20240428194630.B9E7D86239@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/download/check-hash: fix shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=4a27953e8b679a461713e86bc51a8564ca4aed56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The hash files do not use trailing backslash \ to continue lines, so
we don't want them to be interpreted thusly, so we use 'read -r'
(SC2162).

The h_file is used twice in the same loop, once for reading from it,
and once just to print it, so there is no conflict (SC2094).

Integrer variables need not be quoted (SC2086). In any case, should
there be an actual issue and they be set empty, that would cause a
runtime issue, wether they be quoted or not.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9cb421c16f9aa026eabe050d94664c137f93eff5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore         | 1 -
 support/download/check-hash | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 15ddbf8ea7..426aedd476 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1443,7 +1443,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
 support/dependencies/dependencies.sh Shellcheck
 support/download/bzr ConsecutiveEmptyLines Shellcheck
 support/download/cargo-post-process Shellcheck
-support/download/check-hash Shellcheck
 support/download/cvs Shellcheck
 support/download/dl-wrapper Shellcheck
 support/download/file Shellcheck
diff --git a/support/download/check-hash b/support/download/check-hash
index 03a6557187..9db647885a 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -57,7 +57,7 @@ check_one_hash() {
     esac
 
     # Do the hashes match?
-    _hash=$( ${_h}sum "${_file}" |cut -d ' ' -f 1 )
+    _hash="$( "${_h}sum" "${_file}" |cut -d ' ' -f 1 )"
     if [ "${_hash}" = "${_known}" ]; then
         printf "%s: OK (%s: %s)\n" "${base}" "${_h}" "${_hash}"
         return 0
@@ -78,7 +78,8 @@ nb_checks=0
 for h_file in "${h_files[@]}"; do
     [ -f "${h_file}" ] || continue
     : $((nb_h_files++))
-    while read t h f; do
+    # shellcheck disable=SC2094  # we're really reading it only once
+    while read -r t h f; do
         case "${t}" in
             ''|'#'*)
                 # Skip comments and empty lines
@@ -86,6 +87,7 @@ for h_file in "${h_files[@]}"; do
                 ;;
             *)
                 if [ "${f}" = "${base}" ]; then
+                    # shellcheck disable=SC2094  # we're only printing the h_file filename
                     check_one_hash "${t}" "${h}" "${file}" "${h_file}"
                     : $((nb_checks++))
                 fi
@@ -94,11 +96,13 @@ for h_file in "${h_files[@]}"; do
     done <"${h_file}"
 done
 
+# shellcheck disable=SC2086  # nb_h_files is a non-empty int
 if [ ${nb_h_files} -eq 0 ]; then
     printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
 
+# shellcheck disable=SC2086  # nb_checks is a non-empty int
 if [ ${nb_checks} -eq 0 ]; then
     case " ${BR_NO_CHECK_HASH_FOR} " in
     *" ${base} "*)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
