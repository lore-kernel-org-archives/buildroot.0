Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F19FD5E381
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 22:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EF5D811EA;
	Sat,  9 Nov 2024 22:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id er6hqxkqoYgc; Sat,  9 Nov 2024 22:16:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A7781250
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A7781250;
	Sat,  9 Nov 2024 22:16:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30A54D8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12A158114C
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BYQXv7N4qwf for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 22:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 60E8980C1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60E8980C1B
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60E8980C1B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 22:16:26 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-83aad99d6bfso127250339f.0
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 14:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731190585; x=1731795385;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tzRCn/XSfDlu3vGbqTwdjesnhTHlksbzbwpE0KsoS2E=;
 b=ol8SXHla9FVcRaczd9HX01Za5g1eokDgjhzk7NZOxMIusbvHW7UYmzrfgEhkWGwcR5
 Sz+19+OZMeE0uNpYmjgtl4vU2rJbDcJ5Lh14rr7W/5TYo5W6IkmWczltbqxH11asUHIE
 QUZRMpChbv6oGdIez4a/u0X5riH9gOfO+ruA0mP8Xw+bd+FXw1kGhRkYjTe8icYhi8vy
 VwoJu3OEXTJbX/joGPJGZOEyjAA2fNz2fNFZxbL43DTYiGg6jnVeD0xuRlgER8r55Pf/
 Wm4a9L5NuqMNVjy1TmF4hvif9FiveLI5cWnw/xwx54bqktvVw3xYFVZs1nhko9paCP8B
 ze1w==
X-Gm-Message-State: AOJu0Yx9JKqusGWN0hl8349P7v0+oiWfUzoi+G5IfyetDF1N2KhLnICK
 eP3cZLMHEdvymmGmcSjfkIO7wGUhO7CwPblH9kWKN6JqzB4Smo4D
X-Google-Smtp-Source: AGHT+IHc/ZYkk+QUf4ufwB1mr3qY7T0WZP5o7WUfUGaXOu3idHitHGYpSEnZtrNA12/AR6e2wEXCdg==
X-Received: by 2002:a05:6602:160f:b0:832:13ce:1fa3 with SMTP id
 ca18e2360f4ac-83e032fa17amr930559139f.8.1731190585258; 
 Sat, 09 Nov 2024 14:16:25 -0800 (PST)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83e13223a81sm48367539f.5.2024.11.09.14.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 14:16:24 -0800 (PST)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sat, 09 Nov 2024 16:16:16 -0600
MIME-Version: 1.0
Message-Id: <20241109-genimage-partition-type-uuid-v1-2-9f23180c7195@gmail.com>
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
In-Reply-To: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Niklas Cassel <cassel@kernel.org>, Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731190585; x=1731795385; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tzRCn/XSfDlu3vGbqTwdjesnhTHlksbzbwpE0KsoS2E=;
 b=Z4sNYWee63HPKCFROZciK6r4F8HQH3vWaLChwi/snAiwyoZT7eGMh/GSyG/i0BttKW
 A8lfx10Qm1crwVQm4GjrV4ReBCOAovZ6g5vsWBxOe4m0JVmDcaJl8mbp9k5e4d6cXKOH
 y6/uRTYq1xzz+7rNq/PUHlm5ldbYncHqjN++8k9yOaMdTIgr1jvKDbypdjM/yZWGv0eN
 wuLQBG5oRkU+H9vKVnLIn7f1ZCN2pV4L3pNBJ3zTBJ9y93alS4RezS8bnYh8yWP962Jg
 TaLtrwOhs9wQBjEmL85Xp4062wWULWtSNQmfj9upYmYGXS7dHwHJBU7ic1WmLKQq9eig
 G5yQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Z4sNYWee
Subject: [Buildroot] [PATCH 02/17] board/beagleboard: use
 partition-type-uuid "L"
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
 board/beagleboard/beaglev_fire/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beagleboard/beaglev_fire/genimage.cfg b/board/beagleboard/beaglev_fire/genimage.cfg
index ef650704c65f24eea37fb1fa8d53b5759062d570..0241480ad6041883a799ed68c6f080d8a3b29cae 100644
--- a/board/beagleboard/beaglev_fire/genimage.cfg
+++ b/board/beagleboard/beaglev_fire/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 	}
 
 	partition kernel {
-		partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
+		partition-type-uuid = L
 		bootable = "true"
 		image = "boot.vfat"
 	}

-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
