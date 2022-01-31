Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F2EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 08:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C3D381A4E;
	Mon, 31 Jan 2022 08:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cT4M01LQ2NUC; Mon, 31 Jan 2022 08:13:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71AE2819F5;
	Mon, 31 Jan 2022 08:13:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 15C031BF313
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A47D60BA3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qtmj7vGEB2Xv for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 08:12:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E5C7960BA1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:12:21 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id c7so17760862ljr.13
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 00:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HuXewkNczEwFuOV59dsfb227rnOIWP5wz9tK0XG4PAk=;
 b=SYa6pcqTacrTQv5xC5wcjgRykdGUrBpkyaGxX6VoTZLtLXXogHN4r9lGE9ZmzUa0QQ
 qwjt7N9zMbUb2nh+bU8NoQz2iWfIHtrS/dF8BNk6ffn5V+GYUh+ns2EVZVjoiE9X096L
 jUC62qgJBcrZvKl/K/gTekNSCl6qQdeMGBOOHotzLuLvkknPuIptuXO2ytLqTWjQTvYt
 XYRdX1aKdC3KJQt4Lm5I1rB3sMc0puN9V1mel/EYIAVEm1cZ9YK5Ptl2y+HDN6Bil/t2
 ed/0j+fHSpwxSOrdeCKykQ5Dx5ZcXRLjgNNwUuaanWnecZC2oAxfNxzMUsHdbIPCY0yZ
 YQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HuXewkNczEwFuOV59dsfb227rnOIWP5wz9tK0XG4PAk=;
 b=1twX5JcnYUDFGn1df9hOHaP9sODshiVINN6yyQWhY+UuTNa1/CHiGwxb9crOfAYZ9G
 tYTbWdaCx6CVUKL7IG8mhqMdEeiyL2yxgTnBKmfVjfl33kVkD+949C74fcxFSURcdv+A
 dQdtLBRiBoayyrLerniq53/NGKpLmJQ3G9HcAu2UU2zYSTVbK/F9ghnQY6yHD0h4zsUO
 AnOGaRBuxYbi+RsOwDLxn1GJbX36moi5ajhJ6OoI2+N0F15YVPAgg4OVypERHKzsg7h5
 1MJwxIQ0poY3MFOMQjch1I3TnaPpwIT52iLlzGqUAm4aYG6nuwj32w9cBD0ChQcn1KSW
 tRuw==
X-Gm-Message-State: AOAM530V+AdufLZS83Iy4TfQUSuC8acGWawz1rtDziFZMsRK9/k75BrT
 HOKFj3zd9aWsgV/cYrIZ7XItD9UEECg=
X-Google-Smtp-Source: ABdhPJyVGhIwJKxSraxp+jHASEvyC5ylYPsxDKLS+NNx9xhhWBz3qpxUvdoeF9lWzXVqXuIOWZprhQ==
X-Received: by 2002:a05:651c:1543:: with SMTP id
 y3mr6772633ljp.152.1643616739795; 
 Mon, 31 Jan 2022 00:12:19 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id j17sm815095lfu.14.2022.01.31.00.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:12:19 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:12:13 +0300
Message-Id: <20220131081214.12773-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131081214.12773-1-geomatsi@gmail.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] configs/snps_archs38_haps: bump kernel and
 u-boot versions
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Bump versions:
- use U-Boot 2022.01
- use Linux kernel v5.16

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 configs/snps_archs38_haps_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index a95d760df2..02e020bb47 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -7,12 +7,12 @@ BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+# Linux headers same as kernel, a 5.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
