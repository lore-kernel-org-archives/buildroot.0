Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4DEC531DC
	for <buildroot@archiver.kernel.org>; Tue, 20 Aug 2024 17:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBC5F409E5;
	Tue, 20 Aug 2024 17:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPkHAlVzebav; Tue, 20 Aug 2024 17:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57A7D40B28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57A7D40B28;
	Tue, 20 Aug 2024 17:21:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1CE01BF37C
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E0EF608FA
 for <buildroot@lists.busybox.net>; Tue, 20 Aug 2024 17:21:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuDCKU8N20zk for <buildroot@lists.busybox.net>;
 Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 882A5608FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 882A5608FC
 for <buildroot@buildroot.org>; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 391ED8614C; Tue, 20 Aug 2024 17:21:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Aug 2024 19:20:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 11f75a23099835ac6c59416f6b83e797240e0da7
X-Git-Newrev: 145e8e74068207a89088d716de4dac9264ed62ca
X-Patchwork-Hint: ignore
Message-Id: <20240820172121.391ED8614C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/download/check-hash: accept hash files without terminating \n
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

commit: https://git.buildroot.net/buildroot/commit/?id=145e8e74068207a89088d716de4dac9264ed62ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Lots of people are using broken text editors that 1. do not naturally
terminate text files with a final \n as is customary in UNIX text files,
and 2. do not respect our .editorconfig settings, which explicitly
require adding that final newline. See this nice summary of what a text
file is (with references to applicable standards):

    https://stackoverflow.com/questions/12916352/shell-script-read-missing-last-line/12916758#12916758

So, it is not surprising that read does not read the last "line" of a
file, when said "line" does not end with a newline, because it is thus
not really a line.

Even though we do mandate actual text files, let's be a little bit lax
in this respect, because people may write packages, and their hash
files, in a br2-external tree, and they may not have our .editorconfig
in the directory heierarchy (e.g. if buildroot is a submodule of their
br2-external tree, or whatever).

mapfile does not suffer from this limitation, though, and correctly
reads all lines from a file, even the final line-that-is-not-a-line.

mapfile was introduced in bash 4.0, released on 2009-01-20, more than
15 years ago. Debian squeeze, released in 2011 already had bash 4.1.
Those are really ancient. So, it means we can indeed expect bash
version 4.0 or later; which means mapfile is available.

"It should be fine!"

Fixes: #15976

Reported-by: masonwardle@gmail.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ac2e6b392791085bc29fa21901265a8eed4ae0ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/check-hash | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index 9db647885a..d18ec8b134 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -78,8 +78,10 @@ nb_checks=0
 for h_file in "${h_files[@]}"; do
     [ -f "${h_file}" ] || continue
     : $((nb_h_files++))
-    # shellcheck disable=SC2094  # we're really reading it only once
-    while read -r t h f; do
+    # mapfile reads all lines, even the last one if it is missing a \n
+    mapfile -t hash_lines <"${h_file}"
+    for hash_line in "${hash_lines[@]}"; do
+        read -r t h f <<<"${hash_line}"
         case "${t}" in
             ''|'#'*)
                 # Skip comments and empty lines
@@ -87,13 +89,12 @@ for h_file in "${h_files[@]}"; do
                 ;;
             *)
                 if [ "${f}" = "${base}" ]; then
-                    # shellcheck disable=SC2094  # we're only printing the h_file filename
                     check_one_hash "${t}" "${h}" "${file}" "${h_file}"
                     : $((nb_checks++))
                 fi
                 ;;
         esac
-    done <"${h_file}"
+    done
 done
 
 # shellcheck disable=SC2086  # nb_h_files is a non-empty int
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
