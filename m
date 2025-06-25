Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B58C77B7C
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 06:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A10F880E6D;
	Wed, 25 Jun 2025 06:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJDlasHkwELC; Wed, 25 Jun 2025 06:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E262F80E6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E262F80E6F;
	Wed, 25 Jun 2025 06:33:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6059212C
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 06:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 511114197E
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 06:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AebsZHe5nkmM for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 06:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7495D417F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7495D417F6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7495D417F6
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 06:33:17 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6097b404f58so2168277a12.3
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 23:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750833195; x=1751437995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B4b+4fvSy0Q1qgn+HklQ3QVF9h7i+/wA2DhRKBeKBcw=;
 b=KIars9HkQj7reg+ZSKuJ9i/imJpEP8RzQvmHYx/PcnBY+t9ot6oGC37hn8fj9AV6+E
 r5yCyzNON98LRNBCVec7y2tIVM9slJW4QOBE8KYKFb+/oEV3s31tIg5qwPL/WDe8gyPl
 ZHmvFpt0mSk7JWdTyBMEyl1/LnxkKth6Ppi93zg09iE9ELLonwr/gpa+iWakk/aGnvrC
 sW5eUu8s1RmJPCnch9McF2ZCzzY7w8LXJlO8nn3fIOOtcGmVymZ2TE6nlgmoiSSWrHur
 uQP1Vi9RIHrSrq0JoQHFaSJlnvBZR2IczUdiAHL9kC+SVx/Rvts6ZZSbeakpIReVPMOb
 fz/Q==
X-Gm-Message-State: AOJu0YxZ7/WhgDEoOlJrNV2LO/YBxof1ZaMuaFwfndbK4TdCDH6bQHxI
 vnCvINu63oPz4/LQSt8atbuoWcvvUZYmptHi4a+lSxuqhtC3kynQnpPmI1eyNsOjbCn42dsQ3nS
 bMqDE
X-Gm-Gg: ASbGncslvfRL4x+f02avjKEN1f0ZlFQj8pxkOyTK20BBg281TctpZcADVP/vRWHx/S8
 GJhdjTb9iGsLE0wCia5JLxa3AMxYFGxU2VAJTFj7H7KwILkqVZoA2HhYHYCzyGzmEqvhwgtFc22
 U+BJ4EQwAY30uJynI0yGC1UHyvW2w1UeLij87Z6EyjxkrddQwWjeg5ODXL6WS+4LAYDhnEm5NrK
 K1jbDP5t4DFFCuLh8imm1zSJbERONvvuTM0VZQ03zD4pnkQEQ8qHmQ1Fy8B6QTRQ3DIH0UuPIB8
 ZJGRl8IRDBntvUcZyE0x8IwnkKFmq+1Z76nIc0dDdDlAGOd7ievwYJKwzwuxtC4vt7JVwmCdig2
 200eB9PVqPD4Pbuf5qibN+xo=
X-Google-Smtp-Source: AGHT+IHUWG1YQisaPv7D0nj6eIElOyFSWWNy57c4vzPqFXDz0Qyp3berQV/NuEgSqVJwUZ9wA85MYw==
X-Received: by 2002:a05:6402:2110:b0:608:66a3:fec with SMTP id
 4fb4d7f45d1cf-60c4d31749amr1430388a12.2.1750833195112; 
 Tue, 24 Jun 2025 23:33:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:b099:d411:c45f:b57d])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60c3b63d3a1sm1557256a12.51.2025.06.24.23.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 23:33:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 08:33:02 +0200
Message-ID: <20250625063302.3663685-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1750833195; x=1751437995;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B4b+4fvSy0Q1qgn+HklQ3QVF9h7i+/wA2DhRKBeKBcw=;
 b=oUT9SXI9PbUKy59IZTrtkQNGQOkLYD87J0RE3zx9NJzCUuO/OKz4kvfGbJEuDqyEk1
 OVGXGwrmhWEXGqBm420CNkZ9OE28jzfHZ/XooFoUBONu763ZsuTm9flEOP510zSGAed7
 sIlinh/MN2N7Up03QidSfQs/T1HF39O5JgjsQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oUT9SXI9
Subject: [Buildroot] [PATCH 1/1] package/mmc-utils: bump version to 1.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the first tagged version of the package, so replace commit SHA
with version tag.

Change log since last version bump:

  d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
  a23ad7875b89 mmc-utils: Start to use the generic print_usage function
  e769d44ecb77 mmc-utils: Introduce a generic print_usage function
  6586fa5535dc mmc-utils: Simplify and streamline print_help function
  ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct Command

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 685952a6150b..781bd972d4ba 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e10cd7fded5f248d515fe40e35f73fe491e87e4b608ca857afa40fcb8cda1ae2  mmc-utils-c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58-git4.tar.gz
+sha256  39e6a89e06b53f99816f110af6743d1adc82220b26c51b0c3fd0a11ccf4206c2  mmc-utils-1.0.tar.gz
 sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index b439c84d474f..9696f2a6dc85 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58
-MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
-MMC_UTILS_SITE_METHOD = git
+MMC_UTILS_VERSION = 1.0
+MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/snapshot
 MMC_UTILS_LICENSE = GPL-2.0
 MMC_UTILS_LICENSE_FILES = README
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
