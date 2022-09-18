Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9AFC54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CF8383F85;
	Sun, 18 Sep 2022 12:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CF8383F85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8ORSHwKq1RD; Sun, 18 Sep 2022 12:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C943083E7E;
	Sun, 18 Sep 2022 12:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C943083E7E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2EB1BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76EB183E7E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76EB183E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKW8Sp6COraW for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:45:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 689D783E42
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 689D783E42
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:45:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 o20-20020a05600c4fd400b003b4a516c479so2612425wmq.1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=P9p7RPzyoZGtKicfIXHOQrR9cVw20quGqaeRP/kCby8=;
 b=wgf1uGmiORRttBJuMS3sI6RfU8Rp1JvW2sQj0Tn10wNJF1Bm8LHonAXL7hrkcSDoG/
 obcK/M1dHxKHA1YrGALzCte3FxNIBueQ7yx9A740OPL23WKNv6SyWn1v8B11pPTrSS/I
 z/aBwktKpKQ8BsGvLUIFX2Y66PI1diYvzSJ423oBi8k7qQn1cNwpQ+MZo1uqTOCshn1n
 L7uAygDywX4+bgEObvzhXAWqMAzhs1Mk1x/bp4YXUb/8uFCvgR4936/vHDlkyGH1nfWr
 l+qB9/G3gSNl/IDYeNQnikgzM/+kmtt8Sljo+4i1oDnaHrhN5V3ZelipCjWsmwUNB9iq
 hf9w==
X-Gm-Message-State: ACgBeo1KbVbcQqWULIk6KPdMgdl5+9wVHoogFrsZ6fZ7Sj80s96OAKcW
 nb0kY4OKLntwM6RoCOKHksf5Wc9I+ls=
X-Google-Smtp-Source: AA6agR7AR5kbPnqxFFXf/lXy7vcLfytVST8p+88dHEcoSE1Go22yiYYAaqIVzCO1lKvV8QL4nhRNwg==
X-Received: by 2002:a05:600c:34c2:b0:3b4:76f2:9c3b with SMTP id
 d2-20020a05600c34c200b003b476f29c3bmr15662338wmq.179.1663505146980; 
 Sun, 18 Sep 2022 05:45:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f9-20020a0560001b0900b0022917d58603sm10551360wrz.32.2022.09.18.05.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 05:45:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:45:44 +0200
Message-Id: <20220918124544.122719-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=P9p7RPzyoZGtKicfIXHOQrR9cVw20quGqaeRP/kCby8=;
 b=cE8OwMWx2n4z94HIH59+d/q3UW/iw8z9qP0FLtFnqLYBZVS9hUEoBPIhT153HRRhHk
 fw0XK1OExWWhMZ7NzgLbcAhBX1r6AdHHkwick8U0fX9YR3KcReTOs+JMXs4WTWDlTSUy
 b6lf7BqD2VEirmwrGSu/eJsXYm6t8nxJZUaVypFpxzXyuk0x+3ZAdQkcr/qupMVMYX4l
 gem7ybEdSOyoYiRMzGXCI4mN/RMhH3goiO0R7sTiX9Ij5tuqf5U82bA6dstA/jl8YLy2
 bEkw7Jqvmto8neYuUaQB4nxZws0qlnGwUunwhoaOisiotSeJ6HkiNBPT/PaZzMN1miPH
 /nAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cE8OwMWx
Subject: [Buildroot] [PATCH 1/1] package/frr: bump to version 8.3.1
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://frrouting.org/release/8.3
https://frrouting.org/release/8.3.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/frr/frr.hash | 2 +-
 package/frr/frr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/frr/frr.hash b/package/frr/frr.hash
index 9bb2b75b8f..87ade19c16 100644
--- a/package/frr/frr.hash
+++ b/package/frr/frr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33e974e2a622618e139983f65d93e92e7f1a735936ef18b18244403b15be002f  frr-8.2.2.tar.gz
+sha256  9b0430d01f8da2d780ac5e41de2cf4e53abff0ed06a0cc75d745f4b1f29e5b9e  frr-8.3.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index aa36387a3a..72c46ba4aa 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FRR_VERSION = 8.2.2
+FRR_VERSION = 8.3.1
 FRR_SITE = $(call github,FRRouting,frr,frr-$(FRR_VERSION))
 FRR_LICENSE = GPL-2.0
 FRR_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
