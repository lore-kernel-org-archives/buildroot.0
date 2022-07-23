Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7278C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 14:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707564190D;
	Sat, 23 Jul 2022 14:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707564190D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0B4Fhf0q3BGn; Sat, 23 Jul 2022 14:34:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A58416FD;
	Sat, 23 Jul 2022 14:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26A58416FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4971BF314
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B809A4164C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B809A4164C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YXlq3CnYoiXn for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 14:33:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0808E40B19
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 14:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0808E40B19
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EF336844C4; Sat, 23 Jul 2022 14:19:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 16:32:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47f359a615ae4772ea9d03a5134785aec230c317
X-Git-Newrev: 4ed7bca6a05a7878fdb73a973d098a6b64586848
X-Patchwork-Hint: ignore
Message-Id: <20220723141949.EF336844C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gitlab-ci.yml.in: use
 get-developers -v in check-DEVELOPERS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ed7bca6a05a7878fdb73a973d098a6b64586848
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have a working mechanism to validate the DEVELOPERS file
with the get-developers -v option, let's use it.

This brings back proper validation of the DEVELOPERS file, as
get-developers without argument no longer did any validation following
commit 45aabcddc5 utils/get-developers: really make it callable from
elsewhere than the toplevel directory".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/gitlab-ci.yml.in | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index 47e72c3213..3ac988a519 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -3,11 +3,8 @@
         - python3 -m pytest -v utils/checkpackagelib/
 
 .check-DEVELOPERS_base:
-    # get-developers should print just "No action specified"; if it prints
-    # anything else, it's a parse error.
-    # The initial ! is removed by YAML so we need to quote it.
     script:
-        - "! utils/get-developers | grep -v 'No action specified'"
+        - utils/get-developers -v
 
 .check-flake8_base:
     script:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
