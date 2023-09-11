Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E997BEE57DF
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 929A980E3A;
	Mon, 11 Sep 2023 20:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 929A980E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E76JKtWyHuzg; Mon, 11 Sep 2023 20:08:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E60D280D20;
	Mon, 11 Sep 2023 20:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E60D280D20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DC101BF357
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 638CC6101F
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 638CC6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77YOFoG9Y7tT for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:08:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96CAF61037
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 96CAF61037
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 871E386D19; Mon, 11 Sep 2023 20:08:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:08:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ee7c76823f7a58a5d8fcff0b3a445ff9cc04ff2
X-Git-Newrev: 7bc5ea80c7a2e60f8c47ac33b20909e693de5bbc
X-Patchwork-Hint: ignore
Message-Id: <20230911200844.871E386D19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: handle file
 removal
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bc5ea80c7a2e60f8c47ac33b20909e693de5bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a patch only removes files, it is ignored. Meaning, that the
registered developer isn't automatically picked up when calling
get-developer.
Fix this by also checking if the line starts with ---, as a patch
removing a file has a line starting with --- with the name of the
removed file and one started with +++ /dev/null.
A set is used to store the changed files, which doesn't allow
duplicates. Therefore normal patches aren't affected by this change.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/getdeveloperlib.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index e7d0d23e49..469360b801 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -25,7 +25,7 @@ def analyze_patch(patch):
         m = FIND_INFRA_IN_PATCH.match(line)
         if m:
             infras.add(m.group(2))
-        if not line.startswith("+++ "):
+        if not line.startswith("+++ ") and not line.startswith("--- "):
             continue
         line.strip()
         fname = line[line.find("/") + 1:].strip()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
