Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F146CEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 10:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 840DA4176C;
	Thu,  6 Jul 2023 10:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 840DA4176C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47xM1Pqfg27v; Thu,  6 Jul 2023 10:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65E05417BE;
	Thu,  6 Jul 2023 10:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65E05417BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 512261BF28A
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381A7820CF
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 10:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381A7820CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXevXjtfT0ry for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 10:40:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C523D8206F
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C523D8206F
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 10:40:46 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51bece5d935so841493a12.1
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 03:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688640044; x=1691232044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NoYqTaC6xZu1IneftJEyL8trlnIhVFhqUdthByREatw=;
 b=VgDiR3HiM0dzgOgrsCr4NwXRKgXNaDCD2QGkDRQnm90Mmexaw8lTQ67708fbLz6XYs
 xpyUDuaWCrVLgZ8Paf7YeMTvVwVcETx4NMPc1ylHoNmb14WcHiItjzFzzj0YFC4QpMD1
 N73lhCD384CqyLL8+xCufYpoS4mGq/jrACJI/KcQh5YzDZajGcoBSwV1PirjbVDB0Aue
 gkUhqUqmqYn9aY6oMHEbq1vJ7msENVdVsTzGWBbzqeuh9SZ5xLel43GAtzYic9ZilMFn
 0S7X6jWHcJ4dRtZF1RUdojqiaKrXEx2jUj/sfgZl/V4Ui0W7hG88kyT7RThyBtHCdjYi
 4YmA==
X-Gm-Message-State: ABy/qLasHkU1sYbaNDhhHquhwfHsOyfJXBOBbrQ/MWFFibdK18d8oi1U
 RdHk2TL3/Ql+b5CTduCDM5ZAU6SxUg1CYXL3TL4=
X-Google-Smtp-Source: APBJJlF+352abaHT2zia3phTbYJssGGshR+2Ms1EIIQ5+ovD9KbUG7mBdAi2E8vOd8tiv90rsr9TWw==
X-Received: by 2002:a05:6402:54:b0:51b:fa0a:dc37 with SMTP id
 f20-20020a056402005400b0051bfa0adc37mr1384101edu.10.1688640044562; 
 Thu, 06 Jul 2023 03:40:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 b9-20020aa7d489000000b0051ded17b30bsm608310edr.40.2023.07.06.03.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 03:40:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jul 2023 12:40:35 +0200
Message-Id: <20230706104035.4021893-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688640044; x=1691232044;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NoYqTaC6xZu1IneftJEyL8trlnIhVFhqUdthByREatw=;
 b=YHPOGNDmZkYb7W9ukNPIdNIlmtlarwcTpPKDZb6WvRPlGGTIRN3HalObCe5lqCBPqX
 PgG4gW9al9xSsQDzLgMAjXmQ3byLAdM043aB9M+xWEEh9XPazjgk5aUE66UpxjKRuT7x
 qQB2YAgkSrVgm+IvKCVkyoYqihMOUige3LPBQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YHPOGNDm
Subject: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]_defconfig:
 explicitly set binutils version
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
Cc: Michael Trimarchi <michael@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit fb50eab8a5e6b ("package/binutils: switch to 2.39.x as the
default version") raised the following error during the compilation of the
arm-trusted-firmware-v2.5 package:

  PP      bl31/bl31.ld.S
  AR      output/build/arm-trusted-firmware-v2.5/build/imx8mn/debug/lib/libc.a
  LD      output/build/arm-trusted-firmware-v2.5/build/imx8mn/debug/bl31/bl31.elf
output/host/bin/aarch64-buildroot-linux-gnu-ld: warning: output/build/arm-trusted-firmware-v2.5/build/imx8mn/debug/bl31/bl31.elf has a LOAD segment with RWX permissions
make[2]: *** [Makefile:1143: output/build/arm-trusted-firmware-v2.5/build/imx8mn/debug/bl31/bl31.elf] Error 1
make[1]: *** [package/pkg-generic.mk:293: output/build/arm-trusted-firmware-v2.5/.stamp_built] Error 2
make: *** [Makefile:82: _all] Error 2

I tried to bump arm-trusted-firmware to the version that fixes the issue
against binutils version 2.39, but the subsequent board update was
unsuccessful. Therefore, for now, it is better not to change the version of
binutils to ensure the proper compilation of the image.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/imx8mn_bsh_smm_s2_defconfig     | 1 +
 configs/imx8mn_bsh_smm_s2_pro_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/imx8mn_bsh_smm_s2_defconfig b/configs/imx8mn_bsh_smm_s2_defconfig
index 8b2b74395efc..55d05393e184 100644
--- a/configs/imx8mn_bsh_smm_s2_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2/post-build.sh"
 BR2_LINUX_KERNEL=y
diff --git a/configs/imx8mn_bsh_smm_s2_pro_defconfig b/configs/imx8mn_bsh_smm_s2_pro_defconfig
index e9ff244a3555..b3767b332e84 100644
--- a/configs/imx8mn_bsh_smm_s2_pro_defconfig
+++ b/configs/imx8mn_bsh_smm_s2_pro_defconfig
@@ -1,5 +1,6 @@
 BR2_aarch64=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+BR2_BINUTILS_VERSION_2_38_X=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/bsh/imx8mn-bsh-smm-s2-pro/post-image.sh"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
