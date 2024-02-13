Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D69C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B20D84157F;
	Tue, 13 Feb 2024 17:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSI59Gbpl4Wl; Tue, 13 Feb 2024 17:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BABD41732
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BABD41732;
	Tue, 13 Feb 2024 17:29:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 790E41BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73066403C4
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yplWR5SFV6_Z for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0E233400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E233400D8
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E233400D8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so3151866f8f.2
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845307; x=1708450107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uz84XopbAX2BlOQS9PEGMhZ2ykoiueoOZugoFxlBdeI=;
 b=mzRC5UkEtgafu64ALTK6F0jHCDvkavpReCH5lBH+mJBw1SW06QdCehNegFep97uDoO
 GzTfqW+4h0Svs03O/uB8eXxu2xb8RKOtc2ctzM0ZgGmMXVuuiTXjgVIe3V3Hzqh81IhQ
 Gkj0tnLjCcw3IA6A7iNJxxiLOz3LeL5PCXe/0VN1xqouRDBBEH54ZVO2lKKd/5r5Wx/j
 DvPE8Cst3mhP7kCICMkKXmK170APzsybu0c/sygL17Vh1iVD2Lu9t9OAh92bRZW/oeZg
 ijYgm8uF+88/iac3YE8GjSA/WnGuvgNTZoCJcLO6sW5B12IDyNC7SYDpz2cmQyak3x8r
 dqKQ==
X-Gm-Message-State: AOJu0YwKIonxyT/a/7QW9r+pw22WitBzLfWV+rF8Gtdom4wUwFh5kxxr
 dD7whtN43UjxDC6RPMTB5FZCF6ltNefrx9mBEswhTOE5FyzOeWnE2GGR2Aw9QymgrH2Z+ZvNqDa
 Y
X-Google-Smtp-Source: AGHT+IFqklhBdSyXy1JoSCemCWkAz2SNCQjVikD8HexzgN3bDgmj65obsBwWggRSnuvjJkEaxSySzg==
X-Received: by 2002:a5d:4c45:0:b0:33b:6e25:86a5 with SMTP id
 n5-20020a5d4c45000000b0033b6e2586a5mr7870080wrt.32.1707845307579; 
 Tue, 13 Feb 2024 09:28:27 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:27 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:10 +0100
Message-ID: <20240213172817.2872849-15-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845307; x=1708450107;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uz84XopbAX2BlOQS9PEGMhZ2ykoiueoOZugoFxlBdeI=;
 b=hDVWWFQpWUDAcML3XH2bAQHFD215TWvje4iJu9Z1vd6PU5gmp7enfJyvF9gc0QPiCj
 FyJn6t77CCtWxQVNdMy/PiSeGeOW15LwuPXYpf9dQtnmzZzfCoaq/i9PY6wV5iNsrQ53
 FK+AYz7rTqdsuJwNsJiFVCnVQhDSMMd7dBTMPqtmWILjSX2ra1ahPC4mgJsbaGnsPXpJ
 P40a+lFDCLPjerjt61tvgmbFQE1im/PZBYRAKpNzcgQpXhRJLhnRGqshPWLIxKb8GD05
 XgY8IUjhSuzATYG19laE66Okp0iUmLWQccmjcGd8ZZ0P/6tX+e5kwwuj3oNUEtfZNd6t
 GeNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=hDVWWFQp
Subject: [Buildroot] [PATCH 14/21] boot/ti-k3-boot-firmware: add
 BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The k3 J721E support is needed to build for DRA829/TDA4VM SoC.

https://www.ti.com/product/TDA4VM (SoC)
https://www.ti.com/tool/PROCESSOR-SDK-J721E (TI SDK)
https://www.ti.com/tool/SK-TDA4VM (TDA4VM processor starter kit)
https://beagleboard.org/ai-64 (BeagleBone AI-64 SBC)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 boot/ti-k3-boot-firmware/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
index 8393699998..c9a09d8b19 100644
--- a/boot/ti-k3-boot-firmware/Config.in
+++ b/boot/ti-k3-boot-firmware/Config.in
@@ -22,6 +22,9 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X
 config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM65X
 	bool "am65x"
 
+config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
+	bool "j721e"
+
 endchoice
 
 config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC
@@ -30,12 +33,14 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC
 	default "am62x"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
 	default "am64x"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM64X
 	default "am65x"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM65X
+	default "j721e"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
 
 # Only devices with a split firmware boot flow requires a DM firmware (eg: am62, j721e)
 config BR2_TARGET_TI_K3_BOOT_FIRMWARE_DM
 	string
 	default "am62axx" if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62AX
 	default "am62xx"  if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_AM62X
+	default "j721e"   if BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
 	default ""
 
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
