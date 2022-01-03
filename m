Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F1DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F047560AF2;
	Mon,  3 Jan 2022 20:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmtRQ9P5xRZC; Mon,  3 Jan 2022 20:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5735A60808;
	Mon,  3 Jan 2022 20:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9B111BF309
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F5E0403BE
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:16:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLFALbiq0w4M for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:16:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFFDC403A4
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 30C9F82B2E; Mon,  3 Jan 2022 20:10:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 21:14:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85c7bd0602715dc6a148cc79db8910dca27c4e76
X-Git-Newrev: 1368ce2331cc0303ea59b35093875989d0d2bf8f
X-Patchwork-Hint: ignore
Message-Id: <20220103201049.30C9F82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/: remove -E flag from
 patch call
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

commit: https://git.buildroot.net/buildroot/commit/?id=1368ce2331cc0303ea59b35093875989d0d2bf8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-E flag instructs patch to remove empty files. However, in some cases
empty files are essential. If they are missing, build could be broken
or other bad things can happen.

Note that empty files are still removed when their headers are properly
formattedo: timestamp set to 1970-01-01T00:00:00Z, destination set to
/dev/null.

Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index e5a2fdd09e..6da83f6826 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -114,7 +114,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
