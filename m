Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0299DECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 10:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CBDF40531;
	Mon, 24 Oct 2022 10:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CBDF40531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R86iE2IxGMbX; Mon, 24 Oct 2022 10:41:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3C52404F1;
	Mon, 24 Oct 2022 10:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3C52404F1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743C41BF39F
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 10:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CA4881405
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 10:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CA4881405
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgeRA1s3aVbF for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 10:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0205E813FD
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0205E813FD
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 10:41:47 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 186-20020a1c02c3000000b003c6c154d528so9620263wmc.4
 for <buildroot@busybox.net>; Mon, 24 Oct 2022 03:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=se/QbTmta50Cs2lRyPdp/pJZM4moqWMuNWQq+s4NKVU=;
 b=AId8CPqXK/E1kDIIByh3LifRpZrgqH2/P0MSgKG0Iht4a94eDumsZJ8CNcT+FJtRbQ
 5TDnTZu74ZXSre+E5KcNfXs+h1zX1/iyXDbz3AaYUye/cy946gpJz5LGUJOrD7EwUCku
 Wh68NTkeU7lCdd/GsbHkatKnaLAmieslmCHxTJMUCii+NPQ0aRy5cFa4ZlO5R6lSpH1h
 17k0jroJboyCQ4NDaICZdQxrsLVUjel6ns2g9LHaqlqxf0yeRGutQ9PurtkR+HbbB2S+
 p4qKgn6g0/BJy+hMv/T5wJ6zttjumcsCoKLWfPitOR0oktt8cd9Vb0PlrkSURzy1Fuas
 rfTA==
X-Gm-Message-State: ACrzQf1r7czZMYBL98QtDXwne71Q/fQ4zCdZcg/UE0Y1JlvQiy6Z0syn
 OwQIrYcROZAKHFKmsgdpnNkIMd4zD5g=
X-Google-Smtp-Source: AMsMyM7VCbw1iS92aIL+4owsjD6aPxp0+TcHF13mgVRysujQuSCeGWK9AMTM5CxY5Z+TApKTz+Fpfg==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr21681565wmp.141.1666608106169; 
 Mon, 24 Oct 2022 03:41:46 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 m126-20020a1ca384000000b003b476cabf1csm10469198wme.26.2022.10.24.03.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 03:41:45 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 24 Oct 2022 12:41:42 +0200
Message-Id: <20221024104142.1470677-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=se/QbTmta50Cs2lRyPdp/pJZM4moqWMuNWQq+s4NKVU=;
 b=gBGhrSBSeY5ZBCvljEULGvAs/bAvx2AcaZEIANfpySqS6iH+mz0+Caeu3gF0ks8hYz
 3ZJdHoHttipGIZN3Ovl3sfDFW/GfFBoQv1FjIrQWIoukOQm4moUIafsUXo3lofaOwMql
 JDlcBgiuYTn0K46YP3OwfIfWoeUbib/eP1G0Oc6ndA2TYNcbMq4ySxP8WyoWocl1w5oj
 c+PN6JdBw/xK1PE6XMgFLiGBYBMDkjVGx/anpjygxpAt9CV8o82WMsKtFwNfsvEijL+h
 UzK6fpNyyKYpSpdiCKjMXZzty7CjhINGIpICRJLjWOWI+fegnnm5YU5AFjDmVnixLqf2
 qA4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gBGhrSBS
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump Linux and U-Boot versions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/mx6cubox_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index 86f506ef0..cbd937806 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -17,7 +17,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.53"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.71"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
@@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx6cuboxi"
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
