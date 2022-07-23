Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27800C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8AFC84970;
	Sat, 23 Jul 2022 20:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8AFC84970
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTBGtRppLhPz; Sat, 23 Jul 2022 20:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8188496E;
	Sat, 23 Jul 2022 20:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8188496E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D7BC1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3804A61AD9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3804A61AD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 753aP2wxjf8h for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 901C160E14
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 901C160E14
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 08B2A84F5C; Sat, 23 Jul 2022 19:58:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:11:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9762c3f8045f10df8d86d75d277b28e815cee5d
X-Git-Newrev: f13cf28b622c37d83a70a0899ccada50cd8c0711
X-Patchwork-Hint: ignore
Message-Id: <20220723195818.08B2A84F5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: update condition for custom
 tarball management
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

commit: https://git.buildroot.net/buildroot/commit/?id=f13cf28b622c37d83a70a0899ccada50cd8c0711
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the condition to handle custom tarballs as specified by
the configuration. This change is made to have cleaner condition and for
consistency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/opensbi/opensbi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
index 8e055633a8..01f0c3ad40 100644
--- a/boot/opensbi/opensbi.mk
+++ b/boot/opensbi/opensbi.mk
@@ -6,7 +6,7 @@
 
 OPENSBI_VERSION = $(call qstrip,$(BR2_TARGET_OPENSBI_VERSION))
 
-ifeq ($(OPENSBI_VERSION),custom)
+ifeq ($(BR2_TARGET_OPENSBI_CUSTOM_TARBALL),y)
 # Handle custom OpenSBI tarballs as specified by the configuration
 OPENSBI_TARBALL = $(call qstrip,$(BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION))
 OPENSBI_SITE = $(patsubst %/,%,$(dir $(OPENSBI_TARBALL)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
