Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB274C04A95
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 06:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F8F60E2E;
	Thu, 29 Sep 2022 06:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F8F60E2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vOKC-_oA2yRs; Thu, 29 Sep 2022 06:16:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C25460F42;
	Thu, 29 Sep 2022 06:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C25460F42
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14B4D1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEED0419C7
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 06:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEED0419C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNiPCk6-6T78 for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53F0E419CF
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 53F0E419CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38701864AB; Thu, 29 Sep 2022 06:15:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 08:07:59 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 8d4a082225698d5d7dcb744eab60da1e20e56533
X-Git-Newrev: 0c6816b2040f21f670b3b9374a7787820782d17d
X-Patchwork-Hint: ignore
Message-Id: <20220929061558.38701864AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/makedevs: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c6816b2040f21f670b3b9374a7787820782d17d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
