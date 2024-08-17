Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00236C5321D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 22:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F83E606A9;
	Sat, 17 Aug 2024 22:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vA-K66JsSGhJ; Sat, 17 Aug 2024 22:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B275B606BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B275B606BF;
	Sat, 17 Aug 2024 22:02:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2EEB91BF578
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 22:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5338E60607
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 22:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wLatRu9fB-qm for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 22:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D1DB060616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1DB060616
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1DB060616
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 22:02:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 33893C0006;
 Sat, 17 Aug 2024 22:02:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 00:02:06 +0200
Message-ID: <20240817220208.929073-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
References: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723932134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQJFj3T3X3mjEr8OLkRJ9STWu8VqwUUJSHxpB3fI+uw=;
 b=A/XNEnSi5B7WvfjS8F44J+K/pNif0DbWDtb9tkXbD33MT1en8S6Df+AyZLX3/QbomF8YFK
 0GdXnZPW0B8J09FWjd/djniBQmlflRDotTpU/B2hyLAisfsP4Cy0oHQpsksSyyICyVuqlV
 nkQOM9QXJDdOwrymwlQdqRjw5FPYNLj6A/80UGgw07XxKPtiLDShXu9+hgFMI+4vRYNTAq
 MuxyhbSFNzj3tRfS7ACKYp9bN36rtqGZirOtLuEKfnZ5TCHuRmNSNP3xcnHOI9XIoCR/cw
 Kro/NfMD8an/tLL06Dhhk0BdNanOjhT1A5GD/hO7BjbzmKGr+KoAY6a2e5wStQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A/XNEnSi
Subject: [Buildroot] [PATCH 3/3] package/gnu-efi: mark as not supported on
 ARM soft-float
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

lib/print.c in gnu-efi contains some floating point computation. On
ARM soft-float configurations, these floating point operations
generate calls to __eabi_*() functions that are provided by
gcc. However, gnu-efi builds some freestanding code, so it doesn't
link with libgcc, and therefore the build fails with:

arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1431:(.text+0x78c): undefined reference to `__aeabi_i2d'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1431:(.text+0x7a0): undefined reference to `__aeabi_dsub'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1431:(.text+0x7a4): undefined reference to `__aeabi_d2f'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1432:(.text+0x7b4): undefined reference to `__aeabi_fcmplt'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1438:(.text+0x7c8): undefined reference to `__aeabi_fmul'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1440:(.text+0x7d4): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1444:(.text+0x7f8): undefined reference to `__aeabi_fmul'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1440:(.text+0x808): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1440:(.text+0x818): undefined reference to `__aeabi_f2iz'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x834): undefined reference to `__aeabi_i2f'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x840): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1453:(.text+0x858): undefined reference to `__aeabi_fmul'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x860): undefined reference to `__aeabi_f2iz'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x868): undefined reference to `__aeabi_i2f'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x870): undefined reference to `__aeabi_fcmpeq'
arm-buildroot-linux-gnueabi-ld: /output-1/build/gnu-efi-3.0.18//lib/print.c:1451:(.text+0x89c): undefined reference to `__aeabi_f2iz'

Since we don't care about gnu-efi support on ARM soft-float
configurations, let's disable such configurations.

Note that we have chosen to use BR2_ARM_SOFT_FLOAT as we're for now
making this specific to ARM as we're not sure what is the situation on
other CPU architectures (for example RISC-V without FPU maybe). This
can be revisited once we get more data on the behavior on other CPU
architectures that can support soft-float.

Fixes:

  http://autobuild.buildroot.net/results/98d955fd2fcf4a3db1ab46e4f553447031a23b92/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 2c4b78b794..35446876f6 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM
+	default y if BR2_arm && BR2_ARM_CPU_HAS_ARM && !BR2_ARM_SOFT_FLOAT
 	default y if BR2_RISCV_64
 	default y if BR2_aarch64
 	default y if BR2_i386
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
