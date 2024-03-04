Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD62C48BF6
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 15:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A3CA4157C;
	Mon,  4 Mar 2024 15:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2IUNeMoGSSm; Mon,  4 Mar 2024 15:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CEF4414A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CEF4414A0;
	Mon,  4 Mar 2024 15:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3828F1BF94D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BC19401FB
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 15:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TJEcOmYXgpN for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 15:34:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45CCC40228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45CCC40228
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45CCC40228
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 15:34:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-565b434f90aso6711359a12.3
 for <buildroot@buildroot.org>; Mon, 04 Mar 2024 07:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709566474; x=1710171274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRjEP6rW2+wt1sWbDuvtHSEPrWP/jDwJ6vl79p3tKTk=;
 b=tWzGYmOR19u1ktVYCj/ib7njUcwYgiEbGidk4I7Or4ABREUI3NdwdTTt+oxy4ponNi
 9aQwRTGPXBSQDyYopHCABYkR4W67l7VBb/09RBHS8HMpDQTyZkIteSkSBfFzYFitVOeB
 dbyVCCGd4e+DBwtlKRlGfeELHIoYSaAmFG2HBm7XJ0bJN/RtW0VlPUeOgEyBPKbkYPXS
 ZTLbXQIyQGUelK1YeLj7tvQ1Xm53SeL/M9sp7XSd9AmK7ImHV3Jho9bRsm/LOYCmfQRu
 /4+BiOt0PcrNxkZOmRLAYaJ4J4uoKpr1BR11xOrPyxr70sSjH9dF7yYz3XMzDmvFfZi3
 pLOg==
X-Gm-Message-State: AOJu0Ywu3Ma0zKfYQOMGSYvDdJ8hJWwXGGFXj8iGAo0m7lJmETaCRBIP
 NhlisJzRUvSuLAfZ/l6DeZ/ZF5WPb/g/Bo1nYmeEL3oE1FqC/PDx+mrd4hqyU3K7gFZBCDap8TT
 c/vM=
X-Google-Smtp-Source: AGHT+IHZ+n1wJqb9KGIUYOkugVkboqS93S1BK6uO572GtsFk8Uzng00og2ZNg8pDVmaLqlKe1BNycw==
X-Received: by 2002:a17:906:349a:b0:a45:214b:73cb with SMTP id
 g26-20020a170906349a00b00a45214b73cbmr2779151ejb.36.1709566473903; 
 Mon, 04 Mar 2024 07:34:33 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:72fe:558f:d55e:d423])
 by smtp.gmail.com with ESMTPSA id
 sa20-20020a1709076d1400b00a4432543b21sm4936082ejc.198.2024.03.04.07.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 07:34:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 16:32:52 +0100
Message-ID: <20240304153253.732708-22-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709566474; x=1710171274;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRjEP6rW2+wt1sWbDuvtHSEPrWP/jDwJ6vl79p3tKTk=;
 b=GznehXRFm3xBtYfJxER0hi8sh1MgNMNXR3BbQHL4jcbAbQmaS4rJcCkltwxtCNc4lW
 KK0NBLZm91qSPNGnxFeaIYrgQZuejCxdOJudNmnK4XNuI+thYGh+CwJ6tRvp/fQX0YwA
 +Se406p3vVM/CfrYfoAoS/RvcMWXJnqqEfdeI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=GznehXRF
Subject: [Buildroot] [PATCH v9 21/22] configs/ti_am64x_sk_defconfig: bump
 Linux version to 6.6.18
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

 configs/ti_am64x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 9b92b645dd21..6c1b5d824a7d 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/common/am6xx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
