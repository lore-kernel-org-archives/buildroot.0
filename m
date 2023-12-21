Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1CBC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65794211B;
	Thu, 21 Dec 2023 00:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65794211B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0LiBP2qWDnm; Thu, 21 Dec 2023 00:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D163421D0;
	Thu, 21 Dec 2023 00:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D163421D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7E321BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0A5A42124
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0A5A42124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sljLA6mtPDj for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:39 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 066A742117
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 066A742117
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28be15fca9fso129339a91.3
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117978; x=1703722778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W4IRMKCNyOJHSGMIMHZVHsUKW04AWobcmYK7TeZg7TY=;
 b=mt2gZ+Td5XHj5fxRACFFD7e5c3yEllC86hvLPfLimhnMtTl0akqucjhTUx6z4zTdpK
 4feklweKqOslYbSGgU2wjUQv2/oxbM1MsN9SbZ9Yk0c20JcpD7Ey/CFeIOSoEfbhxp6O
 aN8gKNkG8SV03/T4OtjwTwA89MiGURHXQO4cLSISIzClgvX5S+Z8qNpt1ZhtG3jy0ZmB
 alHI7pRN+k+p7lAkevqoNEJBwtPgjHzZ/heCFw+DJo9IYyZu/3iX9Fo8r4Ok2X5DxnGk
 7lsYlsYtTfnb9y7Hw0kBWq7da3LUMJjmyc+wpkdytomDf2He/pwcMVeMqeY3lYX3EA+o
 skcQ==
X-Gm-Message-State: AOJu0YyOSQreJDD0j3glxYw7fVjl9hhNibTnnJFtFDQWoj6/4XHwWe5G
 F86AgASE/TfASl+Gg0z9qzzXVFKkbW6X7axWWoE=
X-Google-Smtp-Source: AGHT+IHxZB3ZlhhdQ/WR70pXHGVY4R453qq+H6vCxox8Iwg48E+qyMGJJnDIVaonGjiZkPU+YlqX6g==
X-Received: by 2002:a05:6a20:ba85:b0:194:f0c5:bbbd with SMTP id
 fb5-20020a056a20ba8500b00194f0c5bbbdmr355190pzb.42.1703117978027; 
 Wed, 20 Dec 2023 16:19:38 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:37 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:23 -0700
Message-ID: <20231221001924.1356215-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117978; x=1703722778;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W4IRMKCNyOJHSGMIMHZVHsUKW04AWobcmYK7TeZg7TY=;
 b=eYJ10ROPcygI6D9USu9oJ2EJmC4xBgdSxwAzKvZGZ9Gv2OP10Z8L20ngx2Hb10BFPG
 51zKn72CyK5eQJs3Wr6ZknvdlgZz3BytZqGMK18Zm13MH6zE+V9oQ9l7P7Y7/AzLYrs8
 abKCgZM4n2Ayh6e2o+xCiFYIIHyiHutgHiLeA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eYJ10ROP
Subject: [Buildroot] [PATCH v3 09/10] package/sway: enable swaynag support
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

Add a config option to build sway with swaynag support.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 5 +++++
 package/sway/sway.mk   | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index f60d55f190..926128193c 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -47,6 +47,11 @@ config BR2_PACKAGE_SWAY_SWAYBAR_TRAY
 
 endif # BR2_PACKAGE_SWAY_SWAYBAR
 
+config BR2_PACKAGE_SWAY_SWAYNAG
+	bool "swaynag"
+	help
+	  Enable support for swaynag
+
 endif # BR2_PACKAGE_SWAY
 
 comment "sway needs systemd, udev, EGL w/ Wayland backend and OpenGL ES support"
diff --git a/package/sway/sway.mk b/package/sway/sway.mk
index 39098797eb..7e1bd61a40 100644
--- a/package/sway/sway.mk
+++ b/package/sway/sway.mk
@@ -13,7 +13,6 @@ SWAY_CONF_OPTS = \
 	-Dwerror=false \
 	-Dzsh-completions=false \
 	-Dfish-completions=false \
-	-Dswaynag=false \
 	-Dman-pages=disabled \
 	-Dsd-bus-provider=libsystemd
 
@@ -48,6 +47,12 @@ else
 SWAY_CONF_OPTS += -Dswaybar=false
 endif
 
+ifeq ($(BR2_PACKAGE_SWAY_SWAYNAG),y)
+SWAY_CONF_OPTS += -Dswaynag=true
+else
+SWAY_CONF_OPTS += -Dswaynag=false
+endif
+
 ifeq ($(BR2_PACKAGE_SWAY_SWAYBAR_TRAY),y)
 SWAY_CONF_OPTS += -Dtray=enabled
 else
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
