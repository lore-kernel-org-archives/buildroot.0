Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B947CC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BBA384AE9;
	Sat, 23 Jul 2022 13:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BBA384AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cNEyHOH8Viip; Sat, 23 Jul 2022 13:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69944848D5;
	Sat, 23 Jul 2022 13:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69944848D5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B26751BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8CAFA60FE9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:42:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAFA60FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hk4X2WSdhsdJ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:42:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10E060FE7
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C10E060FE7
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:42:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 i205-20020a1c3bd6000000b003a2fa488efdso937856wma.4
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cLzc3vPKJQ9oBuI9IzEa/lOb+PnobDPczUs9X/6y2cw=;
 b=hSRoilpDrX/+HhY8JDUmnDEo0gR47yKuXMo9vHueFyPe9hWaG2xvXe1KteIhplGni4
 dtx6Jg8yGgg6czq8cFumsYESVQlxa37hbSilmGkKy45yrtfrXMhDGtRVQBSYk9/viIKr
 iDlrKDbNiC07uXYe5k9G9L0qmzHCYdUQ0c+BW0XcYADqXvfUNI92ZgPYxNSeMFcrCahc
 bUGUMIDWxAHXks2hexHFf3Eg91g6EQ2uRwfqAWXaEZBSRg46e5UJAY2Y+OVjgaz4YndB
 LJWI/Ccvh+xqyxN2iSS3V7VP6JtA0SEiJxD0JwCIX8S0N1b45xmxtQkMO7dZccdAPy4x
 6lKw==
X-Gm-Message-State: AJIora9nDlsoTUoCSRFPOPY0f45f3PaWjSPdxbOFkq8MIA9e/I/URxto
 6jbUcii/s5HVEsey9Cz/mYWU8PORAAyfog==
X-Google-Smtp-Source: AGRyM1sSyXmI6Fh2z/fiYBkrzL5rbwkhnymWZIaS82QAH2JEr9P0h93NoKAoe5cm9Hn5opCQITFQ2g==
X-Received: by 2002:a05:600c:1d13:b0:3a3:3a8b:e21e with SMTP id
 l19-20020a05600c1d1300b003a33a8be21emr3038884wms.202.1658583770612; 
 Sat, 23 Jul 2022 06:42:50 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a5d5543000000b0021e4bc9edbfsm7016852wrw.112.2022.07.23.06.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 06:42:50 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 15:42:49 +0200
Message-Id: <20220723134249.268212-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cLzc3vPKJQ9oBuI9IzEa/lOb+PnobDPczUs9X/6y2cw=;
 b=KajtyKNpI5I7tTXr6MIrUTe8AtVTZnEfcSK7W5F0dRj68Dkx0E/ICgXeO/l9dfZR0K
 4XOEXqwF/J+n1cLtSItLUEmfmlyUMpr4KR8xJJrFZZ6cX93bZG5YWD5HWf0gsyJ9jLHE
 dsQJ1CNPhZh/u3vdQl4G4dxS276gSnsy2+b/Wl5MCbaHufKF9dnKs2Pr+tEeuS6h7tNU
 O3W9Ev3Qb5oxGji2ymjGkJ520uUkgrKlfHTp29Lr0adR15SsMbWTEDW0dnSVFO40BvfS
 CAJCJceO2JbkQ/LB+xDg4zenh6hIcEJL/pcB00EqU4IDyMitP+pFoHrCFcPv/vEt4Y4I
 7dUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KajtyKNp
Subject: [Buildroot] [PATCH] package/zfs: fix pam support
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The --enable option was added to CONF_ENV instead of CONF_OPTS. For this
defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
BR2_PACKAGE_ZFS=y
BR2_PACKAGE_LINUX_PAM=y

this yields

/bin/sh: line 1: --enable-pam=yes: command not found

While we're at it, also remove the =yes which we usually don't add.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zfs/zfs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 07ce3295ec..0a6e4a3cfa 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -52,7 +52,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 ZFS_DEPENDENCIES += linux-pam
-ZFS_CONF_ENV += --enable-pam=yes
+ZFS_CONF_OPTS += --enable-pam
 else
 ZFS_CONF_OPTS += --disable-pam
 endif
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
