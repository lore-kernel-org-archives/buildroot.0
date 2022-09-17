Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09DCECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 21:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FAB140131;
	Sat, 17 Sep 2022 21:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FAB140131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFYNLdJdSx9V; Sat, 17 Sep 2022 21:36:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48AF84011F;
	Sat, 17 Sep 2022 21:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48AF84011F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 65C7D1BF976
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 408E041B37
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 21:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408E041B37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QopJYbSLeapl for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54CFB41A42
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54CFB41A42
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CAE7846F1; Sat, 17 Sep 2022 21:36:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 23:36:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d87139f69e0b1a05ee5307c77c3f830c99fac19
X-Git-Newrev: d6d8d60ee36fe2b509f12e81584aa9a5dfd77e62
X-Patchwork-Hint: ignore
Message-Id: <20220917213624.2CAE7846F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/makedevs: fix recursive chmod
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6d8d60ee36fe2b509f12e81584aa9a5dfd77e62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logic implemented in e745c0b to stop makedevs from recursively running
chmod() on dangling symlinks excluded everything that isn't a symlink.
Other file types or directories are skipped/ignored.

Logic has been updated to exit the function if mode shouldn't be changed
or if path is a dangling symlink.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
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
