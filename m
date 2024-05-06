Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5973C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8527B80F55;
	Mon,  6 May 2024 20:09:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8Pe4cCDbUBu; Mon,  6 May 2024 20:09:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E16F80E9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E16F80E9C;
	Mon,  6 May 2024 20:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 126631BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02A5080DB9
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8ofeYXrfSLw for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:09:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B70480D9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B70480D9D
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B70480D9D
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:09:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b79451145so17617105e9.3
 for <buildroot@busybox.net>; Mon, 06 May 2024 13:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715026151; x=1715630951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBe8cTWAA/y3wzAk50ApOZUWujb90roWAEyH8v9abhM=;
 b=Kfk3E16LDIu/J53DDQ6kO4BV+Itvcz8Qkd9dFzkm5KxOgNmXQKdvTT7PePxn0NpOQN
 AXQeLvL+NIHCEvhceCrGi6sWdsQVe00St5+KoXMx2foT5QKqdq9wtKl6rb1J5S7l2DZD
 eYQJsJZa6CHg+jUdNI3wEQN5t0eQtHOQE76Gv++3VMqI/FqtMLVPwsx2VW4URRGLMOL+
 88tfrpgc7Hitm3QLhECPRQVvFUDFhZ2uXRKMivG7SMqLpIWfIADvfSvfmwfRSVFUPozQ
 vzVLqFgEc86oTkATOKU2xZUS29PqDsSagyFTcwnGTJIBJZczJcLXbuHj1DfoJmpjCoY6
 oWeQ==
X-Gm-Message-State: AOJu0YxncIo4cXeJ0khEuiiP+5Wu+bFGYmfW2XhzmPulV40UoIzwH5wc
 +U5iVI0A6EfE3H3oC+gn7NCwcCPxxv9y/15N9tcgMo/mYeOKbKeLSrgVqnByz6IppwQs1VfkZEj
 xXg==
X-Google-Smtp-Source: AGHT+IE6reOo/e3IHF4K+Fm6FseZqjhTIwu3kalo/Ou7MKLWhuDcaFYD0qxeGUi32YPqbgEwVx9slA==
X-Received: by 2002:a5d:5f90:0:b0:34b:d659:7d0f with SMTP id
 dr16-20020a5d5f90000000b0034bd6597d0fmr10758814wrb.16.1715026150644; 
 Mon, 06 May 2024 13:09:10 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5007000000b0034e78c6ed43sm8878791wrt.110.2024.05.06.13.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 13:09:10 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 May 2024 22:08:57 +0200
Message-Id: <20240506200858.30197-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506200858.30197-1-francois.perrad@gadz.org>
References: <20240506200858.30197-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1715026151; x=1715630951; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBe8cTWAA/y3wzAk50ApOZUWujb90roWAEyH8v9abhM=;
 b=Mr/MX6O85c0pL65qjHoWvv7XO6IxIc2Tl1xcYPRiNsG6yAqFMJnWK29qxix6nzsQH4
 GXsWZ2n9BGqPbnKH1wwMF8k5uf2kxrHyl4q89k03c4jAWMu6qvJuqPFZxC/kXwxz7XDT
 1WDDeffFu/l+LOu3qQf6TOyXOS+sWnXi1szy3xTi17DwevlcMaLSxAZF7qmmhefC6eCP
 5BZksAmBkA3Mx7XNJYnwQWxx7UyEiffnvie8kYM06mh4FCRi7sMNB3DqigKdW6n1boU8
 TIpdd2m3cs1oEC4CFByljWC+Lf1vOS1lnk3KY5q+X4hwONIswm4OLgmgPk9vJ/WVWBel
 uhHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Mr/MX6O8
Subject: [Buildroot] [PATCH v2 2/3] configs/olimex_imx233_olinuxino:
 configure eth0 with DHCP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_imx233_olinuxino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 647292899..7049cfeac 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -7,6 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_SYSTEM_DHCP="eth0"
 
 # For automatic firmware loading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
