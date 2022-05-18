Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDD0C433F5
	for <buildroot@archiver.kernel.org>; Wed, 18 May 2022 03:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 394644162D;
	Wed, 18 May 2022 03:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocQEXFxsedbA; Wed, 18 May 2022 03:42:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E21B8415BF;
	Wed, 18 May 2022 03:42:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 058921BF27A
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 03:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00E9340500
 for <buildroot@lists.busybox.net>; Wed, 18 May 2022 03:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xt6hEAeSqz_u for <buildroot@lists.busybox.net>;
 Wed, 18 May 2022 03:42:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A5B5404F3
 for <buildroot@buildroot.org>; Wed, 18 May 2022 03:42:36 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 pq9-20020a17090b3d8900b001df622bf81dso787805pjb.3
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DOQ6MGGGngOGAQRO0vaz5pLwIyTxAzS9mDZRlvNgTW0=;
 b=kEQ/99c2KNq0XWlM/7j9QvEQnhREWDjDvSYqVFeYy5hT7f+wV+MJ1JZlprp2QsJwey
 1S6FEPMu7nmLCTNkH/xM+kAnYvaj/qOzh4OOiX/REUr7EahbbYOCr050UQm/g85/ERNT
 kEzytOKN3yr5Us60QN0hZ9ggGwd040fZKxpwrCvjWQXy/M7slsA/554liz0wtsTOMagE
 A34W62qOLbUbvyfJlr3VPnAsogGTiKfgoNjmtEx7JUH9QmMw/NULxXzEFMvHdqyQ1fsS
 UKo/ARXLazlUGU29COI/aS5mSfR8Bj//big3A2d+gonrqTgTZrgcTGvp5L+Jy1BOvSiI
 qKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=DOQ6MGGGngOGAQRO0vaz5pLwIyTxAzS9mDZRlvNgTW0=;
 b=L6QfIgnKl/CunEbzij8X4WbnMr1gabtPMJS1tDcVDl4fNYcJCQ0fRoOrbjJQXgWVom
 4lpXS/7ybn0fm9oCMBZMxuv/EDupq4adjHTcBxVH0m/Kn19heKLVyhHusLFffR/NO5I2
 hNOslUTeK3mqJb7oa0qfHt1H97fFZcrgPMAJLpVE6AAO8JkqaEGHvAAREB734S257uoo
 MtgKQdvI9n86jbi6tXS2BjavuCx4i5XyfWM7Sc+oHb7Xc7EhPnXC+vckQ5qr/eCTWwNJ
 kfMRaIMfiIb+CIEIxIC+ia6QVgZCXB6VH5G36cYzSGMWImMekiG/3hbWCHFTMMC7bC/6
 nS7Q==
X-Gm-Message-State: AOAM532smr/Oo6XoKzMDGM47pHeeo9H9eTEl8mhfwNsixl5LksugAR/t
 KlA0wymOASh+RUq2ylO3fHg4wK/thfA=
X-Google-Smtp-Source: ABdhPJxyrJL7r09T/c/lEjQss7Megg1BeAldglib3HZBmYilVpzO0D/8rf5N9tZWaty0DJn1ToHBpA==
X-Received: by 2002:a17:90b:17c5:b0:1dc:e0a6:340b with SMTP id
 me5-20020a17090b17c500b001dce0a6340bmr28535539pjb.34.1652845354964; 
 Tue, 17 May 2022 20:42:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b0015e8d4eb2casm359018plb.276.2022.05.17.20.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 20:42:34 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Wed, 18 May 2022 13:12:25 +0930
Message-Id: <20220518034225.373194-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] toolchain/glibc: Restrict ppc64le support to
 power8
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
Cc: mpe@ellerman.id.au
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Glibc restricts ppc64le support to Power8 (or later):

 https://sourceware.org/git/?p=glibc.git;a=commit;h=a27d2c19355a15569dfcdd5da741b57acf1a106a

The autobuilder has been attempting combiations of BR2_powerpc64le,
BR2_TOOLCHAIN_USES_GLIBC and

BR2_powerpc_970:

 http://autobuild.buildroot.net/results/89eae4c6e28658444ca5bc67caa2644358de97b7

BR2_powerpc_power6:

 http://autobuild.buildroot.net/results/bee990c9c34d391cfc4a351a30abc1a0a53a2415

BR2_powerpc_620:

 http://autobuild.buildroot.net/results/a0557172757d3bba2b5fc6244c7b9b17ef6be0db

When Power9, Power10, etc support is added to buildroot we may require a
BR2_PPC64LE_AT_LEAST_POWER8 or similar.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
I don't think we can boot a ppc64le kernel on these machines either,
which means we could instead set depends on !BR2_powerpc64le in
arch/Config.in.powerpc for pre-power8.

(A power7 can boot a ppc64le kernel, but outside of the lab it wasn't
really a thing).

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68b5..559c2546225f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -46,7 +46,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_arm         || BR2_armeb      || BR2_aarch64 || \
 		   BR2_aarch64_be  || BR2_i386       || BR2_mips    || \
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
-		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
+		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc_power8 || \
 		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
 		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
 		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
