Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE02C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29F2E60FA8;
	Thu, 15 Feb 2024 14:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9aUGAQ4GU1X; Thu, 15 Feb 2024 14:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB4860FF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB4860FF5;
	Thu, 15 Feb 2024 14:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3ECF61BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CFFE40355
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJrtvu-Pl-Uy for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44DF340219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44DF340219
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44DF340219
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:38 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-607e54b6cf5so2021297b3.0
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007076; x=1708611876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZJijpOPhq3t4vMa+NOM6api2NQ4yWYmqDooSS7TheQ=;
 b=CRevHsSoxCGZfDRQNCRgYzV3Rha9AYyVXyXWk1naTmSGZcT7pRYukRWqyEP/821JEn
 Nw3fiv7NCuy0fah6qBqNYBoLlHy9He1Dv7KPblrDyCh9sfXyOieoLn4CVED7bQ70eKsH
 ACbL4nSDuQVrzgYhQN2qs37rO1mkRs2iecBuMEm1hgVOeZrOWRiJ0hAb/42CRra/kZkS
 LEV2TCWS2HUtrJoUH3xjfF2biHyiKMVwigOGFYyDh8Q36fldm9u/HGrOnDu48pEN9BMW
 mEjODRghfTLuhIgeeQXjrwzqVdZFp4lyZBuHfCGgxIx8QuVV0cvHVcDV1rEhN/XHpq4Y
 1VQQ==
X-Gm-Message-State: AOJu0Yw37zBLJW/i1+I8Eg+MGD0s8gYSXtkvVv3uVcm8VdGK0gQQTdO9
 LRCjt3spqxwuO52lLtWP9rtn6ZAafVu9dIplu+taIEbtvFoOk5Qn/M8yqOBm/vw=
X-Google-Smtp-Source: AGHT+IGGNQqFX7gYxok2XkEaEojX6OtjMWJQf7PeHkjZSqn/Hu9fADMGIK7LUC08szTLzG+h5NtK/A==
X-Received: by 2002:a81:910c:0:b0:607:a390:604a with SMTP id
 i12-20020a81910c000000b00607a390604amr4223212ywg.12.1708007076337; 
 Thu, 15 Feb 2024 06:24:36 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:35 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:11 -0400
Message-Id: <20240215142413.451505-6-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007076; x=1708611876; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZJijpOPhq3t4vMa+NOM6api2NQ4yWYmqDooSS7TheQ=;
 b=DcU4z+DeqAFQqqCgSGW+1r2G758RRZbCmFiXyNi/VGxY8B3iOISV436f1yYEaKuZLH
 9rp6O51MZbWBBPEh6EWSZs63zRCd+f41s+M74HRcYpZ3MMiZg+cGzuM3HylsRwQm/mue
 vBBfqNyja03wvpZ+Ot2O8FNalBLpbhDgzgjgazc22Eyek0g2Ew/8SQ5WkCfwIrB4jBUt
 FXHOVUOYF+oCRyqlCWQdiYx3oNjBQiOUHBMuyWDOjH4xP+1PMKXnB0LVWUCL6vgIb1+D
 s0NK43QER/MAYc1SeqZffUWfoeJAttiMGR66QKhJ9O4nLUmYLzR9UKMtYW1zPcH6/XJb
 dp2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DcU4z+De
Subject: [Buildroot] [PATCH] package/opencl-clhpp: bump to version 2023.12.14
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change log:
https://github.com/KhronosGroup/OpenCL-CLHPP/releases/tag/v2023.12.14

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/opencl-clhpp/opencl-clhpp.hash | 2 +-
 package/opencl-clhpp/opencl-clhpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencl-clhpp/opencl-clhpp.hash b/package/opencl-clhpp/opencl-clhpp.hash
index 27b27cd80c..3f038d6340 100644
--- a/package/opencl-clhpp/opencl-clhpp.hash
+++ b/package/opencl-clhpp/opencl-clhpp.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  869456032e60787eed9fceaeaf6c6cb4452bc0ff97e0f5a271510145a1c8f4d4  opencl-clhpp-2.0.16.tar.gz
+sha256  9106700634e79cfa0935ebd67197f64689ced24c42da702acf18fa8435bd8a82  opencl-clhpp-2023.12.14.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/opencl-clhpp/opencl-clhpp.mk b/package/opencl-clhpp/opencl-clhpp.mk
index 933b40e3fe..93c25d0d66 100644
--- a/package/opencl-clhpp/opencl-clhpp.mk
+++ b/package/opencl-clhpp/opencl-clhpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCL_CLHPP_VERSION = 2.0.16
+OPENCL_CLHPP_VERSION = 2023.12.14
 OPENCL_CLHPP_SITE = $(call github,KhronosGroup,OpenCL-CLHPP,v$(OPENCL_CLHPP_VERSION))
 OPENCL_CLHPP_LICENSE = Apache-2.0
 OPENCL_CLHPP_LICENSE_FILES = LICENSE.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
