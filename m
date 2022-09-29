Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D16C04A95
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 06:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD5A160F40;
	Thu, 29 Sep 2022 06:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD5A160F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yX4rXjaP7Y04; Thu, 29 Sep 2022 06:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF52C60E2E;
	Thu, 29 Sep 2022 06:16:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF52C60E2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D3121BF3E1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7854419C7
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:15:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7854419C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnpaSYp0RKIr for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9AE2419C6
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9AE2419C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5CFC864AB; Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 08:07:54 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: b9f874b690b4245aba7cfb7759f40d3936d8ac96
X-Git-Newrev: 943a2e42c247021d90fc8a99ce8520a62a9af15f
X-Patchwork-Hint: ignore
Message-Id: <20220929061558.A5CFC864AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/makedevs: fix
 recursive chmod
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

commit: https://git.buildroot.net/buildroot/commit/?id=943a2e42c247021d90fc8a99ce8520a62a9af15f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

The logic implemented in e745c0b to stop makedevs from recursively running
chmod() on dangling symlinks excluded everything that isn't a symlink.
Other file types or directories are skipped/ignored.

Logic has been updated to exit the function if mode shouldn't be changed
or if path is a dangling symlink.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d6d8d60ee36fe2b509f12e81584aa9a5dfd77e62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 2796cd5e78..a5c9c7d64d 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -446,11 +446,12 @@ int bb_recursive(const char *fpath, const struct stat *sb,
 	}
 
 	/* chmod() is optional, also skip if dangling symlink */
-	if (recursive_mode != -1 && tflag == FTW_SL && access(fpath, F_OK)) {
-		if (chmod(fpath, recursive_mode) < 0) {
-			bb_perror_msg("chmod failed for %s", fpath);
-			return -1;
-		}
+	if (recursive_mode == -1 || (tflag == FTW_SL && !access(fpath, F_OK)))
+		return 0;
+
+	if (chmod(fpath, recursive_mode) < 0) {
+		bb_perror_msg("chmod failed for %s", fpath);
+		return -1;
 	}
 
 	return 0;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
