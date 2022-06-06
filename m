Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F075CC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FBD8403E9;
	Mon,  6 Jun 2022 10:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MGu_SCNjKNEh; Mon,  6 Jun 2022 10:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBE32402F7;
	Mon,  6 Jun 2022 10:31:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 007351BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3A9160FE4
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q1Xij5aJRDLU for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 195F360FD2
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 357A686CC0; Mon,  6 Jun 2022 10:19:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 12:26:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 84668397c18a59d7f7bee26287c16e2d9e20330b
X-Git-Newrev: aa0dc6693137bba82cb41a086284780e7f38a793
X-Patchwork-Hint: ignore
Message-Id: <20220606101958.357A686CC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 docs/manual/makeusers-syntax.txt: add caveat for upgrading
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa0dc6693137bba82cb41a086284780e7f38a793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

With the change of the range of UIDs that is generated from the
automatic ID (-1), it became apparent that there is a potential problem
with these automatic IDs when upgrading: they may have changed, which
means that persistent files that exist outside of the rootfs suddenly
have a different owner.

Add a caveat section to the manual, as well as an explanation of how to
work around the problem.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[yann.morin.1998@free.fr: slight rewording]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8b512056381e53deb2ea5e3228643ef6422c51bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/makeusers-syntax.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 3d1013f447..0a955970b3 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -90,3 +90,16 @@ This will create this user:
 - +shell+ is: +/bin/sh+
 - +test+ is not a member of any additional +groups+
 - +comment+ is: +Test user+
+
+
+=== Caveat with automatic UIDs and GIDs
+
+When updating buildroot or when packages are added or removed to/from
+the configuration, it is possible that the automatic UIDs and GIDs are
+changed. This can be a problem if persistent files were created with
+that user or group: after upgrade, they will suddenly have a different
+owner.
+
+Therefore, it is advisable to perpetuate the automatic IDs. This can be
+done by adding a users table with the generated IDs. It is only needed
+to do this for UIDs that actually create persistent files, e.g. database.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
