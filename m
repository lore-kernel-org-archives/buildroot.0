Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680FEC636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 21:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC4C81399;
	Sun,  5 Feb 2023 21:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC4C81399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rcb6c27acIip; Sun,  5 Feb 2023 21:41:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A4FF8138C;
	Sun,  5 Feb 2023 21:41:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A4FF8138C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 246301BF407
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 21:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1D3D8138C
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 21:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D3D8138C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IpvRegzEsqEU for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 21:41:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AEFA8138A
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AEFA8138A
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 21:41:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bh13-20020a05600c3d0d00b003dff6cd8b7eso2246390wmb.5
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 13:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZRkEQCU/ewBgf9NHRrz55g/N5Y6QX31AubvQzBMGPbQ=;
 b=EbplAXqR5jalJEVErr5tLwYOcRMYXaM1XOo4snuQk+1e62oYgqLQmAAKlg6SSuuoMk
 DdK2tdTyZOHnJGAmv56832i6rjJwwgoD1Mf0V/tcz8fL/DKTwD5jJAFc+w6rajEgoUro
 sOs6uKTwTTVKJxdX/kl/9EYEXuoJlR3+wom5VHayieYXqernyf4VVGcVGG3pB/XR9AAU
 V9+2YKL3JbEpjmlVj225lbPZBFGkFbB873qrdX1KJsd+kvZmGk7eXA2WTLGHUQaF30V3
 4rO42ufNqwhyxSxlsYpVZGAw2MDEDUM0rjg4W3Y2dktgP2hfejzCVujZfcUKIIhKMPN1
 3Ezg==
X-Gm-Message-State: AO0yUKUFPAFDUyOVYlth94m6Ag/6dYCiSc7WNdHniSUKBmsv5RpxH/H/
 MNA3NhB6TrrkYx9MrzBtbrDvHhdHkFOxbkKOkGP7ww==
X-Google-Smtp-Source: AK7set8zDKHR7KwmJpWvPpasBW04intk0B6FVLAs8gsh8kOnZh0E4q+FjmHGGEpJbHnEsSbJxVP5RQ==
X-Received: by 2002:a05:600c:3c9b:b0:3dc:46e8:982 with SMTP id
 bg27-20020a05600c3c9b00b003dc46e80982mr16477279wmb.19.1675633307558; 
 Sun, 05 Feb 2023 13:41:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:648d:7200:935:86ef:373f:18f])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003dd1bd66e0dsm9994934wmo.3.2023.02.05.13.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 13:41:47 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 22:41:31 +0100
Message-Id: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRkEQCU/ewBgf9NHRrz55g/N5Y6QX31AubvQzBMGPbQ=;
 b=ot2leMgezq2mMWbU0lchX56xSqDTYAo9+aqS1E98EZ/PVE8OzDkqAwUdNEiAvpn4ud
 hY/kUWakKRuUKORSB1sw7U0fN1LY5lOX56Im7gevLqc0EPvyM00KyVWrO+v/iru6dxGY
 DX80OA6/qMkAYnvVHOgtfpbYAeBeoHtJSCfXQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ot2leMge
Subject: [Buildroot] [PATCH 1/2] configs/beaglebone: bump Linux version to
 5.10.145-ti-r54
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous version failed to boot from sd card with a log reported by
the document [1]. In my case it always failed, a 100% failure against
75% reported by the document.

Instead of adding the patch to fix the problem, I preferred to update
the kernel version as suggested by the document itself.

Tested on beaglebone black.

[1] https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-from-sd-card/33297
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/beaglebone_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 639b491e9746..dff7dea422ee 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,5.10.145-ti-r54)/linux-5.10.145-ti-r54.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
