Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A470CC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 18:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AEEC41D99;
	Fri,  3 Nov 2023 18:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AEEC41D99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGu9iH2F8n90; Fri,  3 Nov 2023 18:28:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DA641D82;
	Fri,  3 Nov 2023 18:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7DA641D82
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF9001BF57C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A26A6408EB
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 18:27:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A26A6408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otFnPcuuQ2vi for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 18:27:53 +0000 (UTC)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE9DC408E4
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 18:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE9DC408E4
Received: by mail-oi1-x244.google.com with SMTP id
 5614622812f47-3b2e330033fso1392010b6e.3
 for <buildroot@buildroot.org>; Fri, 03 Nov 2023 11:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699036072; x=1699640872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cy7l6/fJaPHfASEMYPmpI35SP5rOVt3gSD3trjU4Bf8=;
 b=CywCgwp0sShk+IKgNKpZds+iDbrHor1d2gra49VCIE6pST8p9Sn2ccZ5joqmlZWuI/
 UX97ZVj4P/HICwMqkhBCzsbLK+a7WLT0K5jUrvIZqSbt9ncNNW8ayk2SYRShMSNjUn4d
 QRNiH/Jedq2VvXDdM4OBP6iuJTVk6dDU0lEIEQiH6BOgEsx6BRtzgDkJz2c6cYOBYtl9
 xhAW8quFl1uHiPJdds3HGHiQDR4x5oSF8f2Rj/OUPjL/ddJaO6cEC19ve34IVpJdYsRt
 xT5q6uhEvwp0bPhfoh6XDDwV7J35NU2TvJ1egjuKUBCXT3q8Zt/3gQ2ujBxzNocQfbKf
 YOVg==
X-Gm-Message-State: AOJu0YzSYpOyd4ugDfVyUgzi6v/zklALfTW7iAT4whhEZLUtOKapsFU9
 +yjISbc82p5r7HuVUDQzUGbXqDEthBOMWbgw8o8Cklas5b8=
X-Google-Smtp-Source: AGHT+IGw8tbUheHieP0It3EC5XIoNtvPrAv9SFaaEdXuMf0o8V7FFro+gBXe7K8cyqpJa+ftfPEc6w==
X-Received: by 2002:a05:6358:3403:b0:16b:2f05:7fb8 with SMTP id
 h3-20020a056358340300b0016b2f057fb8mr5291329rwd.2.1699036072210; 
 Fri, 03 Nov 2023 11:27:52 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.196])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a636505000000b005b7e3eddb87sm1602164pgb.61.2023.11.03.11.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 11:27:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  3 Nov 2023 12:27:45 -0600
Message-ID: <20231103182745.903344-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
References: <20231103182745.903344-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699036072; x=1699640872;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cy7l6/fJaPHfASEMYPmpI35SP5rOVt3gSD3trjU4Bf8=;
 b=WtPmwaOV/4fXzXrSk992bB0zyRjo1J+vN1/BUMZcs2ifQJpLOEL77tIBK/ZEUHmK8f
 tZ4yGtjvybMxiGmXP2KJBfQ2L8+r3UTJ0tVcQNBrQYUFeFZREQmdAYNZvyvF5Ad4rVTd
 7Wx/dtPsEGZLDTicULUEEUEsi3+PWvzdN4yas=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WtPmwaOV
Subject: [Buildroot] [PATCH 3/3] package/nodejs: taint the build when using
 external modules
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
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

By default, there is no guarantee of reproducibility when a user enables
additional NPM packages. As Yann pointed out the last time this patch series
was submitted, there are several legitimate scenarios where enabling
additional NPM packages is reproducible. However, the
BR2_DISABLE_TAINT_CHECKING option addresses these concerns.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/nodejs/Config.in                | 3 +++
 package/nodejs/nodejs-src/nodejs-src.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index c684f8eb86..80c58b2e94 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -74,6 +74,9 @@ config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL
 	  version), the uglify-js module at 1.3.4, a module from a
 	  filesystem path, and a module from a git repository.
 
+	  Warning:
+	  By default, using this option taints the build!
+
 config BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS
 	string "Additional module dependencies"
 	help
diff --git a/package/nodejs/nodejs-src/nodejs-src.mk b/package/nodejs/nodejs-src/nodejs-src.mk
index 3452c93728..d04e0416e9 100644
--- a/package/nodejs/nodejs-src/nodejs-src.mk
+++ b/package/nodejs/nodejs-src/nodejs-src.mk
@@ -242,6 +242,7 @@ NODEJS_SRC_MODULES_LIST= $(call qstrip,\
 #
 ifneq ($(NODEJS_SRC_MODULES_LIST),)
 NODEJS_SRC_DEPENDENCIES += host-nodejs
+NODEJS_TAINTS = YES
 define NODEJS_SRC_INSTALL_MODULES
 	# If you're having trouble with module installation, adding -d to the
 	# npm install call below and setting npm_config_rollback=false can both
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
