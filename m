Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A347FC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 21:58:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 443F860F23
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 21:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 443F860F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D9340100;
	Sun, 29 Aug 2021 21:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id unLCTSdkSILZ; Sun, 29 Aug 2021 21:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33D8F40151;
	Sun, 29 Aug 2021 21:58:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 331A51BF350
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 21:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2852D403FE
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 21:58:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nnvle2qD4OiJ for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 21:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3C62403FD
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 21:58:05 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso13346384wmc.5
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 14:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BTBLyDc8tFmCPj0BGSBZAKpST6gQtApMZLWXtFpyOc=;
 b=LUWQL+aKpDyjAyNyOIxw6tVZwLrVstOT3kb+jot6xsZD2g8+pHzfAcIKHZ7Ad7fsfv
 T5KduGlJ6f9Ts/DQgfG/6SlTLvM9SsJfm3iitRPTLQOOX1lGxmFre5mMM2gs4nuVfxc2
 8jTMfdzWk55ECnBzg3IKlqd4caAsw13bUJ5m+71SOiUJn7GthTCHvgrjTDqGVIYDGzer
 jljiVTG6g9NEzOfO0Io+2T2VQ95n9xKhNb7BiN2HLglZRPSEe0yTxhjPV2zEdXF32J3s
 Q/DLyAOo9VatuxlH5TkSrnVqp6Sd0t8yS2yCR2Su9fPyyfIjKbA/KIwsZSF5az51NAVH
 ymKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BTBLyDc8tFmCPj0BGSBZAKpST6gQtApMZLWXtFpyOc=;
 b=OtF/R1MTdk7ITxmjQjpiBtzcVBnsOGhYo2eDYqMDGWi+hSpmrso/wTY1r0y1i7Mz1V
 GXdCGRKMmgUu3oa+iSqSJWs57nE9NeFW1YwkmIwVqi8S1zvxIkzYgAkRNKABm35vtdxZ
 brv5vfapaL8rOWkruFGnAuouLtxRkScK6KbgBN9TUQJ0Thg2d23gPiGLnyOYMOa+cPmm
 Na24JENR7F11C3Qhsg27xPJ6SDGLwtrBUoVquhuGQAGfQv0I3C8gcIjE7YMZOIBLMikg
 2zO3expzmKZfjrHRYo6gqiHuvilRQpZp1r91iq8KPOIQwfcICJXteBkycMZJySTVZEVn
 o3gw==
X-Gm-Message-State: AOAM533cDDBIWi8tiWI//eHPsVp1OQBjUHayFuVLtRDvJ/ks3X23qwqR
 D+8aR+7XU7sqXAj3CrfHIZml0/QX9VI0cg==
X-Google-Smtp-Source: ABdhPJwHRZOfST2e0tUHjvhpCYDNHwmgyiadgdG8aPalfiE3fSp1+TXFJdn/0l72350oTwkVEVezug==
X-Received: by 2002:a1c:a793:: with SMTP id
 q141mr29545110wme.157.1630274283885; 
 Sun, 29 Aug 2021 14:58:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id v28sm13460157wrv.93.2021.08.29.14.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 14:58:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 23:57:38 +0200
Message-Id: <20210829215738.2160383-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libiio: drop unrecognized
 options
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

MATLAB_BINDINGS and WITH_MATLAB_BINDINGS_API have been dropped since
version 0.21 and
https://github.com/analogdevicesinc/libiio/commit/b968f81375b8e3e03467e2765173434dc6e1922c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libiio/libiio.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index aec251e9a1..b36ea3bafe 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -13,8 +13,6 @@ LIBIIO_LICENSE_FILES = COPYING.txt
 LIBIIO_CONF_OPTS = -DENABLE_IPV6=ON \
 	-DWITH_LOCAL_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_LOCAL_BACKEND),ON,OFF) \
 	-DWITH_NETWORK_BACKEND=$(if $(BR2_PACKAGE_LIBIIO_NETWORK_BACKEND),ON,OFF) \
-	-DWITH_MATLAB_BINDINGS_API=OFF \
-	-DMATLAB_BINDINGS=OFF \
 	-DINSTALL_UDEV_RULE=$(if $(BR2_PACKAGE_HAS_UDEV),ON,OFF) \
 	-DWITH_TESTS=$(if $(BR2_PACKAGE_LIBIIO_TESTS),ON,OFF) \
 	-DWITH_DOC=OFF
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
