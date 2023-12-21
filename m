Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF621C35274
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 15:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E6E4255B;
	Thu, 21 Dec 2023 15:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E6E4255B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tq12a_V20gE6; Thu, 21 Dec 2023 15:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A864266A;
	Thu, 21 Dec 2023 15:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10A864266A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D11F1BF381
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7606B4241A
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 15:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7606B4241A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D78EwjrRN6Mq for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 15:36:29 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D74F6423F2
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 15:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D74F6423F2
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1d3f29fea66so6368175ad.3
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 07:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703172988; x=1703777788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/S6M09EUkGTpt/R6wYIiMzT1gzQ0foNHTNkBCehzII=;
 b=VXP+lExMafJBinyTqMFeTtyB7tVXjx0v8fSdPmtXPVHUk1mTo51Hs2OwVgHMYgCTE5
 X4kowJHYEP5vGC1oDBbUBIdApFwU8dv4LBUkiSRtDfwybnNM/VXwllVnrexNKNJlL/C4
 LJ+ISQJ8CXw3jMoz4ytJaGnVeJvT55Tu9RMJwpbsHFVF1DpxuMH3Dxn5rqxqawboXFSv
 r+htlZBGTGwYx4AgpNjpSX5+hkYe5GWExy11wJ5SpN+xJR1AiHX+NDYQxN4Xk1WrWJBf
 pEKf+U/ld6hC+yDjsBeXFCNThpZJn77Bgvan57xWsbCcX1//Vj7pY00ndUxNFQGI4pzL
 YPIQ==
X-Gm-Message-State: AOJu0Yy4MU5+NtombHmcX29UlaFjprd0hYpOGq/54PeRI2BpEHdAqzJp
 tYPU37nZf9Hak515EmkC1W/qIW9WY/DFBAZvbLQ=
X-Google-Smtp-Source: AGHT+IH6iiUSTfXvvdzC9WL4t7MtQ+DKorkkzJLxX4IrWYGiWEo2GLbOZer26oJcvt4ZEO+aQ5hYNw==
X-Received: by 2002:a17:903:647:b0:1d3:f8c9:f301 with SMTP id
 kh7-20020a170903064700b001d3f8c9f301mr1505774plb.47.1703172988540; 
 Thu, 21 Dec 2023 07:36:28 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 g24-20020a170902fe1800b001d0c41b1d03sm1792029plj.32.2023.12.21.07.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 07:36:28 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 21 Dec 2023 08:36:15 -0700
Message-ID: <20231221153620.237439-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703172988; x=1703777788;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/S6M09EUkGTpt/R6wYIiMzT1gzQ0foNHTNkBCehzII=;
 b=jwFD0Nl2mLLWgOO2+/oLfogqjAB6njqhA9owl6JsOYjwKjioAHgjQYlQxg/qC+NG3z
 xQjPxWHq/W1uyvmBC54SKJrtu9IlOUP57vDSjyShGhT39j/6Dee+lqnPdye6iML+7tyr
 iGPAX3HTILw+P0Yj7eN/uQ4Y6tABNI0652lmo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jwFD0Nl2
Subject: [Buildroot] [PATCH v4 06/10] package/sway: enable default-wallpaper
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

If swaybg is selected, set default-wallpaper to true.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v3 -> v4: Enable default-wallpaper if BR2_PACKAGE_SWAYBG is selected [Thomas]

 package/sway/sway.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 677b101f1d..1e3dd279ef 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -11,7 +11,6 @@ SWAY_LICENSE_FILES = LICENSE
 SWAY_DEPENDENCIES = systemd host-pkgconf wlroots json-c pcre cairo pango
 SWAY_CONF_OPTS = \
 	-Dwerror=false \
-	-Ddefault-wallpaper=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
 	-Dswaybar=false \
@@ -39,4 +38,10 @@ else
 SWAY_CONF_OPTS += -Dbash-completions=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAYBG),y)
+SWAY_CONF_OPTS += -Ddefault-wallpaper=true
+else
+SWAY_CONF_OPTS += -Ddefault-wallpaper=false
+endif
+
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
