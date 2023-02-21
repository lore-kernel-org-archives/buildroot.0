Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4404C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8282740FD0;
	Tue, 21 Feb 2023 14:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8282740FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vCZacY0xPHWi; Tue, 21 Feb 2023 14:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C135940D0F;
	Tue, 21 Feb 2023 14:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C135940D0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D63C1BF2F0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0590240FD0
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0590240FD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuPJvCzqet1C for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1363940D0F
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1363940D0F
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:45:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 p18-20020a05600c359200b003dc57ea0dfeso3765080wmq.0
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 06:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wmczvWeEyW1UZLUBEvH1HX5RDHJIvlow1m9fyMxYFjE=;
 b=1JKDLjxs2c2O1YusxqQbI10As0f0/rrr8XVfsMyHottpNRHs/2IZaNWcL0WTJArRiA
 gHD7pxXu/FPSg25s5Cb+m1cs8CSt3oLC+QfB3WShRwRwPM1epm9X0oJxPOt36ynMh2zG
 3isSwFSAJMkiwMv/P48cCig0T37SiFv8zWLUKw+550WB8br9ul8pcuK5+RvLRch35joM
 HxDDBi19eqzXAcPsNp00tF24IMN2hxvPNrcbzgzdp4Y6q05jrKnJFxWgtCDBVvjfgSZL
 L2qWky8I5Ia+1HgvHWCe86MS/p5zkiRp8ppjbNq8FDwaN3cYPOkHCNjaejSoG5rEssHX
 oN1g==
X-Gm-Message-State: AO0yUKU0ekVmScKaiGp4pOfe9+tAQUHCFRU0/zKcR7fUYbV2c75aUcwN
 3cSJ3EzfMYQu+Bqg72/zpVRxdvpPOBo=
X-Google-Smtp-Source: AK7set/+f+5ye454rH5TOuVkpycVmbmeiXg9Gygti2nl9+DkfxPq/8IZg/+lG4cibxueE3EkHjahig==
X-Received: by 2002:a05:600c:1616:b0:3e0:1a9:b1d7 with SMTP id
 m22-20020a05600c161600b003e001a9b1d7mr2995724wmn.19.1676990707722; 
 Tue, 21 Feb 2023 06:45:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j7-20020a05600c1c0700b003e204fdb160sm15585897wms.3.2023.02.21.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 06:45:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 15:45:05 +0100
Message-Id: <20230221144505.1515495-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wmczvWeEyW1UZLUBEvH1HX5RDHJIvlow1m9fyMxYFjE=;
 b=q6fOZZOb+8tTOem3KwY7pukfx6ra/KZe0yaRWorDdLKw63xrmiuQGCzzzFrFOKxk33
 +7I7/flUO4BslMzuRwhw6qj8WxtZuNEafY8IHedolkKwL9GmIfYtY1zzMYaT5cMu4tBS
 3lvk6TmX7oljfiKtDyFSWiejcDbYnP8LVMDuzAU7ql7zF91rIMU7bCxr9dI9Z3jAplwv
 pWHjFcj0+07HUtAb/J0tvn+UYBfDwVNRUfaIN7eh/9G7/C/B3pzx2MnULNbVciVW0Ogr
 H9NMRLkkCX4la3Sm+Qeq737O0lMrvloFucJp5KMZc0XWEswXSPjZ3vKsSIZi0j5qH89M
 sl3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=q6fOZZOb
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add ubi handling
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

Add a custom case to make sure that a random configuration with an empty
configuration file for ubi doesn't fail.

ubinize: error!: no sections found the ini-file "/home/buildroot/autobuild/instance-2/output-1/build/ubinize.cfg"

Fixes:
 - http://autobuild.buildroot.org/results/f678c17cc4df06fb2737467e769cd8f72a3ea420

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index dbace1b07f..d192c5b324 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -508,6 +508,12 @@ def fixup_config(sysinfo, configfile):
         configlines.remove('BR2_TARGET_ROOTFS_F2FS_SIZE="100M"\n')
         configlines.append('BR2_TARGET_ROOTFS_F2FS_SIZE="%s"\n' % ROOTFS_SIZE)
 
+    if 'BR2_TARGET_ROOTFS_UBI=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y\n' in configlines and \
+       'BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE=""\n' in configlines:
+        configlines.remove('BR2_TARGET_ROOTFS_UBI_USE_CUSTOM_CONFIG=y\n')
+        configlines.remove('BR2_TARGET_ROOTFS_UBI_CUSTOM_CONFIG_FILE=""\n')
+
     if 'BR2_TARGET_S500_BOOTLOADER=y\n' in configlines and \
        'BR2_TARGET_S500_BOOTLOADER_BOARD=""\n' in configlines:
         return False
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
