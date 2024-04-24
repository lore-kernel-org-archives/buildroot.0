Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FD7C4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 12:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17CA682079;
	Wed, 24 Apr 2024 12:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SvcwQVmB2Udy; Wed, 24 Apr 2024 12:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DD808206D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DD808206D;
	Wed, 24 Apr 2024 12:38:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75C921BF580
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DC0F8206D
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 12:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQVoKfByy-JD for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 12:38:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFD108205E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFD108205E
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFD108205E
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 12:38:17 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2da0b3f7ad2so98623571fa.2
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 05:38:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713962295; x=1714567095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WbVS60EcMtTIURKuf62qkfmNRpkq9dgDKeqew2kK1W8=;
 b=KnehNbce0XD5uXRDtRGbHBzVx1zsZlC5rTwKmdDLPuGqIhIENcpQgnychS6b3/IKWo
 zH+CD0kn3hPerc3VxwJAE9dKJGILL8djmxh0lSMIbw9OsxdG4Pp41h2tJFxVWlZRqqTw
 D7ShPIh4eaX2L5EGkhaOibyASylG57pdBhUEW2rD2lV2wCYcj8/A//ms6TcAd4RqZsvC
 wJv9OGJDELUAXU+cQJhNUzqZJKtvsun5egbx5Z/kkQVjX2sfuy0GnFXcK4c4UCASOz6H
 J8NSy0kvnC5wkE84aDMe5hQ9kj13XCpxJ4WQ1bTRy93EC8WTpAaVDeKkOrP+v9eRcDAp
 lwsg==
X-Gm-Message-State: AOJu0YyvjhgBIrpiJdihF8AZwuGRm3F7dH3Fr5/nK8q+pEMXzLuFZkNm
 Zuf2wwHfvlYnurKQp8hbUWOrTMKUcaDksOObZDExzBlQepFEAgHOXdc4pM5S9ajkXpWaiv/jcbD
 e
X-Google-Smtp-Source: AGHT+IH5JWfEyY/MVc01xp86DzuPLhfAQ4+x4eBycbGjtX5hoG8IsP3LyF04vm3VnkqUJ2VObr8OXA==
X-Received: by 2002:a2e:b784:0:b0:2d8:901f:7f4d with SMTP id
 n4-20020a2eb784000000b002d8901f7f4dmr1406201ljo.29.1713962294662; 
 Wed, 24 Apr 2024 05:38:14 -0700 (PDT)
Received: from P-NTS-Evian.. ([2a04:cec0:1029:8401:c161:55f0:60f6:3bba])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a05600c458e00b00417e5b71188sm23741231wmo.34.2024.04.24.05.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 05:38:14 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Apr 2024 14:38:08 +0200
Message-ID: <20240424123809.406447-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1713962295; x=1714567095;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WbVS60EcMtTIURKuf62qkfmNRpkq9dgDKeqew2kK1W8=;
 b=fSNLhb5nECK3S4EQqvr3bjFJu17YDsyFumoY7rh9O8SdoQEXQj72M1Vq+6hzm0eEvL
 5Q9l1/+W5RgcgOkunT1+wTuVaFRC9S4Qq+J4WHmbnThOmejMe/Pmw9xKm+RJaUAhst5q
 8VpwSd2lTpuKbA3Q1gNdgkgmiI2+Pwdy3tiwxzbZQPbNVlVSyfLVOaoyit9wMafegVe1
 akj4Pbl1lKmvGZ2ZSAS4d/IN0X/FCIn/GbmOIis3Dr+hJ3twhru4AVs6bGqNvjGkTsVY
 nC7VGBPk/bAMkTRplnU2wUvJJDwReJibMXppR0Xrb4M2+np9RVcZBt0dxfWS1PmytgRv
 2AVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=fSNLhb5n
Subject: [Buildroot] [PATCH 1/2] configs/qemu_arm_{versatile,
 vexpress}_defconfig: update devicetree path
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The last kernel version bump broke qemu ARM defconfigs [1] since
all devicetree where moved to to vendor sub-directories in 6.5 [2].

[1] 9982e0b5a6 ("configs/qemu: update defconfigs to Linux 6.6.18")
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=724ba6751532055db75992fc6ae21c3e322e94a7

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119888 (qemu_arm_versatile_defconfig)
https://gitlab.com/buildroot.org/buildroot/-/jobs/6655119890 (qemu_arm_vexpress_defconfig)

Reported-by: Waldemar Brodkorb on IRC
Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/qemu_arm_versatile_defconfig | 2 +-
 configs/qemu_arm_vexpress_defconfig  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 2c73090d5d..a48e437278 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -24,7 +24,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="versatile"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-versatile/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/versatile-pb"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_arm_vexpress_defconfig b/configs/qemu_arm_vexpress_defconfig
index 12ec33ed7a..439c299752 100644
--- a/configs/qemu_arm_vexpress_defconfig
+++ b/configs/qemu_arm_vexpress_defconfig
@@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/vexpress-v2p-ca9"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
