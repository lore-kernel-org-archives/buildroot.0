Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9BFC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 14:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D2D4080E;
	Sat, 15 Aug 2026 14:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUhLADnDxkR4; Sat, 15 Aug 2026 14:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52D040657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786805267;
	bh=Gx+rO8u3Tz8wbgm/6U7tfLQNfpBR+Y7XNPg8F1QoFnM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oBDcii6xF+MGywFJ0qwfSLEm7pIzo0R5LotPogRTzpOotCQKx2yliipOWfcLLHlbN
	 mq33V6ZUsoq2fHvuGZjhOkruPV2kRYnQJcYBUKqDhzy/ovxMdL7SpYpXO6bCkMs+Az
	 TOQdZLGFOWWLry12ZQcLOSntCImcxYfUKXrSBcE5kIH3WxAkEXWgYDI6bYX3kqSWT2
	 3+/exH9LzUB/MOBUpGA4QzqCjIKVheuuIxQ6CqsIM9V5xKaqzwPgvGqaO+iSQMGOIq
	 MCW0Vd9ckJjbJfX8AXtKDPxXnpzP7JuqMXYYvQoRCKzFyw5hguBCDMI5a+YfqIv1su
	 C1t1FMXrzMXqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52D040657;
	Sat, 15 Aug 2026 14:47:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5DD12BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D775F80E30
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0vmur674qq2 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 14:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA44F80E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA44F80E22
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 14:47:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C36B8D5FB; Sat, 15 Aug 2026 14:46:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 16:41:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2456e44d6779f9664b45c8d2b85f3ea8a250ecc0
X-Git-Newrev: b7cf802aceba9ee2bd3064230f1bcbc86a58f926
X-Patchwork-Hint: ignore
Message-Id: <20260815144654.1C36B8D5FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: fix CPE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7cf802aceba9ee2bd3064230f1bcbc86a58f926
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A new (and hopefully definitive) CPE is to be used for TF-A:

cpe:2.3:o:trustedfirmware:trusted_firmware-a:

as reported in TF-A directly[1]. NVD correctly reports[2] the new CPE
deprecates the "old" one Buildroot was using.

CVEs for projects under the TrustedFirmware umbrella are now seemingly
handled under the CPE vendor "trustedfirmware".

[1] https://review.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a/+/efd7b189fa259c349699957462c7b52bf640e27b%5E%21/
[2] https://nvd.nist.gov/products/cpe/detail/2E1BD3E8-DF65-42E3-A0BA-747137D6DEF2
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 1b52f36783..798efd5a15 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -6,7 +6,7 @@
 
 ARM_TRUSTED_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_VERSION))
 ARM_TRUSTED_FIRMWARE_CPE_ID_PREFIX = cpe:2.3:o
-ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = arm
+ARM_TRUSTED_FIRMWARE_CPE_ID_VENDOR = trustedfirmware
 ARM_TRUSTED_FIRMWARE_CPE_ID_PRODUCT = trusted_firmware-a
 ARM_TRUSTED_FIRMWARE_CPE_ID_VERSION = $(patsubst v%,%,$(patsubst lts-%,%,$(ARM_TRUSTED_FIRMWARE_VERSION)))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
