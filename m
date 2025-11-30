Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCD2CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 17:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09AC56072B;
	Sun, 30 Nov 2025 17:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3OeHybJjUN46; Sun, 30 Nov 2025 17:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218766072E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218766072E;
	Sun, 30 Nov 2025 17:08:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 16261219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0D1B40A92
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljxwfbtiDYOl for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2E140A88
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C2E140A88
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27F6B86269; Sun, 30 Nov 2025 17:08:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 18:05:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b871105790e071edee40fe51d76a83fa1c285540
X-Git-Newrev: 92da94bf213cd8d0b0586770ec2db471976138cb
X-Patchwork-Hint: ignore
Message-Id: <20251130170815.27F6B86269@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/check-merged: fix checking
 custom skeletons
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1063956066580177310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1063956066580177310==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=92da94bf213cd8d0b0586770ec2db471976138cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a custom skeleton where the merged symlinks are missing,
the build fails with errors like:

    support/scripts/check-merged -t skeleton -u -b /usr/src/simplek8s/rootfs-skeleton
    The skeleton in -t is not properly setup:
    - /usr/bin should exist, be a directory, and not be a symlink
    - /usr/lib should exist, be a directory, and not be a symlink
    The skeleton in skeleton is not properly setup:
    - /usr/bin should exist, be a directory, and not be a symlink
    - /usr/lib should exist, be a directory, and not be a symlink
    [...]

Commit 793ebd5d2809 (support/scripts/check-merged: use getopts instead of
getopt) intoduced a flawed use of getopts: unlike getopt, getopts does not
conume the positional arguments.  This causes the check for directory
validity to also check each option as if they were directories.

For overlays, this is transparently ignored, because the checks are only lax
for overlays (missing symlinks are OK).

However, for skeletons, the checks are strict.  Because of that, a missing
symlink is considered an error, when it should be considered as being OK.

The fix is to actually consume the positional args to only keep the list of
directories to validate, like is done for example in
support/download/dl-wrapper.

Fixes: 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-merged | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index 447abfd815..57db8abd21 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -47,6 +47,10 @@ while getopts "t:ub" OPT; do
 	esac
 done
 
+# Remove the options processed by getopts from $@,
+# so that $@ now contains only the root directories to check.
+shift $((OPTIND -1))
+
 if [ "${type}" = "skeleton" ]; then
 	strict=true
 else

--===============1063956066580177310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1063956066580177310==--
