Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B360FC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9FA60C14;
	Tue,  9 Aug 2022 08:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B9FA60C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1754k1pPag0; Tue,  9 Aug 2022 08:00:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC4660D96;
	Tue,  9 Aug 2022 08:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC4660D96
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6C41BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25396408B7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25396408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VcRWULuP2ryb for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D18744085F
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D18744085F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:38 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dc19so20741222ejb.12
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8Yi1CadY88hvzJtr1FeSUIWQygzvUeolcqF8vkzNmu4=;
 b=eliHKO/EdgRrjNexzgNi4MxtqyrGiKoDR9dPCf2bGbp58nDJ+V3JRPohDcsgv1Bvtt
 plDIFh8gaQABrMI36Fm2K2+n4geeA2Gh6ZdPG/VAjssfDAZHechgZNQIL6KiZA2ffNnD
 xdW3TDCYdqZ9R/zGA6UCC/K5gHZYLvn3q9oofrVMTMAK5AT7ppjj+jBDx0+fslJVdsGk
 RSokxh4u+5d7fy9Zq8Hv3VseEztzUlwevm8MyaXX8U7kevZs/gA1Nr/7zeStITgjjNdQ
 yLuxJ30e+3X/aMCYda/UfksZ0c1vOY0Ziz1XNm9moSLAny8FrmOfX/nx2f4Pf0oMGArp
 1yBg==
X-Gm-Message-State: ACgBeo3n4TDyFyRpJ7tk5x5pBnh+XeYtD0eWJRlcthQLXvsUJmrYjEkG
 xj1RTk3yLgo1vlDqRC2Qcgf5DTyMs9M=
X-Google-Smtp-Source: AA6agR66LWDzFT+eoQIt4h4LvK9mTnkT3Azl5sQkzm5TxMz9VTFYlwVe/mme0QpRO981cbaXg+v6yA==
X-Received: by 2002:a17:907:1611:b0:731:87dd:5eda with SMTP id
 hb17-20020a170907161100b0073187dd5edamr2339103ejc.148.1660031856710; 
 Tue, 09 Aug 2022 00:57:36 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:36 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:57:04 +0300
Message-Id: <20220809075704.86472-14-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8Yi1CadY88hvzJtr1FeSUIWQygzvUeolcqF8vkzNmu4=;
 b=lwYLmotTlfj9Ryht4q3HWPgwh+9ZF/T/TprZxRiJbi/nkDUi4irgyey/0uMjpoTtd0
 1WZuq5tjP+tFxap9a4STESFDTdKlRYkQMVmiUfGHRx6g4Srlle7yEfJQEV+O/WgTLuMh
 44QTXoHyOjkM8WXJB3mK2p2yKs+o9oVf0UHtLgQnyOXw7y6SsM+cWAwFQXV2etNUnHTy
 eNB2Uiinzu3ksZcq6GP2AaJl3O7y3FhMQchPLfPwSvY1tudOQ3e6UfJBLMvSxHpJqJJo
 ERZPGSUFokfucefaAfOi9/0Eyg6kYfGri2PLZBil6hSWEVPQRfOLcRBdVCncENEkFVgl
 tWsA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lwYLmotT
Subject: [Buildroot] [PATCH 13/13] package/nodejs: build host-nodejs only if
 we're installing modules with NPM
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At this point in time, we only need the host-nodejs build if we want to npm
tool to install node_modules on the target.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/Config.in | 2 +-
 package/nodejs/nodejs.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 0b6ded6562..551cecc0b8 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_NODEJS
 	depends on !BR2_STATIC_LIBS
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS if !BR2_ARCH_IS_64
-	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_NODEJS if BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL != ""
 	select BR2_PACKAGE_HOST_C_ARES
 	select BR2_PACKAGE_HOST_LIBUV
 	select BR2_PACKAGE_HOST_NGHTTP2
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 6988df3d84..43ca636312 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -8,7 +8,6 @@ NODEJS_VERSION = 16.16.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = \
-	host-nodejs \
 	host-c-ares \
 	host-libuv \
 	host-nghttp2 \
@@ -224,6 +223,7 @@ NPM = $(TARGET_CONFIGURE_OPTS) \
 # We can only call NPM if there's something to install.
 #
 ifneq ($(NODEJS_MODULES_LIST),)
+NODEJS_DEPENDENCIES += host-nodejs
 define NODEJS_INSTALL_MODULES
 	# If you're having trouble with module installation, adding -d to the
 	# npm install call below and setting npm_config_rollback=false can both
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
