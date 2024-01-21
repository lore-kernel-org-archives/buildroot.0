Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1DDC47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 19:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEFA0404F7;
	Sun, 21 Jan 2024 19:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEFA0404F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UeEVJNJx_ahh; Sun, 21 Jan 2024 19:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE67C40136;
	Sun, 21 Jan 2024 19:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE67C40136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDD5A1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD83D8225E
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 19:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD83D8225E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llCg5KVV_pV8 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 19:50:26 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D257C8219C
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 19:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D257C8219C
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so2937115e87.0
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 11:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705866623; x=1706471423;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2tjNzxXd249RG6+XOvvK4g06FyBn7Z6p8t66+2nU5U=;
 b=a6iKA+6dNP9MwR2fca1kGv9xyQGdTtYhNVhHd73rtsOi1AxFREL3HMxlvoYBrS8zcv
 uG7mDsdWxeP2auyW1vQmpKOVwHeiUlHwSb1hwKPKAYAxIDhu9A5+J8r4mVA7sVqyLXII
 UsoR+aAnx81vBqOf7yM6HSmJ1Y12Um6Vvx9GjvUSKpFG3JHwbtSrcgKUOxchMKaOrdQ1
 YPxNKx31k7eLOfuVh0ea1mfo9oh+i+wom0q2WzhnkdcVrTP3oNYeWzNo778Y8WN7zeWj
 MzkN0IolqLD7n71vxi7RVQBac78W0Cs6zz2yVIT1WlBbK1gg0qKrR4b5hqr9TtNKe86Z
 3FOg==
X-Gm-Message-State: AOJu0YxS86G9CgsXB9jO3V+eF06X2QzfRRk3dT+U1LmeJ8gR9E40KWIC
 JGY/GDDB8H9hNZYMCpFM2M/Urt9NEBgm3S7yGMSs5JExCshQoe78sdWXEZhyKs4=
X-Google-Smtp-Source: AGHT+IEZ/LUzRfYh6nKEPBY+PqmQMv8/qIhIMMmG05PgWfsbfHWp5S3Zl6Q2xg4N2iCwklsdGEO7Fw==
X-Received: by 2002:a05:6512:3f02:b0:50e:aa96:73d6 with SMTP id
 y2-20020a0565123f0200b0050eaa9673d6mr1233799lfa.21.1705866623092; 
 Sun, 21 Jan 2024 11:50:23 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::522])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a056512025a00b0050ff9c42503sm210670lfo.96.2024.01.21.11.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jan 2024 11:50:22 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 20:50:14 +0100
Message-Id: <20240121195014.3560982-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705866623; x=1706471423; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G2tjNzxXd249RG6+XOvvK4g06FyBn7Z6p8t66+2nU5U=;
 b=Vxpd6RZpdFrp6fswqjuTrVs5BTCnyC6HNvoyB2qg/XxZMhK6WxAhq4Lqb2E2jfWEn5
 AbFx8DvyTqfwmIiywG1YYF2C0br9Gcz5+PvcK+WryZ5Mkt+CdJvww93agwjhbBKHs065
 bX1IS+aqruyfvWYmSplWRdhIfA/8ioULGdgquDeIc72HSIg4dWFXKmxSvUpbivHVkugC
 MHfkcYTPPq3683BhgbJEGrhOoH6+G/TUuZk0gqT8/ISX5lOAsjwyGaQm4ZBA8kp1fgo3
 29+Qe6BVZNSS5pygf4zbQBty/qC5W2bF9G+OtWJxhyj6C5wMj6Z59tjRHthdL3k9HOEK
 VioQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vxpd6RZp
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: install
 rtlwifi/rtl8188fufw variant
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for the rtl8188fufw firmware variant, for 802.11n, as
covered by the mainline rtl8xxxu kernel driver since Linux 6.2.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c09dbc523e..ee51ecc930 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -134,6 +134,7 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192sefw.bin \
 	rtlwifi/rtl8188efw.bin \
 	rtlwifi/rtl8188eufw.bin \
+	rtlwifi/rtl8188fufw.bin \
 	rtlwifi/rtl8192cufw_A.bin \
 	rtlwifi/rtl8192cufw_B.bin \
 	rtlwifi/rtl8192cufw_TMSC.bin \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
