Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B4AEED61E
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D40C418CB;
	Fri, 15 Sep 2023 17:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D40C418CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SlQ2nSpPuTGF; Fri, 15 Sep 2023 17:53:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE90B4031E;
	Fri, 15 Sep 2023 17:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE90B4031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 179261BF2FD
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8719760BDA
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8719760BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKe2iKhA33KB for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:53:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B660360C22
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B660360C22
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A63B38703F; Fri, 15 Sep 2023 17:53:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 19:50:24 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 1c6e9cd37f01187412496ae18a5dfeaa490d2f10
X-Git-Newrev: 15639f42994d98ba2811f26e973680a92550e749
X-Patchwork-Hint: ignore
Message-Id: <20230915175318.A63B38703F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] utils/getdeveloperlib.py:
 handle file removal
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

commit: https://git.buildroot.net/buildroot/commit/?id=15639f42994d98ba2811f26e973680a92550e749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
(cherry picked from commit 7bc5ea80c7a2e60f8c47ac33b20909e693de5bbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
