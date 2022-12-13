Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA5C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 22:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0DE7417A2;
	Tue, 13 Dec 2022 22:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0DE7417A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKavMpOr8xP8; Tue, 13 Dec 2022 22:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D27614179D;
	Tue, 13 Dec 2022 22:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D27614179D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 674CC1BF405
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 22:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4958181EFA
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 22:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4958181EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wrFTxTUGPcVo for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 22:12:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B0B81CEF
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4B0B81CEF
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 22:12:15 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d7so1331806pll.9
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 14:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=60fMgPk7WLAMOMuWtiYczRtHjvF9WNqCtfAJPlBaNlE=;
 b=GThsmPZJot2sfwZl/b07hC+6X2nNtEEOnTPkiClDuxy/j49voSBGi5BkA8XfEu6otM
 TATRLkDDDORcT5PWqvUXYkPX56mQdnsQRU9JbGm0kNv7yMXCvG1Bsk3zorCkmKV/44YS
 rjHnva3PVpBwQKEJLnpdS8/9L0KHGYZQfUjQqLkuSKfxaNT6UVp1n/C9QtmSJLKNBTtW
 0i3UBeWVnq4M88vMku+jULG37C4+MYkTHS+W20lRDgu2kE2/Qlgl2sjrl1sbBRe+kVEw
 h+Ceh4QxYYGcaqIdnnFyAOTRsTnQ2mfJ2MLZW0CMWXxCrnRTGnamFd9VZ35l8mznc6So
 RD3g==
X-Gm-Message-State: ANoB5plYG7cdnn+n6HFDwzV0C6EfwP7drZ+MeDV9kJMEbs6DJ4Xt3HwK
 bqBOl7lwcU9Ttq/HGGlYdqVxpo2sFkbiKA==
X-Google-Smtp-Source: AA0mqf58QYrGZ/1zJvv8OQ85nyfLbnbw6fVTk1WvRYdsHrgIO8pxydrpMWSbTekyJKP9lg3rGGm1xQ==
X-Received: by 2002:a17:902:aa91:b0:189:b8a2:27ed with SMTP id
 d17-20020a170902aa9100b00189b8a227edmr20868419plr.57.1670969534776; 
 Tue, 13 Dec 2022 14:12:14 -0800 (PST)
Received: from localhost.localdomain ([199.119.84.5])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a170902710b00b00174f7d10a03sm385604pll.86.2022.12.13.14.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 14:12:14 -0800 (PST)
From: Lance Fredrickson <lancethepants@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Dec 2022 15:12:10 -0700
Message-Id: <20221213221210.29366-1-lancethepants@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=60fMgPk7WLAMOMuWtiYczRtHjvF9WNqCtfAJPlBaNlE=;
 b=U9tHhmmeq92Xu0QstBJbGqvEA2gCatV1oQun+pk4t/fG0xxkzxHTItc+sFe4bcy5ME
 KOUOodHiFa7HfF3U/IK4jamvjJ0GOVIpa1mg++M6GyirylzuE81aG6F6eNcbCb9s56jM
 Lw4vQC/JUWpcIU6Fuao1iHg7M3llQX/1HlBxMEK+nbSBdvbiv3VyMygwGftf1rCkk9dj
 dmql0ntOFkS8SZnRe8/nIJlE2RLV2Wu5+boQ3z4zbnqZTxuHlvM+RJZK0WdWB860Ei+J
 +jcjaX3PgJ4eRa3vgs88lWIVzHJ2a1Fp0RXYPS8SE4oqtTvuNRjkOVPFFaHGw/PtNqT5
 zCsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=U9tHhmme
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

Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>
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
