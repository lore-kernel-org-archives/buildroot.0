Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3E8EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E6F60D58;
	Tue, 18 Jul 2023 20:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3E6F60D58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ba2sEfQhKL4g; Tue, 18 Jul 2023 20:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA8360BFB;
	Tue, 18 Jul 2023 20:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFA8360BFB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B12A21BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8704F60BFB
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8704F60BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZbF_d5pU3cd for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3116605E0
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3116605E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC2CD873D4; Tue, 18 Jul 2023 20:39:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:39:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a89a632833dca00beb7443ef540571b281703ae1
X-Git-Newrev: 231d79c81e9a1f8c2ef14861374a40fcdc5e6b33
X-Patchwork-Hint: ignore
Message-Id: <20230718203924.AC2CD873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: set DTC path when
 BR2_TARGET_UBOOT_NEEDS_DTC
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=231d79c81e9a1f8c2ef14861374a40fcdc5e6b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for host-dtc to get picked up properly we need to set
the DTC path passed to the build explicitly.

See:
https://github.com/u-boot/u-boot/blob/v2023.07.02/Makefile#L420

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
