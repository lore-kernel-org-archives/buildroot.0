Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D45C433F5
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 18:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00329840F7;
	Fri, 15 Apr 2022 18:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TD2MSZuGy5K; Fri, 15 Apr 2022 18:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1811A84153;
	Fri, 15 Apr 2022 18:51:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C5E81BF20D
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 18:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17FAF40577
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 18:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r-mWgkoM4l3x for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 18:51:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F9B24014D
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 18:51:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5490654wmz.4
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OikH34mSfhZB/7OZm698oEugaNaeNMLn4+a5BNtyNY=;
 b=H6bv/1Wp68iNUo9IPNPVXvrSRbR5MHYz7vPxLtN2piKy7t8dAcDaaTGmpe+2WE771o
 CH4d/vYBHKpkfLRTtT7soDGH02uzU9svVpQh6MWoS6G6hBxQa6CCQuhmkjojcH1xwqVo
 +4dgipmhDyWjWJECqqH8E0IbMJM1FkdVmQSIaeGxto9Y8qWPLZr17B49j4FSnhVWrrHc
 SGsrU8q0WDym2IbmMnwpNZlmopEtwQ9qRFiF8EAW9atvxRcGiiyvrAd5Dfi8DoVVgt05
 hvM8rIDNMl1hGYiIQhM6itC8VuhgQJ+UORBPltzx6kr/wCq+La3kByTWJs1OgoGFzjur
 Y3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OikH34mSfhZB/7OZm698oEugaNaeNMLn4+a5BNtyNY=;
 b=INenVTtIr7a2tFS7WZJnThM7Giwjx+kOGokYjPOj5ijVp9gW3ShN+XxS2faXRQcocP
 WFM/w3pOQCvSVgy4WqbbhT0wojxk4CdG6GtW8tWZ+E0vyzWrz3f0O7ulBQM6UloGJ4v6
 RkNjqP6Ia0dMnLIEzeVZOsdhJtPfxX3eKpxWf9mqZDjF7UOg8amwIdMh7kltEJDTMUA/
 DBfie3baRTmGQX0yURm6aGys2ReoJVMGL2Pq2mTwYlYWyzjuvK1D06j9X1OSEOp2jzSM
 tYkcpseKM5K0kOiSU9Qoi2d3mlKlM2I8zN03XQEzjouDqGy9BMTpQVq8eugQLK0rfM+Q
 mVsg==
X-Gm-Message-State: AOAM530VwvYdHVskePn+nkmGLcJWjQuG7kDGY87R35lMVNRTJYZSJs86
 9a/kn0bR1kTgg+MvdI4BBJaXjlCTvlc=
X-Google-Smtp-Source: ABdhPJzPZ8sBiF05eF+0dkKn0tYWYetAEQCI6zc/NhTZuKimN/e+cPubz8oMQPnTvwk0b3suD8xEow==
X-Received: by 2002:a1c:4e03:0:b0:38e:d730:11eb with SMTP id
 g3-20020a1c4e03000000b0038ed73011ebmr250389wmh.191.1650048709096; 
 Fri, 15 Apr 2022 11:51:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i127-20020a1c3b85000000b00391a363f5adsm2342815wma.36.2022.04.15.11.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 11:51:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 15 Apr 2022 20:49:42 +0200
Message-Id: <20220415184942.575667-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/linux-tools: cpupower needs dynamic
 library
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpupower needs dynamic library since its addition in commit
f1863ede94c29e120d7ce900f7cce211f1e8633a to avoid the following build
failure:

ld (ld-elf2flt): -shared used without passing a shared library ID

Fixes:
 - http://autobuild.buildroot.org/results/16f41b9169bd76352c2f2ed8c6239ad371b3a30e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index f459b41762..791f2c085c 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -7,12 +7,16 @@ config BR2_PACKAGE_LINUX_TOOLS
 
 config BR2_PACKAGE_LINUX_TOOLS_CPUPOWER
 	bool "cpupower"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_PCIUTILS
 	help
 	  cpupower is a collection of tools to examine and tune power
 	  saving related features of your processor.
 
+comment "cpupower needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LINUX_TOOLS_GPIO
 	bool "gpio"
 	select BR2_PACKAGE_LINUX_TOOLS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
