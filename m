Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1341C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 17:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 525AD81F93;
	Wed, 23 Nov 2022 17:34:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525AD81F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRnFP3FuwG_B; Wed, 23 Nov 2022 17:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8967A81F3F;
	Wed, 23 Nov 2022 17:34:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8967A81F3F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E36BF1BF5A5
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE436607B5
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 17:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE436607B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Lg7fo3aUQoI for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 17:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 389B4600B9
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 389B4600B9
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 17:34:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id t10so22233208ljj.0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:34:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nn9I3H77mKq9X1mrZnkupUlmimSoWslrBKnrQs6vZ+w=;
 b=r5BNAYI8ZdTDlm2sQ4vMW3CW9K+zDHztFOwAA/10yL7WP18DxHo9YEDHYuxXa/Fv0S
 X+EAJ03Z4QTduvXiR23BroRR1s4TZgKrl1xMoiDjeQoT3svVWDE7ckv210avZEK39UcM
 PUwVsJWMiJP01tB2bH0knszvKoDKe50yRf6s9G62ZMcBLCefb3qqRNyEPEpyOniK58x+
 wsmyZUcPD+vhvtJWb9iAC0pzbkIfUHNH8mAAXKDEj208mPjt8qH76/oOU1RNExiSBMWw
 XXYwMO23X0WtZ5q6xe4rLM1gztaZMaJ7eXoEh9KTSvdumDydrEC8Ka7ibLzqnaVvmu5P
 Rj5A==
X-Gm-Message-State: ANoB5pkiC99Vm83DTVDwZzHYDZ7Zcqw1y+v8ORoXpY3zb2h6Jwt4EpJs
 S5Z72cEduUlMnd4+bqGjmUQUrkOGwxMXOA==
X-Google-Smtp-Source: AA0mqf50H1YNFlB2PAekZ66cM3sIaThelBedDN5IMrjkNDoJVT8WOvFquqYrP9eyt9ADgZxNNJgB0g==
X-Received: by 2002:a2e:86cc:0:b0:279:6774:a99f with SMTP id
 n12-20020a2e86cc000000b002796774a99fmr3167453ljj.34.1669224870906; 
 Wed, 23 Nov 2022 09:34:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-86-145.retail.telecomitalia.it. [79.25.86.145])
 by smtp.gmail.com with ESMTPSA id
 z10-20020ac25dea000000b0048b003c4bf7sm2942827lfq.169.2022.11.23.09.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 09:34:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 18:34:21 +0100
Message-Id: <20221123173421.3371884-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nn9I3H77mKq9X1mrZnkupUlmimSoWslrBKnrQs6vZ+w=;
 b=nel7t94cLS8vBNGNCCR4g/NpGOyfxIhTPP3KnT4rZvAmJEE0vItmr6rvEJb08Q98te
 9rPKNVvRJF9/x6aTr2OSuQz8q+ryguUkeawEM2ayVDUKzc/I8nkqwCnIW4UZqUwTN8Rg
 s4aXgI/eUZRUTFSDH//KTVqF6olu1KkytpaJc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nel7t94c
Subject: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.11
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Add nvme_all build-in command
- Add Write command to allow use mmc write to write image
- Fixed race conditions of g_last_error_str and g_last_err_id variables
- Add support for stm vendor fastboot

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 50da0f9bf3d9..cc1cd8326672 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  baaf3e031958075b96530d43d7435f19cb428088894066e0b02349a3b9666666  uuu_source-1.5.4.tar.gz
+sha256  932c0a4acde0f52b907f5693c6d133c83142c4ca6e9df05a38b3ac1e50628883  uuu_source-1.5.11.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  584bfbb18b4c08b872d48b80419dd453307212a144134fb516bd6ddc0700c2e8  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 681c1fbc44e5..647015e2dd85 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.5.4
+UUU_VERSION = 1.5.11
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
