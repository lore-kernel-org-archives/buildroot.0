Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC77CD128D
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1B1400CF;
	Mon,  1 Apr 2024 18:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FVn695g-pXZP; Mon,  1 Apr 2024 18:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 846614070A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 846614070A;
	Mon,  1 Apr 2024 18:48:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 180591BF28E
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11631406D8
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 18:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShoET4N9505D for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 18:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1123D406D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1123D406D0
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 18:48:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9A6184735; Mon,  1 Apr 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 1 Apr 2024 17:03:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01b3053ceccad2486e25a17af6dfc5039b7eea3e
X-Git-Newrev: 9cb421c16f9aa026eabe050d94664c137f93eff5
X-Patchwork-Hint: ignore
Message-Id: <20240401184812.E9A6184735@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download/check-hash: fix
 shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cb421c16f9aa026eabe050d94664c137f93eff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash files do not use trailing backslash \ to continue lines, so
we don't want them to be interpreted thusly, so we use 'read -r'
(SC2162).

The h_file is used twice in the same loop, once for reading from it,
and once just to print it, so there is no conflict (SC2094).

Integrer variables need not be quoted (SC2086). In any case, should
there be an actual issue and they be set empty, that would cause a
runtime issue, wether they be quoted or not.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore         | 1 -
 support/download/check-hash | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 89814f4e9b..6f4bf67629 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1434,7 +1434,6 @@ support/dependencies/check-host-xzcat.sh Shellcheck
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
