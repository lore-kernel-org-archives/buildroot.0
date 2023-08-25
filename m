Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C8C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D18D40A4A;
	Sat, 26 Aug 2023 18:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D18D40A4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMBDY8L3zCTy; Sat, 26 Aug 2023 18:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C8D440A5C;
	Sat, 26 Aug 2023 18:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C8D440A5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 612C51BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A14340F4E
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A14340F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEy2xSor0ZNn for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B995409AB
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B995409AB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B98F86413; Sat, 26 Aug 2023 18:49:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 21:32:28 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7b716b2017c812a33fa4bbbd0dcccd50c959ab50
X-Git-Newrev: 3408ccf38e107e7c314b04da22f7dc6f26900779
X-Patchwork-Hint: ignore
Message-Id: <20230826184906.2B98F86413@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] boot/uboot: set DTC path
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

commit: https://git.buildroot.net/buildroot/commit/?id=3408ccf38e107e7c314b04da22f7dc6f26900779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
