Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA55C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 18:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBBD142023;
	Sat, 11 Dec 2021 18:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69qDQQLhNyfj; Sat, 11 Dec 2021 18:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18DE842012;
	Sat, 11 Dec 2021 18:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6C01BF426
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27F0340353
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 18:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvsXd09DMyrh for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 18:09:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C26F040017
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 18:09:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 137so9099321wma.1
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7cPRTHyhpPFttuE4Y3RJb5cARy9LvxYQymkdpzhNbbY=;
 b=F83q/hI3s5aj2IepgLYxPQO2eb7rruLFZXOc9KvaE6r0Ia4gVP8eCAG1WOuzfvo5ey
 zfBA35bnNN61wFKTtrWezDz9ABmfsL0FlqRaoq47ou1DMCJ1jPr5QX3xbeD1zq0v99xw
 VDUyOEhmJHCtfG71uOU9vnNpW5AkDmtV63VV2HlRoE/6dzK1OVm/U9I45QMj9Uy2UZl8
 33CweDcJk+5v3vwRW1EeZDFlkDXKtNmmLG90UNiSLgnUx2+f5HrImFgexb92XblgqAe3
 8HjWD6zT6Vu9jJEynSP4cKNCC9mY2uCqun+92OSsQGdirbywJrEOpZ5+C8yN06s63rwf
 SuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7cPRTHyhpPFttuE4Y3RJb5cARy9LvxYQymkdpzhNbbY=;
 b=sCdUDqc/NTI1+QlqDHSMNAiNW7H4Qere/+o+LPi9GYWbO/9VoRLpWaQ9qCXARnlbe5
 di29bV9T4/XBYP2pDOlhkemI/sojr4a5x4bt5/XiEF8GgR7+WeSRfAUo6xG8RwFF0dNC
 s/X6w8dnUei3UQFvby/1YxtDuHkEc/nj0MTAgWB83CasO6P6nkUYanMxaPhDB7JUOl+m
 dqCilAOH0BS0NiIXhz1+6M53WTbr8ybT8zlFXynEeCnxHUQ4b9HteTU0XHcHTr/lMAsk
 b0kJ0TNGY9PRjP53Q6QQlxw311I5yyA1KF0tve+SFzJfM5B2VB8bAsZBnYlm0j5IzjQ8
 zYXA==
X-Gm-Message-State: AOAM533OKE1FFChexrVaL0BBqJU3RhVVoIUFPB7qm2eeseqlIfkRPjUB
 nJif+/7d/PgGPsHB2IyafNWoL4RnnwqAhQ==
X-Google-Smtp-Source: ABdhPJz4ucxHBEugKfajD9V32gH9nojWw///ui/TsTkLitcDmSld/4hds5qLqTikVH07d6PXp+/kyA==
X-Received: by 2002:a1c:a9c6:: with SMTP id s189mr25242557wme.38.1639246139822; 
 Sat, 11 Dec 2021 10:08:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id t189sm2014537wma.8.2021.12.11.10.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 10:08:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 19:08:03 +0100
Message-Id: <20211211180803.18456-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index b4f9e09b32..4844606c59 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8a8caac227e0a266015298dda663e81576a0d11d698685101e6aa6c9fdb51c4b  pcsc-lite-1.9.4.tar.bz2
+sha256  9ee3f9b333537562177893559ad4f7b8d5c23ebe828eef53056c02db14049d08  pcsc-lite-1.9.5.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 2536a49e5d..a7db105987 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.4
+PCSC_LITE_VERSION = 1.9.5
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
