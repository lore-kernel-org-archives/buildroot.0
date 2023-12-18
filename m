Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A83C35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 801164168C;
	Mon, 18 Dec 2023 18:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 801164168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSsFkDS4riBt; Mon, 18 Dec 2023 18:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECF141909;
	Mon, 18 Dec 2023 18:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AECF141909
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 463831BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F50240926
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F50240926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3p0_m3l1UMz for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:46 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C4B040886
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C4B040886
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5c673b01eeeso1329161a12.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925685; x=1703530485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yUmLmJco0ELYLxeDBGy98CUZY5WSENCL76eAGJoyj7A=;
 b=M6O7bQJkw7rxKisurEFoYd5lvchB/wM+CxiW0f9W5vJNDoAqTvI7ltgB1P/fZXDdpS
 wnxoA8NZva0zpQcP4v8YNiNb2GT9NxQUwUjBOXs6uin4Hmoyg5HRW2UykUGTro+xmxOx
 zOmU7tbSVZsGNvW13SEuLDqdvK/GMYe/TKsuKFPqjexRlZ0IJym7wf/PcUweLsttjaXi
 M2Ja73eI8LngXkd1CEIasZdWs8EkS9MQL8gj5TyDf6jbSjVoAbYtblVOa8sa/W6W+BnI
 kbPZ2wOXJg/AK5Ih3UPpFIhH8lwLD2s3zztdSs/LzEX1iYcayJrBWEku1cQrARQGuFX9
 FzRA==
X-Gm-Message-State: AOJu0Yx9yfivN7mAyUfs1gBOKIEYRZgpXupDFtPIxBUsHxgzv0Psaqdx
 XC2sO6jhc1qgUalSeyII39YZE6wDdbB6dcv3EJM=
X-Google-Smtp-Source: AGHT+IGWgWtThAmV4qeNVyZsHM9NDev0q1DZlr7SzGKc9wkKtDk3oC5kwyacwZMxt3K0sbZ9pBYQLQ==
X-Received: by 2002:a05:6a20:3c8d:b0:190:53f9:43e6 with SMTP id
 b13-20020a056a203c8d00b0019053f943e6mr9123870pzj.4.1702925684905; 
 Mon, 18 Dec 2023 10:54:44 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:44 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:29 -0700
Message-ID: <20231218185440.506995-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
References: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925685; x=1703530485;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yUmLmJco0ELYLxeDBGy98CUZY5WSENCL76eAGJoyj7A=;
 b=AT0SUyrj+b3MLvMSqFpuw/NE+zpH4oBKA6tlAcExbo7X2V8Qbg8p32Sd0VyHDrHiRp
 sFMe6tB35jlOMvvN3aP0EsECpqBGONdCOIkfC5Hux0QKZa9j03zOQrcG5fp/NPtW2Dzj
 xNWXvE1eZWuL802SALXfc28u/qLVL5cvetMwc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=AT0SUyrj
Subject: [Buildroot] [PATCH v2 03/13] package/flutter-sdk-bin: bump version
 to 3.16.4
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

--no-analytics and --disable-telemetry have been combined into
--disable-analytics

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: Bump to 3.16.4

 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index a204de1807..f4d4bacb84 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739  flutter_linux_3.13.9-stable.tar.xz
+sha256  eb4fb2bcedd3ca2bbfe7570217db611937884bbdd00dec601be9c2a74517cee2  flutter_linux_3.16.4-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index e8e71b6ab0..e1292c154c 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.13.9
+FLUTTER_SDK_BIN_VERSION = 3.16.4
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
@@ -24,8 +24,7 @@ HOST_FLUTTER_SDK_BIN_ENV = \
 # The following config options must be ran one at a time.
 HOST_FLUTTER_SDK_BIN_CONF_OPTS = \
 	--clear-features \
-	--no-analytics \
-	--disable-telemetry \
+	--disable-analytics \
 	--enable-custom-devices \
 	--enable-linux-desktop \
 	--no-enable-android \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
