Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44BFCCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 09:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3106F810A3;
	Sat, 11 Oct 2025 09:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ni7GxRGG1zsY; Sat, 11 Oct 2025 09:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2971F81096
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2971F81096;
	Sat, 11 Oct 2025 09:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86590BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A6A04055E
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kg3CgZ2X2nrz for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 09:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FE7740503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FE7740503
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FE7740503
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 09:36:10 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2681660d604so32770395ad.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 02:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760175370; x=1760780170;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XIrnWNb+6HMEOuOiPqEdg4G/8E8dxrMQkXAUBf0wMUw=;
 b=UNEhhd3dFkc0c3IMGSSPSYBVB12Mpszphp9J20dWYcYCG+HWnkp8CkgFqN7z4kLqrX
 x0zWcMfUQ39dQtLE95lBKvZ5WE1W2nKGsEDXBgMiQK1oafQMud6mFpqZmwnMjlfU942S
 1kn5v5dcouk/WNkcQIOT3a01qWiUR06wxSL82fdRamLH5TN5J9a8VZ1L4BonoF+GPHE3
 gyBbL8y3og+HwuanimCucAvuLsxGCsTLHzJrI0w90EYkOdJKKQz96qbVV1hGYwnfYZIw
 AqGiPriyFmwcSkXOYTBrh/NjZaj2A85ealPh2QWWiVsgMxz3vLkLPn4Bt2CJtOWPfcpc
 bvkQ==
X-Gm-Message-State: AOJu0YzKZiy1YB2/9Ub5HHTMmiDUC98SXrUHdTGzlXWCL1V9H3oQTEmt
 EBJHN98KnQF1b+NKFkMO0flza+bMeuP51oWo9Gsv8XARm/P60f1lh+DJB65+FTIg
X-Gm-Gg: ASbGncv5Loc/8Gf5YBGglgZvZm0lYsFk1Pard/MvO1z3l0Zt92jHhW36KQCJeCLhtwF
 9/6+CrGfQ9YXUjl76AUBdBY3A4lGSFnPf2y4K6t4o8Wkig6KG2pXZ8HcNtuaSvI2JSPm2boyhz0
 BveG/sxGCDHQlqHy2DGbih30P5/AM/ivfzNFVtTyUs5oneOxQ7MTldoyw6qFbTZ01ZT7SIqqC1u
 4fGEi/5ZXNfbFp2FIt4+B5aqqU5XA3OGCsYUZp7QBYj7O+FAU57yy+JqBLoecYEyjaZrflKzlEr
 32ekQQALHdkKly1DrKknnkvIDA/97GPNoknYXU0oyOQUJm14vwRwy2pdNNX2u+6h1HZbGP4kz21
 hcAzzIJm/26OaVhZEmEnYEao/csXOqey2qoj2RbKfYcFnFuX1/TV65Uq8wzsttQiUJLl/2Rycci
 1dRaBRGMtpmH4z0fII8gDYuDxC68Md16lRquNh1Z4FyHJmGc9wq3kp1+at0VQTSZSE96LXcYSHA
 BusIQ==
X-Google-Smtp-Source: AGHT+IFxdqQnoadfdkmRIl7dMHIizm38TLPd4dCsKMG1DdQONREjO3OuV1hyffCOzV4ekQd3AfBTqg==
X-Received: by 2002:a17:903:37c7:b0:275:b1cf:6dd9 with SMTP id
 d9443c01a7336-290272f80dfmr189654905ad.52.1760175369651; 
 Sat, 11 Oct 2025 02:36:09 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f32d6fsm79727615ad.96.2025.10.11.02.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 02:36:09 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sat, 11 Oct 2025 02:36:06 -0700
Message-Id: <20251011093606.522412-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760175370; x=1760780170; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XIrnWNb+6HMEOuOiPqEdg4G/8E8dxrMQkXAUBf0wMUw=;
 b=AY6DoMbSfNnyz8YRsmD4Eh2VRzLVYakUJBgf0f0u18hHeBS5a3tVEX1KZ+E/aRB71o
 nEJnuP6du87E3UpArOUIaQYTN2Eciw1+SVC0p6mVKgxELDFWEKSWNHkX4615V8UFfuBS
 gtS1Oe8gzhXeQ1KdnNQNWtkB4JpkArBpl1+UP1XGMZuJgD0VwN9NiSnkKKNyooh2wxHq
 9ebTY0mf+rRX48zscDM0Q86cQnJphieVuAlrdJEhC3EQnH+gae628+LQUwuDwgmT1N2r
 T5kZdwsNG/3TP9+BXnVi4AFJndY2Yd969qI80YmmNJRAfbbI3a5TlpeBzaDvv13ugBlh
 ua4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AY6DoMbS
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.40
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
https://github.com/pikvm/ustreamer/compare/v6.37...v6.40

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 30c8735901..44e73f8b50 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b134bd9e291d2e7222e135f9b1b22f89ebf7c78c9c22333a4046a21365f87b2e  ustreamer-6.37.tar.gz
+sha256  576d40d14241945926876ec1b1dd164bc59a03076b325fc1dfa07094edae4b1b  ustreamer-6.40.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index abbeac2382..18f354d3dd 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.37
+USTREAMER_VERSION = 6.40
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
