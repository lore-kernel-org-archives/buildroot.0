Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E2DC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 08:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D6281B36;
	Sun, 12 Feb 2023 08:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D6281B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pzvYKC7X9rB; Sun, 12 Feb 2023 08:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74C0A8183D;
	Sun, 12 Feb 2023 08:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74C0A8183D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C52941BF4E2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACCB860BFB
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACCB860BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tHitg6tLNKaB for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 08:45:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A1660E13
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3A1660E13
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF1FC85670; Sun, 12 Feb 2023 08:45:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 09:38:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d758b054b496619999e03c60c63b6636d818f3e5
X-Git-Newrev: a39116b5dba6cf0695620e2ba5302f21fa80a4a5
X-Patchwork-Hint: ignore
Message-Id: <20230212084528.AF1FC85670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: catch post-process errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=a39116b5dba6cf0695620e2ba5302f21fa80a4a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/12a/12a63ae177fe3ed0c9a1ef2fa01870f334f36b0f/

Currently, when the post-process helper fails while downloading from
upstream, there is no fallback to the backup mirror.

In case the post-process helper fails, we must consider that to be a
download failure, so we must bail out as if the download backend itself
did fail, but we fail to do so.

Duplicate the logic we have for the download helper: if the post-process
helper fails, remove the downloaded stuff, and continue on to the next
URI, which will ultimately hit the backup mirror (if one has been
configured).

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/dl-wrapper | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 09a6ac1f1a..1e8d6058f6 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -138,9 +138,15 @@ main() {
         fi
 
         if [ -n "${post_process}" ] ; then
-            "${OLDPWD}/support/download/${post_process}-post-process" \
-                -o "${tmpf}" \
-                -n "${raw_base_name}"
+            if ! "${OLDPWD}/support/download/${post_process}-post-process" \
+                    -o "${tmpf}" \
+                    -n "${raw_base_name}"
+            then
+                # cd back to keep path coherence
+                cd "${OLDPWD}"
+                rm -rf "${tmpd}"
+                continue
+            fi
         fi
 
         # cd back to free the temp-dir, so we can remove it later
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
