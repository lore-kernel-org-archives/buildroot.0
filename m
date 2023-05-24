Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D5FC7EE2D
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 16:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC06424D8;
	Wed, 24 May 2023 16:55:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC06424D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4XF7nyohMcA; Wed, 24 May 2023 16:55:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F4D942493;
	Wed, 24 May 2023 16:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F4D942493
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 201DB1BF307
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 16:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE16E61221
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 16:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE16E61221
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjL4TVHnaSZc for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 16:55:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF93E6120E
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF93E6120E
 for <buildroot@buildroot.org>; Wed, 24 May 2023 16:55:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bcb4a81ceso2534719a12.2
 for <buildroot@buildroot.org>; Wed, 24 May 2023 09:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684947310; x=1687539310;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NOcYT725sU4yjAfbzkh0JEnk67fvFAE0I/ciCht+N7k=;
 b=BvShmFD28OhB6VP5NTkQ1GGOR8Qie7ME87jaGild2vQqNvxKs4m+Xc2OpT81nZ58x5
 pHmcUVuG+82K9vOUWqSjZdqR4Sd6/7Qg0WyzkNK0jb6g1irPnE9l+EFSAIQaoE3GBiwI
 MznGYA+N5IGFfEAmG29iLLXVvq2yqiAA1x0Qxq99a0rmX1hcE/dPJJtmpS6+9NfN7FNy
 qKwkbhngMbS/hJDgu8cM3Dcmf4hbHdSrtBNeZfjYP1PfZ8ur/ZLi7otEPiwIeH88bsFN
 61YAXaspSWOJi/ype1RxL41yY219t4bmnzoaUrkHwj8Htn8XNYyAZ1/1SFiJj+WGlqsk
 gtRg==
X-Gm-Message-State: AC+VfDxfXwJPY3owHPjt4hYIiZEJ0X8fSLuxoEnX55WTgfKTOx0H/Ko9
 VYp/0z0UQn6HOObB3yYy6QuGYxeXwe4YM8q8CVmIgA==
X-Google-Smtp-Source: ACHHUZ6tBBJhw6V9xJSX3+QYp231KbltswlYBwHTNO+ZWdnL5VI66RGHjJSqM1KyrpPirBaaaXScbA==
X-Received: by 2002:aa7:d7c3:0:b0:50d:c3b7:7a18 with SMTP id
 e3-20020aa7d7c3000000b0050dc3b77a18mr2223180eds.17.1684947310558; 
 Wed, 24 May 2023 09:55:10 -0700 (PDT)
Received: from stefan-PC.. (cpe90-146-212-89.liwest.at. [90.146.212.89])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a056402018700b00504ecc4fa96sm93905edv.95.2023.05.24.09.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 09:55:10 -0700 (PDT)
From: Stefan Mayrhofer <stefan@familie-mayrhofer.net>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 18:55:06 +0200
Message-Id: <20230524165506.692213-1-stefan@familie-mayrhofer.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=familie-mayrhofer-net.20221208.gappssmtp.com; s=20221208; t=1684947310;
 x=1687539310; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NOcYT725sU4yjAfbzkh0JEnk67fvFAE0I/ciCht+N7k=;
 b=YVx8gnYN8ntcIKVdk4aB3H9AaFYElEfEj9qukG9H7iGu8QP08wYzgy4ZS4m11bNsdI
 gaaHP5PqLXbbdWuluymY9rElMHBcwrmvY4hDR49UmfnH+xdMxOMhPb9huWi3nnC3R6FN
 Gg18mE1oOAzPB2Gz/43Co4Vfjqs2fLisyzOdOvrg7O0xY5md0QyzcYXZTZO6jk02Tc+a
 4wpmU2xtN/TN4znVN0X2UBqPgbAtAa2ykI13kabM7MGmkth5G3POSWwaCEV7EfzeGw8F
 gIzg/F5zCjdiy5zCfenoYRhsy63evBaXDOGv4dqSUiR1l8hLg9P13s/BTqQOL9v1tjlm
 03jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=familie-mayrhofer-net.20221208.gappssmtp.com
 header.i=@familie-mayrhofer-net.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=YVx8gnYN
Subject: [Buildroot] [PATCH 1/1] package: mono: allow building for aarch64
 targets
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Stefan Mayrhofer <stefan@familie-mayrhofer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add aarch64 to BR2_PACKAGE_MONO_ARCH_SUPPORTS to allow building for aarch64 targets.

I have tested that this compiles successfully and runs on the actual target (imx8mp based board)

Signed-off-by: Stefan Mayrhofer <stefan@familie-mayrhofer.net>
---
 package/mono/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index 76178bcf9b..640c6fb42a 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || \
-		      BR2_powerpc || BR2_x86_64)
+		      BR2_powerpc || BR2_x86_64 || BR2_aarch64)
 	depends on BR2_PACKAGE_HOST_MONO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
