Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C84C47258
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 22:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97AA640342;
	Tue, 16 Jan 2024 22:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97AA640342
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hD61eepXiCIK; Tue, 16 Jan 2024 22:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7C5943549;
	Tue, 16 Jan 2024 22:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7C5943549
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B012D1BF3D7
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87CC78385D
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 22:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87CC78385D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m0Q2JUVBNNvI for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 22:03:06 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8107F8384B
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 22:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8107F8384B
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40e86a9fbd9so7185975e9.1
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 14:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705442584; x=1706047384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5SDsDzqtE5hCKshNgvxcTrdI+KF7BqEyx4NJgViFhKk=;
 b=w9fMIhT+gs4R/H5KyMyx+T5Nktz3iY+cp1cUOFFngLF0SaEwVL26aDAdEza4P4KrXQ
 QBis3iCV8qYf3ZT+QpgA1Z0GkDACCFXhmTTyof9ePAZLcF83Rc27qUDXqD7kby6BoF+u
 sdW8pNyU7iPvACAk3kdUQ53j85VhoE8NCwEHww6oKO284DG1kA9m6TxFNIXObZ8+R2V/
 WZ2Wn9/fHWUPxSXRmk75ZZ2JpzoIDggw9XTOqdT0E6xRTSukQR28J6Mw+7M5524Lsgtn
 VxeOcNuYHeo+5u/h5yqk21n+wS5YQ70tP+FrbS1cKJ8G0xlfcwmD1HDJuSdMyUnc3nT8
 zYqA==
X-Gm-Message-State: AOJu0YyiRO+/vmkj0UxxS8ffPu11wmP7SwOjUZrHMdA4ZiV/ITmrQSrN
 ypby8rw13p+P6TNMswZZadtaRSjNjLs=
X-Google-Smtp-Source: AGHT+IEiGFMExnDCActk9ZCcj10AYq32szb+KOwrynHfandTvuNsrB30mDjPjXtVEaR2TiTvin9WPQ==
X-Received: by 2002:a1c:7504:0:b0:40e:4833:f7fc with SMTP id
 o4-20020a1c7504000000b0040e4833f7fcmr4177130wmc.181.1705442583561; 
 Tue, 16 Jan 2024 14:03:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b0040e486bc0dfsm24698369wmp.27.2024.01.16.14.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 14:03:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 23:02:58 +0100
Message-ID: <20240116220258.1003073-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705442584; x=1706047384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5SDsDzqtE5hCKshNgvxcTrdI+KF7BqEyx4NJgViFhKk=;
 b=VrWFsO+VjubnrEzhsUswz0o4iGpudf5R2409X5uLP9JQiG/o0cgDbIcInZIjVPCIK7
 zFQU4kersIRPpp0pRJRuGa343U9eltwaMV2Q/WpKJ0C6ZWdSF+56EDHAe/IPATeuOM5T
 B8ZWBDYDCsUM1QrePnOhynOLoqwY6SLsLVEpTntShdBPAB6dgHn8bEtGwurZcmnNkgAp
 +envlr1kyxgV6o1sZ5r+laj1wXNzMYOLnddSKGQBiEPf6JVeKysi5FAZzVei24n4p6gq
 7D7Ig8mFjbCLYWZ0p/evb3obCpphzoKJJhuwOYSt47ab2llpcYY4TRIzeVwYgij9X6f1
 tU1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VrWFsO+V
Subject: [Buildroot] [PATCH 1/1] package/domoticz: drop fmt dependency
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

fmt is not a dependency since bump to version 2022.1 in commit
adca60540f4fd271dda48b9a121986492700e73a and
https://github.com/domoticz/domoticz/commit/82043c4d5c79003792379be79b931eb85ab890c8
https://github.com/domoticz/domoticz/commit/9e02d9a79c70c36db180d3242cbd03ff9b63e3cc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in   | 1 -
 package/domoticz/domoticz.mk | 2 --
 2 files changed, 3 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 85361eecf0..a0e69a7601 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -16,7 +16,6 @@ config BR2_PACKAGE_DOMOTICZ
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
-	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_JSONCPP
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_MINIZIP_ZLIB
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index d0856b71af..88bad15427 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -12,7 +12,6 @@ DOMOTICZ_CPE_ID_VENDOR = domoticz
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
-	fmt \
 	host-pkgconf \
 	jsoncpp \
 	libcurl \
@@ -36,7 +35,6 @@ DOMOTICZ_CONF_OPTS += \
 # jsoncpp, fmt, minizip, sqlite and mqtt
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
-	-DUSE_BUILTIN_LIBFMT=OFF \
 	-DUSE_BUILTIN_MINIZIP=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
