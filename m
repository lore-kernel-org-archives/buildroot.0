Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5779CD69100
	for <buildroot@archiver.kernel.org>; Thu, 28 Nov 2024 11:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2333846B9;
	Thu, 28 Nov 2024 11:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgpFkYigeVrT; Thu, 28 Nov 2024 11:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8ECD846BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8ECD846BD;
	Thu, 28 Nov 2024 11:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92A871167
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 11:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FD06409E4
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 11:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIQpcHyX9n65 for <buildroot@buildroot.org>;
 Thu, 28 Nov 2024 11:56:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CED28400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED28400AC
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CED28400AC
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 11:56:28 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21278f3d547so5601695ad.1
 for <buildroot@buildroot.org>; Thu, 28 Nov 2024 03:56:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732794987; x=1733399787;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j11ycWSwHZDlyIFBXOh21dtuDO4dLBubfUEqAxtbA4g=;
 b=WXiFyzPvbpnqOGSTiexrBOro8T43C4AamUt1OJ3uaBqx49engxB4scCDbckc2/t+0A
 7VeXVA8mXRIGmSfJFmISXmuNhS55bDeA30r74lDgXHGqmMCVMpgmUb56yGbsTSeEBNUX
 dZOz/v+8DMY2ZB3zbR20U8sSMsop7QwfOWzbWetaTLTeundozco+KhYAXta8MmdtcKOn
 evCStSnMUTrh3WD8w2+yi1dbl3LTWCnr9K+ew9f7wu/qkwhRV/N+riqYADp5nBRIvcBe
 FV6LEI0qm6JKz3GJQh06E5gIvEhg7RnWYOV6LD2qdFEAqCjyYvxFssj4QZEWieBBKUGA
 lSZA==
X-Gm-Message-State: AOJu0Yx4tgj9SCXZPvlpxIIm5jzwx3Q2+KZ5Ps0BbxD1NF6BSNy23Im5
 WS4q5yQfuLqlo8W+B9nmWpUCVmB+Qoq0EMjXsdApV98ZHKZrH8A9vpkyVg==
X-Gm-Gg: ASbGncvOl2WQAU5otV9Lx+nlR+6+iVO3LiTjZAiBKULJnVRqlHP7W+9vfrB0m35RgAQ
 bkwBZIq+94lIbgwckU9KikJn6Z9g9aD0lWb2tsbNIMX5tfz3nHDnKC7HzIzAJuyRqjQpzKJ7SIF
 TduPo6+7E3880soSWoNdSEm+2qG3iIlWR8lGhPg39yqMVsQWsupT15bLKbRA1WryXMEwbJUrlth
 9JtKw++jdti5aaYXPSrsTrCFiW94T4jxWne9ZoZHEMFmAo=
X-Google-Smtp-Source: AGHT+IEJysk6qc6KJn7Re5lMM4vpXsj77MEfvtvTa8Ye7seT7XWH48jUkfhfd8EcQdfFW2Q8x4AR7A==
X-Received: by 2002:a17:903:40cb:b0:212:f7d:927e with SMTP id
 d9443c01a7336-21501099f1bmr74894115ad.17.1732794987507; 
 Thu, 28 Nov 2024 03:56:27 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215218f573fsm11842845ad.35.2024.11.28.03.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 03:56:27 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
	Romain Naour <romain.naour@gmail.com>
Date: Thu, 28 Nov 2024 19:56:15 +0800
Message-ID: <20241128115618.387042-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732794987; x=1733399787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j11ycWSwHZDlyIFBXOh21dtuDO4dLBubfUEqAxtbA4g=;
 b=blnnSbKK37BbRG38BO/uAZVqtr9II4N7h2/dYEwzIrEQh0mINZWRhqjhTm1/ZCW5aR
 9o4JAyG9rR+UbPxC57Fca4B138+/ySu10osCr50y+SO0YkqDf9uh5eJpKRFAad68h8B2
 JT8Q7WJeSA0x03Z77zbLSzt9GCstF5S01OO760O9t5g5lLR7xNJwF54C21A1otPCOvi3
 sA3AeHQ4fMWZm8Dvwb1q1hNHVMoulKcEQ32XXZAir+lM5oUBiAFPNVqdhO+hYmQj+O7J
 fl/bwz9BKXuiYtu5HNWxactubxpPPkGmXLu0gSrTR/8FtIUVWR1ijBemk2uZC/MHjnOw
 AKSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=blnnSbKK
Subject: [Buildroot] [PATCH] package/libiec61850: bump to version 1.6.0
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

Release notes: https://github.com/mz-automation/libiec61850/blob/v1.6.0/CHANGELOG

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index be662bebaf..3c23682c49 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a0f396a5e2249398f2432bb9698e3aecdb9de11b28e5af68f7fb8b14bc3b2f44  libiec61850-1.5.3.tar.gz
+sha256  0dd0adc7f13215e961d22511bcb1dadfdbdaab969f11a0d975775a6ebdff8099  libiec61850-1.6.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 276acce1a8..92b27dc5c2 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.5.3
+LIBIEC61850_VERSION = 1.6.0
 LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
