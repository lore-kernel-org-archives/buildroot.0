Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396BCCD98CF
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 19:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0594D83AE2;
	Sat, 13 Jun 2026 19:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bk7_DM1eXtYE; Sat, 13 Jun 2026 19:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198C383C76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781379903;
	bh=j4kJ7+eL4sX67TC2CJo3G65AEoiAXyVfpUileGlgDvw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KcN/yRjaAU4YEjDE7QdAf8Qgd/rDzoxtxjtCH98lai67r7GODQySgfUC5ncP6028z
	 qpMBX0pVrudSCuKtgU1i7L59xud/l+RRceAhXig7PhQRaMwbw+BF1PGExQKY+sB6F8
	 dunmObUSA/POx71NwJG1HvhxGMokKMamt914BQIuccmQMB4rmDT508Kevjrw3qtaa8
	 nEWNlY2mpjeIkCqdBcBmXWn8mknW9Ay/A1y7wmC2VNyeESRwMV6P6pZnd70D0Zlxhw
	 civ0+/sK1ZpyvDEImqckTHIDDPLCqCDq8bouSsc713oibzLVXxr4TBggD1BkFHGdKh
	 aAJ2YBMGIi7vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198C383C76;
	Sat, 13 Jun 2026 19:45:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDF31F4
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A2E60ED5
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffWiSV8e0j4y for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 19:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 750E960F05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 750E960F05
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 750E960F05
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 19:44:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so25328095e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 12:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781379896; x=1781984696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6yHAt6HbSy/Hrmyu0WzPs/+3JFGx+DheSvkO6ggkt/Q=;
 b=JhN/lwkQliZlb/ZDhUoYpPgVXPYUhk1NCE2ypJCeJVEUnkBqykAXwJOJNjovCiVJDC
 UYTYHqHiDJ7TRAAjzlDDCU5NAgT+fpqfumt8iT89uAWcF6d7B5fodQ27gv07x6Jh+9bU
 BTlh8I4UaVWO1DQJ/xYH46RQbVeEgXIbHEVDoEnHtz0cQcRNUPRTI8Y+1czG7YkF/ZMl
 /2zaXRrDGPFYg9XIpHFrqw2jexviRkYeqeg6fxd+1HMMYBiznUiEOSUw02PY9JtPiv/9
 H2qKHdqn8/v8R68nkoulhbRwsg0E5lSuIglrl8T9AQFJzYLTyySkd+1UCZzxhQv0AQwf
 gOsA==
X-Gm-Message-State: AOJu0Yw7iwhgiuSJbRSzdry3gHodg9jBy4Obp1KCFu3eIBNyZw7AngwU
 QI2WtgNHmV5ze4CtwOas6mC+NGVVMI72SaD62zug9WTRCENhUrZucjlIsPnLTCwrdaxo1NYlgP3
 OZE7L
X-Gm-Gg: Acq92OEymLd5qWpw9kGsdWiO7SDkUZmSWY0RpB6HA5LihnPAjLc37NK3Cyw5TMJiH+B
 Pi1G5oyhWC++cqZKrwBG37H2AxLP5Ml7bM4zRMg1sK1HEv/ufluIc7KlHHb5glx+QaEJbFkS7wY
 tdtDTy30aYbAseT2gaaPEPgepaeGJKjoOURpCnqL+yPBYv8vPWvCM71sBO+f08Q8vpjXjKgYE8c
 /FbxeMTENfeZqi1GjXK1zc6QUnjcFePVVnQvBVoa+Ln1/y/BhUKL8PBA98NxnYJXwtm82NvrV3D
 GBBgU37P2tZzbKK3jtcoHqOArMPhsGOemSnxz3FoK09kbm61w1RnbvSkmM3FR1Gtx4T4Qg3OIVA
 RkqDqV5UNtCqvnJFJMPym8Fw78ox+2/3gZzKmQMkiPLeIo+mKn7JgmcmG+TnXSb/ZYyYxrTgjod
 wCu04nQvQASHxSLuBvSsA4abSoCOBre2zVIWWvDhStAQjSmbUpVuceMZdmFvrFT85240P/87YSv
 nftNf0mkwQpHsqB9SMfisCUAg==
X-Received: by 2002:a05:600c:5010:b0:48f:e230:29f4 with SMTP id
 5b1f17b1804b1-490ec4e1c7amr80115085e9.15.1781379896405; 
 Sat, 13 Jun 2026 12:44:56 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edc23sm103167015e9.2.2026.06.13.12.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 12:44:56 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat, 13 Jun 2026 21:44:50 +0200
Message-ID: <20260613194451.220317-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260613194451.220317-1-romain.naour@smile.fr>
References: <20260613194451.220317-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1781379896; x=1781984696; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yHAt6HbSy/Hrmyu0WzPs/+3JFGx+DheSvkO6ggkt/Q=;
 b=XrU00nw8141lAadhpySUGUGdo5fW00bGifY6mqTkG0lu/OPwH+ZqIbOojG+A7uqnRC
 9Uqt4pIq6Chy9uMHOyOMfMpJVv/RIQef6f9zhsJ0GBKV3yqpP7RU+L0XHmGPDLPVzRNi
 eBr9dXt1q9u89sD3EccmaIOnD/65FJMUw3foQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=XrU00nw8
Subject: [Buildroot] [PATCH 4/4] configs/qemu_{riscv64,
 x86_64}*_efi_defconfig: switch to Bootlin stable toolchain
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the qemu riscv64/x86_64 efi configurations to use the Bootlin
glibc stable prebuilt external toolchain, as recommended in the
Buildroot meeting report from ELCE 2024:
https://elinux.org/Buildroot:DeveloperDaysELCE2024

This will reduce the number of Gilab-CI minutes by ~20 minutes.

https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914014 (qemu_riscv64_virt_efi_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914021 (qemu_x86_64_efi_defconfig)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_riscv64_virt_efi_defconfig | 4 +++-
 configs/qemu_x86_64_efi_defconfig       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_riscv64_virt_efi_defconfig b/configs/qemu_riscv64_virt_efi_defconfig
index 4e698fcd5e..c279e159af 100644
--- a/configs/qemu_riscv64_virt_efi_defconfig
+++ b/configs/qemu_riscv64_virt_efi_defconfig
@@ -1,5 +1,7 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_LP64D_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_x86_64_efi_defconfig b/configs/qemu_x86_64_efi_defconfig
index 1fb3682354..60790857b5 100644
--- a/configs/qemu_x86_64_efi_defconfig
+++ b/configs/qemu_x86_64_efi_defconfig
@@ -1,5 +1,7 @@
 BR2_x86_64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
