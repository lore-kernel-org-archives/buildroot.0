Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8915E87842
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D5740DB7;
	Tue,  3 Feb 2026 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsBFlHDxuTW1; Tue,  3 Feb 2026 15:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CF340C9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133008;
	bh=19ojxetiat9Z46r7kc7BSXTdxtQpTBW4WzxhT4yfuYs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MVyTE3vlhbq9mAtFuxNib5jdhO46cy4DtuFYLe+GlZVYA5IWJrWUrUOMdOyTj0i0f
	 afE5Jkn3MU9DqLESCP/+Ddp0dinVBaneb0tISa/lkaynbnPnVJRdO7FVyrFRZCC58Z
	 CU2w8p8nektd2sjbhQeG4JcR0ooHgciOXoG4KSUo9Hpgt9h/uKfGx66vtiCRYG19hR
	 tMIpijiZlFXLsfei8Ab/j2Bx8qMZXCDCdcnGInGieJ6BoV1IkuKB/gxQgtSkgWh8aq
	 O/MYJRbAyYHpbkFYIgA4LB7jG5Shaf1OvdFrQi25PYgTB6u7mxAwarMLPux8Unbc5j
	 XstLYRdOXURgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CF340C9E;
	Tue,  3 Feb 2026 15:36:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 67263F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4909A83C8B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgoTrUxC78vo for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6342C83C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6342C83C98
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6342C83C98
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:36:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so50322025e9.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 07:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770133003; x=1770737803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cqpRPB8ut2FxgNIjc3/EVDZVsUCuQuaSu1qTyaulowY=;
 b=QWNEmznCzQfjib/VBOjSn8tK4wdTyVlAFno5tSYCSm1ae4dIrSk3BQLgaHxjtXribq
 JdIYq5zqjasSHbNt2dsPOH0ZcQcquQRwgHuYcW53uJ7TJZiypwt+M58WPuDqnBZqJEqd
 renKcz2HhZmkHzb8Zl4bvOW2I/bhHcsEO5YsHXGakAseVUCoO6ptWYpe0z2rsa3cXaue
 ZXX2zJCnT0NtrtYvyJRBIn02tDKgy73ai+/Qw4hW95nRBvx3ZJD72frhJqmD656XwgIa
 riYDvOaN/8r1P/Svd/RC/Xq3oTilIhKQLOBMEhZTavZW4vPkSXrjNOq742CO6bCOmymD
 A4ig==
X-Gm-Message-State: AOJu0YwWSskQFEstR5/IMfUQ25CccsXqRvGqc3MnnkWLTnQ0C0dsvHr1
 e68L/V5FjZ1yqhwU/VahQzjJOkQfc+9Ag54N6QtoWnl0axCqZgoxTiIzi5bgWnTm
X-Gm-Gg: AZuq6aI0BDzpCBlIoj5PCrqxaxJQEQsRUCUS7I6THXCII21EN6EibrX2WSeE3UBpm8G
 ZwLkzXsBUMzOhjeukkE3O1mktJIZaxVqp0GIiX/yxmtOgxamvFI5FuIs8Cw4LLlc+3r2wVjUCOw
 bwv1cK0OvccOdp8L+ZUbYYVUdMP6ZFgT3iFDReo+mf1OXJ9dL3NZJ1GEkKB0Hfj+rF6QNHvX0ga
 F55AldP5L5QqkLmcztsI71eC4GLIBoFwLnVbkABmeixlO+huK2S4B7EGaEI5GWW+oLa+5DI6hDu
 jbIh1F/J2k4GihK2a3L52qbWEiA7L3UlOID+IlRtC65Qqht4JWDzialDDcKJJdoW0zZT3R1FpvJ
 Z+3y1DCofMf/JL+erEv0FqboB7rkkRTZfR+Mru0bWpnn3NsCClkkh74h9Wrb3sbpEi/1wc4RPZ0
 wPD5mponHXvtJsKAB45CYmQzt5rxLzEbAjmpV5aA==
X-Received: by 2002:a05:600c:c3db:10b0:480:4a8f:2d5c with SMTP id
 5b1f17b1804b1-4830e991dccmr242065e9.29.1770133002978; 
 Tue, 03 Feb 2026 07:36:42 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48305161534sm62812055e9.12.2026.02.03.07.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 07:36:42 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 07:36:13 -0800
Message-ID: <20260203153617.80012-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770133003; x=1770737803; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cqpRPB8ut2FxgNIjc3/EVDZVsUCuQuaSu1qTyaulowY=;
 b=YeWMfyyYOILNGRr1yVwbibx48nqxMMOkRjX3twSY7K9CPm3fzBn0yu3zl59j82R/8V
 Ht01qOggw7CYywLy8fr2LJ8ei8hK/OwnK+IPelUuF4xNVVNILfdmt2z/29rJm4MsjJ72
 a3JAsI8ZbsLOG8zU4iN6Tu159tVX3rP+MfLbOx7HAnarCfP9w3tQH7mmZHLH02h8KOTB
 gO/G0nfuwMvhnsWmmDu+rBuF5yhNIH9sFMNynhaYviFGc8qjQxAlxnvzrRYOa9InbD76
 0ouM4BZh3yII4gv3rofekLFEqi66NKxwHh5l9ATlQQTMDcUzlp7eKeL3GeoMfr6kC1+7
 LTYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YeWMfyyY
Subject: [Buildroot] [PATCH 06/10] package/freescale-imx/firmware-ele-imx:
 add i.MX95 B0 support
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

Add support for i.MX95 B0 silicon. The ELE image for said revision is
called "mx95b0-ahab-container.img".

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 package/freescale-imx/firmware-ele-imx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index d8a55ed219..39d75a6eac 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -21,5 +21,6 @@ config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
 	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
 	default "mx93a1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
 	default "mx91a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
+	default "mx95b0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95B0
 
 endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
