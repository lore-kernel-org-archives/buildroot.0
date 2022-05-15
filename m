Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29F5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 17:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2766981B35;
	Sun, 15 May 2022 17:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vwhxrZ8e2Ee; Sun, 15 May 2022 17:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E9181B0A;
	Sun, 15 May 2022 17:20:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B573B1BF44A
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 17:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE2FA60AC0
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 17:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIbJChsaNhDj for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 17:20:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E1E760760
 for <buildroot@buildroot.org>; Sun, 15 May 2022 17:20:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 v191-20020a1cacc8000000b00397001398c0so846677wme.5
 for <buildroot@buildroot.org>; Sun, 15 May 2022 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qaO23ja55z6fVLOwwl0VdGfEA/SYiHZxOClukEq7CJI=;
 b=G1UteGERo+R1wIcj1+VHpRK3zQvQac0Gxo5w3w2CTy0z5P6mmvJniyFa+LPQuSTqIK
 V3e035BlOTpk9XB+1VUYGkyntDZESORAd8eJ/mVSPPgi1aj4UpyRa3zHXmNND0bnUIgb
 2RpCBd2Nze18TYcEKY0/2uP0xbtoNsTPK9VKOhKtNP6UwmQKvpOIQtHq0UjXqgw34S4n
 8CqKlRO+LKb6zAQDA6ZPvmeHnlJa7v4k3TYJhyCWnyWLUOaz1tgMCwzFQ3LS0EF2iIbW
 5cXwkj616LBzF3bB6c8prr1QKSLe2eBYJLBgzHIyp0D5Ms6cMdtjMOoeeokKkpfCMA76
 1FMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qaO23ja55z6fVLOwwl0VdGfEA/SYiHZxOClukEq7CJI=;
 b=FckQH7UoKp83TCjrjw8p60S0+ZLtLleYmLd0ZSNKt00+5qlNJ3CpoKCgZG142/d4nL
 wEoj5KBKNgaVd4O9ZqSQt9LOyuriCNWJEyXK03yy32vmT2F4poni67TKEVXZyZS6WZPr
 D0dopUf205mnczN6hsu6xo6bMeCrnrRH4izw8AnYjgcZ1ThHvKG171AnVKO4wEazRZUE
 sIF9cIO1ZnttWZYB2hj5TlKKPuL0XPJ3qZBYatI46D1cU0Pmc46r6STOFa43O5tkNweH
 p7FjY4ikx5EQrjT8oRpsGldrn8ezuMemhszGoH+0pcbHG/tOvbg4kCv/CQpq2Z3dtnsF
 CM7w==
X-Gm-Message-State: AOAM533bdCOSc9Cfm2BzhudRqJNBIUVIo1HUgUooFBuFIXWlT9KgzxxS
 qrN6PU23rKyJfwiJKU6sF9aiP7Wj1EY=
X-Google-Smtp-Source: ABdhPJw/zymrseyIEhxGH3OCQglxO/0dDftok9alcTh6C2JTOnMMIOG6AJdnrp2DOfSWv64fV+5ZRw==
X-Received: by 2002:a05:600c:4e06:b0:394:56be:19c with SMTP id
 b6-20020a05600c4e0600b0039456be019cmr23561065wmq.168.1652635198766; 
 Sun, 15 May 2022 10:19:58 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b003945cdd0d55sm8826984wmq.26.2022.05.15.10.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 10:19:58 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 19:19:54 +0200
Message-Id: <20220515171954.177732-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] arch/Config.in.x86: fix bonnell typo
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] added several x86 cpu variant and introduced a typo
(bonnel) on bonnell cpu.

Rename BR2_x86_bonnel to BR2_x86_bonnell without legacy
handling since it never worked.

Fixes:
http://autobuild.buildroot.net/results/2418106d30e07cf09834941e610c75dde78816d2/

[1] 653fa001f30414165cb54dde577688d78cca6b42

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.x86 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 2560da922b..c770ae3ffe 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -286,9 +286,9 @@ config BR2_x86_atom
 	select BR2_X86_CPU_HAS_SSSE3
 	help
 	  This option is deprecated. Since gcc 4.9, the gcc option
-	  "bonnel" is preferred. Use BR2_x86_bonnel instead.
-config BR2_x86_bonnel
-	bool "bonnel"
+	  "bonnell" is preferred. Use BR2_x86_bonnell instead.
+config BR2_x86_bonnell
+	bool "bonnell"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
@@ -598,7 +598,7 @@ config BR2_GCC_TARGET_ARCH
 	default "broadwell"	if BR2_x86_broadwell
 	default "skylake"	if BR2_x86_skylake
 	default "atom"		if BR2_x86_atom
-	default "bonnel"	if BR2_x86_bonnel
+	default "bonnell"	if BR2_x86_bonnell
 	default "westmere"	if BR2_x86_westmere
 	default "silvermont"	if BR2_x86_silvermont
 	default "goldmont"	if BR2_x86_goldmont
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
