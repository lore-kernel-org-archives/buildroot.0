Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAA3E784B6
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 14:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 951E0610EB;
	Mon,  2 Oct 2023 14:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 951E0610EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIW9X_Z-bXkE; Mon,  2 Oct 2023 14:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E750D610A7;
	Mon,  2 Oct 2023 14:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E750D610A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85CD21BF947
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FB3F81A81
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 14:31:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB3F81A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WEVxGwaADf7i for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 14:31:29 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 087108135A
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 14:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087108135A
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso2332058666b.0
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 07:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696257087; x=1696861887;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OR6Fz62tfuhff3OSggVynFvEAvX8p+pb9/BLvhpKqAM=;
 b=rXnn+KZztWYNfDwLYJYGsFdgECf7L9ZVqL62cU2LnR1KjO3pUdDR9bhj2HK6I50lx0
 Eqj/HJ1gAr4hD1I6ZnaSDRm8rpPMGNvrMjSq1VZfQT//vN+5f8zV5DVOFGkIOBqj1RQJ
 6bmyZ4e3Y1PCWsovB4vFytDWVs7tjAX5aU2bh3rsQche8BEv94yO0caM0iBVBx4TL6BP
 x/N3H4JYRBdg1Zyab+1UXDzJXqSweveqYdHE1tYMjxfRJmXKHHFmK/d2diZaPPEpQ+H8
 Sxhx2aj18a9RhCXCMD2jSavxmgVdSGeqtlTdOmMfODqEbfAkuyQgULuRPj6Oz/KLdOmn
 7bkw==
X-Gm-Message-State: AOJu0Yz0M4DRZ5mm7kTPF8sXUtd9wQXHXpyL69CM9GCmzP13a8xFXhRv
 0by3c9XarHFBtKDA6bcrIrmqCndK39W8I7SYdxPEaH9X
X-Google-Smtp-Source: AGHT+IGJcva4dUggne+9MH1FHlyS8/NZqgjl58xAVuH8fMkYJHkaSS5Zp+YEPcv92eUL9nlIfJKdFQ==
X-Received: by 2002:a17:906:8a64:b0:9a1:ff2f:28f1 with SMTP id
 hy4-20020a1709068a6400b009a1ff2f28f1mr11626350ejc.40.1696257086745; 
 Mon, 02 Oct 2023 07:31:26 -0700 (PDT)
Received: from fedora.. (146-241-223-149.dyn.eolo.it. [146.241.223.149])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a170906165300b009a1c05bd672sm16917735ejd.127.2023.10.02.07.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 07:31:26 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 08:31:20 -0600
Message-ID: <20231002143122.257820-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
References: <20231002143122.257820-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696257087; x=1696861887;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OR6Fz62tfuhff3OSggVynFvEAvX8p+pb9/BLvhpKqAM=;
 b=Q2pxZPaTN9/RzFd/kCFimbrxF1qbZBm7+28XZMniBgJq0+SIj/x+oBDKkk7YOF7y2r
 fzat/1hQg96Emuw7E2WrocYmvBibuKF8UoPD1AeLJ0JQDgaS/y82C3ULZ1ykoMMq2IEY
 n7rfSVy4QoOZluP21hyeU78zA6Vuoco0nipck=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Q2pxZPaT
Subject: [Buildroot] [PATCH 2/4] package/flutter-engine: bump version to
 3.13.6
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
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 942b07786b..b502dbcee1 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.4
+FLUTTER_ENGINE_VERSION = 3.13.6
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
