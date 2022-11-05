Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE70EC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 14:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE0260A8C;
	Sat,  5 Nov 2022 14:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EE0260A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1zqwkK8UUZd; Sat,  5 Nov 2022 14:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C85BA60A74;
	Sat,  5 Nov 2022 14:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C85BA60A74
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ADCC91BF28A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89C4E81442
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 14:10:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89C4E81442
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ihiP6G6jCRH9 for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 14:10:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D15B88143C
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 14:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D15B88143C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB13487964; Sat,  5 Nov 2022 14:10:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 15:09:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26634490364decc24fa32f175c12c8a2d984f1d3
X-Git-Newrev: a848418db4f956486a17dedc08f09803b26c84a1
X-Patchwork-Hint: ignore
Message-Id: <20221105141010.BB13487964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux: don't leak host timezone
 into linux version string
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
Content-Type: multipart/mixed; boundary="===============6886225635401458011=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6886225635401458011==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a848418db4f956486a17dedc08f09803b26c84a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index efdc21eff2..6b547a68ed 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -162,7 +162,7 @@ LINUX_MAKE_ENV += \
 	KBUILD_BUILD_VERSION=1 \
 	KBUILD_BUILD_USER=buildroot \
 	KBUILD_BUILD_HOST=buildroot \
-	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"
+	KBUILD_BUILD_TIMESTAMP="$(shell LC_ALL=C TZ='UTC' date -d @$(SOURCE_DATE_EPOCH))"
 endif
 
 # gcc-8 started warning about function aliases that have a

--===============6886225635401458011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6886225635401458011==--
