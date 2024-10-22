Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F72CDD0FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 22:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E4280BAB;
	Tue, 22 Oct 2024 22:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J82WX2flQ9Bu; Tue, 22 Oct 2024 22:55:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25CD80C0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B25CD80C0B;
	Tue, 22 Oct 2024 22:55:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AC282072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48F3C40318
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaJuO831D057 for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 22:55:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.46;
 helo=mail-io1-f46.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E58E40187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E58E40187
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E58E40187
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:13 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-8323b555a6aso364008739f.3
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 15:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729637712; x=1730242512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Qi6ZeX4rNeQdVCSqK3mtmeyv0rUEeWVEishfYq+dLY=;
 b=U6W0QTAm0xNgLLkJHT3FmELHXjiiBEcIV9j+im9tSB+vOdt+UAjugMpGpPq5AhCwwF
 JBg3IIZlvQcXqO0V5KgAQ8C66gnHioViNdraPQGREqFjY1qyhEPgp8XEhbZtslVzfx6G
 C71e/1cTYbmzyIi4y6A0WIbmrmmh5ZRX46w7n43XJRpyZboEOx3FXHJhNSWbERG5P+cz
 m0aJWPQkFjDOxmDbjMqwtfU03A8+6jqmKuUIZWaBXXNTjN0azMrIWQI6m7OI4UGVOq8H
 kG6wxzGAxHS6Bd5/YrHHpa26DRArECdTwIimYsOLRaAnz4qypzk6a8mmRvG93xaEdnwi
 ttXg==
X-Gm-Message-State: AOJu0YzDrz4tEW/d6/z1OJ+q5cYM85cjXaVQNVgWfnkAKDfyEywyX94t
 TqB2wS5htCtAWA/HZpaMgCawITjpdRKePXm4vYMh4ENXDsAskVY6p6yDOw==
X-Google-Smtp-Source: AGHT+IFmiR7OiQq154vywoJNfT4fzQ4MoDvGTDtAasi1wNUqCusyrn7+4DH9P+WsB5irvO80wbhASA==
X-Received: by 2002:a05:6e02:1a67:b0:3a0:b384:219b with SMTP id
 e9e14a558f8ab-3a4d59ff663mr6268215ab.26.1729637711997; 
 Tue, 22 Oct 2024 15:55:11 -0700 (PDT)
Received: from USATL1PC00222.am.bm.net ([149.106.100.80])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a63063fsm1785186173.124.2024.10.22.15.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:55:11 -0700 (PDT)
From: Bryce Johnson <bryce@redpinelabs.com>
To: buildroot@buildroot.org
Cc: Bryce Johnson <bryce@redpinelabs.com>, Xuanhao Shi <X15000177@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>
Date: Tue, 22 Oct 2024 16:54:56 -0600
Message-Id: <20241022225457.568323-3-bryce@redpinelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022225457.568323-1-bryce@redpinelabs.com>
References: <20241022225457.568323-1-bryce@redpinelabs.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: use
 HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
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

To check for valid x86_64 or aarch64 configuration for arm32 toolchain

Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
---
 boot/ti-k3-r5-loader/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.in
index 8c7898ebf6..fe429bb8b4 100644
--- a/boot/ti-k3-r5-loader/Config.in
+++ b/boot/ti-k3-r5-loader/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_TI_K3_R5_LOADER
 	bool "ti-k3-r5-loader"
 	depends on BR2_aarch64
+	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
 	select BR2_TARGET_TI_K3_BOOT_FIRMWARE # binman
 	help
 	  Separate U-Boot SPL build for R5 core on TI's K3 processors.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
