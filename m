Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB648C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:30:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8657661AA3
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8657661AA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A92840436;
	Fri,  1 Oct 2021 22:30:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aARlyumPPj1l; Fri,  1 Oct 2021 22:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89D804031B;
	Fri,  1 Oct 2021 22:29:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5186C1BF3EF
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 317BD6071D
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id seTwSPO1JiGJ for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 22:29:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A6AAE60711
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 22:29:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id g2so9157586pfc.6
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 15:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QzxCrpWZVHe+QH4LGkPn7QaegckQZntArh5GXi1kbaU=;
 b=5582IMvtxnWMOOMlexkBOsZPYM4drQPs+RWDBWIE1tlm0vGh8Jh80qYNxnopAq1of+
 tQLq1Y/UF6dlsOfdHZ3ve1H97dgVsW0B0P4QXQInIFq90onbgM0RM5ojxZITQ1crODeV
 sEQMYVghcYuVgQztBfoebhl3fZd2Bq3UfjEx6q9KOEH3+2xTCYHozedPc9KI4ylK+GfB
 FnJ/Nvy0SWrEPNGNEtDK2tE8EQWth+AtiFyrx1R0cAyyzr1I9ZuZXNg4ReHW6XZ68XM8
 5+dHWMuXzTnJDEDfl0pxUj/kT0y5BhpBb9SCwf4LANctdYG3loFNYDnzMKUUs8UDF8/N
 +1TA==
X-Gm-Message-State: AOAM530fgYNF2ysDriTxZyTtrmCFXpORkd0L2YfTua9q5k9pABtQXLW5
 tMoeUDbsEfsUNEwvXYDhdNY5H5fYFinQSw==
X-Google-Smtp-Source: ABdhPJzU+etWFcNXuuv4kDwodqxR7TT4ghona1Wz1yiKOnCxTIgbhjohHWZ7KiGOAi5n/9+afREpMQ==
X-Received: by 2002:a65:4008:: with SMTP id f8mr402522pgp.310.1633127395852;
 Fri, 01 Oct 2021 15:29:55 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id u6sm7119790pgc.68.2021.10.01.15.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 15:29:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 15:29:51 -0700
Message-Id: <20211001222952.670649-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/lxc: fix typo of toolchain in
 config.in
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_TOOLCHAN_USES_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/lxc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/Config.in b/package/lxc/Config.in
index 72b675113d..a3f9be0c90 100644
--- a/package/lxc/Config.in
+++ b/package/lxc/Config.in
@@ -21,4 +21,4 @@ comment "lxc needs a glibc or musl toolchain w/ threads, headers >= 3.0, dynamic
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
 		|| BR2_STATIC_LIBS \
-		|| BR2_TOOLCHAN_USES_UCLIBC
+		|| BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
