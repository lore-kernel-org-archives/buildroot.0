Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA9DC64EC7
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 22:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED70E416E9;
	Sat, 25 Feb 2023 22:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED70E416E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ongx139FU9GJ; Sat, 25 Feb 2023 22:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153B9416E5;
	Sat, 25 Feb 2023 22:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153B9416E5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4581F1BF275
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 22:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EFD081D19
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 22:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EFD081D19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xb_cfo82sZ8l for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 22:50:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF51681D2D
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF51681D2D
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 22:50:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1702093wmq.2
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 14:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F/Y+GThqvmHM+6buDuxrrAwg9No7uemAr3L07mP1Oek=;
 b=764cZvXfZWfcXtP1Ol3cjENRO0FGkU+eJ8cMJHyRymnQTrJLP6H0X19J700tOSMIvd
 eFqM8NGSHCALkViquAPnWgyMPwOmtPsIXgCTc2t021vVqnDMr/qsa3VjMDIwT79n/MeQ
 i5t5Xdd+ze89ZGBx3/R3knTTLCjVlAkCLQUKUQk9MRBWNCOOn/NXf6Dp6g8ON52iamDs
 TOczTSTL5Aid/piuaASwvmyelDUG9nggxEpAvlM5pKVVaYx2rNmeFeNyAlale5owQTii
 NR7nHZQZjupLAmcCkuN5mG7qwB5iJAR7g00pxc4Q5Cy4l6cHgeAghejUAAqujKZsiTZm
 IcBQ==
X-Gm-Message-State: AO0yUKUs9nv6O/JpNFantpUVYLhA20GyUSfKHOrByjmp/IYzMdHLdccY
 rsEO9iRoJOJsLwmSoQRzmyQR95Nwb3k=
X-Google-Smtp-Source: AK7set9hOlVoue1Jx1SREzpQ8dwNP7ifoqeTwxd75v3DbI4q7ZeBRrU9bSmrB5nqR3lDdBldAwVzbA==
X-Received: by 2002:a05:600c:16c7:b0:3ea:25b9:c518 with SMTP id
 l7-20020a05600c16c700b003ea25b9c518mr9350939wmn.5.1677365434357; 
 Sat, 25 Feb 2023 14:50:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z23-20020a1c4c17000000b003e2066a6339sm3859989wmf.5.2023.02.25.14.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 14:50:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 23:50:31 +0100
Message-Id: <20230225225031.9260-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F/Y+GThqvmHM+6buDuxrrAwg9No7uemAr3L07mP1Oek=;
 b=bPLFaAVrYT8ybqnq4Na1B7YjSU9ZhabX2Qykhs/7sVYqSEA7Exf/fvYvxyZ5bTU/pz
 K2SGts32YiVIjQqM0rjTD8fAwfjU8hPL9pFRdxahO122RZDhx2L4PnELfV5uifrR5clP
 SFSs2B8ALPiJcpmYB9t3kNGL9Ftt9wqy/d+ZtNFsXr0/w+DC/7jvzYHIn0ZcVHu58TFL
 f74kENo3XABpObQC214oTuthSCRJYT6RbDuv8bgRiIuaz6gtQXy6TsZqL17JhG6/zGDa
 lDkicqybjqKNzHTlrJcoN6xO6pmM7hCZbDKUOjcczaQQLgqXBp2yhLshlfqzM0RskmXv
 r/dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bPLFaAVr
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add
 boot-wrapper-aarch64 handling
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 7689b72e00fd4d8c017880004e83a1c79144ab7b:

configure: error: Could not find DTB file: /home/autobuild/autobuild/instance-9/output-1/build/linux-6.1.9/arch/arm64/boot/dts/.dtb

Fixes:
 - http://autobuild.buildroot.org/results/44287ccc8cc9767704642919e6d928d1f57b436d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a3d98119c7..ca465547d8 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -487,6 +487,10 @@ def fixup_config(sysinfo, configfile):
        'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
         return False
 
+    if 'BR2_TARGET_BOOT_WRAPPER_AARCH64=y\n' in configlines and \
+       'BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS=""\n' in configlines:
+        return False
+
     if 'BR2_TARGET_LPC32XXCDL=y\n' in configlines and \
        'BR2_TARGET_LPC32XXCDL_BOARDNAME=""\n' in configlines:
         return False
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
