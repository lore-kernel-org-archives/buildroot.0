Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91188C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 21:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D2B660093;
	Sat, 28 May 2022 21:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Y4sT9MNB_H0; Sat, 28 May 2022 21:43:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4282460AFE;
	Sat, 28 May 2022 21:43:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3D41BF5A0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B47D83E93
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HYKluyXKUgdS for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 21:43:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D97083E32
 for <buildroot@buildroot.org>; Sat, 28 May 2022 21:43:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1044D86407; Sat, 28 May 2022 21:31:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 23:43:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d590003e31dd0c72ef51fd7d9515af62017b0c56
X-Git-Newrev: 8b512056381e53deb2ea5e3228643ef6422c51bf
X-Patchwork-Hint: ignore
Message-Id: <20220528213159.1044D86407@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/makeusers-syntax.txt: add
 caveat for upgrading
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

commit: https://git.buildroot.net/buildroot/commit/?id=8b512056381e53deb2ea5e3228643ef6422c51bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
