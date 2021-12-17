Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B96C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 23:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC1B740C18;
	Fri, 17 Dec 2021 23:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vymw54-Un7dB; Fri, 17 Dec 2021 23:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFDEC40C12;
	Fri, 17 Dec 2021 23:32:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B145C1BF86B
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 23:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92D5184C3B
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 23:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVUEjsWC6ToQ for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 23:32:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3773484C25
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 23:32:33 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u13so431229lff.12
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 15:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TZzq/qsOsVzp1PqF5sYejorUNJnt23PpZIoglOxEVfY=;
 b=B5q/YonTPXQyfYW+VUDpqAFcINNF4Vzim0kCoYZo57iF9F+H58BAd2+PkGAUnUAQ5i
 p+FQbWyOYhlagT71Ye4zG1wUOo1gtuiyP2j2vgvSQUnKfD/vjqUMv6NxSfthiE4qeMx2
 +X/QbWyr50KEUrbFG5UB+Ter5+8Zz6AOnFY7fwIGEMwe0sbkUQQGEdrIhKHbmWRqZBbi
 SWLuUZDztFrSU24g0BVjze/mzRnWiDgUkXWjPJEdhVgWO6X+RbY5g+XpVQ2RnCixfLvF
 dtFcDTgOWQqDsKWotROxtK04OyBiZ4xw4dzNqEAYDirNoEgrpy1jmkypIj6rcYVLcjg3
 tIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TZzq/qsOsVzp1PqF5sYejorUNJnt23PpZIoglOxEVfY=;
 b=w52U7PcyxDlviPQ+2lOgTjttJ+NpA95NUQzcXie9a3mXD1EsHqeP9XsaLjXZttPGfF
 eGuWO+XoFoBSHk13feaL16OX2WPwCMsResYRHrNOdwcZfaV3QVjQQuzBUV8sJ875vmE/
 iM+r/Z2DFXbXp1/oDI12tZWyCLfPTKsj0gvFHljZQtBjeVZiLcYlhuDWxopGwcfvU/QV
 h7dTpE7nSI2+PgHJQe452JTpFWm7Q8ZUPQ+7fSQnhs9GFOT86aDUCZ8G3QrTYHdHEG6D
 FoEPEgW0XpvTCXhFQp/fTABwPad32gymN1pzhHBOYfz5rickr2F5XlfEuVHwz0wyHIga
 4H2g==
X-Gm-Message-State: AOAM532e8tIFiErhpXyNZgIgkflIeDGjCsuVhH8R7J3WzY/iGDKLRNwT
 +aAIxL/g9P08IFA3onu4B3Mm9tQQdGz14w==
X-Google-Smtp-Source: ABdhPJxsLDhnQpO8363GKb9vv/7Lp3x9hdbgTCB0Ssf6S7PW3KdZwwQKyZ/decRN0OwwLH/Mbw9D+A==
X-Received: by 2002:a05:6512:5c8:: with SMTP id
 o8mr4019185lfo.659.1639783950927; 
 Fri, 17 Dec 2021 15:32:30 -0800 (PST)
Received: from hellfire.local ([178.155.5.134])
 by smtp.gmail.com with ESMTPSA id y32sm591628lfa.302.2021.12.17.15.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 15:32:30 -0800 (PST)
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 02:32:27 +0300
Message-Id: <20211217233227.16411-1-kuzminov.sergey81@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] board/orangepi/orangepi-zero:using UUID to root
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mmc block device number can vary. Passing a mmc block device to specify the location of the rootfs is not a reliable approach.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
---
 board/orangepi/orangepi-zero/boot.cmd | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
index 44f0885ff4..d094a64fe5 100644
--- a/board/orangepi/orangepi-zero/boot.cmd
+++ b/board/orangepi/orangepi-zero/boot.cmd
@@ -1,6 +1,7 @@
 setenv fdt_high ffffffff
 
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+part uuid mmc 0:2 uuid
+setenv bootargs console=ttyS0,115200 root=PARTUUID=${uuid} rootwait
 
 fatload mmc 0 $kernel_addr_r zImage
 fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
