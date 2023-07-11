Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47F4EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 21:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C47A41E51;
	Tue, 11 Jul 2023 21:44:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C47A41E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gm5nr1aVDUGf; Tue, 11 Jul 2023 21:44:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2227441907;
	Tue, 11 Jul 2023 21:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2227441907
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB62B1BF32D
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:44:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4F4640493
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 21:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F4640493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76AZY_Q6GQGF for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 21:44:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D66DE4152B
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 21:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D66DE4152B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE8B186E45; Tue, 11 Jul 2023 21:44:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 23:32:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18a6d6db685e939cb42cb66755668e8f91bc6340
X-Git-Newrev: 8d2a51dc8de7fc1072e1f7b1923d45d4f4694175
X-Patchwork-Hint: ignore
Message-Id: <20230711214405.BE8B186E45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: add support for vendor dirs for
 appended DTBs
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d2a51dc8de7fc1072e1f7b1923d45d4f4694175
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Take the basename of the appended DTBs to workaround the following problem:

(cd .../arch/arm/boot; for dtb in cirrus/ep93xx-edb9302
 do if test -e ${dtb}.dtb ; then dtbpath=${dtb}.dtb
 else dtbpath=dts/${dtb}.dtb ; fi
 cat zImage ${dtbpath} > zImage.${dtb} || exit 1; done)
/bin/sh: line 1: zImage.cirrus/ep93xx-edb9302: No such file or directory

Necessary to support ARM Linux starting from commit 724ba6751532
("ARM: dts: Move .dts files to vendor sub-directories"), i.e. Linux v6.4+.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1c4fe45ac9..1db5c6046d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -468,7 +468,7 @@ define LINUX_APPEND_DTB
 			else \
 				dtbpath=dts/$${dtb}.dtb ; \
 			fi ; \
-			cat zImage $${dtbpath} > zImage.$${dtb} || exit 1; \
+			cat zImage $${dtbpath} > zImage.$$(basename $${dtb}) || exit 1; \
 		done)
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
