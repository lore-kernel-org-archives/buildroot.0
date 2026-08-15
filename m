Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2614EC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 12:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECAE81175;
	Sat, 15 Aug 2026 12:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-O69tnrNEsH; Sat, 15 Aug 2026 12:10:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9698281107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786795813;
	bh=c/WibOPYsMVvV1K2MLoLELpXOKAjPUL1HzLP5SdYKfw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=RnkpF4nroFZ5+1Ljocbzt4v1Wd8mkbRfFhhKiSR1cuKUqb8YgiduvOtjLRyBD5bWM
	 NS84ms14XnBtaGMd23TANKT9kElVCrnnAKwLgf0juo45mZzqmDqWKbEgcaYjpVdBqI
	 uvFbtUO8UJEQf57D18aH8y5eo6lKFn2WnryF14XbXqVy3z1AB/I2IhD37C/6kBVkwO
	 5s5o7aHnWwMrBu2T7A6DpWzMxqREhig5d6Kly1Gu/d/azH6X98m9jzBhs0AFn4daNA
	 UYYJ7/5QbXpguqAyVD8eQjjCshmIxh3kyjy3LSatI7tYBns9hrC6fjUvZJcDAwbHow
	 yTFYsRIaXfKRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9698281107;
	Sat, 15 Aug 2026 12:10:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3A3B2B2
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 12:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86C764099C
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 12:10:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rNnoT1k13rjL for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 12:10:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EC2340723
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EC2340723
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EC2340723
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 12:10:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49978908b35so15408815e9.0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 05:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786795809; x=1787400609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mbaUtOU05JPOMi2P8tJ5eQXd11DJuRwQISGuADg5y40=;
 b=p1X4H72lP2f4P5+zbS2YxzGyRGehDAnawzhbtNezKrs8233Z5xPuS5c3Fi2qMBwNra
 oN66kmcZe7qjBhJS17N53HVBecZM+qHhTZLhs+ZpVcNdcyTZDaFRonMhgWCLDfBE2FOb
 fB0PJsE488R+ZwDndanrbliW02f9B93L/cKM0dBg43upmvtgpzUtqyJ8hi5XBhWW3Phl
 fNpwsxUpgMXpkcO+4Bmykn4RoS0lPi9FVqnnh7TYRNOeHLq7DPB6I+bEeqogzeRHTBKu
 XnRLQZhlGBa4OaHXbuzcmTXxTeRdhMmPai/eLY1d3Nb2u5xK0nb+x1hAtvj1XmlqpTVF
 o2iQ==
X-Gm-Message-State: AOJu0YySY4Q+zSAcj+DDJslOpoztxc6XAYjkOog5eyqgK/6QzIFHDol+
 kCtP0lTSFGNEAgnhmXESl3w6lGEAEHrC5ZoHegAQPCVYzk+I9REJLRqQCm8p7dL1JkMmQMrmlt1
 9rQqRfgw=
X-Gm-Gg: AR+sD136+Y/wPtkWMRUmMq/aLpBisb4OptTks5k1j7Qt3kLhkAzlh/cRJpfncT/vvau
 q8AGTE4KJDzptk6O3GbpfjCku601sK92EmyxwbXwJ/F6yIbG3/dTGFqbywe09c+TfSFZneGmYA2
 wyC19KRXQ46erEZskzs1zuZVokF62rYBXD2BQWp2UxeJmwu+FcsCEMYzjMSKKh8CtpvSvQ9GQMV
 5A+TxM5uHGy4FaRQjSXUVMpcUUcs4m4M1lyA2EsthZ+Qou/dqr1z8MFQhcdJd/gDFBX3Q0WpwIK
 63pHyptyUQFO6lsMY4b/vpMpJU2/kdUz18y1mUX+TXqiAzODt4vbG1nyZLQycl4VvYl8WyWo2Gy
 J3+M+RBXqOocIAfiuAtdIfy+JQH8zXQKXjcoKoLNPsNRrwpLETzzc5kuuuKRWxCPWeHhYyNuJ8n
 wbPt4UgBcFFJ/2T2P7fOtuYt9NxfBOOs9IkMAhvt2cPGk+x3ZPfFOIhuX/g95b8rVgIy/kHD3y2
 HIc6kwxJi0u31a46AWFwDcjQsOaNX4oegxzvDxQvr80oqAMxk7cLBbjJcdPU1E=
X-Received: by 2002:a05:600c:6304:b0:499:8ba4:8cae with SMTP id
 5b1f17b1804b1-4998ba48f3fmr93768175e9.1.1786795809218; 
 Sat, 15 Aug 2026 05:10:09 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899b5f86sm109548115e9.5.2026.08.15.05.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 05:10:08 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 14:10:04 +0200
Message-ID: <20260815121004.2036403-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/uclibc: disable SSP support for riscv32
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On modern 32-bit architectures like RISC-V (riscv32), legacy 32-bit
time syscalls like __NR_gettimeofday are intentionally omitted because
RV32 implements a strict time64-only ABI to avoid the Year 2038 bug.

But uclibc-ng code [1] is using a direct __NR_gettimeofday syscall that
is not defined for riscv32.

[1] https://github.com/wbx-github/uclibc-ng/blob/ae4a98f9612c7050b1bceb9c8340fe5ef9345e22/ldso/include/dl-syscall.h#L263

As a workaround, we have to disable the SSP support for uclibc-ng
toolchain on riscv32 for now.

Fixes:
https://autobuild.buildroot.org/results/1b6/1b6f2161b11390b6545bddbc39b444401c718ebb/build-end.log

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/uclibc/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 6b8b0d86f8..dfb74da789 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -100,6 +100,9 @@ config BR2_PTHREAD_DEBUG
 
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
+	# uClibc-ng ssp support requires __NR_gettimeofday defined.
+	# https://github.com/wbx-github/uclibc-ng/issues/19
+	depends on !BR2_RISCV_32
 	depends on BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
 	select BR2_TOOLCHAIN_HAS_SSP
 	help
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
