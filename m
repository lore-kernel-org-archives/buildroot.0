Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A9EC433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 09:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5318E841F8;
	Wed,  8 Jun 2022 09:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvmuQqsKcSl7; Wed,  8 Jun 2022 09:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85D0884040;
	Wed,  8 Jun 2022 09:48:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9A41BF3C8
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 09:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAE8960E48
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 09:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ISo7OyyhWW4 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 09:48:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8404260D80
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 09:48:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id A128F1BF210;
 Wed,  8 Jun 2022 09:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654681689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gOFkjdsMs11Os56usPAu/GVzZ/ulFFBqVZ0tGqVL/Gk=;
 b=Alc2lh07cNgUmU+xjalS9F8W+gYsoy5jer2xwdKbg/NMPjebHoExijnLYkZPfbXtVziObg
 J24jD4z0BLXuEN2I9QB2ByZlUwCOQmJhNBFKPQ9QJ+xT2drTYX8NI0FP+6cMU6/t0bViP6
 S18a7fwz/YUXNz0JRVkInw4kTGJrlPw4PTmGhgbQV5s/hN74NX+b2ktytCPQpvdQGhYV3P
 xa5y4RRfEUsR/KWqUNyl1TxrGoiewKj5c0rXFa5+8w+lRBhefyrj+kN6Tn+f4Vhq76gLro
 iz4I+MqIZfkuLbztQ8/aioC1TMtMteEbcZn7EOwGz261FnJpRuNNmcZdCvS7kg==
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 11:48:02 +0200
Message-Id: <20220608094803.3403930-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] arch/Config.in: armeb no-MMU is not supported
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

elf2flt does not support ARM big-endian, so supporting Cortex M3/M4/M7
with armeb is not possibly.

Therefore this commit makes:

 - MMU mandatory on armeb
 - Prevents from seeing Cortex M3/M4/M7 on armeb

Fixes:

  http://autobuild.buildroot.net/results/9bca0cbfb6a66c455e74ad194526bca942665978/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in     | 2 +-
 arch/Config.in.arm | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 49e16fce38..da499b37ab 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -49,7 +49,7 @@ config BR2_arm
 
 config BR2_armeb
 	bool "ARM (big endian)"
-	# MMU support is set by the subarchitecture file, arch/Config.in.arm
+	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
 	  instruction set architecture (ISA) developed by ARM Holdings.
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index fa2e882550..eb71d70430 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -242,6 +242,8 @@ config BR2_pj4
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
 
+# Cortex-M cores are only supported for little endian configurations
+if BR2_arm
 comment "armv7m cores"
 config BR2_cortex_m3
 	bool "cortex-M3"
@@ -258,6 +260,7 @@ config BR2_cortex_m7
 	select BR2_ARM_CPU_MAYBE_HAS_FPV5
 	select BR2_ARM_CPU_ARMV7M
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+endif # BR2_arm
 endif # !BR2_ARCH_IS_64
 
 comment "armv8 cores"
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
