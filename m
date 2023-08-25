Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2E4C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E594C4059C;
	Sat, 26 Aug 2023 18:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E594C4059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3yzDbI7pT-9; Sat, 26 Aug 2023 18:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F8C540232;
	Sat, 26 Aug 2023 18:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F8C540232
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF761BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6575E60F0E
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6575E60F0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXrMUlsegYf2 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A078A60B3C
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A078A60B3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84FDB863F4; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 21:32:38 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ef926a0a44e49da84f619846f66028e7653e5c52
X-Git-Newrev: ab72054281376ead3742ff9cbb8511562b0f7c53
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.84FDB863F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] boot/uboot: set DTC path
 when BR2_TARGET_UBOOT_NEEDS_DTC
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

commit: https://git.buildroot.net/buildroot/commit/?id=ab72054281376ead3742ff9cbb8511562b0f7c53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

In order for host-dtc to get picked up properly we need to set
the DTC path passed to the build explicitly.

See:
https://github.com/u-boot/u-boot/blob/v2023.07.02/Makefile#L420

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 4eae8e95c3..1a6e70a792 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -209,6 +209,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
 UBOOT_DEPENDENCIES += host-dtc
+UBOOT_MAKE_OPTS += DTC=$(HOST_DIR)/bin/dtc
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYTHON3),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
