Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D54DCAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 15:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A884D615B1;
	Wed, 17 Sep 2025 15:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOxUwmMFH1a6; Wed, 17 Sep 2025 15:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C362C615BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C362C615BC;
	Wed, 17 Sep 2025 15:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A182AF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F99482252
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEjXbbN2ttZG for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 15:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::643; helo=mail-ej1-x643.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2AD382209
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AD382209
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2AD382209
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:19:54 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so1032699566b.2
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 08:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122393; x=1758727193;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvEC4k8LzGtu9Q6jrq885o0Zcu0L9UaKlT6Z3FNjGM8=;
 b=hVGSc2yqxvmfAl9OVhKgW/47+7yog6ZjPaaMsBTai8Mn026pHm/7G564IuUsZ9nco3
 +EAKb6BLNbOmlFlQpyP8HSgxkx2CUiopvGmJttV9dVxPbh13lgJhB6xfBq1FKhOxo6p3
 /Jr1L6dp2NviEdd+HbU56IYPgjxt2lJNtyMbe3CrfSTFc64m5vCq5fjphx9AMG/COFl3
 lEQgg5EP+N47DPxaB/Ee8jsurgZ5iJIKyiCQ/W7kwJ1hlflh0Ef7toPRv0Y7e+jCV+zE
 xhQ6Wqiwqvah6gMwPS3NO3RmF/aCbd3I6ngybA0gXQe2UCFFML7ilpIha2q8SSTySfJ1
 rtew==
X-Gm-Message-State: AOJu0YwlIn8lvUz2EZ+y36V8ocaAMVTYkWpJLolZH1JmFLF69hx3KFId
 OYajXptpjCjhry2OT3TQ0ZdyEiZPCsrltbiKiWM/NwYqdTNw0sI4yqhEB8AgxHN8OKJSQDEopPG
 Z79COzYkpSg==
X-Gm-Gg: ASbGncvw6spiF1z1taksCYm5pc4Jpobit4GDN2qkQl1NzZgMQ6FaO1QzxKjgEqaqooA
 IdNfPs21j11u+8sjw/eVWQrPPCNnPYVes8jopuZG9GL7NyKc5NqNclzhz2WhTOl4GMOGfvOU5Bn
 AmO7sY51ZIt6SZFW9QHVCyhTK4Otd1KptLh0PesXe+Bm870+1+kruZPn0rhhT/QlRzOIgRCiv9w
 OMHvbH/yVWc5IYt0MeYMHko51nv9lshizOPLYBnKfIdoKnPP4ypOrNZ49DGYNsoKJs5fLGWgj/g
 ifBOxhqhyAifItaNm8eOigMd7pemDB/QYPn/mPd16fJzfDL3jEYaNjGSuaKs63F2igBmsbeMoAZ
 c+mBrCvcIeR4zIppdXHH02SFPnnj4wlsj2DOKjeyMufg=
X-Google-Smtp-Source: AGHT+IGVA8jpjBpH+EXYzpk5jPDe+iK9rNpjUdvEF4CnbLosAq8O95DJ+HanFUCvuUJpageyPJsdJw==
X-Received: by 2002:a17:907:dac:b0:afe:cded:bf96 with SMTP id
 a640c23a62f3a-b1bb50c5925mr257487966b.6.1758122392791; 
 Wed, 17 Sep 2025 08:19:52 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b1186294af1sm590616566b.35.2025.09.17.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 08:19:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Wed, 17 Sep 2025 17:17:17 +0200
Message-ID: <20250917151717.362991-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758122393; x=1758727193; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VvEC4k8LzGtu9Q6jrq885o0Zcu0L9UaKlT6Z3FNjGM8=;
 b=PT9DIzJsNGfdn0xYI5pJVKTBCMX3IEV/wRvx6hIqMBvGcNc7lFi08Y3C1adU3ai8G4
 OS5Beb7e3GZYvL/pCdK6haYh9AXjMtJRXQEEyY868cFxaZOCjP2IZtSa7YeMI1KbGp2g
 HtRSkewq0SwdinATBFsdS2Rl3bRMcge1iT/Uukfpx9n4HXl0ofij3I+KjaLRLu5LGYze
 9Is4wHqB6AGI8FgzJADBucSwqtVghNVmxsM98gu5vMs19Y+mSv+U47wCKdAl0IBTf1fu
 UKTZZainfQ0s05vKEfPtjmPp4ojWV4dKZOtlOBOMQZjREWYT2iKp5eJBkWxn8lpmH7bY
 cwZw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PT9DIzJs
Subject: [Buildroot] [PATCH] package/opencv4 (-contrib): security bump to
 v4.12.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerability:
- CVE-2025-53644:
    OpenCV is an Open Source Computer Vision Library. Versions prior to
    4.12.0 have an uninitialized pointer variable on stack that may lead
    to arbitrary heap buffer write when reading crafted JPEG images.
    Version 4.12.0 fixes the vulnerability.
    https://www.cve.org/CVERecord?id=CVE-2025-53644

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index b406f3d11e..dc9e810318 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2dfc5957201de2aa785064711125af6abb2e80a64e2dc246aca4119b19687041  opencv4-contrib-4.11.0.tar.gz
+sha256  4197722b4c5ed42b476d42e29beb29a52b6b25c34ec7b4d589c3ae5145fee98e  opencv4-contrib-4.12.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index 3961ca4a25..c1273237aa 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4
-OPENCV4_CONTRIB_VERSION = 4.11.0
+OPENCV4_CONTRIB_VERSION = 4.12.0
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 6a3501b051..a39b199166 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a7c11f924eff5f8d8070e297b322ee68b9227e003fd600d4b8122198091665f  opencv4-4.11.0.tar.gz
+sha256  44c106d5bb47efec04e531fd93008b3fcd1d27138985c5baf4eafac0e1ec9e9d  opencv4-4.12.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index d3df1a39f7..9691eb78e8 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4-contrib
-OPENCV4_VERSION = 4.11.0
+OPENCV4_VERSION = 4.12.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
