Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BECC636CC
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 18:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 528B5409AE;
	Sat, 11 Feb 2023 18:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 528B5409AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9n9-KJe7M6vl; Sat, 11 Feb 2023 18:29:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BC74157A;
	Sat, 11 Feb 2023 18:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BC74157A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85E471BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FCCB403CA
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 18:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FCCB403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emE0ONrIq5qQ for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 18:29:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DDE240148
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DDE240148
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 18:29:00 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j25so8307225wrc.4
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:29:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yGQSk/Nbd16/0eYk1lH5Qee1VgkXRKhM0I8LC6AHeK4=;
 b=p8n+fPVpgQeWlXUEQr660BvismySWJk4akMbOtnDhfZBoWHVNP+zKVLFlpUAoxlSsV
 qi8rkwtyf9LIxFEoIFG1ZcY+lt4C15HS9Zt7TuE+Nhhcg7u/BHzg4J0VlftlL7dMvtzW
 /0aO/MMNYJGieLFV4zGlpB33kajMiR0Z7o+28+zmxpkvDrLjfyTfUhoyB5y5u3/lRgM0
 GT0mZfMohdIY40kcAwCVbIRqcbNalDzXQDgNn5vZ0RL1OxIvco30e/cXdUojLtmK2vuM
 1k9ASSIEcv8ZYYzAU19abtUbDK8CJZ96rHWVZ2qUCgntnlHEL9PCKb6GqXC84hpm67kN
 uXiQ==
X-Gm-Message-State: AO0yUKV8zvTX0TxhJ6PlGl3puvjLoEa/2aQP+HkGoAiHKUhzSSMSPoEp
 +A5216V/wca+0kCWJlwTzi128Kz7Bl0=
X-Google-Smtp-Source: AK7set+v6ucC5W41Iu9kQ1vbZuKcEqwY45YO+k45RS4eqDMHPzIpEbv+DuM1LuucLuamKxTZox6Z4w==
X-Received: by 2002:a5d:6707:0:b0:293:1868:3a14 with SMTP id
 o7-20020a5d6707000000b0029318683a14mr15841082wru.0.1676140138409; 
 Sat, 11 Feb 2023 10:28:58 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003e001afa274sm9446499wmo.2.2023.02.11.10.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 10:28:58 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 19:28:39 +0100
Message-Id: <20230211182839.3841661-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230211182839.3841661-1-romain.naour@gmail.com>
References: <20230211182839.3841661-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGQSk/Nbd16/0eYk1lH5Qee1VgkXRKhM0I8LC6AHeK4=;
 b=YnO6rb14R9typTVI/LX7s/Q+Fi/7eClxq1OEB/O2PBrAz+im6/ZTJOMU7R3X/RMXYg
 8sX2M8pX9R43eSoxk3x/EzwM3dMY5hsBM5sQtMYrimySSXKGNgw5qOcQsKocz1Z+yLNW
 HU6fj2m3f8jc9BrsmjhUoLUS8I+tpOnMyupdMP/kuw+rq3ebrhHwuhM1lQ4XrMWNc11V
 YpzVYyQfh8oPO+4vS8EAh5scu17vQbbbqk2alpH22aHyPIBTx1eulLxGiyMdyNSJCTGW
 1gyPzCIkapLkuvVtExoXWgzmcodxQR1ebG+wAC/flBuDDY0He5FamhYV251Kk4wZiOXE
 z/pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YnO6rb14
Subject: [Buildroot] [PATCH 2/2]
 toolchain/toolchain-external/toolchain-external-codescape-mti-mips: remove
 wrong MIPS32r5 and MIPS64r5 support
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toolchain doesn't support MIPS32r5 and MIPS64r5 and the toolchain
infrastructure fail to import the sysroot to staging.

Fixes: c4a62fa6278058461ff9e501ba6e822486453493
Fixes: http://autobuild.buildroot.org/results/701/701e8a5f713f7bdd1f32a4c549cdaac580e2522a/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external-codescape-mti-mips/Config.in            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index c58c55119a..8217ddc38c 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -3,8 +3,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
-		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
+	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
