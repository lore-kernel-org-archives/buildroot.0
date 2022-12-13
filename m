Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AEFC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 21:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FB9F417C5;
	Tue, 13 Dec 2022 21:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB9F417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58P5SvRbu_GR; Tue, 13 Dec 2022 21:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79CAC4181C;
	Tue, 13 Dec 2022 21:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79CAC4181C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 574CA1BF4E4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32E7D404E0
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32E7D404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mdrkdrDvgs0 for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 21:56:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF3F40227
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BF3F40227
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 21:56:12 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id 21so3168062pfw.4
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 13:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=amZAl1aweMc2Uriu1f25wNgBArN2YWoyEYfNhvVSt8I=;
 b=CwYbjDyHD55qp1PIGalWpTrEVnkjdkfMTC049ESi4sbCphctqoqOM9y/vixVyc6oKT
 nMQyrs6pBQy2SM9zG5ggDcFCQLvoYp0kGkb8kv4bcUUkF8nUpU8CBVcNbxUq/AkN51sN
 VLVXWaaZ4IGktm95+Tc5Ks7V2mbgeegkUqBqqs9zIyKfoNQnl2YzVBrTM3B78r3Q2maC
 ZX9LeX0WtP3Ul7sJ12465+WiMLai8WIzvA1y84CZ8qw4quzDib/sXy6ZMgUjj1XYwqWa
 kQe8MClTloA2rE27F0z+bGWmFXtqndk1B3WCTYEbZKGGuTvD0+J+PSzOQlyAh3W5rBiR
 egcw==
X-Gm-Message-State: ANoB5plgUtcfSJThihdXExJzMw07JTHIfmBtePZpE+cdp7PH7LnRjMcl
 IQ53JCpzQzf5VdK0XV+j9+gDl9o233RQNw==
X-Google-Smtp-Source: AA0mqf7IAWg3mw6Tl6PO85jjeY9+i6apEXQgHDozB4v/7JnfaSwyE5/DJWkCz9jaV5Knl7GFDm72qw==
X-Received: by 2002:a62:ee14:0:b0:566:900d:6073 with SMTP id
 e20-20020a62ee14000000b00566900d6073mr21200207pfi.24.1670968571762; 
 Tue, 13 Dec 2022 13:56:11 -0800 (PST)
Received: from localhost.localdomain ([199.119.84.5])
 by smtp.gmail.com with ESMTPSA id
 n27-20020aa7985b000000b0056d7cc80ea4sm8085071pfq.110.2022.12.13.13.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:56:11 -0800 (PST)
From: Lance Fredrickson <lancethepants@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 14:56:06 -0700
Message-Id: <20221213215607.17698-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=amZAl1aweMc2Uriu1f25wNgBArN2YWoyEYfNhvVSt8I=;
 b=epEpZb+akAdJyL6TToZjVFNT3NSvR5glrN1mbBaCP3b0teyPTOOcvRKNwXjM7EpUcT
 jJtRStqCcVAAkVKA1OC3dFnv84IkSxcBYwja9E0mRZgKe3ZgKuEkIPOki55QBulNeQAZ
 NsXoI59muhgBhAN1m4BViOvcEN3vcDMsxnTt/8YdUuQYIU+QwtLXUJZsHbm/P6uDAyXV
 GsPspjpCIsPFeMFPoEnisynqgSSmfcMCyipO46Xm87KOYK/ZrHR2mLlQCu8vVJUmGm8e
 /uWrIa5LaMaxfxBkkg7kW1h34hOsujXzJRM3JHtPI+oM745SJXCKCxOgIaNCZqyhOY8r
 ooUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=epEpZb+a
Subject: [Buildroot] [PATCH] package/linux-firmware: include firmware for
 the Realtek RTL8125b variant.
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
Cc: Lance Fredrickson <lancethepants@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Newer hardware revisions require different firmwares so include those as well.
---
 package/linux-firmware/linux-firmware.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 200b4ca564..2e6fc81340 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -584,6 +584,8 @@ LINUX_FIRMWARE_FILES += \
 	rtl_nic/rtl8107e-1.fw \
 	rtl_nic/rtl8107e-2.fw \
 	rtl_nic/rtl8125a-3.fw \
+	rtl_nic/rtl8125b-1.fw \
+	rtl_nic/rtl8125b-2.fw \
 	rtl_nic/rtl8168d-1.fw \
 	rtl_nic/rtl8168d-2.fw \
 	rtl_nic/rtl8168e-1.fw \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
