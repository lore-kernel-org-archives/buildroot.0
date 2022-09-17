Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D4DECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7610D83F25;
	Sat, 17 Sep 2022 13:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7610D83F25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXV_AnRE4-jM; Sat, 17 Sep 2022 13:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0147B8333E;
	Sat, 17 Sep 2022 13:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0147B8333E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE2591BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB9B40C59
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFB9B40C59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9HsuI3b6Vht for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B27B405D1
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B27B405D1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E9B3384332; Sat, 17 Sep 2022 13:44:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:41:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35e8b1fd63fd38d95d64a1ec2a43f465f800a988
X-Git-Newrev: d814c2bb6c52c93c51315ac2e90c0820ec9fd312
X-Patchwork-Hint: ignore
Message-Id: <20220917134414.E9B3384332@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: support linenoise cli
 backend support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d814c2bb6c52c93c51315ac2e90c0820ec9fd312
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

linenoise CLI implementation is supported since commit 023c2d3301a0
("cli: add linenoise CLI implementation."), nftables v0.9.3, so let's
add support for it in its Buildroot package.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/nftables.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index a64c36094e..e42108e159 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -24,6 +24,9 @@ ifeq ($(BR2_PACKAGE_READLINE),y)
 NFTABLES_CONF_OPTS += --with-cli=readline
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
+else ifeq ($(BR2_PACKAGE_LINENOISE),y)
+NFTABLES_CONF_OPTS += --with-cli=linenoise
+NFTABLES_DEPENDENCIES += linenoise
 else
 NFTABLES_CONF_OPTS += --without-cli
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
