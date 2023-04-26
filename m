Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E879DC77B60
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 08:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B6D241CA9;
	Wed, 26 Apr 2023 08:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B6D241CA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZN21AQRrIah; Wed, 26 Apr 2023 08:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F1D041CD4;
	Wed, 26 Apr 2023 08:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F1D041CD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 545961BF215
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DB8A41C43
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 07:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB8A41C43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hD2QOqL14t8j for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 07:59:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C1CE41CB6
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C1CE41CB6
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 07:59:42 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so50821174a12.0
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 00:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682495979; x=1685087979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UiirW3R+LTQFSC9C3OPF5nv1a0p4OIS3ytv/fTZkD9w=;
 b=Hq6BTs3WWEdetOxXMrcnTaTmghA4ElO2L/kQQQBfrYh2Yf2UzdvqD1sy5xGBDAPKTC
 CqUi/v9FsgC3oav12XwDsH4hdDaxAlJeOpqIOFfAyhmKhDqkH6UzbQIqLqeJ8ukeR1Wd
 +p+IUEwUEy3X/jgLQvtI96vH4stAMCJhu2BcBVAYsSgeMet+noQV6L9eN+QZOt6LcgN4
 6Bp3VpoUemXn2IcZ2FujvE4CuTmAXdtnN+4GBWFf4yR7856KXmzdF925iIWtbXI1pZN0
 WOEyu+o7DEOOGGAai8K2JpqciYmzxKsbPQBoBX11J1NpFT4CI279RbwhuDA6ZRsoHlKG
 4zjw==
X-Gm-Message-State: AC+VfDzw2J6X4+Bbev5E/b5HA7UHSmjKiWsmCT1qFCD6C6bxR7cdunXS
 K05qISzRicSEH1M/Yc24H7W28/ptPHlfK63E
X-Google-Smtp-Source: ACHHUZ79EXsfHl9rN6Zz0jQX4s3WPTvHNsLmdBBkIGIIn4MEiblA6B1M+prCE8l/7oYAQPfBNWXEOg==
X-Received: by 2002:a17:907:7254:b0:94e:c40b:71e3 with SMTP id
 ds20-20020a170907725400b0094ec40b71e3mr1749741ejc.5.1682495979039; 
 Wed, 26 Apr 2023 00:59:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:5dc7:9f11:9dc8:1e6d])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a170906970900b009534211cc97sm7883414ejx.159.2023.04.26.00.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 00:59:38 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Wed, 26 Apr 2023 09:59:05 +0200
Message-Id: <20230426075905.2307988-5-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230426075905.2307988-1-thomas@devoogdt.com>
References: <20230426075905.2307988-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 5/5] package/libgtk3: fix update-icon-cache
 on empty directory
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

If both, hicolor-icon-theme (selected by libgtk3-demo) and
adwaita-icon-theme is not selected, then the /usr/share/icons
folder is empty, causing find to fail.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
---
v5: 
 - Fixed indentation.
 - Grouped patches.
v6: no change
---
 package/libgtk3/libgtk3.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index bdd54dcdc8..eac569fd41 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -146,8 +146,9 @@ endef
 # Create icon-theme.cache for each of the icon directories/themes
 # It's not strictly necessary but speeds up lookups
 define LIBGTK3_UPDATE_ICON_CACHE
-	find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
-		-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
+	[ ! -d $(TARGET_DIR)/usr/share/icons ] || \
+		find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type d \
+			-exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
 endef
 LIBGTK3_TARGET_FINALIZE_HOOKS += LIBGTK3_UPDATE_ICON_CACHE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
