Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99BCEED61E
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 17:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 624DB404EB;
	Fri, 15 Sep 2023 17:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 624DB404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zLPnCEw0EjJH; Fri, 15 Sep 2023 17:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EF64031E;
	Fri, 15 Sep 2023 17:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5EF64031E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6323F1BF2FD
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A63D61385
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 17:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A63D61385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gp26eyM4lG3w for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 17:53:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BD9560BDA
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 17:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD9560BDA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A1718703F; Fri, 15 Sep 2023 17:53:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 19:50:49 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c42be1a5524d2f8a193881717977d3a0f4225171
X-Git-Newrev: b52299adfdb930a8bb5da9ac1f6896e4eab5ba3d
X-Patchwork-Hint: ignore
Message-Id: <20230915175318.5A1718703F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] utils/getdeveloperlib.py:
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

commit: https://git.buildroot.net/buildroot/commit/?id=b52299adfdb930a8bb5da9ac1f6896e4eab5ba3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
