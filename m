Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176A2D2C57C
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 22:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFFCC605D4;
	Tue, 22 Oct 2024 22:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G8lnDgRJ71w4; Tue, 22 Oct 2024 22:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEFD5605FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFD5605FA;
	Tue, 22 Oct 2024 22:55:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AEFE74C2A
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F0AF605FA
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01LXrnuK4Scu for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 22:55:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.166.180;
 helo=mail-il1-f180.google.com; envelope-from=bryce.d.johnson@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0B9E605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B9E605D4
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0B9E605D4
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 22:55:11 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id
 e9e14a558f8ab-3a39cabb9faso21238805ab.3
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 15:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729637710; x=1730242510;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AcmEPr/2CFIg9nBhA+v2J9IFwvkx+8o6gnM7C1WRnEM=;
 b=d/uOMWyIdGiPoShpSisiWd9bC4cIW6UFlW1ODeCYxTAaEF53jB1Fz8rUMX/0mO4AqQ
 m6X54Zxz3msy9urcusoxswyHu59NEkOQsjFu2Fba3m9PDy7KCDcDIpiHKAUxqpCWTjJX
 FqRnHQ1qxETz4EAzPUXeY4lK4MVMKSMdZN9poT/n4E1tXCdF2+PRXbheuKkHAAxyI4I9
 9Z+CLvn5vAax9Co6Ze6M4c/ugeS/gRXT/O6M4iH3MldTO2V0atGiUol33BQYGGifJjWC
 mZcmuOzlMFh2HbBmMLzc71kNqPHh2V1hd/S+obvjaLLFzxJNxYdHk1TmS8JJ15VxA1Kk
 AkGA==
X-Gm-Message-State: AOJu0YzR6OemqGXaBD7PaQX5RB3AjpnFQQFc2a9hU+6oImXJoHPB2oM/
 PmMSKdRrpP7jK/7zClUK2I80XCH2sv4zNqsOmusFiVvcLCR+8K2KGWQHGA==
X-Google-Smtp-Source: AGHT+IFfoV6E1WQl+KG9ILhTEdBIzEJOOgMBCavb9UouMCu8UkkfHQJBwo0t4+yzZb3hPgB5CkrSuw==
X-Received: by 2002:a05:6e02:170f:b0:3a3:b143:98 with SMTP id
 e9e14a558f8ab-3a4d597c876mr6534945ab.15.1729637710540; 
 Tue, 22 Oct 2024 15:55:10 -0700 (PDT)
Received: from USATL1PC00222.am.bm.net ([149.106.100.80])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc2a63063fsm1785186173.124.2024.10.22.15.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 15:55:10 -0700 (PDT)
From: Bryce Johnson <bryce@redpinelabs.com>
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 16:54:55 -0600
Message-Id: <20241022225457.568323-2-bryce@redpinelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241022225457.568323-1-bryce@redpinelabs.com>
References: <20241022225457.568323-1-bryce@redpinelabs.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=redpinelabs.com
Subject: [Buildroot] [PATCH 2/3] boot/arm-trusted-firmware: use
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Bryce Johnson <bryce@redpinelabs.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To check for valid x86_64 or aarch64 configuration for arm32 toolchain

Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
---
 boot/arm-trusted-firmware/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index 5ba4e08370..4a5c7dc89c 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -249,7 +249,7 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC
 config BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN
 	bool "Needs arm-none-eabi toolchain"
 	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64"
+	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
 	help
 	  Select this option if your ATF board configuration requires
 	  an ARM32 bare metal toolchain to be available.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
