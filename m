Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0481C71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 15:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7027D60B5E;
	Fri, 13 Jun 2025 15:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nyXH2_PDQMr; Fri, 13 Jun 2025 15:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB0F860B62
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB0F860B62;
	Fri, 13 Jun 2025 15:41:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73D3D115
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 15:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A23960B62
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 15:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srawryFeiMsB for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 15:41:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B11D360B5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B11D360B5E
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B11D360B5E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 15:41:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453398e90e9so5884855e9.1
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 08:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749829284; x=1750434084;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GYl6eFY0VF3l9+84/o6DjPf3R7n1fm0THIuLhRtfV0s=;
 b=u793A3KMF7R+PebvT2VINVeSAxF9SRHstmG8ABXDC8hQxEZOu2lSPxoeoBq/ZywKEu
 eJP3pGUKbOCGUq4LPtA0+LvGZP9krNQYvyeH8wYxiJvGZoDmXKMVspUq9ishUtRZWzzt
 XsQ/AKS7l1UQTeCx000YmCkYJhK4BjSDnLYOFulgT27i72isn6W5L82KzOJlaE89s3Hp
 MGEOtVFtzmpcpH0AryZjJGmA1N+QkvjCoh3yTFDd6PhxAUPNyrnkUVuLe2WqPURoCKQu
 yzQ1oYI8j4O7a4SaGBoHwlz81fOonNrN1tVPlLo9bsbE2l/WNzCpOvQbmGQnWRS6D4J1
 hIZg==
X-Gm-Message-State: AOJu0YysxSwE0ilT+BYSQzHsvzPjQySBNFoMWaSdOSBQmCwD0Fd5WTUC
 WdqaqmUYQUcMC+/2wkuKSYQq5JGUEO8QyDyDseHuG+CEHOTiHn4g8NZQxFNOPt2fCCZfBQQ/q28
 ei6To
X-Gm-Gg: ASbGncsMgaZG2hRvfhv1Dd2Dx+HMM74bB+8EZW2jzXRmnMEnkpL99JGWsh5kGJOl/WK
 CdD3kKEG1ptLyuEhfIZgUrZeIaUJCnlwACbL0yzJzM8Ap5488TO6/ozdmm0GfYXRFjfyxrukl0q
 DsZq6Vfu4CmubJIXS916OkOsbbAQZWiIczyW5XcgBc0nvLRsODM+alU08CSqKZhas3vdKmYr2dh
 8dZCW9DTdhsSCKSqswVsnj7+p6HXZApYgi1ErCuMYKnEgyAWBtv67LGoayghzuW11UO2zj1OE22
 /EIlLt3XWFSAzRYU0xXZfyZjPzJtWOlMJOO2qHevNu91ErF4NLf1qn01P6+jS9Am15HBDiav1aA
 =
X-Google-Smtp-Source: AGHT+IGaLmhprGG0MOQoel9GZ67zB43zqNVYg+wEvQSB2LsViD0uJptUOvD/mY3uwfvrLfDWr31KqA==
X-Received: by 2002:a05:6000:4602:b0:3a4:f6b7:8b07 with SMTP id
 ffacd0b85a97d-3a572e95984mr170961f8f.48.1749829284288; 
 Fri, 13 Jun 2025 08:41:24 -0700 (PDT)
Received: from NV4XMB-ME-MZ.. ([2a01:e0a:943:83d0:e0a4:5913:a608:fb7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a54b7asm2745755f8f.16.2025.06.13.08.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:41:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabien Lehoussel <fabien.lehoussel@smile.fr>
Date: Fri, 13 Jun 2025 17:41:19 +0200
Message-ID: <20250613154119.3013099-1-fabien.lehoussel@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749829284; x=1750434084; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GYl6eFY0VF3l9+84/o6DjPf3R7n1fm0THIuLhRtfV0s=;
 b=xG7evNcwZqC34dreilQ8tYcFH8miVMn89uEU2QMIDAeaWtFBouDW/mTEheZ6CqhM8U
 CSJojOKQ4WOGJhO3CAEgU62gQxoy/amwwIAra8b2cOrvAMoFI2nJSgFNbokbOX1y/X+R
 5wLjmybBz9NLCgOqFJn3ls/IBgCpYWKr9iwSc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xG7evNcw
Subject: [Buildroot] [PATCH] package/gcc/gcc-final.mx: fix CPE identification
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
From: Fabien Lehoussel via buildroot <buildroot@buildroot.org>
Reply-To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the CPE (Common Platform Enumeration) identification in the gcc-final package to ensure proper vulnerability tracking.

Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
---
 package/gcc/gcc-final/gcc-final.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 43aea72420..97a64ae2fa 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -12,6 +12,9 @@ GCC_FINAL_LICENSE_FILES = COPYING.RUNTIME
 HOST_GCC_FINAL_LICENSE = $(HOST_GCC_LICENSE)
 HOST_GCC_FINAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
 
+GCC_FINAL_CPE_ID_VENDOR = gnu
+GCC_FINAL_CPE_ID_PRODUCT = gcc
+
 GCC_FINAL_DEPENDENCIES = host-gcc-final
 GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 GCC_FINAL_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
