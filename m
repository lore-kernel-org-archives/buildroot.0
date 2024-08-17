Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0996C531DC
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 22:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E63F16061C;
	Sat, 17 Aug 2024 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3FOhTCEZHx7; Sat, 17 Aug 2024 22:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 252BD60625
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 252BD60625;
	Sat, 17 Aug 2024 22:02:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1264D1BF578
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 22:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F414D6060E
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 22:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8k2lcNXyoCSL for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 22:02:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9018B60607
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9018B60607
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9018B60607
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 22:02:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4FAF2C0005;
 Sat, 17 Aug 2024 22:02:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 00:02:05 +0200
Message-ID: <20240817220208.929073-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
References: <20240817220208.929073-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723932133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEXFMOMn+Mapqb8fLs/xJdSsKQ7h7GdMVP0gAfJ6gnQ=;
 b=jaaQ/5mD65bnui1Px/2IvyRKOv+LjkIpiIKqueeDdEVgt1phgahqFtuhh/vSx3sT2olPme
 yi4Pj4E3QRWnWnWz9wTp6hm9fVsNfwW+GaAypiamvJRTdDpCf4vsG+QPqiOneL7/lIknqA
 RW8rjYuftdOKxdXxMRftbG5D4iHMZvKn6hQPwaPKfeGaRpD1RuwgYEX5YG94Hhia1VPGG7
 vxDqzzdTuxV7+V22Hd3P8Cbygctown5FUe/gIDt35Eju0qJSmgqyPQOpzyWxWz35TkyOcr
 Vvgz7sna6ANSplBAiujMIksVRi2T7SbS0wmT/joUIfSXN/MByW1+jk8BCsOqzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jaaQ/5mD
Subject: [Buildroot] [PATCH 2/3] package/gnu-efi: only supported on
 MMU-capable platforms
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

Since commit
1f7c58145497ed01d566e08734a62feef1696807 ("package/gnu-efi: enable on
RISC-V 64-bit"), we allow building on RISC-V... and that includes
noMMU RISC-V. This unfortunately fails badly with:

/home/autobuild/autobuild/instance-2/output-1/host/bin/../riscv64-buildroot-linux-uclibc/bin/ld.real: unrecognized option '-Wl,-elf2flt=-r'
/home/autobuild/autobuild/instance-2/output-1/host/bin/../riscv64-buildroot-linux-uclibc/bin/ld.real: use the --help option for usage information

Since we're anyway not interested in gnu-efi on noMMU platforms, let's
not even spend time on trying to fix this and make MMU support a
requirement for gnu-efi.

Fixes:

  http://autobuild.buildroot.net/results/8b4a503939bdbe773ceee69e01a3ea16873a75fa/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnu-efi/Config.in b/package/gnu-efi/Config.in
index 012324712c..2c4b78b794 100644
--- a/package/gnu-efi/Config.in
+++ b/package/gnu-efi/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GNU_EFI_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_i386
 	default y if BR2_x86_64
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_GNU_EFI
 	bool "gnu-efi"
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
