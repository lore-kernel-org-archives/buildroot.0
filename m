Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09C0CF34DA
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 15:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AA1B60F4A;
	Wed, 19 Nov 2025 15:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaRpNJ-BMCSu; Wed, 19 Nov 2025 15:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA1BA60FF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA1BA60FF7;
	Wed, 19 Nov 2025 15:39:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5BC037F
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 15:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B732340ADE
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 15:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MuyDOdhn-BS6 for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 15:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=andrea.ricchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BCD7440A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCD7440A52
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCD7440A52
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 15:39:00 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b735487129fso1104774166b.0
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 07:39:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763566738; x=1764171538;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6JTXR+o2HGYi02hfsKJnLMtEuIC1wdncth4wylTnLqI=;
 b=mnLcWmyrD1BW//YlHNjZHxayjPUVSfk3uydPcSBudJfM+AyuJo3KLPDZje94X02Lqo
 5inJcE0PW+ipAFDlVCAxcvNLLZ0KFKYx5eKZS2wihRfC4DP5/XYaNm4t6i8GP5xf/HXE
 HhDMJcelsqH0KcDTjd+y9QqtGwBhXNOq2ox1/K2BXIPJ99waA/nXHLzMUEhV+iuHWCdx
 KDgAOkdz8gW7Ua76xmSDMbCFDpUzVG8zZeSd5boyZHeUpEHgPF5ZPRj8TwS0StvoNpUc
 0HB+WwGS3SgzIOVix2Nne1YyLEIaq8hWLyzWDGp8Istay5w3Rr7OYAri0Eyftv57vylf
 tnaw==
X-Gm-Message-State: AOJu0YxMANwmkhC2WyC0YYDNOdFJrP4f9qSrGnKnQ4fMMLufBNaVFDAS
 ZqUV2pmDd8ymck/C+ZuKnlUwu5mfsn/ep3QxzYM0HYFaU3KJLFU9D5kIK1nDmU+LPio8dCZ6dGk
 XpngvD58=
X-Gm-Gg: ASbGncuYxTvc17F6UmQ5h/MXrlhPqdm77HuZ2afE5iifL1RP6PLcySpERLNUs4JkOax
 DxWsr3nX3t7yJ1u7LMc9lW/KThKLBGS6CYNn6bz3xbuHH75GbbOAYHEtrh7HZulvfvsENQtRZu+
 HZwfzOU+ayQwzqNLK0SDKt0ft/3kpL9SXMqqBuS2ktlazlAP4xHCmn/eTJcQYknOzl8zHdan2WM
 1bwkh9g5tmORiyQH4X0QIoM+t7PwRDXmZtNIaIG/it2Fb6spcyFQ3aeOpqddtl0Oi15SdMnSErz
 KVCcZn7M2MqZS2EY3uYjc/i+KdCTa+vaL544jif6ix/vBX5Orcx5bIQw7JRgawNsVt7tp1CABym
 Tl0osLvMsSJEixxQtRyJh3Tut2eopBwt8pqk19PotY8d0M30iNAmTmpNeymH+CL3ivmkPW97zLG
 jL6HgbvmDGqXqXPyMEhV9Luw/dMFaGRqUwcso7PofgwdoyxUEl6q58Ai3oaFRXthnBnydE1F8Nb
 Iv/8NtSTB4YOPdIfvJ1UbfUka5VwmjeC/Fqkl9WTvhTueX1oG62jrOrJEwFgvGx5/Zc1eRyt9/h
 tM01MqEvW8PYr5t/j2/474YVd9SCFVCuYhOOLsmVV9FD
X-Google-Smtp-Source: AGHT+IGS14e7Lcop+a7MmL6apoulC44b9MgoxfG+yxkwNU75TbpbPHnjJQ0hlZIILQ31sIi35E1PIg==
X-Received: by 2002:a17:907:944a:b0:b73:21a9:d3bc with SMTP id
 a640c23a62f3a-b73677ed400mr1864635566b.11.1763566738171; 
 Wed, 19 Nov 2025 07:38:58 -0800 (PST)
Received: from rcc-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-27-40-30.retail.telecomitalia.it. [79.27.40.30])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12c87sm1628650466b.31.2025.11.19.07.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 07:38:57 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 19 Nov 2025 16:38:54 +0100
Message-ID: <20251119153854.52628-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1763566738; x=1764171538;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6JTXR+o2HGYi02hfsKJnLMtEuIC1wdncth4wylTnLqI=;
 b=gBn+7mHj7ANbc363RVgcZxy3mt9Ce95oOxEK6t3Wvor+NHGr+1PkZlkt3W+e843b72
 pUOh5KcObu+vGuDcEvz4LhmlHdFTLwr4p+MQJZL0xo3Z/bn0hERtB5uTRn3YPA7Ioq5B
 BHV401PWTyyhDfdCrTqDcQGzQUZ9rMzTJabWY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=gBn+7mHj
Subject: [Buildroot] [PATCH v1 1/1] package/cutekeyboard: bump version to
 1.5.0
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

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 package/cutekeyboard/cutekeyboard.hash | 2 +-
 package/cutekeyboard/cutekeyboard.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
index 4585996412..5800865230 100644
--- a/package/cutekeyboard/cutekeyboard.hash
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7bb9094dc8792c897dcf81caca5dfbb509ed8a851b01542a84d631adf6c62b62  cutekeyboard-1.4.0.tar.gz
+sha256  5ac0521f89ee9b7a2793150f09a77693b797301d12b8a65fe214387d8e8c0845  cutekeyboard-1.5.0.tar.gz
 sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
index b7085c8d7b..9a29f5df02 100644
--- a/package/cutekeyboard/cutekeyboard.mk
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUTEKEYBOARD_VERSION = 1.4.0
+CUTEKEYBOARD_VERSION = 1.5.0
 CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,v$(CUTEKEYBOARD_VERSION))
 CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
 CUTEKEYBOARD_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
