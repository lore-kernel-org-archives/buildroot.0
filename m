Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA477C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C50D81D24;
	Fri, 21 Aug 2026 15:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1Qkv6FEoMKT; Fri, 21 Aug 2026 15:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325118;
	bh=oK3aeFWN98dIZvm9zpC+DdqbJnR5BTOceRnbn9bAsx8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=raPQRHyvSt82LDacithawrKbV4/5zv2xw5WY7dBNeNi+rp232D/t1yJNL8ZsUrNIg
	 7DM9qCNn1pPHnwLTjQZdR3tdXHD3BVXpiAdQfQ4qlP/OmUnlIFnAOSudDOVcvo4fSv
	 0WsVD6RRfGtf7Tjjqrwb4knwAggvYMfLtS5DCqBVaSsFvT9EJnTsBiRd4s+MyaUaEE
	 JN/LUymMyKtGvXPZHXjip/CgXgbSVM6vt9GDysb6D6dTKUbRl45pKQLBUMqxLrQVQ4
	 Qy8bEuGc0wFM+07kVuEp2a7w1z5QdcXOJJ1HI2a0puo8gPYSxR2705vMdiFIhvMQSj
	 2L/jQdNEP8xuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 810D481230;
	Fri, 21 Aug 2026 15:11:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA434EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C2E640BA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzyBQcDvsrHx for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECEEA40A15
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BFD18E132; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:20:34 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8d4e5f9cccd1e5866dadd500cc3457f72b32d3bb
X-Git-Newrev: e38702fc5796a0dd09c2c37c9752886b2c00889d
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.6BFD18E132@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x]
 boot/arm-trusted-firmware: fix CPE
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e38702fc5796a0dd09c2c37c9752886b2c00889d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit b7cf802aceba9ee2bd3064230f1bcbc86a58f926)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
