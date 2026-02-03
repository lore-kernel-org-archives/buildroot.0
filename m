Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A6FE8783D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EB640BBB;
	Tue,  3 Feb 2026 15:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bc7RnkwxqDhn; Tue,  3 Feb 2026 15:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14F6240B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133000;
	bh=u+bPQVGPKosbgA20Ie+El13GfPBsFcJ5NrnUdTNne5g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bTCcD4XiG4RWKCAKS45nO/Tt58SpkECK/4ffXF7X02882U2CBaRfaWo6Q3hA+aK7b
	 AAkzQ14LcCnE2sjrGyo5ELcssNHef4azJ/frRRnybo5g/wtpIZlkifrXYP0KVH8K/r
	 4np4PXwOhAIpICOMb4Ov6F9lbZNWkhYQ7ymFiqoXVnc9GVlfEdMkbvedsJ98XVjXFw
	 CFaZSjMyrTcWMsD8FOeIz19NqzY/Prdjyb2IDVlcNznB2ULBRucuAcrJr7cQhkCAqW
	 DLyCzOVv0zbDb2G9Rf+Tlid38QPyDJEqLr5zFxcoqn4wL00bmBRnqgY3hyU3CSpcjV
	 mWx0daXab6wRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F6240B60;
	Tue,  3 Feb 2026 15:36:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 678C8F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55EB240499
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GEbfo9OXnYll for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5D8C540025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8C540025
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D8C540025
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:37 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so61458865e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770132995; x=1770737795;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=KSZ4ON6qaSmojcQT+5cBthh6YKyqKcs6wDA8/8XCCuE=;
 b=bzjHVQZQ8UT5fv66RHpFij/iSG0g1HmmUHo62EF4RxZ5qMb96b0ZYIaj7vAbQYC9sg
 u7VEZ8/tRAJ6HJnIlKQFsn/Cfs9l3UnKCx0pXmAsMXVg+M5KoSi4jRbaYkbavi2iA8cv
 lyeVo9VPvJdBgSsBSLsq7pug4xJKrxsbAUg9pGcCjeIisyZJrQ25tjayxQA4ELszdxoL
 5+lrupHp3wL6altCnUo6kipYUGY2Sm3ohi/SAZC3ZYw9u4nOX1hQsm3eNwRyQqbHZykZ
 wVZrnfg7qpTs4Z+yQsmFSpN9u6r8/1JWBrgpVUsvua69r6EkRmYFILnqeE+8k+GEk+e4
 kEdg==
X-Gm-Message-State: AOJu0YzsnlohzNdH5L1LMpdBskRkdPXMMj9fERMB9qHHwb5poVOKcQls
 e9GwLss9tv2uDl/4G8Ny2lcFgtklFcHAi70ZOE9xsj8N1p2LYQ2U6jGmqoczbMc7
X-Gm-Gg: AZuq6aK0hMkqEWrjb6Ow4jvlE2ZIqixDMl7a1MSLE0dy929BN19JXE1qKNmMsmCP26r
 JrTVrkzH12kOZd/YGntsBLQkQkVzm7L2LeVxNVXNgr9NCDjCxcoFNQeZ8gUklqw/AdXqfJSkS5m
 q6V2krh3eTMtUHt1wf8wkaXLju8KPulY7kzbqGRRPcqWVPcf7aF7Tz4kzSMeRDka6iA5Z2WsN79
 p2iA4TeRMLsLFutdK10BrknwhMhe+P6eR4LIjTSO/qX18/FakzOAEqIx6Vyk/YefLc7l5w9eJ4g
 nNwHH/8v4Jx0E3ivcR464kfpuXQ9gHWNhczMtFbpN8UIp85thMdnz/7AyEsKj/NFkX2FTxsp8s7
 1T5Qn+VbPCCVbajllOZaRV9hJt68vkQWpmyACfBQCnueUECTD9XGSxUjxHN4MTehnAs2aUcWSEb
 aJ3WrBsyYaQQI6joPdMhk5Qzuqe4GZumSqIPT2HQ==
X-Received: by 2002:a05:600c:1e8b:b0:479:1ac2:f9b8 with SMTP id
 5b1f17b1804b1-4830e9794a8mr315905e9.21.1770132994776; 
 Tue, 03 Feb 2026 07:36:34 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:34 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:09 -0800
Message-ID: <20260203153617.80012-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770132995; x=1770737795; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSZ4ON6qaSmojcQT+5cBthh6YKyqKcs6wDA8/8XCCuE=;
 b=VGhfWg4Gu6YzEx37dzoZhJOnzYPr/BJ5OSy/rSNEH2TDhsbc9uHbbVnkzurjqi3beB
 30MKmkzhipiDC+3qj1V0i6EzJ/ZpfwT2GETWXUWd1goa3cx9mn08JkYSqay66pKre1NQ
 8VENuLaegYFPzUXwf/WyUueyMQlvVbOPMucvi79m1KzwLLWLFC/u2/6k0+qesaqQPyFT
 J24qUVyydhf1AlX80h6LbVJDWnUCCq6+c+beJKeNMl6dIgLW/2MOxvBUstt1dRESqfUj
 ilI2aYZ+z82LkHxU/jBS9/RnA3geQVyHg/UJ3c4uRcbP8kZ6172G2/FGL+bOuKqgdQhN
 1gWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VGhfWg4G
Subject: [Buildroot] [PATCH 02/10] board/freescale/common/imx/post-image.sh:
 add i.MX95 support
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add SD card image generation support for i.MX95. The layout should be the
same as i.MX93's, thus we utilize the same GENIMAGE configuration.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 board/freescale/common/imx/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 8d9bce5328..adf20d5e45 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -56,6 +56,8 @@ genimage_type()
 		echo "genimage.cfg.template_imx9"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx9"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95=y$" "${BR2_CONFIG}"; then
+		echo "genimage.cfg.template_imx9"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" "${BR2_CONFIG}"; then
 		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" "${BR2_CONFIG}"; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
