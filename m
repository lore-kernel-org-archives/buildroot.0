Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DEE7C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16FE04F5C5;
	Tue, 21 Feb 2023 00:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16FE04F5C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6IdXdDL7EJZ; Tue, 21 Feb 2023 00:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77FF4F5CC;
	Tue, 21 Feb 2023 00:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D77FF4F5CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5237A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65259417E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65259417E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6rX7LIeHwav for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CC7D41805
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC7D41805
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99B4086495; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 09:38:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d758b054b496619999e03c60c63b6636d818f3e5
X-Git-Newrev: a39116b5dba6cf0695620e2ba5302f21fa80a4a5
X-Patchwork-Hint: ignore
Message-Id: <20230220205258.99B4086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/download: catch
 post-process errors
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
