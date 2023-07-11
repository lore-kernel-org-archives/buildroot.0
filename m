Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EC7EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 09:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76EA440463;
	Tue, 11 Jul 2023 09:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76EA440463
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXlnZfyhauhK; Tue, 11 Jul 2023 09:45:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0C5540204;
	Tue, 11 Jul 2023 09:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0C5540204
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C94E1BF28B
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15A1881F1E
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 09:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15A1881F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnglxyUvysbV for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 09:45:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8623781EC7
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8623781EC7
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 09:45:01 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-76714caf466so504123185a.1
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689068700; x=1691660700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3HaDl8Au2zbdodnP17lbrYazjoABs68tldKhdI/G4ZE=;
 b=ZNRK8Z+vFQyGdJ03bVnXmew79A+Gq10IBV+XMe/YKa7UQ0k5VgkfOnyT1vOhVD/p5b
 yewlAWKMss9Uds6ujbe6vZTOW0xqyNSdj5fvszCa7iiG2bzmnkfdGPSj4bvsGFxH2HKT
 0OteQHb/PXXNDfNSQggtVPdna17q9ssefbSJgyH2uex9ROK2dT7vWTS1xE6GcTD104u0
 jyzSt5op3FT1t8uCrpQDOs82QXdQcgZClhlUN3y+YPbUh4GXAnwIc04df+r0cJjapUSZ
 kMHM10tlJfmbyRku/DASiCEGMrDy3bUWDEE/Zcz6lkyyAUfirXU9byT3gRI08QsapeXB
 7UlQ==
X-Gm-Message-State: ABy/qLb7/fJstlmymdyCVa0A1X7XQTHb1veMSAnLEyotgagD2lDbJOSx
 CUgwNgLuYqu0YxdHCcKxwGSLoyCVTV+UgQ==
X-Google-Smtp-Source: APBJJlF9/UWz2hokKleYy/whG34srzRxU5KaB1fUzfh9gRg/IPvKqTS49F4swt8CcfM22i1bmbN6LQ==
X-Received: by 2002:a05:622a:54a:b0:403:a1a8:85dc with SMTP id
 m10-20020a05622a054a00b00403a1a885dcmr14535849qtx.54.1689068699957; 
 Tue, 11 Jul 2023 02:44:59 -0700 (PDT)
Received: from xeon4.informatik.uni-stuttgart.de
 (cmlf1.informatik.uni-stuttgart.de. [129.69.218.20])
 by smtp.gmail.com with ESMTPSA id
 cf17-20020a05622a401100b003fdec95e9c8sm910166qtb.83.2023.07.11.02.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 02:44:59 -0700 (PDT)
From: Lothar Felten <lothar.felten@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 11:44:48 +0200
Message-Id: <20230711094448.2482427-1-lothar.felten@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689068700; x=1691660700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3HaDl8Au2zbdodnP17lbrYazjoABs68tldKhdI/G4ZE=;
 b=C0HAKW3FGsbc0cBIJXnzjb8/ykSBAKUDy2OBFZ4gMvLr+KxwEDuVjKvA8gaEUODTFa
 4t1L1V2iwEpFF94b39GnQZMnROa3Dtx+9ES97fauMtM9J248PMSG33eL4ZFSuswb7gVT
 tBrasLf6enGhf5gjNyBL3/wNW3qI4UaHEDW2i5RrSU2f3GP5aKRDEKmQ2372OYkarWzv
 NpABw5kdzwWXV8E9+3z2FMMa4JYqTJpTBuqbSuaTjkQj3a2Xa9i5zhUtYpKvLbneF7av
 Vf21XB2QmUf+5so1Umtj2x/EPTgC1M324IGrt3u552GLuS0kPLI0bXk54d7c+IwMbbGb
 44VQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=C0HAKW3F
Subject: [Buildroot] [PATCH 1/1] configs/beaglebone_qt5_defconfig: build
 am335x-bonegreen-wireless
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Build the am335x-bonegreen-wireless.dtb device tree.
  The genimage script which is shared between beaglebone and
  beaglebone_qt5 was updated to support the bonegreen-wireless.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 configs/beaglebone_qt5_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_qt5_defconfig b/configs/beaglebone_qt5_defconfig
index ff03a05a8e..0038acfcfd 100644
--- a/configs/beaglebone_qt5_defconfig
+++ b/configs/beaglebone_qt5_defconfig
@@ -15,7 +15,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.7
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/beaglebone/linux-sgx.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_PACKAGE_FBV=y
 BR2_PACKAGE_QT5=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
