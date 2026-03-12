Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E10FED2F3
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 09:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AC9141C66;
	Thu, 12 Mar 2026 09:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kC_1GkGWMeH8; Thu, 12 Mar 2026 09:24:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2538841C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773307474;
	bh=2tuqsK7qCw9pLXHMmR/maoGnxZegXt1ybHa8kzCqRDw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JHRxLosmIguG6AiEsFLow5OLI+5OMLo+ZhsWQihpweWhd6JTzR2MhenDBJdgfjngX
	 Q0KKqXQu4uXNbCw7UUdwjRNiRpbRzEz1FXfMCeyPVfvuhtMyKcawg8btiqcxl8SaAy
	 eR70WnjDrrRKH7DL8JMMtDHDoXwfzHFYiB5X/tfPvgPcFriPQiccqB2aRBP213oIio
	 7i8MYyN71uEKhrirmbhhJ9Kd+/kSHU8u3xreVlTORXq4+gsDoB4xK46LEz8HdMXsJo
	 zIunw4kECsNkSSL/Z4fPVGekZFHaD5/8ap+Mc/6ffFLIrZPasice7T/TKN5LM/PjwN
	 JSw2mHJMoft2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2538841C18;
	Thu, 12 Mar 2026 09:24:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0474201
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B65A4413CC
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yOARliinxsnE for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 09:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=dowan.gullient@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BC85405EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BC85405EE
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BC85405EE
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 09:24:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853c3c2fe7so3915515e9.0
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 02:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773307466; x=1773912266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qIpgmo8h5/A/j6h27gvPsvFL1Oqovg1rr46TjcDIKyc=;
 b=ifoN6DmFuLAquTcX385fEBZ1WZo9yx6gtUAT/veAeUx5+G/L1KezB8eTvm10EU5U57
 vXqJfAgWrCmJ2Z8k5wUY9iaK2RV+evHcmLRHbDytGGIlpU0J1Oq1kUHSPo21RrOW6xt6
 Mg5w+F+OmhYDwwK+e55RzTfqCIxxgbkYU6H/ujddTLDmDlPuoZ4MmsxIRQCoE4gOJryP
 7g6EOeDw5AKRGtCJlGjsi9uEd7cwV6NYtWLQIfGJhLzOteF8VmG1xZMwDPnEYx5PRkjR
 6sLH+D5hhk5FCaSihFYN18vaRJOv1kk0VMHWJTdS3tKhOVlRCih0UIEQW4tsTWSCh755
 tkjA==
X-Gm-Message-State: AOJu0Ywiew48/aMnw5M/+eVj1Qt7ej6O66NJ+8Pw8pYRk5/VH5d7+UVY
 ENGV5GKBluxh8xXZwT6xNEzKL9ewuDEGl4BA+wcpctlmdvzhb42JlM/8B3iOH5toM4VpRqWmgr8
 qaD4+8dM=
X-Gm-Gg: ATEYQzwQyAgW6iktgxc9XCadNbu9RAbTSI5eWqeKe9/Y4EwHsB88fUYvt/tk9Xf8Q5U
 YZsV/yFDkLH816PkhfI5Je6HeJq+XreNsA0kKzxVeDhTWr83Wt2pDfCpi8EzJ0y3vqSSRxBzd48
 yJUE16h5dX6Px8E3PTnlnn/Z6iNipamH5+blBpNUUItjqB0649Mdt3NcyChShOgmpj8Jjw5NlB8
 4HyJ8u0hKblIVAhosfpk1XOsHMkz0lylb5KjdhxfP5fXfXEcPiAYQ003BtAXqQ8gd+/fMON1WRt
 CgJ0Vxs74WwwG0If2QPz4ge6P7Oy+sivxC8NGfxQtgbdnRUE+Cg8ejZIxJxpG0uKRxOupGo+SGJ
 zzhdzU0IVPrnqtp2/rBrM37oJ00q21Xoc0/45SeWFvr5naj/UyUUNbTBr49TLDjXuCLAxgER9Qh
 rgWYykg/S0szVPGxoLe3XBM1+HBFVgUD9nwCT92GiyWI0iaZj9+ZYaLvygfd/sbiIiexsnajlzH
 OkYw8kyrO3dHePFq4HG
X-Received: by 2002:a05:600c:1c29:b0:485:3f41:e113 with SMTP id
 5b1f17b1804b1-4854b0ac248mr107774055e9.1.1773307466227; 
 Thu, 12 Mar 2026 02:24:26 -0700 (PDT)
Received: from P-NAN-NAPALM..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f3cdsm243996485e9.14.2026.03.12.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 02:24:25 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Dowan Gullient <dowan.gullient@smile.fr>
Date: Thu, 12 Mar 2026 10:24:13 +0100
Message-ID: <20260312092413.545638-4-dowan.gullient@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312092413.545638-1-dowan.gullient@smile.fr>
References: <20260312092413.545638-1-dowan.gullient@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1773307466; x=1773912266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIpgmo8h5/A/j6h27gvPsvFL1Oqovg1rr46TjcDIKyc=;
 b=3yn2ciJ9krmFEz5ezZpBGAJyh30YQLawXK8yLgtpvwvSQq4cR2DYkXK98DSDl3m7fl
 4jXV4E2lO0adF4CqvDAjF4JnZ5dhb3GP3ASfdOZKHTa06t1tHinpebNhGN92x/8dfQsR
 TuBLNImAq1JyruOJzezdtbbJTCsL5UnfsPsXQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3yn2ciJ9
Subject: [Buildroot] [PATCH v3 3/3]
 toolchain/toolchain-external/toolchain-external-arm-arm: bump to 15.2.rel1
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

Update the ARM external toolchain to the latest 15.2.rel1
release from ARM.

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

Verified by booting on a default Qemu configuration.

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
---
 .../toolchain-external-arm-arm/Config.in                  | 8 ++++----
 .../toolchain-external-arm-arm.hash                       | 8 ++++----
 .../toolchain-external-arm-arm.mk                         | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 7b1a7fb27f..992ba09518 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,18 +3,18 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 14.2.rel1"
+	bool "Arm ARM 15.2.rel1"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
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
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 9a657a5ed4..ce3797ac34 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,4 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912  arm-gnu-toolchain-14.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
-sha256  3fe832f9c831323a37ff54bfb5ac7a083acdd473f2c93feaf0cb3c1ac690d739  arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  3c65d820a6b8f677f8f6fbfc749fe00a4f16dde12341436c9df5b7092a47c0fb  arm-gnu-toolchain-15.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  6e5871df39a38b3a4c1374ea06f82fe0fe0c2927ddd2c060401fd60a5d045859  arm-gnu-toolchain-15.2.rel1-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 86937a7412..f82f1ab196 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
