Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A16C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 12:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA5181361;
	Wed,  4 Jun 2025 12:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rHTqk6fvXwQa; Wed,  4 Jun 2025 12:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0DF81BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0DF81BA8;
	Wed,  4 Jun 2025 12:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDEC9DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A426881BA8
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_vMCxH8b3YB for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 12:59:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=konstantin.menyaev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E925B81361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E925B81361
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E925B81361
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 12:59:09 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-32ac42bb4e4so15789581fa.0
 for <buildroot@buildroot.org>; Wed, 04 Jun 2025 05:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749041947; x=1749646747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HpgfRSgMsdxgIgeJT8wbU3tohDAf/hiE0USjJVPsrNg=;
 b=EqdKhkiPIf7nPaZaFf0r3+zREbsLLYgdq3IkZCceVwa5uiPrZQjgnm2WbNo4eX1i+b
 McpB3608ASw0FsXnAzUggztPDix+zbHhGrZqynnYsReFV4Dp0kYaJhbHtyABQtZRQSEO
 KIprBUsksnSysSNMAYPvtn6QK3DipZlCAuLzuMduoFywsqUnPmVRdDU3RUZKVt6vnVbx
 VzpzU1gGlC5enVqOBlZviXL1GYnnsAK5sQR7j4l7pduZF9UjzMUi/h0BI/1WNcuYhL20
 RxO+Bg+Dz+3EQ56WaK6nypcw9OYT+3uc5HYCaGi98KC/JEf1qNqybdsRogrYXfjELlo9
 n5Sw==
X-Gm-Message-State: AOJu0Yx98JyvL6LGsulRQHN9kUg1I+xZpaD80argm7DmQGwXXxU/fhOt
 WzbMu723MjY3DL/rLbTzWkDnH9PaYWgEYDNykUarwmJqk4fYCGcE4GHB4zNKIk80
X-Gm-Gg: ASbGncsJzd0GHiLgpvpRMoEBwDdzqHhh8ir2qYMvDK4ppNteCtTHYG8JiC48HGsjibk
 hx79feqsktwS6OukHWnOwFkt8OqA4W9wS617twACnIp0YfT6qEVOKLre3+Bx7QRl6OJhzq2924O
 BVXhRARYswU3mlhXoIi5oQfjrD/JmIRKKf3au7yK0cDn4HEHojx/Y4Y4JX1G8iCq1VqRwVFxGVj
 +it7JAfehs1uKT8NNpVt/+rhlShDeAgQgCUDZ3wZDiI/I204zpy++woFgc+i2azJCxL0O6M7f4J
 SWK5552ILzTY/UjBal07UrFwzTeiknJqbq5enZN8K0CTm/e2tFtfzbMB833ujngFgCRgRSfBoD0
 3eMsTlb9rtDTF6yQBuNlpCKRPHxaOj+WdVA==
X-Google-Smtp-Source: AGHT+IHDcni01kFUKygyx+vN9aaRj3+y7RX9EEtta0wFjWTfpDujve7Zwvt5FO2uRnqpRNNeFTIgFw==
X-Received: by 2002:a05:651c:1445:b0:32a:82d7:6d58 with SMTP id
 38308e7fff4ca-32ac7158a0amr8454271fa.12.1749041947164; 
 Wed, 04 Jun 2025 05:59:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-23-227.dynamic.spd-mgts.ru.
 [46.138.23.227]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a85b337a0sm22452801fa.24.2025.06.04.05.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 05:59:06 -0700 (PDT)
From: Konstantin Menyaev <konstantin.menyaev@gmail.com>
To: buildroot@buildroot.org
Cc: Konstantin Menyaev <konstantin.menyaev@gmail.com>
Date: Wed,  4 Jun 2025 15:58:56 +0300
Message-ID: <20250604125856.1337861-1-konstantin.menyaev@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749041947; x=1749646747; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HpgfRSgMsdxgIgeJT8wbU3tohDAf/hiE0USjJVPsrNg=;
 b=Cxo3hOe5N+CS8tUjBnhfRJWqw2HIPOkGIGvLdoeBDmMXyO3gMg7s2hwLQrtgKUNyGR
 2llTMZyUTQBq4mq7e23H5fGVqG/bKDwQ1QM7TgLAjqx5sDO6lW0APvFZ+WI5WgJakOZn
 79IcLDvLdFph+yYX2+of+1z5NbTS6FQd6cu7Gj+E0U//GF1Tn36etaZijEW0YpJyLmvH
 c755W6QvZP6cT11vOa9KQGXNugCXqbaEvPFKMhCWjHhsjjMQs/Q9bIMcsPIMEn7jyAiy
 NqlYgiynFZwsoAOGN4By82VQoCDxRXVgV4raF916uj0qFL9zB7CZzmIGU6oZ3FoD9/45
 0isQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cxo3hOe5
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: make privsep configurable
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

Privilege separation mode is undesirable in some use cases.
Let's allow the user to disable it, at least.

Signed-off-by: Konstantin Menyaev <konstantin.menyaev@gmail.com>
---
 package/dhcpcd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index f55e613071..9658a460a4 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_DHCPCD
 if BR2_PACKAGE_DHCPCD
 
 config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
-	bool
+	bool "Enable privilege separation"
 	default y
 	depends on BR2_USE_MMU
 	# Audit headers were only added in recent kernels for some arches
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
