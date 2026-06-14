Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED301CD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76CE83A6D;
	Sun, 14 Jun 2026 15:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyKRbw_yA2hb; Sun, 14 Jun 2026 15:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4DD083A77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452438;
	bh=eCYTLjQtke1gBBCCjoxhyr6yYiBBKqY4d7hWiyIh2W4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DOB7QF7zTvad/HMBfvpNkUezDgATz8UEuP643XZmvU9egMxIxM3/f1rAiGnPjXjZX
	 hsPz98svlRBrirI4hl5uOdLOYvdrQMqoG4BD6iDhqT4W9FhWonm2yCDadvKytBKNPS
	 OVeUbclrCGM11qYX8/vjU+DLhgD9zdzIkMskFvpKvZga3acACQQjZamRM9XTx/BHNe
	 l8i4GcaKC+wIDwnRrJIcFZc8JAUwMhOCgHeZUrn5kS0NHpbWjIHPja0Rjmma27UNed
	 L+8KrfRBTObbavkUWC1DZyNsvD+c2zLY+qg14YwJsKrCSN3SoGDdmVFgXkgZgUSlnD
	 o6h4IH6P+dbkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4DD083A77;
	Sun, 14 Jun 2026 15:53:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 91E4EDE
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83E5C83A77
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAU5wzacgWRs for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:53:56 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1AE283A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AE283A6D
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1AE283A6D
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:55 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-39677c434efso23614841fa.3
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452433; x=1782057233;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EHCdL2zg+DMjtS5iXT78HqTDBkv2VtGheRz6TNmbTH0=;
 b=fvoL9tPqaG+NihmrBOuIFJBWI7ksb/ntY04H2JTPYi+QAnbM5TSHCQ2AbBEhdwNi7d
 k6620QYvZriFWy8SMDJ80qDCh24qiMJ7MwiyBxrmhN1WqalecqFKDStMJ/vpywTICV4V
 Mfs30cQ+dlP5aTVrqlH6xvC62iWAEExel2OZN3MYpz9Oozezf/WmnmMW5YLAFJRocMeQ
 Ogb/Pu/1c+Bpm10Oa/g7NmgsCh1acYvHD/g7BWak0NYAVmKWknkMRI/a1qSnq5Bqngrk
 BvuAS/ZRut1GBWRcFTGq0QjBQgtnIz7FkulzVXVBrpXzCQrOjedgWvNaWOwM9KARiLTw
 1J2A==
X-Gm-Message-State: AOJu0Yy551PPZ0bA73Gevd2/pjpM2quKpMWrDaFV1VW02b4l3QSSjTfU
 Ufx5S9cQ/2A0y8fy0C0LTN6I4gq9zN5/X2fEBWtP/LYTBEtwlQi38pRfoN3ybJJauy29S/2n9f+
 i/EPoW3gv3w==
X-Gm-Gg: Acq92OEVBYomG/5gyXs2KssDaqI9jQ3OYrWUvrOiNGnIVnXinl1zPlt6oyuZjR1lgDQ
 w9n88XC2CdWZ9pXouBGuco+PAQb3Q3dDIw/NA4BKCRMYvXA0Jc4rYCN2ITH41TY65BJEOVl/n5q
 wxE5+wOdbsGvf1Yd/naxF0akB4rKGkegA9Mmq9AcEKYPXd8/aYi+tLCCdYYzekPPuT4dlzQkZug
 dYPpLGztrCHCZ9TakridlUwmHFG4PKBvEGNLsPLBTZPylrXam635AoUXkd/8s6ahkV/8uGM/TR1
 wDBoExAT2/qRX6SIin5o3etbUHUSXd9wSrvVjTMSdUBgkXmq8uT+y5Dl6NQcFaEjf0YIZpg1iKB
 IKeCmXoIuTQmUM5ZsryYH3GgKmVN2TwTheIwlAChOabN24ZBikBJKjWZQsgmcYEXy/CbDk1Q7Q0
 tJRRc/oz5Ux9aQ+TQ+mfKSsNekxklBl1p5BxGvEzsrtyx/+upHGrs3zw==
X-Received: by 2002:a05:6512:2314:b0:5ad:abf:1e19 with SMTP id
 2adb3069b0e04-5ad2db2bf27mr2662606e87.6.1781452433312; 
 Sun, 14 Jun 2026 08:53:53 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e161f52sm2044976e87.6.2026.06.14.08.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:51 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>, John Ernberg <j@j-ernberg.se>,
 Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 14 Jun 2026 17:53:25 +0200
Message-ID: <20260614155328.304282-6-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452433; x=1782057233;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHCdL2zg+DMjtS5iXT78HqTDBkv2VtGheRz6TNmbTH0=;
 b=P1kJ4BKsfFcOTlKP1a47WaxkOgfnMITOd9/QW7D6Pbpm2W8VD51+oOcS5RevUf/HXU
 saZFCyP6tbDN+zwngvMEpcAiLMmDSoyZzl96tniI51aVf5dvz4gvvfAHM8ZzEKKL2/vs
 JTapMmz5AayLz0ef+Pbz65/Gcnl74s3ebh/A7cXpuKqXDiImuu39TcERVY6KZCkhqZpQ
 OlVr06jn7oEwVLHbAt16IKVAzJS51wJAH+qZ/rvF3MShEWFYW0AGf4jhMur1wTuQReQb
 u8CRFCt4yGHb1j2dW/AcNeSeNeak6OyMxbU4qspjD/h0lwXCBkMUZQYGuuCbGSpPyEXV
 kY1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=P1kJ4BKs
Subject: [Buildroot] [PATCH v2 5/8] package/libcamera-apps: Only enable EGL
 if both epoxy and xlib_libX11 are selected
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

Since release 0.2 of the rpicam-apps these dependencies have been required
if enable_egl=True is given to meson. [1]

The dependency check was broken since commit 3fac163b9315
("package/libcamera-apps: bump to version 1.1.0") in early 2023.

Link: https://github.com/raspberrypi/rpicam-apps/commit/c8351a09174f143424884081a69b6dd8018f4ba3#diff-a2468a39040f9f883e5b03e1523dd4e73fd43ad9ea87f600772477b890cdd655L18-R22
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - Simplified the checks in .mk (Arnout)

RFC: I can't figure out if this is the correct way to do this kind of check.
---
 package/libcamera-apps/libcamera-apps.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index df7be41496..5cb7ca3cc4 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -36,10 +36,8 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
-LIBCAMERA_APPS_DEPENDENCIES += \
-	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
-	$(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
+ifeq ($(BR2_PACKAGE_LIBEPOXY)$(BR2_PACKAGE_XLIB_LIBX11),yy)
+LIBCAMERA_APPS_DEPENDENCIES += libepoxy xlib_libX11
 LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=enabled
 else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_egl=disabled
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
