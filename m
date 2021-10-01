Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:30:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73AC261AA3
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 22:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73AC261AA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E08642664;
	Fri,  1 Oct 2021 22:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4cBNzh9ICBe; Fri,  1 Oct 2021 22:30:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96AB742668;
	Fri,  1 Oct 2021 22:30:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2521BF3EF
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A9FF40315
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 22:29:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6Oeq6HsLvuq for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 22:29:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6C414031B
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 22:29:57 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id u7so9124750pfg.13
 for <buildroot@buildroot.org>; Fri, 01 Oct 2021 15:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJqsMF1P5WiPdfGvt9F89PWzpGpIG1kMPE7LQXJ7IzY=;
 b=qSZtEOWOTpYzYSrs7itEBlFiKkx5ZSWz5ZvHBG7TkBYAinAdSPqD3D6AlDjTAry0lU
 s6+bl/A1zDvwcLl/xq/W7lpKoiYYWEXm3J/9RAp0bsoOkrhRBiKO9lGNXT7puEK1/J5y
 NvOZC2Qp2mxbG+p6n2Zltbny60QjvaCxso036Jckq+Z3yv9EKXWCAoqnKJshRVsz3X8H
 6Bvy2nikAKv5veg1eoLADSo89KUkZqgQjXlJbuqtIbC30oZasI23bQJFd73I0o1LnI8B
 nppq+030ovTy7NyeE21yD2SC+kIhygLkVJ0lzLOkFnoMEtAji31NxlCXIDHAZs7ZSjiA
 u60g==
X-Gm-Message-State: AOAM530uqZbOBqbFPywoIgqmvf71pQkqxPsK1Na47CsRqXTtJ3js7hw+
 CqH2WASdKpi9rfK3u3icUFfUv6uZSiAxpw==
X-Google-Smtp-Source: ABdhPJxNbk/w5VyPr8yTdQ64w2/4XZmZ0XBGvOQVkEX4DO0J70MFNZMrY2QfvLuj/HnIhxlOBgqj4Q==
X-Received: by 2002:a65:62d5:: with SMTP id m21mr428621pgv.124.1633127397099; 
 Fri, 01 Oct 2021 15:29:57 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id u6sm7119790pgc.68.2021.10.01.15.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 15:29:56 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  1 Oct 2021 15:29:52 -0700
Message-Id: <20211001222952.670649-2-christian@paral.in>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001222952.670649-1-christian@paral.in>
References: <20211001222952.670649-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/runc: fix typo of toolchain in
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
 package/runc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/Config.in b/package/runc/Config.in
index f181ee334f..66203896a8 100644
--- a/package/runc/Config.in
+++ b/package/runc/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_RUNC
 comment "runc needs a glibc or musl toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
 		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
