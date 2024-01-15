Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A5CC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 10:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74D381329;
	Mon, 15 Jan 2024 10:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74D381329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCh13uny366H; Mon, 15 Jan 2024 10:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1F28131E;
	Mon, 15 Jan 2024 10:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F1F28131E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0427C1BF4E5
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 10:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC92A40544
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 10:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC92A40544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVDvIqJ5fpHX for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 10:58:39 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB20B40542
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 10:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB20B40542
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6d9b760610bso985414b3a.1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 02:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705316318; x=1705921118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpHFMdrBCp9M6XaQ9gS2V8NmwyjPSYLIi2pdqKqytEU=;
 b=DeOST/V3g5akcRh9+B+qUY/TVkdpTKkLLX7MjwDKrrfhqIMcQnHeHUFSRyCySGdPAF
 LFbltKjrI7lBvMDmizQarLs0zgJ9m5cBDN0XbPcuqyoJOpm4JXFy44VbVB9uZ6Zu98Gv
 3GO5u96Ha4icLanAknjSKg8qNHHc5zuknnwUjhZOgWl0LJEJiel1yRCJpT4IAnXH7FkL
 gPtAOHVLxpnh0lEBjjSKYG0GI7UxGy3FJrumlpZz5Q9du0txm+//OaOAKkMIlHdUmgm8
 QHVA7ahtHY+03i2y0VgTA0IdWnjBiMVY3HWu9ws1Dw817IQZ3EhSeCCKS2TqYlDWP9Gx
 7Znw==
X-Gm-Message-State: AOJu0Yx9g2JtqHltJ0I3hSLge7mLkk0LRJKKYUSzqhmWyBfeHLiGcw3F
 6IZ7hYoR8EByuTFTTNDJg/g66OvMHv8=
X-Google-Smtp-Source: AGHT+IFALVH8jDptyDI10jbl5O/+FpAcPo9Y8JCDnVry4rPRsWfZKj8DxKo8RMBW2PGVtwOzve3E7Q==
X-Received: by 2002:a05:6a00:990:b0:6d9:edd1:4ede with SMTP id
 u16-20020a056a00099000b006d9edd14edemr12608676pfg.2.1705316317805; 
 Mon, 15 Jan 2024 02:58:37 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2104:76ba:2f92:11c3])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056a000b0d00b006db07575334sm7364945pfu.59.2024.01.15.02.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 02:58:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 07:58:27 -0300
Message-Id: <20240115105827.3179346-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705316318; x=1705921118; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lpHFMdrBCp9M6XaQ9gS2V8NmwyjPSYLIi2pdqKqytEU=;
 b=Nq3j3+3VwlLUV/6bqq2STglk64rmlI/eY/bXUP/lVgyxizXERI5A767d0wRr+61DUq
 bNG2fLusmjjKmI7IZtKSHVSba/r+Cqvf7+VYj4sHMk+Sq+CTP/moPxutpDhGhkhsvCeJ
 0FfaYOYkadmtzt5LA4awppO/U2lh+q7fvCVrxR4L55iyJxf6jbl/m/PYgxUKppP9PxLH
 O+IX6gJT3nLFXKdIHAvkHR834p4ODbtCucW0QdT1gF/5YmFjbVbN6xdOMWDV83YWhUKG
 zzF6ShupNyNZpbA+ynBF6IyJQfrDH9z/h414PS/oVvIe7/G4xj3wy5U7Cjg0yy0HH3ne
 o+AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nq3j3+3V
Subject: [Buildroot] [PATCH] configs/imx8mpevk: select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
error:

include/image.h:1394:12: fatal error: openssl/evp.h: No such file or directory
 1394 | #  include <openssl/evp.h>
 

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/5858180070
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/freescale_imx8mpevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 82ed68c5a9f1..2aed04848265 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -29,6 +29,7 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
 BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
