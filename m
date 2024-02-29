Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7197C48BF6
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 16:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 840B341B26;
	Thu, 29 Feb 2024 16:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BRw54ivEwIZo; Thu, 29 Feb 2024 16:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A00141B35
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A00141B35;
	Thu, 29 Feb 2024 16:53:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A17D51BF30B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C6B4822EC
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 16:53:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQ6dnh6dxw4k for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 16:53:27 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=gsmecher@threespeedlogic.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C5218227E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C5218227E
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C5218227E
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 16:53:27 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1dc3b4b9b62so10184525ad.1
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 08:53:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709225606; x=1709830406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QG/UKuhfUKvu6+C/csLWnm2nMXnIRD83lJa82TjXHRM=;
 b=g9r1lNp2YlK36Bi7bQPfAtC08wb3PQQOp5Mp1XjRSZxeViCzbdtIUwKMf22/bx6Nr8
 kOqlEc0pLanFalKt6R69Zka+KExGv6lHv6BXS+KnTj2+LtXHKupzUzknkK6Mexd06Ax2
 9f2OSOtC6+qACTdj3zTcHIsqks4sfIoo6/2YwuZZXXQ9SBoNnYSPPI8ya5xgbZIxXZcw
 rjt2iQ4PPUk6v62l80ZzGetl5+FH7vprrIOScid4XLrDbLyUY/4pLjqXggsTu+xHPW83
 NHDUyodb88pMbi/vq7c+hJl9PqXYTFkAX/6IN1bSQLOQ3ZuxACtCYDtWtW3jYZr6f1Rt
 ihIg==
X-Gm-Message-State: AOJu0Yyoa3QsiBxk5cxYo9pPJZy9w3yy8NYQLiA1kck5/IpgGuhoL6I+
 Ax8TvBtsNZP8BtWhCOY2PNoe2TPSqt+VRhiytsCs8hfsPwNJ16YAiKioK+x/YA6yqSjQQX+nLD7
 G
X-Google-Smtp-Source: AGHT+IEiTOTKZbb0o4PiHh8jWvSq6wXeq7q8TdCsLJ4DJBsL+A+Rjiv2KeKgEXj4hklyEi1vWhrLpw==
X-Received: by 2002:a17:902:ce8a:b0:1dc:cf17:8a70 with SMTP id
 f10-20020a170902ce8a00b001dccf178a70mr3344924plg.29.1709225606341; 
 Thu, 29 Feb 2024 08:53:26 -0800 (PST)
Received: from boron.threespeedlogic.com (d172-218-135-26.bchsia.telus.net.
 [172.218.135.26]) by smtp.gmail.com with ESMTPSA id
 x11-20020a170902a38b00b001dcdb39613fsm1628407pla.244.2024.02.29.08.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 08:53:26 -0800 (PST)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Thu, 29 Feb 2024 08:53:10 -0800
Message-Id: <20240229165310.1453209-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <f63378d9f3ed51f3740b15d02e66f8831905cc8b.camel@gmail.com>
References: <f63378d9f3ed51f3740b15d02e66f8831905cc8b.camel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20230601.gappssmtp.com; s=20230601; t=1709225606;
 x=1709830406; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QG/UKuhfUKvu6+C/csLWnm2nMXnIRD83lJa82TjXHRM=;
 b=HQKxpAlqX2XLiKA9N3vFCEgCI7hOg/v5L9dzelXeMIn3nkcX0r/0A3aTYsM72AHexD
 MeYy6pkAimoX+p4DsHYpBJcRQBE3d7zArQ0hAfj8UutRc64yCojLiDO5CkY8idoK5yIo
 wesl26TW8rLJqGW3w+96So9qU4lCWcTlfzsLBoVtiF1vmfG1QIrW8yHpfBOOE1uIY8kf
 Gbwt1PTSag1LDDrPiiAw1rNSqOfowk6MW6g9AYNEH/SVloyvOZHBpwFrN5vS4MveDIdB
 bsx68MZ/aMTjKiULr7QINTZUIZ8acH0YRNoxoH8tpZg1nFOYTJ6pU/ijwFzNbRBpOwSh
 O10Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=threespeedlogic.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=threespeedlogic-com.20230601.gappssmtp.com
 header.i=@threespeedlogic-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=HQKxpAlq
Subject: [Buildroot] [PATCH v2] linux.mk: Allow wildcards in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
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
Cc: gsmecher@threespeedlogic.com, alexander.sverdlin@gmail.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There are a few config/ entries where wildcards are already present:

     $ grep -rle 'BR2_LINUX_KERNEL_CUSTOM_DTS_PATH=.*\*' configs/
     configs/octavo_osd32mp1_brk_defconfig
     configs/octavo_osd32mp1_red_defconfig

...however, while the copy-in step of device tree compilation works
correctly, these wildcards are not converted to DTC build targets in the
kernel build. As a result, this configuration line alone is not enough
to generate DTCs. It should be.

This patch adds a $(wildcard) expansion step into generation of DTB
compilation targets (the LINUX_DTB_NAME variable). As a result,
wildcards behave correctly.

Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1db5c6046d..80881597ad 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -195,7 +195,7 @@ LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
 # copied to arch/<arch>/boot/dts, but only the .dts files will
 # actually be generated as .dtb.
-LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
+LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(wildcard $(call qstrip, $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))))
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
