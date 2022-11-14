Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FFCC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 19:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C68C060B8C;
	Mon, 14 Nov 2022 19:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68C060B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O8gPzWrdMqPg; Mon, 14 Nov 2022 19:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DF66079D;
	Mon, 14 Nov 2022 19:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04DF66079D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 212B11BF2A6
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 19:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF00240219
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 19:48:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF00240219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OCcvoj494-G6 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 19:48:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6A4C4018B
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 19:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6A4C4018B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5827839F0; Mon, 14 Nov 2022 19:48:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 20:36:19 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 06e37ff050c8c23ce507e831837f20e9df7b082d
X-Git-Newrev: 0446e276b4a105ff380bc89d756a07814783002d
X-Patchwork-Hint: ignore
Message-Id: <20221114194841.A5827839F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/socat: disable
 openssl for static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0446e276b4a105ff380bc89d756a07814783002d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

socat's configure script does not take the zlib dependency into
account when linking with libssl, and therefore fails at detecting
libssl in BR2_STATIC_LIBS=y configurations.

Since there is no easy way to add the zlib dependency, just disable
openssl support for static builds.

This is not fixing a build failure: libssl was not detected in
BR2_STATIC_LIBS=y configurations, so what this commit does is make it
explicit.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 934ec83e9d005fb21e5813f4480ebd624ee28c6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/socat/socat.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index c1bf4d260f..bfccd02031 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -39,7 +39,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
