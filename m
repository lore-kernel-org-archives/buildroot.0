Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD34C02194
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4479846AB;
	Sat, 14 Sep 2024 11:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLNnOUlWQG8d; Sat, 14 Sep 2024 11:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF58D846B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF58D846B1;
	Sat, 14 Sep 2024 11:43:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A51D1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 651CD408BF
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNhRR-L1CeO3 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1B1F84086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B1F84086C
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B1F84086C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:43:28 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-205722ba00cso25937445ad.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 04:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726314207; x=1726919007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pXB4rUhXa66+q0E4HPaCD8f5CnXFE/IZNG+E5G4Sp5s=;
 b=KT5Yr8Oi9ok8paFd+ezcG1je1EF39mzxIQ5q9DiqvzEcNy0QadTjTWnuNdsVTdKlA0
 IHI66zkq1gl7JYzV/9bCHE2kWturOdt5I7fKsO3lsfM9Y0OlFAnNzLKl5dX6GtgQs2e5
 s7VxjAziLWsA4mKEMZKEkjoc0V6sL5cNTlAhWXwUuc9oEYEyem0L0t7dREGpK2h1mdNb
 eqb6VQfR7IivO92zAF0iyynKdWJlBTQIBmU+ggcAY0hwuRAxjwcqjK3dg53HnNhUqT7i
 ue2IGi6bqgUpB3CZc/tcXV88ydgQSyQBTYu4VaX/UKbsPiwJtginZh5gJlh+iNUTLOqk
 iI8A==
X-Gm-Message-State: AOJu0Yw2XTM6yH5dzGAC/Ek7na9IiXPL59QUwwQqamvAWuoVUIVHJQj9
 npbb1G7yYcENKx6sOGHfFAP9aFoVZIGJTsB7mMB/3wOW7ro8PeLYnPBpXA==
X-Google-Smtp-Source: AGHT+IE/3C9cgCuFE0XREZaDgByaMs9rdAdHDSaFVF9q+imzPTU09Ex/sDuEc7e3xks7ziIgOTaWsg==
X-Received: by 2002:a17:902:da84:b0:206:c911:9d75 with SMTP id
 d9443c01a7336-2076e3b2654mr120741035ad.20.1726314207300; 
 Sat, 14 Sep 2024 04:43:27 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f375:804a:5c89:62a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2079471af10sm8446185ad.239.2024.09.14.04.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 04:43:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 08:43:18 -0300
Message-Id: <20240914114318.1912121-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240914114318.1912121-1-festevam@gmail.com>
References: <20240914114318.1912121-1-festevam@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726314207; x=1726919007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXB4rUhXa66+q0E4HPaCD8f5CnXFE/IZNG+E5G4Sp5s=;
 b=ZHyIYYA5y/X07HzsBz3D4+kUYHXux8LmCYisRehdiVeARRHdSybnvG4UN22CDoISGW
 1plIFYWA/bVEXU5Cps9FhNXu+03OZS3eHedMtQPfKZ5pA07fwsDjJrqkz3O1QimKYJ8o
 +21ZXJzhZGYkdTLAKuzHUT0vJJ2cs+GqPnS0n5QNJrrDZNF/hg94XT1fdmdkTLfD0Of0
 WebmP23kw5jxMFQlo3Nb3TtYWVnDQ/U90GNq77qudKwyrwZhHZtX5NKkNyOy3CzJaQzq
 7K3jVKhBgElEIs3o4CcUSNk7OYGtz0W33G45WlURKOtV2BCg3LFNKqBudHgL7QRScTXF
 WHmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZHyIYYA5
Subject: [Buildroot] [PATCH 2/2] configs/mx6udoo: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following
build warning:

include/image.h:1471:12: fatal error: openssl/evp.h: No such file or directory
 1471 | #  include <openssl/evp.h>

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/7803199927

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx6udoo_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 6c84a41bfdcf..7e94e0a8338a 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="udoo"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
