Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C7FC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8656940926;
	Mon, 18 Dec 2023 18:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8656940926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqaZq9diL8xa; Mon, 18 Dec 2023 18:54:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF89D40918;
	Mon, 18 Dec 2023 18:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF89D40918
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E94E41BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA326408FE
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA326408FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vljYAtls301v for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:54:44 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18C1040886
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C1040886
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5bdbe2de25fso2784305a12.3
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:54:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925683; x=1703530483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5gHqi6Ibi+/erb6MVkvnlDRfEOrj4VjSl8LODLO5eM=;
 b=UfupLbfJtZpqxrD1QF1ffZJb35JXqTsj0HGzaxYKI4cnkHmutKItbGDpfC1Eb91AM2
 Qi6ZjvzzAD14Wg8yqNxl345yH6okmz206e28FltQ4R4UxVugtV9RzcSj2lq1VQ52r3s2
 DsAcTE1cn8BVNUACQuINTTDTGjScvj2UVzKvIF39S8K+S1RpM+pcymiIiqGpzJ+yrCTl
 mDlrHo9mX95G9b6IBfdlEvZUWNv+x99Y593vwVlB+8tn/M9eXbxCLT7Dxy63rISD9clh
 dsFiFJAFgqf3RNVpfp9CruGGVPJs3cI1t7hS43QZ45ygKt4Rv9ba8qF8TKyavf3GT0ne
 VeCw==
X-Gm-Message-State: AOJu0YwPxBYs95aZMpV4Wo1WBhlXdWy53ACDfKh3sMARWFBoLSWnhKZc
 QsMW9r41cEhCDrvQL6ytpTvoecYAuU3u2Hf3wEQ=
X-Google-Smtp-Source: AGHT+IEnu74CbK2PBtuefQRNmeFFyn5+a7SmL1VM8tx9SZMuv+YF7NTq5ME26CjjLH+IPSe7hiCAuQ==
X-Received: by 2002:a17:90b:3507:b0:28b:7336:9838 with SMTP id
 ls7-20020a17090b350700b0028b73369838mr1310920pjb.8.1702925682969; 
 Mon, 18 Dec 2023 10:54:42 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([174.27.209.61])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090ac00500b00285cc7a867esm21890580pjt.0.2023.12.18.10.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:54:42 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 11:54:27 -0700
Message-ID: <20231218185440.506995-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702925683; x=1703530483;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5gHqi6Ibi+/erb6MVkvnlDRfEOrj4VjSl8LODLO5eM=;
 b=URboGHsxzonfcXoZPqALDmgaHBC0jA3EF/CtskJrrQ018xWt6xbgeq9z+Sv10glSa8
 Uk3ZEETL+pNKJMWw6f/Wix4KZxzykZhgUq7kRa0aKvC6oRb2vuXTSB9TwaTpJ8g3N8T+
 fdLdL3fEmHzSx6Hqxoaa4hrDkmappH/3dCAD4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=URboGHsx
Subject: [Buildroot] [PATCH v2 01/13] package/Config.in: move flutter-pi
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

This is a graphic application not a graphic library

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index fcc09b07c4..bfa73b848c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ menu "Graphic libraries and applications (graphic/text)"
 comment "Graphic applications"
 	source "package/cage/Config.in"
 	source "package/cog/Config.in"
+	source "package/flutter-pi/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
 	source "package/glmark2/Config.in"
@@ -346,7 +347,6 @@ comment "Graphic libraries"
 	source "package/fbterm/Config.in"
 	source "package/fbv/Config.in"
 	source "package/flutter-gallery/Config.in"
-	source "package/flutter-pi/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
