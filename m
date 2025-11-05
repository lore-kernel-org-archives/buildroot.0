Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B64CCCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 22:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E641741318;
	Wed,  5 Nov 2025 22:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H19rDfYNONtj; Wed,  5 Nov 2025 22:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C9F412EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C9F412EF;
	Wed,  5 Nov 2025 22:30:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A25B00
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 358FA4104F
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vfKYIPhI0XqM for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBE9D4104C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBE9D4104C
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB1FC83DA3; Wed,  5 Nov 2025 22:29:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 23:10:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 151893aa08dc24de9d97cf9acefd20fe7b57abcc
X-Git-Newrev: 4c57c030daaefe429b0a1b331c21266e2e1e500d
X-Patchwork-Hint: ignore
Message-Id: <20251105222949.AB1FC83DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts: comonalise checking
 merged status
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c57c030daaefe429b0a1b331c21266e2e1e500d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than repeat the same canned sequence over and over again, move it
to a function that we can reuse as many times as needed. This will come
handy when we later need to check merged-bin.

Switch to using bash as it allows for nicer functions (local variables),
but we anyway require it globally already so that's not an additional
dependency.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/check-merged-usr.sh | 46 +++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index 433857cd8c..ed0c58e9b7 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/usr/bin/env bash
 #
 # Check if a given custom skeleton or overlay complies to the merged /usr
 # requirements:
@@ -10,30 +10,36 @@
 # /usr/lib/
 # /usr/sbin/
 #
-# Output: the list of non-compliant paths (empty if compliant).
+# Input:
+#   $1:     the root directory (skeleton, overlay) to check
+# Output:
+#   stdout: the list of non-compliant paths (empty if compliant).
 #
 
+# The directory to check for merged-usr
+root="${1}"
+
 # Extract the inode numbers for all of those directories. In case any is
 # a symlink, we want to get the inode of the pointed-to directory, so we
 # append '/.' to be sure we get the target directory. Since the symlinks
 # can be anyway (/bin -> /usr/bin or /usr/bin -> /bin), we do that for
-# all of them.
+# each of them.
 #
-lib_inode=$(stat -c '%i' "${1}/lib/." 2>/dev/null)
-bin_inode=$(stat -c '%i' "${1}/bin/." 2>/dev/null)
-sbin_inode=$(stat -c '%i' "${1}/sbin/." 2>/dev/null)
-usr_lib_inode=$(stat -c '%i' "${1}/usr/lib/." 2>/dev/null)
-usr_bin_inode=$(stat -c '%i' "${1}/usr/bin/." 2>/dev/null)
-usr_sbin_inode=$(stat -c '%i' "${1}/usr/sbin/." 2>/dev/null)
 
-not_merged_dirs=""
-test -z "$lib_inode" || \
-	test "$lib_inode" = "$usr_lib_inode" || \
-		not_merged_dirs="/lib"
-test -z "$bin_inode" || \
-	test "$bin_inode" = "$usr_bin_inode" || \
-		not_merged_dirs="$not_merged_dirs /bin"
-test -z "$sbin_inode" || \
-	test "$sbin_inode" = "$usr_sbin_inode" || \
-		not_merged_dirs="$not_merged_dirs /sbin"
-echo "${not_merged_dirs# }"
+test_merged() {
+	local root="${1}"
+	local dir1="${2}"
+	local dir2="${3}"
+	local inode1 inode2
+
+	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
+	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
+
+	test -z "${inode1}" || \
+		test "${inode1}" = "${inode2}" || \
+			printf '%s\n' "${dir1}"
+}
+
+test_merged "${root}" "/lib" "/usr/lib"
+test_merged "${root}" "/bin" "/usr/bin"
+test_merged "${root}" "/sbin" "/usr/sbin"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
