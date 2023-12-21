Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC078C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A28542417;
	Thu, 21 Dec 2023 15:37:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A28542417
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u4Co-pyF_xAF; Thu, 21 Dec 2023 15:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80948426B2;
	Thu, 21 Dec 2023 15:37:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80948426B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6038C1BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3927F60F7A
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3927F60F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SkkyTRBQvQRt for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:28 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C02760DF9
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C02760DF9
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d3eabe9321so6242475ad.2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172987; x=1703777787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrqHviaX37J+nkPJSjh2ijJfN/9C5B4R9kCmmlwk+wk=;
 b=B02AQCBKZr1UgTtvz4Z//PYLm5oUPEhaVCYlVp8YzpmMuUdskGSmU9OvOupjs7Ix6S
 0Kppooi4GUdZ9TnvzWUizIpXUPvCsfY/aqbkcNc9J1tDNn/sXycgDduGrk6Hqv9Mj6DN
 W/5W02kxtKP2yeZiK32FlgjU81rKh+yGd+doJWzxEDoNpzuOATzIxUplSsTPKuI0uAbv
 tRIsTyqEDxckJmwa8H7YiyjZY7bk4CdgjOrLci8UC5/xDedRLaG9ZP5tMkP4Emk1GA7X
 +erSPYmiamp1ipsDc0DWG8quqmYAzODGtmnjl90j5g40enddAgsTSRGOIwrDoijOXbPl
 kqJw==
X-Gm-Message-State: AOJu0YwpARTvu/XHniubK+wTBmNDnPUVPZfvVDy10WBN3uOFr5FTX2/Y
 QWQRkrWLl0oKSJ7dNhFgQ7TETbV5WectslJH8Jw=
X-Google-Smtp-Source: AGHT+IHmUEDxw7SPuCAuK7F3kwXyPL3rNdfQ9EXZhdgzWa6C5PX0zqmxXpb/nZs0RNP4xnzZXNa81A==
X-Received: by 2002:a17:902:900b:b0:1d0:6ffd:ced0 with SMTP id
 a11-20020a170902900b00b001d06ffdced0mr10637200plp.137.1703172987568; 
 Thu, 21 Dec 2023 07:36:27 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:14 -0700
Message-ID: <20231221153620.237439-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172987; x=1703777787;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrqHviaX37J+nkPJSjh2ijJfN/9C5B4R9kCmmlwk+wk=;
 b=ZbBa+lwSksrRaLLjSGcPd/x4p/5hsuAuzCCYaWr6hadjdPnaypXFuBJJO8cd2984I5
 oNClORYJgugGCNrzGvTyjHM6rDUm7Bf3W9p5eQtwYvgxF3SZUmQVgPZkBNpXnCDB6J0F
 EQSar9f2kMganxS4yfYFGyUz3qI86ZnAfzYbw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZbBa+lwS
Subject: [Buildroot] [PATCH v4 05/10] package/sway: enable bash-completion
 support
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
 package/sway/sway.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 19f90b8b00..677b101f1d 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Ddefault-wallpaper=false \
 	-Dzsh-completions=false \
-	-Dbash-completions=false \
 	-Dfish-completions=false \
 	-Dswaybar=false \
 	-Dswaynag=false \
@@ -34,4 +33,10 @@ else
 SWAY_CONF_OPTS += -Dgdk-pixbuf=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+SWAY_CONF_OPTS += -Dbash-completions=true
+else
+SWAY_CONF_OPTS += -Dbash-completions=false
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
