Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942D2FED2F8
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 09:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8D241C0A;
	Thu, 12 Mar 2026 09:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CNN72u6qDyAl; Thu, 12 Mar 2026 09:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D44B41B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773307471;
	bh=jRTXVcaj6i2WLtYUVgy3Zd7ndA9Sh8YHLH1Vpchijdw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a+MuwpHbP0JWfu2OL+4QVUi5StaLdljgegAZOG1ZRTP9B6j6VHIg1EwmxDR14rpNy
	 R9mAJYwIcHdiCoBdt11IGXQYKYWcSc/MToR6zc/sePDqCatn7bQq8iBYx4U+NvWGem
	 n6dy9CiAc6Utz9hmhkKE1b2eivY8C2kmeViAbqrdEcJEpNRB9FOgvk+ig1pJdgH5y3
	 gPzbsdje4dSCtURxqE4bdqv6u5461fgxdRE8wktvPXo9BzYh8k0VXJc+S2eYM429uh
	 ChnVquJnCMTd3gJKjV+A291vkfyBfxaersuMC5TFjEeztYVa+terrfeix033B9ELIn
	 HIv2MQ5CpLnvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D44B41B70;
	Thu, 12 Mar 2026 09:24:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF479228
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A500461C3D
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtM353ONnL5Y for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 09:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B2BC61C2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B2BC61C2C
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B2BC61C2C
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:26 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-439afc58ac7so973354f8f.0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 02:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773307464; x=1773912264;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=66OVGE4Cr+1jUmI6/kDDrsBD8q4i9yX5gN/1MmFRFB4=;
 b=kRDTBscHBTzSFRMyLzqUaIKHeGjU52Mm2m5Vflpip0hLvVsbq5krnlugpq9B5/32z2
 i96whyiq/R03Qv8mbY9MA5PLaDynbxJgvtH6QKMKippiIFJ7e2OS6brbhWqTPRE8cLDR
 fu/CKiqScPlICPewPpjgiIpfHJVmbAJlx9ScrObcUyVqqteWD5LEbeZquJhIZtsEeZTq
 ZZ1Ep0OLmdkNJf3OS57CGiFdwj015KbV6FzI8TwHNv5QWifr3rexuVe7E0SE/cBcFg7d
 qh+07zwHpCmGuHz5v40YyV2AKVhzVqOigKgbJkTuC7YC0KZZipWkzcWCwKfWhN+qu9Xi
 kKFg==
X-Gm-Message-State: AOJu0YwclT/5IAA8AJwI8LMU75958lI9riMCOVSqTvf+ClketSYbcQrN
 NSDQuaE2+M2zA7l9ay3M/vQJgpS6Zi6EzCnL2b1BPGSt5rYseBUpjgRHD7TNGAwpgOV5kLwFIrv
 WenRYivU=
X-Gm-Gg: ATEYQzybedPRBGRy6WU9iX4iR63vzVJdzwaB+yvHmj877LkZe7oQGr7jwFz1QceX1Y/
 aXuwBtHpAriCwNXCIUmFQ6O+Z4Faqz70ThE7JdyuBrtsfqH/e/ci4t6nTg5KIIxmfGwpJKJqp3C
 LpCENX0RHx0QdXQP65FxqHuvd7up7qeI7gxy2T+jK3feychSE++a2bcm1gxt6MsEuhUCwmhOCrL
 iEhf/4fBxNQVX/HnnKVAfrEILIjIhWGpKWkvQOXWVlLhjFxMkL1FuAn7GHkhXo1vqus0VcVldmQ
 UtVxeyaUVi9WbfQbJ9G7af1CVOuteROS5Rf60KY5qYc6s6hpGX0z7MQIXbAzmAVV/MatqEgiMRa
 B53R9lpUfY91+1uUE1bjjhXYj+Pqggl2aLdTdsCYVCU8DEAGCyxMIWF0IVtvIGt9K71eYgsvNe8
 ZEJZ6ieArjuYpNUqQq9A/ZuTpB/B/jMLPKvh8usrv+P88PpAvEpomPjGoiwgGPpODmhynuZUOtu
 qSUG2hoxEOlnXyWPKde
X-Received: by 2002:a05:600c:c4b7:b0:485:304a:58cd with SMTP id
 5b1f17b1804b1-4854b0a4a4cmr93312025e9.4.1773307464027; 
 Thu, 12 Mar 2026 02:24:24 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f3cdsm243996485e9.14.2026.03.12.02.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 02:24:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu, 12 Mar 2026 10:24:11 +0100
Message-ID: <20260312092413.545638-2-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312092413.545638-1-dowan.gullient@smile.fr>
References: <20260312092413.545638-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773307464; x=1773912264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66OVGE4Cr+1jUmI6/kDDrsBD8q4i9yX5gN/1MmFRFB4=;
 b=EzG74vtsjFnwQF9iOXP+NhLgoUanvCgdFHFeqIGKL47WS99UWdR5cAy+NBLs1y9fA8
 guXOcofcEoNHoFyikyQo3KpB16ytTuSlz1Ca+1C0x2vSxEAZsSYAYad773kM/7Wp6Lfz
 XyAjqtD79+J5oPOcoUKrho0x6RVBPDuxw9gfs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=EzG74vts
Subject: [Buildroot] [PATCH v3 1/3]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
 15.2.rel1
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
From: Dowan Gullient via buildroot <buildroot@buildroot.org>
Reply-To: Dowan Gullient <dowan.gullient@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update the ARM aarch64 external toolchain to the latest 15.2.rel1
release from ARM.

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

Verified by booting on a default Qemu configuration.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../toolchain-external-arm-aarch64/Config.in              | 8 ++++----
 .../toolchain-external-arm-aarch64.hash                   | 8 ++++----
 .../toolchain-external-arm-aarch64.mk                     | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 8582fe0ec8..ae1298bfe2 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,13 +1,13 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 14.2.rel1"
+	bool "Arm AArch64 15.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 3f9c9cea71..9913974643 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  299c56db1644c135670afabbf801b97a42e5ef6069d73157ab869458cbda2096  arm-gnu-toolchain-14.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  9a685b335bd709d683a8c782253c37e8c36c10e6924e59e39d4769b02132eb43  arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  97e3f600c00413088bb21109475443f9a1c57b4f75336a6e820acd43b065f875  arm-gnu-toolchain-15.2.rel1-aarch64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index cbc923bee5..5ddb5e10c1 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-$(HOSTARCH)-aarch64-none-linux-gnu.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
