Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B45FC9EDA
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 08:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4864206C;
	Sat,  7 Mar 2026 08:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XH-H9_T2mleG; Sat,  7 Mar 2026 08:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 403084203F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772870731;
	bh=bT36428GTwqLcusyF5gk9qdVAekXLmR9z3gHsQVDpa0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XiIseYzVpDAM4Ts4MvX8QLxFmyOXLdq/hREDdgj44t0kV7VxdE1AsS3ee6GJ1kGlv
	 9F7MBjtxfQmIZYAzGFJymwLPTN8Pdb//S1EOJ7Cqkp17bh0XV1VwpU9yfWbMz4+C4Z
	 1n76FcE9QOq60XM10YLUWgSxOM8lw/2wy5wxN4etrh4LdjL/df4xLFm3oTDpOpex51
	 uw1U6BIu7ZDADwO2NGwJ6OnF+udOcKExvzsaTo/KiuM6/NDD2GlPgRlsHjEwEPRdhA
	 sE+V5K/O/Gj0SSj+QLTME8opHfnzXDr0c0yPFmhRaqRXm+y8h+2xtVX0ujaSAawjuY
	 cj4Mr5Ta53m5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 403084203F;
	Sat,  7 Mar 2026 08:05:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A5A5223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 08:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47E7E840EA
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 08:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vp7zY83IuWzi for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 08:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0431B840E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0431B840E9
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0431B840E9
 for <buildroot@busybox.net>; Sat,  7 Mar 2026 08:05:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439cd6b0aedso2288654f8f.1
 for <buildroot@busybox.net>; Sat, 07 Mar 2026 00:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772870726; x=1773475526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1t2B/gkC/W33weI9J5YKZrGBRU6Uq4JAV6DRkNDpB0=;
 b=aabNWjGmI2Wj13LhkOhu4vpd//f7Z1lBCYNCh7mFO+oXu8MTjYBkJ3pHUEQBLrJk4/
 1pvKc5A2GX8+eRKjnsiqKtiau5HE4WbMlORZAOm10+oQoXp4f8tJvuYDTbDRmlUusMzl
 Xi6EdsdiSe8V7+AT/m+wqWOTbkK4b0aEGJ9FBo1PjtbAtdp6KiuvhNu94nqicrISLCNJ
 vKe38KvsfUfYMIak7LuSvLllTFwlzkac6QfMJS7X3Fd57rDOEfRhmUa2B3juil51ZNBO
 33gkoW2kqrb4ochyJ4+yCryQAu/To7uohsmaKOkKFPqEm+jJFiDuWaUUQF+23KXAnsJ6
 7NGQ==
X-Gm-Message-State: AOJu0YxZFQ6Ix6I4oapOClSHVBUvrOATIDkm7T0fM2XwMJbwd+Pjd+EL
 eQ1JBi/gzI1FHmgTScSdPCd2Vy4uCWspZ13LUlBHOGNVbeGJOuP8di/0ClXANn/GyvNTfVLq5zA
 vgnGQrg==
X-Gm-Gg: ATEYQzxYlPcJMlcasgXQRw5HXUuCvPldjCk1WUneeneWUUV/+9jo4F958AoOeCPrtco
 u3M63ZCQTjar2vmcEg8+I3bY6Cljj+ac43IItJPtVr2fhZbh5A7ReBHpY65b50EQojpIvZfqWxV
 Bvd1C/RfylPvs7yD8CXJtQYDCMkTbF7PQzJSS09eZCrrG7Rz6bUc1VdvXklPucDntuC8rEe+vGR
 iVRslUPZq9HCwTQK/2rguXQwZG/HjjvZFM2GxE3xyAvS6VaShXTh/F86LFzw+gogRsdxX80Veoc
 WrRTUbohiLVMSv2zU6BvdDEdSC/kBJ7qDsIXBmmLFEeawHtJGQHdWALfWHn3RmIIKDsmyZ/2YtR
 lFYDnsgDoVBBOaLepOeTKThsnW8c0jvM87eVywDOJknZLmKamKqfUGFXH/RnDS7ZMxiUlYJbe3z
 YHyOVNQgAziNQAKW5ZxgIaVbsr7O58YPV2X3IT+16xXqsi0rDbrA==
X-Received: by 2002:a05:600c:b86:b0:483:78c5:d743 with SMTP id
 5b1f17b1804b1-48526969908mr76307705e9.28.1772870725405; 
 Sat, 07 Mar 2026 00:05:25 -0800 (PST)
Received: from vm-2404.. (181.185.66.37.rev.sfr.net. [37.66.185.181])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b0adasm86867655e9.10.2026.03.07.00.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Mar 2026 00:05:25 -0800 (PST)
To: buildroot@busybox.net
Date: Sat,  7 Mar 2026 09:05:18 +0100
Message-ID: <20260307080519.384004-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1772870726; x=1773475526; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1t2B/gkC/W33weI9J5YKZrGBRU6Uq4JAV6DRkNDpB0=;
 b=LebNA6DMP3rZnfIf8vB1XyRASfoBK6WopzkpKNiTWYpQ7q0TRz8joyycI6smSDCy9k
 As/Cz7lQwwCII7jrnHLBy3dPa8/gNaLe1C8Ju5MhvsGIhcg8R6og5pxUN41pPSMeWBVi
 4Gyi1AVAdfQucTmSme9Kr/UTPIdoFouYgu4KsL4kwR9BcMssg2vxdhxkrdQE8/tGJYxP
 7JpQoFM6Iz1oAPbJyYduGLcElyNnyu83FWvBVuNvuPork+Hn0BcvelJo+S1vURXrQuez
 61UH8Q9g1FoEreXEYBi+6AzDSn1GoRENSopDB7oURlatFpBR3Ybrito0xO7AXu0X8GF3
 je5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=LebNA6DM
Subject: [Buildroot] [PATCH] package/linenoise: bump to version 2.0
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 3f82ba0ff..3c6774c13 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
+sha256  97ad7d4041e11d7fa395819fd773c1892dea89e5292342378a8345692ce89c29  linenoise-2.0.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 29bed3ce4..ac8d9aa79 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,19 +4,15 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
+LINENOISE_VERSION = 2.0
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
 LINENOISE_CPE_ID_VENDOR = antirez
-LINENOISE_CPE_ID_VERSION = 1.0
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
 LINENOISE_INSTALL_TARGET = NO
 
-# Fixed in https://github.com/antirez/linenoise/commit/880b94130ffa5f8236392392b447ff2234b11983
-LINENOISE_IGNORE_CVES += CVE-2025-9810
-
 define LINENOISE_BUILD_CMDS
 	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
 	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
