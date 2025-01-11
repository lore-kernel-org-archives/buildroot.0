Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0407E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 06:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22FE3608E9;
	Sat, 11 Jan 2025 06:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r7Y-zuTY-Jj; Sat, 11 Jan 2025 06:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B7BE608F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B7BE608F6;
	Sat, 11 Jan 2025 06:38:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D568940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A2BC40132
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1LhqNjjO39b for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 06:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D9D640146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D9D640146
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D9D640146
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 06:37:58 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2163dc5155fso50081675ad.0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 22:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736577477; x=1737182277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bUnqPryi9gOs435T2SB4brHDoqLodSF/ZEfb+cfJOOo=;
 b=peWWm2++XpqB5h0uS8OFB1FLJOIR4B9gB+kSULLu0gYEvkLLJRQGOGiYTsLRmgKlzt
 h8p56ejJ8FqxG8AAY6D5alV2C0Q5qIkqpATAPqvwTSwwmuNqQguug/MvB6RnpBZJxmBw
 dTHd7qaWu9cCicYhtcx4+/9irXb7zq6mZgLoE+MGJY3/NqGISvzKiIicZjHrqHegnqKt
 m3codyqWHqx/ZEcha5PvjN+wu9BAZacB0kTp+qOe0v/vrgWSkLRcWE/oFxCOKUPUAJkk
 2Um8E/AWdz2+ynC+R3UVtJUmjOG71POdth9A+N4GYF1tQKYAvfrIcMVIhZpYcG4Hy0i8
 32Fw==
X-Gm-Message-State: AOJu0Yzrd17f3uHa3zE6lc9YcEiqDA4suq371sOGuIVbQqtBOYQwOco8
 ADEg9cUbJd5MOB9TMH87jU4ue245CVZlulgQ/m9Uelc3hxXqFblXDmzfEBMa
X-Gm-Gg: ASbGncvKedf8TWeXTuWlPjGNJLciGg4spVhkhgeZYMMICJINkSIYpi2IAVOi/mh/7NN
 BajpfyByC0gYs91VGm/4Ts5fr5vy7PZyQPjw08wrQeyy1gBvT9jnB0xQ2W9vuwFHTLjTjgpqAGC
 tlZHvI5dFAUi1YhWuuvwly9hR/Fjb6lsTIz/YtpkjdGdLl00m7yrUCOQuFj+7Og/rd57mfwPYUl
 /gD0759TxQRY526+9z3Ys94xgSFlPh+YOI6KA343FVfWgK7Mr2rR7gDb1b7jByNf4dlTCfLC756
 C2wW3tSie4EKKak/WkER0qOjGambpfDvprSCXyCs
X-Google-Smtp-Source: AGHT+IF9nZ2vzRfljCMkQuGNP5mQVQlL2Q3Svuu90omCNVslw2N0TNq1pc13icjMDd2q3pb8wdT5Uw==
X-Received: by 2002:a05:6a20:7fa1:b0:1e0:ce11:b0ce with SMTP id
 adf61e73a8af0-1e88d0a9418mr24748000637.35.1736577477394; 
 Fri, 10 Jan 2025 22:37:57 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d406a9433sm2477488b3a.176.2025.01.10.22.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 22:37:56 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 22:37:49 -0800
Message-Id: <20250111063753.769689-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736577477; x=1737182277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bUnqPryi9gOs435T2SB4brHDoqLodSF/ZEfb+cfJOOo=;
 b=NphWIzNwlX0LOgJU4cJpdUr2e8ejbnUa0HayIAwWYLS/Y8VtT840S3It1WxRFXxqyi
 xEI6xgnL6FVNqo8mPYmZ14bxeyedbG1rjCbHoPzpZBt8MccmiWJYBw/kVCVsC0Eka0ob
 XPif0tUs6Vlw7jv2VyrW7BRCk3OkSCBrVllEQ4WRV3Ti2LsKs2ZhWwdRP0NCLyuu6H4s
 cbpDw6C4DBhIbIrXwgO9BA6oN//+JpTluvm4KYiGKWt4CEoyxVUpjcP8X/syccsUJXQn
 OrZ/sJFIy1BSvSp9TO0FW2g70JwI17wxAwRbFrEpmRT3UcpZfqeRg/xRXId8Iv3sUMsn
 Tzkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NphWIzNw
Subject: [Buildroot] [PATCH 1/5] package/qoriq-rcw: bump version to
 lf-6.6.52-2.2.0
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

Changelog:
https://github.com/nxp-qoriq/rcw/compare/lf-6.6.23-2.0.0...lf-6.6.52-2.2.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-rcw/qoriq-rcw.hash | 2 +-
 package/qoriq-rcw/qoriq-rcw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.hash b/package/qoriq-rcw/qoriq-rcw.hash
index 1f664842f5..b9316582ff 100644
--- a/package/qoriq-rcw/qoriq-rcw.hash
+++ b/package/qoriq-rcw/qoriq-rcw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  52dfb95a3d8e811609dd8a982a5c6f3ba88fac096ea8448a27b571b7c25e3a83  qoriq-rcw-lf-6.6.23-2.0.0.tar.gz
+sha256  bfb992fcb396894874143257b53d14394ada48df0771f7edb55324fa932bbcdc  qoriq-rcw-lf-6.6.52-2.2.0.tar.gz
 sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index c6cfe59a56..c536a12373 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RCW_VERSION = lf-6.6.23-2.0.0
+QORIQ_RCW_VERSION = lf-6.6.52-2.2.0
 QORIQ_RCW_SITE = $(call github,nxp-qoriq,rcw,$(QORIQ_RCW_VERSION))
 QORIQ_RCW_LICENSE = BSD-3-Clause
 QORIQ_RCW_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
