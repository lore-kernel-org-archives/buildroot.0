Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9417C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 20:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BC9740567;
	Sat, 23 Jul 2022 20:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC9740567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huu6kONvMgKP; Sat, 23 Jul 2022 20:12:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE29405A7;
	Sat, 23 Jul 2022 20:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE29405A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7685F1BF59C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1D461AF8
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 20:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E1D461AF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2_iV3EHlVzZ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 20:11:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F6760B77
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 20:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87F6760B77
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F3C4784F5B; Sat, 23 Jul 2022 19:58:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 22:11:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77ebf64634892a0408d449b0bdf4d36488c73a6c
X-Git-Newrev: c9762c3f8045f10df8d86d75d277b28e815cee5d
X-Patchwork-Hint: ignore
Message-Id: <20220723195817.F3C4784F5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: update condition for custom
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9762c3f8045f10df8d86d75d277b28e815cee5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates the condition to handle custom tarballs as specified by
the configuration. This change is made to have cleaner condition and for
consistency.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 6506294d6d..da151d3c25 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -17,7 +17,7 @@ define inner-barebox-package
 
 $(1)_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
 
-ifeq ($$($(1)_VERSION),custom)
+ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL),y)
 # Handle custom Barebox tarballs as specified by the configuration
 $(1)_TARBALL = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
 $(1)_SITE = $$(patsubst %/,%,$$(dir $$($(1)_TARBALL)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
