Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1939AC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 11:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C0660B45;
	Tue,  6 Feb 2024 11:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C0660B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QXztYYagFpjD; Tue,  6 Feb 2024 11:21:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B3A60AEB;
	Tue,  6 Feb 2024 11:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B3A60AEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2E691BF3F9
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 11:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC38360AEB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 11:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC38360AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnLhVAT_dxqO for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 11:21:34 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B479F60AE4
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 11:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B479F60AE4
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5cddc5455aeso4749827a12.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 03:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707218493; x=1707823293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4n2ON9fxyb4g+pkxbZPEsNWI/GNmI6XoTyeyd4d1qyc=;
 b=gFzHAe/JLuNoYTzDsrAUiENv4OeXLDMw2Ulw+zIcEJh0GsIhGVmTrmP1SXxjrJzuy9
 bhjAsUIDbNP98yCXXj/PlAJ/5qsN+WD1LkD/j+gAoERJcDWAKQAjm+evHnF/3izLuzp8
 qrhgLywMt5pnOXimpLKoT0FtEKf6zjkIFdxfunmxdNtt0ohFctbhXMIpz3JlWd+g2yX/
 h1Fun8d2oUrcudwvC9JZAH0PIrd+TOosc75sq8eyW4F9uB4KTlMR2euJlPJZEdFkcg8W
 Bqh7KnrG3/PLxCs0SH9d20LIv9uA6vVBbv0hOBoDiS34AC2x8Cxmnc78r1kZe/8G+6so
 Y+tg==
X-Gm-Message-State: AOJu0YxHfdu1XHoEb4JGLeHJFiVsVoOQxl9wFmDGS8RilMd9AfKm7I+6
 R+S2pCfs72YJOQMsxIamm2iSmkSxT0SLRxRDtSCzVMOG5NrvYb16ElTu2032XUdg3DcfilxkP+I
 5hN0=
X-Google-Smtp-Source: AGHT+IE+HUR41chKVMA0grvkjJW1KAFfDUl8bTghzUcPTWOZ2urD3bw8P47koMxFQi3yqykdDLLm1Q==
X-Received: by 2002:a05:6a20:9396:b0:19e:99cf:6ce3 with SMTP id
 x22-20020a056a20939600b0019e99cf6ce3mr1443876pzh.40.1707218492718; 
 Tue, 06 Feb 2024 03:21:32 -0800 (PST)
Received: from desktop.. ([2804:7f0:6401:3d0a:25b6:2c76:96f:3f60])
 by smtp.gmail.com with ESMTPSA id
 w13-20020aa79a0d000000b006dda103efe6sm1604288pfj.167.2024.02.06.03.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 03:21:32 -0800 (PST)
From: sergio.prado@e-labworks.com
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 08:21:09 -0300
Message-Id: <20240206112109.2175948-1-sergio.prado@e-labworks.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=e-labworks-com.20230601.gappssmtp.com; s=20230601; t=1707218493; x=1707823293;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4n2ON9fxyb4g+pkxbZPEsNWI/GNmI6XoTyeyd4d1qyc=;
 b=QbD9E2lUr80bJzK2IPzpOyWLjdgCxQjuo4Pw/h+GIUqHdHVZUYtA6oRkx0/LEkRJTI
 2O1Iedl7rbB9VsoY4oraLF//QwP44ypC0wq28EVrd53NvKwAgtK8sUtWpesE4r7++oaj
 w7KST7Bt1s41wwWwQFhoFXH+Qc1uW36qvJfIToI2EByuMAhRAWQwAxhpJ/cgRzs6hvvD
 Q/CJAQhayxmqQ32kqS5SCymInj1Gk0Z7noK+TwITtVdRUzW7bkSY8upPLQ6TnTQqyOVx
 J6Bv5Smhy31swrQbgJ5JD9OluTj/lFx4NEJ7gwa5LtcpAHrg1QCt+maH5fR+9I960Kd4
 0lBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=e-labworks-com.20230601.gappssmtp.com
 header.i=@e-labworks-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QbD9E2lU
Subject: [Buildroot] [PATCH] package/azure-iot-sdk-c: bump to version
 LTS_08_2023
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergio Prado <sergio.prado@e-labworks.com>

Release notes: https://github.com/Azure/azure-iot-sdk-c/releases/tag/LTS_08_2023

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/azure-iot-sdk-c/azure-iot-sdk-c.hash | 2 +-
 package/azure-iot-sdk-c/azure-iot-sdk-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
index b960c0e571d0..d51dcc60aab2 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  7b52b9886a3aff20a55a0d5bc5e140c212f85fd06af18c31291c15d363743a77  azure-iot-sdk-c-LTS_01_2023_Ref02-br1.tar.gz
+sha256  b853d5ab04f3c6863fe78e3936f0d0840012d5260ae4a3b23f03e157395dc15b  azure-iot-sdk-c-LTS_08_2023-br1.tar.gz
 
 # Hash for license files:
 sha256  be2e9913fad9ff33607287c728f392579e2a6cc83e51b203ef6274c41db02ee7  LICENSE
diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
index e07cdf986e4f..4d0ecb077f8b 100644
--- a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
+++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZURE_IOT_SDK_C_VERSION = LTS_01_2023_Ref02
+AZURE_IOT_SDK_C_VERSION = LTS_08_2023
 AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
 AZURE_IOT_SDK_C_SITE_METHOD = git
 AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
