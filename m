Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D33C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 13:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0FF84047B;
	Thu, 23 Nov 2023 13:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0FF84047B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NuBxQDGFiXeu; Thu, 23 Nov 2023 13:41:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D58F04116F;
	Thu, 23 Nov 2023 13:41:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58F04116F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1E641BF368
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 13:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBC4341E26
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 13:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBC4341E26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnL0Oua6yC4N for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 13:41:04 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 000F841D92
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 13:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 000F841D92
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9ffb5a4f622so121060066b.0
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 05:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700746862; x=1701351662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5GndmCvuoGZyq+5RxBLuD2FsC7lyScoioQDXxCtZ9/E=;
 b=c0rTWeK1rl1ZgMnKmw/kvpOFcadP/rg+1olivTWahtqdCPixoVm0/MZcW2OgQsxm0C
 fEiPtBAkxvbTrZ7lbZk4gSQcHOd+eMKJ8KGAZZlRxi5naP6KX5jzKWyEhcNNlGP5Ke1W
 Zhrkbsxt+5dIIwAYA3bOWw1Ej/MfNFedE84AkGdTZ3XDIRqVdvNsz08BrBr8ybzUy8/l
 lLfj0+Qb7nxTaRN6yfkuViO2Y4ZE7DzMTy2g/bxuuV9C5np89AxTbL+83C6+OLZ88vMM
 +ygE2crAbFtv5SiuXBhdRAZZsleGfPoaWDH+gsPcmEgfpVWlit2+0/q/VM2AoyVACB8v
 APyA==
X-Gm-Message-State: AOJu0Yz8qzflg4If1jsaDZQAit1L+0mm6Ra5HP0Eeh8HSNk8HGwcqQF+
 QptTn8drP1zgIv2GVtwQlb0auK6FccCZTJ35wohO6w==
X-Google-Smtp-Source: AGHT+IHZBkrKNOhzHyfBzb8s20gxmOX8T+Qi+AkUciZQIAGeddYKi2qYLySy2cAzG6tX1nGh9oXv2g==
X-Received: by 2002:a17:906:1282:b0:9cf:35a7:9ebd with SMTP id
 k2-20020a170906128200b009cf35a79ebdmr3201297ejb.43.1700746861696; 
 Thu, 23 Nov 2023 05:41:01 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a27e:f878:7504:438])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a170906595900b009ddc90505desm799604ejr.141.2023.11.23.05.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 05:41:01 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 14:40:51 +0100
Message-ID: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700746862; x=1701351662;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5GndmCvuoGZyq+5RxBLuD2FsC7lyScoioQDXxCtZ9/E=;
 b=e43jvlDz2ZlhvWE/wFULzOT7htdoVMNAWU1/nlEqoEUhf9JO9Lr+qeXsTAQFauLhIg
 2yGD4q1WHmLkjIuKvaqN0lrAGRE3yotRg3RnuBTbvpuP4fLv2KuT6FrhabhP+HIg1zyC
 jvYAoMw99jF/TMIyyuWL9yS2N592sYXRSRjKc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=e43jvlDz
Subject: [Buildroot] [PATCH 1/2] configs/ti_am62x_sk_defconfig: explicitly
 set the kernel version
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4b8fddb060fb ("configs/ti_am62x_sk: new defconfig) forgot to
specify the Linux kernel version, so do that now.

When the defconfig was added, the default version was 6.4.x, so use
version 6.4.16.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am62x_sk_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index b98a68ff153f..6610e6fcf890 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -1,7 +1,10 @@
 BR2_aarch64=y
+BR2_KERNEL_HEADERS_6_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
