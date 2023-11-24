Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD4C61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E168400D1;
	Fri, 24 Nov 2023 20:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E168400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAPT0JsWXvx6; Fri, 24 Nov 2023 20:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A269401AD;
	Fri, 24 Nov 2023 20:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A269401AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A84701BF289
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C920822A8
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 20:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C920822A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3SoHeFvfoFu for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 20:14:41 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A21F8228B
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 20:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A21F8228B
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6b20a48522fso1921388b3a.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 12:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700856879; x=1701461679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WeNaMOTJNaE2OpfUZBpm8U2WNDk5Gy7kKEzj2sPZd+Q=;
 b=XMCoZqQkZxDyGHj27X4caMdCzM2MICx80Q30a5IpmX2jZ5Lq3EQi9ArUoTgSptpIxd
 QaQWHBrY2Y+F2c+9nakvMCsFKvEBAMwP4lD81BT+SzGqhCKdxFzY0bu9Id8mvKzUCHmn
 c+N2DdjcgTdwBT21+IZquTvVEeIIEIe+FOmCcDAEHH+9e64GMkWzeQmV4YEzerC5RdcM
 D+nMcTkA0Qt/azkZGQIgMvbnd8jyEOVbuXr/20iHKhnz4PvSG94MW0VuulrBuQ6KCckJ
 UI2lCs23nD4eBBiFkRJAOn3Ju93NdxkXqECDL2JN9tMtEyHSrQyUfTs3zZo63IDTzcZG
 0wjA==
X-Gm-Message-State: AOJu0Yy7jzpD8J5QCknbMPfELP/bN3rMISypP+aRPyJHO+fv80UFe8ls
 cgXlzoTMiM4HQOl719gEq9TaSmuVz5ILqxq+SLI=
X-Google-Smtp-Source: AGHT+IH1cd7b6wNGwVMnhRbN4NnHhg2r+pYhnYoV+ubPcOTKO+Xto8MWHmWYJhWjVRJC8vQw9Du5Zw==
X-Received: by 2002:a05:6a20:7d96:b0:14c:c393:6af with SMTP id
 v22-20020a056a207d9600b0014cc39306afmr5267111pzj.0.1700856879501; 
 Fri, 24 Nov 2023 12:14:39 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.200.138])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056a00218500b006cbafd6996csm3186545pfi.123.2023.11.24.12.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 12:14:39 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 13:14:36 -0700
Message-ID: <20231124201436.52264-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700856879; x=1701461679;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WeNaMOTJNaE2OpfUZBpm8U2WNDk5Gy7kKEzj2sPZd+Q=;
 b=DdnARiBw5HUKfbjCNGdvvtN/cu1bDDDPBI89+A6CHudG4JZbeJgmLqefa0iiHPuMN3
 tP7wkZWeNT243ACQptQ0AVimSrOTw/iKhKFlsEN3qC+j1C5YjM2skl7liTsbJhD+QVbS
 INXK9wzSD41v95i1ZhLQLkHVNmyi236R+H//0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=DdnARiBw
Subject: [Buildroot] [PATCH 1/1] package/flutter-sdk-bin/Config.in.host:
 remove comment
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

flutter-sdk-bin isn't a rust package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-sdk-bin/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
index a48714ea7f..181a2ee6e5 100644
--- a/package/flutter-sdk-bin/Config.in.host
+++ b/package/flutter-sdk-bin/Config.in.host
@@ -1,4 +1,3 @@
-# All host rust packages should depend on this option
 config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
