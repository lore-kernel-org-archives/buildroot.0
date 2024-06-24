Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2EEC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F8E60FCF;
	Mon, 24 Jun 2024 20:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zvgn0Vj744mH; Mon, 24 Jun 2024 20:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DBF560BB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DBF560BB5;
	Mon, 24 Jun 2024 20:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05D251BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5C3360A80
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwx2YHU8Iij2 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D2A60A82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1D2A60A82
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 995BC82B84; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:57:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93a75717dcee3b095de57d12dff83789298c255e
X-Git-Newrev: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.995BC82B84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/apply-patches.sh: set the
 maximum fuzz factor to 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch was created as a fix to a problem that occurred during the
compilation of QEMU:

>>> qemu 8.1.1 Patching

Applying 0001-tests-fp-disable-fp-bench-build-by-default.patch using patch:
patching file tests/fp/meson.build
Hunk #1 succeeded at 138 with fuzz 2 (offset -502 lines).

Applying 0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.patch using patch:
patching file softmmu/qemu-seccomp.c

Applying 0004-tracing-install-trace-events-file-only-if-necessary.patch using patch:
patching file trace/meson.build

With the bump to version 8.1.1, the patch that disabled the compilation
of the fp-bench test does not report any errors, even though the patch
itself is no longer applicable. The only noticeable message is:

"Hunk #1 succeeded at 138 with fuzz 2 (offset -502 lines)."

As reported by the patch man page:

"With context diffs, and to a lesser extent with normal diffs, patch can
detect when the line numbers mentioned in the patch are incorrect, and
attempts to find the correct place to apply each hunk of the patch.
As a first guess, it takes the line number mentioned for the hunk, plus
or minus any offset used in applying the previous hunk. If that is not
the correct place, patch scans both forwards and backwards for a set of
lines matching the context given in the hunk. First patch looks for a
place where all lines of the context match. If no such place is found,
and it's a context diff, and the maximum fuzz factor is set to 1 or more,
then another scan takes place ignoring the first and last line of
context. If that fails, and the maximum fuzz factor is set to 2 or more,
the first two and last two lines of context are ignored, and another
scan is made. The default maximum fuzz factor is 2.

If the hunk is installed at a different line from the line number
specified in the diff, you are told the offset. A single large offset
may indicate that a hunk was installed in the wrong place. You are also
told if a fuzz factor was used to make the match, in which case you
should also be slightly suspicious."

By setting the maximum fuzz factor to 0, we avoid that patches which
cannot be applied are incorrectly reported as valid, with positive
side-effects on version bumps.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 73aa6c8e5f..2acaa63e9f 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -116,7 +116,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -F0 -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
