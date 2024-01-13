Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA917C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 735FC60EE4;
	Sat, 13 Jan 2024 20:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 735FC60EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k5yE3YazxFRc; Sat, 13 Jan 2024 20:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF56060E13;
	Sat, 13 Jan 2024 20:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF56060E13
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 338811BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F1E403A5
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09F1E403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LtFoOHS1zSNm for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:31 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F39494026F
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F39494026F
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3bd562d17dcso1883199b6e.3
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177229; x=1705782029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c1cM8ntw+SPo8dT9RmLN0QJb8GVQdEX4FYWXg6UtCSQ=;
 b=il21Eanvx55FN6wQIhMHLMHzvJ5XZlSZOU+lj7aB5/Wkjg5Ct2L8U8p3uTZzMwKaKH
 yl26ti/37gpFxKLKSGuivxC0DgzkZ2I+YPju8DJqpYLKsBczAYas5ZMwHt97U4H9+meJ
 ilwW0SjyYDhw94cAefBbTRmTe4NpN+Z8cUAJaZw8lLvmn0hCsITJxyhWDjNFENL2YyuB
 LZWOuCibDzlGB0LrSD2w4mfVVk0XGcs3k/WaCLSzzqL1NZrTQ/QOgQAlc4V5LnyEImHw
 Xodk3b+Kva9lMVCnHQHUC8bja/fwFVzOtMPbC/jqLgjI3LIayKHk316wu+tKPFzgy3tI
 1LeQ==
X-Gm-Message-State: AOJu0YzGdT+rqRe/qrwmEpT0cl5uEy319whch1z37Vx6a+gnXJMYKXNm
 Sma7zJ1V84sSuNp4iMLl0I1GI97nmnPkeTh/lrfBUPEc2Os=
X-Google-Smtp-Source: AGHT+IHXvMyBARTcDsMQSX9UNevU5tW/7RgHiCpV64Zpx2psPc2DmP8gJNsnGPCR9ZVd/NGwR8rfEw==
X-Received: by 2002:a05:6808:1183:b0:3bd:62f1:30b with SMTP id
 j3-20020a056808118300b003bd62f1030bmr2540765oil.47.1705177229622; 
 Sat, 13 Jan 2024 12:20:29 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:15 -0700
Message-ID: <20240113202020.21747-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177229; x=1705782029;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c1cM8ntw+SPo8dT9RmLN0QJb8GVQdEX4FYWXg6UtCSQ=;
 b=WIXS1hRLoEjXQ/zYDGUr3o6daAv97wEL4Uafh9/igCkN47fxKb2cGBekNYaXgB0s8D
 sGu47teKR4tmpGeTsEeBllp4nmeVbX8CVQ7mjkp7kWhzbdOg7j4XOrU3KoyTPdnmcqIW
 854V6fofVqMHM+2ZTVtfL1lFOtuoAqqKKmaoY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=WIXS1hRL
Subject: [Buildroot] [PATCH v2 05/10] package/flutter-engine: bump version
 to 3.16.7
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 ->. v2: bump to 3.16.7

 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index e972612097..cefaed5212 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.16.5
+FLUTTER_ENGINE_VERSION = 3.16.7
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
