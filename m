Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88835C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 10:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CFE981450;
	Mon, 14 Nov 2022 10:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CFE981450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOb328ToraMQ; Mon, 14 Nov 2022 10:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7101E8144C;
	Mon, 14 Nov 2022 10:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7101E8144C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 183591BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5845408C3
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5845408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OU9v9q71nn-x for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 10:40:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FECB408C8
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 10:40:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FECB408C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BB93813DA; Mon, 14 Nov 2022 10:40:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 11:39:55 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 6ef3c58671a93155e5f6d1f9597d8edb94c5cdc7
X-Git-Newrev: 5c73598faa0bdf685692b2fac201242440c874b6
X-Patchwork-Hint: ignore
Message-Id: <20221114104013.4BB93813DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/linux: don't leak
 host timezone into linux version string
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
Content-Type: multipart/mixed; boundary="===============1397911552351042358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1397911552351042358==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5c73598faa0bdf685692b2fac201242440c874b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a848418db4f956486a17dedc08f09803b26c84a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============1397911552351042358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1397911552351042358==--
