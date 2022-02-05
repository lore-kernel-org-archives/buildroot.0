Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DCFC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE5B828B5;
	Sat,  5 Feb 2022 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LevJILEUQkS; Sat,  5 Feb 2022 14:01:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0D14814B4;
	Sat,  5 Feb 2022 14:01:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A08EE1BF39F
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC9F60C21
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 14:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9jlbHHagyRDr for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 14:00:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB6936068B
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 14:00:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso11328576wmj.2
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9BbfPRZH7tDkVytMeV8+0NNsEk9e25/empwVDjoX5Do=;
 b=JPDUy/8o9+wNccbStru53uP3GD/HSchxc0dCY2DE6Z9ddOOqByA93jbfI/J+PFbMR9
 dHVwcwz7iYtHQFu7BW+Yv1xlhLPB1MwWXizrR0Hw4/xY/cG8+KnEXPY+qL8z9+wM+6Sr
 X8DF0kRCKTzfVBdIj0chy9wOb0GzpUMYghqmxD1ko174bllBlaSCLDny8+qs1P2ttV/h
 oyBm3Zn3375i32+dTpSL8URTlKBVnC2nPHw/REOpCB+XI7VLEPDWYVL2CRbe9gkQJwlP
 UgxkhSbH+AvBQ3NOAPIoxXT5TSfRMMvJzm0mpG8Gsb46wGuWaZZMG4TAVngclpAFD5XJ
 HpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9BbfPRZH7tDkVytMeV8+0NNsEk9e25/empwVDjoX5Do=;
 b=PB/ojTe+hIg/AD3IwPMWvwbvVsFoP9SOBkxCObWcHz4Lt1LscDy7+yA2GKZk1tZvOe
 jLNJ7jEKRwNEVns6vcREckxYrYbxoh1RxCPI4k4qUVdqR623TdjNnpHhbiqCw/6XEu9g
 3YRwhEymRn9XvE28RedFxQ55RMotSBDRWj5955v9Sl7N1ayxgsPFPQhvPBbRKepQel3m
 goVMc76BH84Nazi2Dag+upx07qUrEXfISAFzQSQ3yCNJNYhRf3UetZwcD3Xk6M5aBrEu
 Zdu7Dg+ykV59R+whRBisq2uqCCNArkDROT+fm6RcSHU/KYAxzedt3n9w9kV4b2577xWP
 hsGg==
X-Gm-Message-State: AOAM5322BrE5pkkZR8XxjrN4cp5e9eiHH75MSCg5YQs00v9W86dEzaHo
 bAaT0zskyLT0lUJUCjCIHbDVH0C0oDE=
X-Google-Smtp-Source: ABdhPJzUb3ASaDYivHLOl1am1j0848O9bUFLsZlJUmOK3KeImFqqmxoLOSRLlhjBV2rRYRQZqL67JQ==
X-Received: by 2002:a1c:4e07:: with SMTP id g7mr6644341wmh.38.1644069657566;
 Sat, 05 Feb 2022 06:00:57 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id c11sm5426763wri.43.2022.02.05.06.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 06:00:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 14:58:06 +0100
Message-Id: <20220205135806.312865-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: disable altivec if needed
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
Cc: Julian Scheel <julian@jusst.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
bf4cf9de833e2d571d98d1ca935ea08a3468e463:

blake2s_simd.cpp:715:8: error: 'uint32x4_p' does not name a type; did you mean 'uint32_t'?
  715 | inline uint32x4_p VecLoad32(const T* p)
      |        ^~~~~~~~~~
      |        uint32_t

Fixes:
 - http://autobuild.buildroot.org/results/9e9f8559b12b8e2cf99cfab435fa7dd5796bbcd5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptopp/cryptopp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 4353e35e0a..87d6fba237 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -47,6 +47,10 @@ ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_9),y)
 CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
 endif
 
+ifneq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
+CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ALTIVEC
+endif
+
 ifneq ($(BR2_ARM_CPU_HAS_NEON),y)
 CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_ARM_NEON
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
