Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAEBC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ED6C42134;
	Thu, 21 Dec 2023 00:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED6C42134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YyU_3F8mCDW; Thu, 21 Dec 2023 00:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6FB0421CE;
	Thu, 21 Dec 2023 00:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6FB0421CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B56D01BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A21142124
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A21142124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i0mlVcD-UJ2c for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:35 +0000 (UTC)
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 044B542117
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 044B542117
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bb6ed2b913so152828b6e.2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117973; x=1703722773;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrqHviaX37J+nkPJSjh2ijJfN/9C5B4R9kCmmlwk+wk=;
 b=vUuydC3Kvq07p182Kmh3UtM4LWLOKqTwpCl2IOTIygV01xWVEDMW1lv3SeT5ifnGQc
 pmBKUndUgvJYgF7DyI361xWSX6du6UEHqw2nAlMTKcZNLQJ2vVDZpJYi8eQP2StuscJx
 69d5o1Wsqs8fSJnvh1o9yHWbTgFXna476PTDA53/2jSbRHJxtKiWOPRi6pzcz5nZcjyC
 +i4EVw9h30ke5K6oybPKuNroao05U6bI0Q6Gp2RUu/Jus5xOZL/8Uwr1vrqot/vynM3E
 7ZA8CjdcBeKshrIQ/dH1tCa2Y4rUl5CJBwAvvUgAoozovsZj0oSx9y5e4PSUDlukJUqi
 AgiA==
X-Gm-Message-State: AOJu0Yy+htNGW91FTA17ZMkCZAOlVh1s7y0tifMxRYXG/7QgHWx/ECn4
 U8ZpA2Rwe3+2uUUJgFpZ0kFbtpXdHI730Urbbuo=
X-Google-Smtp-Source: AGHT+IG1pMdYGc0N4NU6d4eJgz1AdpbVeZjzxKD7bnYyZBfAmsspc4uEAN3MkHBqLw+1EQOlLXQ7tg==
X-Received: by 2002:a05:6358:6e87:b0:172:f491:7b60 with SMTP id
 q7-20020a0563586e8700b00172f4917b60mr603261rwm.50.1703117973384; 
 Wed, 20 Dec 2023 16:19:33 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:32 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:19 -0700
Message-ID: <20231221001924.1356215-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117973; x=1703722773;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WrqHviaX37J+nkPJSjh2ijJfN/9C5B4R9kCmmlwk+wk=;
 b=ffyElWxQCvRvJfTR2dXx1OF/2ofwyMgxrJ3XoBuy4bUN1w2RmWijRiFZteLxoWVysq
 SvIn8JyFWld11OyCikQfuliVp+arE1GBE40ZVnIPkw4i8bOugSYhptWcn/S3mGjv6Ilc
 t/KUcwRO/0/rQWf7A7QJx4LQfiaVzF2gSYS3I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ffyElWxQ
Subject: [Buildroot] [PATCH v3 05/10] package/sway: enable bash-completion
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
