Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4D1C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6051660F5B
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6051660F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2450D4060F;
	Fri, 12 Nov 2021 19:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQfovIc014YY; Fri, 12 Nov 2021 19:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BCE2405E5;
	Fri, 12 Nov 2021 19:07:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30CE71BF31F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C852400D0
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x6XibiP1yvuq for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:06:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB0A0400E8
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:06:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d5so17256485wrc.1
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n1qkLASKawt6S4ZKWtJ9/WyMVsFzLu/jVIrl4oRjIMg=;
 b=IsWSLKS5vgpYZt6Exk5ZyAsurwC1bupbiayAIbmFZgUwiLfHz/0ViC6V210TJLjYwg
 BrnErqyHXR993vfj3iKpiYRXJI4wS1yDANYJlWIXkzhhQn9WOgOUEJrT3jjooaKdCk4Q
 MfK8mTCsxQckolK2X9AHuPp1iFBcOaaUigqhVHn3nqvhD0Zl7+wEaap7eR4GDmB9tfQy
 htOcb2BRMSghtAPzxx+f+C4cQSb4P4Ikt2jWedEPElOQqeke6DNEp7TJACp/2ucGdsUu
 NG2X4cSHS2RgyY3ADFfPgf8z9iecasykpedgQhxwE/dk9OfgmX+GF7VDCFTQcu8ExLQP
 ZsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n1qkLASKawt6S4ZKWtJ9/WyMVsFzLu/jVIrl4oRjIMg=;
 b=HpLch5GlD2brvFGeztsER+h0DezCCI6+qMfG6Ctb0cRGDakzO1M6w2P4CtEY+5b3dX
 dKSneEoP1L29zlCP1i3vjAvqThkt+0UhnlBEHPkfSjBZJ4OeSaYJ/PL8geS3x2UORG76
 iojyzfr9zmH8eSvttoHJ4PrIU903GrzOXJ2+Jtrb6VHa5TLyq4tEFQ/jL/Sh+Hw/YbWi
 iVtHK+VOveldniqToR6qufjl33cp6KR4M8r/5glNQh5wnaBvKjNYpxPmH3BzlK/o6z7h
 JPUb7wYTFHWhm5zqgzqlWJTw2PRdu5jqszkf2MHW9euhmGMXe3DjiQrbBvU8nXmvdSpo
 KJZQ==
X-Gm-Message-State: AOAM5324Z28XBjaa+IdM8GNqcegw6WI4ef2eo8qVF5v1XbUNHHC3hmEq
 1R1yTImX5Q2h3UaGJasiEZGmfbrSHVg=
X-Google-Smtp-Source: ABdhPJxLmnRWq7V1GeUvKx0fOUwHWzSJY4cHW1iSM37Iqn5tiiujOWPI0FvauyXzG7K+37i9Mxfntw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr21845201wrn.337.1636744017212; 
 Fri, 12 Nov 2021 11:06:57 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id d15sm9462604wri.50.2021.11.12.11.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:06:56 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 20:06:47 +0100
Message-Id: <20211112190650.84234-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112190650.84234-1-romain.naour@gmail.com>
References: <20211112190650.84234-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/6] package/luajit: rework
 BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit reworks how BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS is
defined to follow the recommended syntax.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Francois Perrad <francois.perrad@gadz.org>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index e4e1249240..f6d01ed09a 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	default y if BR2_i386 || \
-		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
-		BR2_powerpc || BR2_arm || BR2_armeb || BR2_aarch64 || \
-		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
-		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
+	default y if BR2_arm || BR2_armeb || BR2_aarch64
+	default y if BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
+	default y if BR2_powerpc
+	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT \
+		&& !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
 	# -m32 flag is used for 32bit builds and host-luajit has
 	# limited architecture support
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
