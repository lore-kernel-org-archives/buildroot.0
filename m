Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4EAE7490C
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 19:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0725D41780;
	Mon,  2 Oct 2023 19:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0725D41780
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xbOG2omn0bpp; Mon,  2 Oct 2023 19:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE275417A4;
	Mon,  2 Oct 2023 19:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE275417A4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 52D011BF3DD
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A872417A4
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 19:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A872417A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id afs5D1xOpYip for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 19:17:08 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8EB041780
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 19:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EB041780
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-69101022969so86990b3a.3
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 12:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696274227; x=1696879027;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tcLCrM2bL+LRfyKSkA69Fziwr2vFmdwsVY+jeqT2FcU=;
 b=xLrpmknVtX3M+UJ6UGDpAUigAqOm7WerTO/d5a2dNa3ylu7u3IkY7Me5uuiLTeGz89
 ZBDxROpjNvMlgcfw4frBJFqK/waQnj4TScZIVuWPKY/X6CyPX13Gz9ryaK2oaTJCcuzd
 Xl5fDVHfWZrwDh8rulj6+9adYngWmWdGX0q7Dlzd1e4AdFQyaP2AF19bCaBzwWQVuG5u
 8+0mBHaJf9FNKvUBoJPIJkYN1A7NWq6Lcchsw1xMgZj81x1vp3D8CRC1K71Lr+GRBDLP
 +OCsVX0awuIdLYjwZdQIa2u+7s0ycSMszyI32EJ3lD7RIwSA/JStKFvbfkNUetzrEaH2
 eEGA==
X-Gm-Message-State: AOJu0YzmfMNd2233SKjZAy6demHMhHpfHEicA0HtWYldDV+WJKLm+zbh
 vZnB+1sqSCxwq46hQyyI67ueUGcQr9SGNUg80XNFLApC
X-Google-Smtp-Source: AGHT+IH1gHkrYocSuEareSUUJWY8wiw/dOpsWUt+yyznjqkuB6Xkm8qJUebGuaNoiqZYfUOjySWINQ==
X-Received: by 2002:a05:6a00:15c7:b0:690:fa09:61d3 with SMTP id
 o7-20020a056a0015c700b00690fa0961d3mr16140310pfu.15.1696274226792; 
 Mon, 02 Oct 2023 12:17:06 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 z13-20020aa791cd000000b00694d420e25esm4305187pfa.157.2023.10.02.12.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 12:17:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 12:17:04 -0700
Message-ID: <20231002191704.57123-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1696274227; x=1696879027; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tcLCrM2bL+LRfyKSkA69Fziwr2vFmdwsVY+jeqT2FcU=;
 b=j1zXoigth1ssiV9+q4A6pwv4WWb2u99OiHkIXliAgyJmAwEwiBPsYs3sRrnjsbzPeC
 GJwjik6WF+i3pfXodAIyo6Ns8mTI2TYx9U+RXaWxN3jvKV3VGMI7HaVnlLi9jcsyaekJ
 obCLIqD7yPjauygLQ8fQFGjRsRlvGsQu+lyoaJQlruy3wxIiyahfggz4+ICkI6Q4dqvg
 uUWyCn4aj/tzKR6hviVSVaimvyu4UNNSR8Kyl5ISZ/0GD9wVXcjk6ZNLUCDCwmn/LzBO
 GqIzfHM0Nvq3+kftehbAl9XdNeHHThAtsXKIPOkYPwxnA85Xr/EpANh0bsU4Nnr3EKA3
 D6PQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=j1zXoigt
Subject: [Buildroot] [PATCH v1 1/1] package/amlogic-boot-fip: fix typo in
 Config.in.host
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/amlogic-boot-fip/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/amlogic-boot-fip/Config.in.host b/package/amlogic-boot-fip/Config.in.host
index d72bac568e..bccc6296d1 100644
--- a/package/amlogic-boot-fip/Config.in.host
+++ b/package/amlogic-boot-fip/Config.in.host
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP
 	bool "host amlogic-boot-fip"
 	depends on BR2_HOSTARCH = "x86_64"
 	help
-	  Firmware Image Pacakge (FIP) sources used to sign Amlogic
+	  Firmware Image Package (FIP) sources used to sign Amlogic
 	  u-boot binaries in LibreELEC images
 
 	  https://github.com/LibreELEC/amlogic-boot-fip
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
