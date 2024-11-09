Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB86D5E387
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34B21605F5;
	Sat,  9 Nov 2024 22:16:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLSbm9se1m8Q; Sat,  9 Nov 2024 22:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A9D60647
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A9D60647;
	Sat,  9 Nov 2024 22:16:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98803C2
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 732E360638
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoIJr_lBaC0a for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E74BC605F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74BC605F5
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74BC605F5
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:27 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-83a9ca86049so125597439f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190587; x=1731795387;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtEf5heC2YM2fWmeD+eMPANgMJ5FrM7s2gb2OtfWOkE=;
 b=b2QseDAlszvvHL7E3s47uYv03AIuZDeofIE46d2NoOlVUngvHuOjbYl9KHt+Vidy2t
 8TU9A3DCJVAtWT+Plnrcgi1R3HXunCVO4ABwmbnbe5JcHNBXa+gydQaHuxcVa4xxo8zU
 FC33usN3BphTVP+daYCtEdLmMl3HvRL49bTJfGU+Riq/Xc5VZSFzeXaZLy3cDdh3Zba2
 wmaopjkWuvQ0KeEeK1FgVYd+TR4WHeNfSUthqXEYV5ujYgg8lce+b2/lya4qNaJlWdM7
 PUpL3II/EbVdqzVeq10KcxPjQN5N9sHRRw3ZZXwYC3QNcf7iPQUiUrzI3rQmomOY+GEp
 Fp9A==
X-Gm-Message-State: AOJu0YyuNp6Al1Bhhjy+gG+mmgqxyFA3HSGklQQW70Vgqo5PG4QlmUpc
 P/uSnnzBBs8RMMKru4sXaiIyjUICl265cGAUeo4m38oXCDj/zsRY
X-Google-Smtp-Source: AGHT+IFYV3JcWvheJSj/zh3XePB2xxXMFYhgXxvtqna1KTZ8/hkXY5clpTJPX3iy+z7uukwP+UFxKw==
X-Received: by 2002:a05:6602:3c9:b0:82a:ab20:f4bf with SMTP id
 ca18e2360f4ac-83e032888fcmr819309839f.1.1731190586674; 
 Sat, 09 Nov 2024 14:16:26 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83e132be3casm47448139f.27.2024.11.09.14.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:26 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:17 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-3-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190587; x=1731795387; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wtEf5heC2YM2fWmeD+eMPANgMJ5FrM7s2gb2OtfWOkE=;
 b=gYb+LByKInwT5wig+MUCakQff6FT/2cMXn3ow8xz60n1l0JYlUkr/OZamVQvXc4jt3
 nZVUAftjTBaw2bwnQaR4QUEpWyoNF7KktJHwKlEUZnxmrp9bfkjZNwJ3aFxJEcMyYmbJ
 7BOUw9bfORI8hlkxC2GTcs3fIMhLYSQDgLP5+3HWdsOB7TgpCxifBm2CzlT2yHsmS66I
 FRJ2gsOtiMEgOCL1xIg4jWQEoIIcKgcfBn7Oy2r29NzgOoeddvesbQfrHwS3xVs4QTtJ
 roWNLCG6vJKwwAMKkGt73Ucqi9vQMJPecrGrG7vuEYuv0ZpNo0DmfbAlolKoRFHKanzi
 kPtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gYb+LByK
Subject: [Buildroot] [PATCH 03/17] board/sifive: use partition-type-uuid "L"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index 99e3525a8cf4cfe2abc84200becab0a38b4142d1..93355eaea9f0670b39d2357172b74ea43f0eaad5 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -18,7 +18,7 @@ image sdcard.img {
 	partition rootfs {
 		image = "rootfs.ext4"
 		offset = 4076K
-		partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
+		partition-type-uuid = L
 		bootable = true
 	}
 }

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
