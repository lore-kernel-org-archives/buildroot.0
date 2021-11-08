Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D0FC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 09:00:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2F461029
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 09:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F2F461029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0613940231;
	Mon,  8 Nov 2021 09:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppLdpTSMLqic; Mon,  8 Nov 2021 09:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 685A14022F;
	Mon,  8 Nov 2021 09:00:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F5321BF393
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 09:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2F3C80D42
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 09:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zIszOwg_hEmV for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 09:00:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1AF880D1B
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 09:00:03 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d24so25553593wra.0
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 01:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajYiWrKqvu8In2vb8G1P7kBAAQrDdCu0/CXzLjLdEvA=;
 b=m2pyc1SMFs6vnfwKWnbNw+PQhcau8SdogwtAHDDtC0njJgXpAN4KfyU7Odlf9DoSNv
 vPIvsqa7wM7XVWn6rOd//eh5Chw5t9v7MLHwShOwo6gaIsKwHJAv5Mfm5oqxfHcBziG+
 Y0orjI77kyglwXpiZzC2USAs4SlcaaDbUMpSryY1/+OoBuD3oBlnGaOn/8SZ8TW98CNi
 P75jrr5mMYwFDdX4uqll/wlNEe3ZNZS8WrJ+ZcvZVusXyRoMqoXPvUVi4y118U0g9LFM
 mTMoYfENKmAoLVJFQ2YPJZRsEtDKSMUDIjYmWhUlIINVUGU1FKDZWtK8gARYMu2h6MBa
 nvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajYiWrKqvu8In2vb8G1P7kBAAQrDdCu0/CXzLjLdEvA=;
 b=QqeOueLJkU7YJNJ4uBtqO1LG2PxPJExMUTzx/RPGfXtJGneZnvcf/LSS9ai9aofcqo
 BG47LFXOHOl1eruWTTVng2NEX0ZWXBfs+t01yyMwlKPA4kL4LJ8/04ix8R94xDgHd+Rn
 2EfcaTNVXCPrP8ZbGvchnWjvJt8AiazIr6An1U/VV4l4EW9OZaN6jJYj7ohIKiSs03GS
 UKAZqPha+iwEGYT8ZzdBv2sF83MdhYuudPJ3WM67hlb8bQmsx/0HSN8D0KzOPetK49NW
 Le2HSbMjT59GWOBYqd7VnkY4LFKtPDsZ8hkWnKIynq3KDNHj3/T4yMmibwMuVHG+0SrN
 QBYQ==
X-Gm-Message-State: AOAM532Dr9T5/fEuulrlOZtmL4V01IkXxC4Azt0kQ0DlI3Ckd0U8HHRC
 3LSeb+YxfangLR/Afq1XDJihqgR36Fs+TQ==
X-Google-Smtp-Source: ABdhPJw4yeO8AhIYRC9VlUkTaKgNtjGN0gcIZcGTlia+sn1ILlV7RRJBknTA+iWNMmmDHvhAG6/I/Q==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr100537673wro.346.1636362001592; 
 Mon, 08 Nov 2021 01:00:01 -0800 (PST)
Received: from mclaren.neureality.corp (82.166.25.98.fix.netvision.net.il.
 [82.166.25.98])
 by smtp.gmail.com with ESMTPSA id t4sm6543864wmi.48.2021.11.08.01.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 01:00:01 -0800 (PST)
From: Ramon Fried <rfried.dev@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 10:59:48 +0200
Message-Id: <20211108085948.3601629-1-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/bitwise: bump version to 0.43
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
Cc: Ramon Fried <rfried.dev@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
 package/bitwise/bitwise.hash | 2 +-
 package/bitwise/bitwise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
index 5493c642a6..c8daa0aa64 100644
--- a/package/bitwise/bitwise.hash
+++ b/package/bitwise/bitwise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d3d43cef47bf8f49e85f7ed381c3eaf1df921ca51805e0962f1a97a517e1d1d2  bitwise-v0.42.tar.gz
+sha256  f524f794188a10defc4df673d8cf0b3739f93e58e93aff0cdb8a99fbdcca2ffb  bitwise-v0.43.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
index 237f7753cd..33d8f6776b 100644
--- a/package/bitwise/bitwise.mk
+++ b/package/bitwise/bitwise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BITWISE_VERSION = 0.42
+BITWISE_VERSION = 0.43
 BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/v$(BITWISE_VERSION)
 BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz
 BITWISE_DEPENDENCIES = ncurses readline
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
