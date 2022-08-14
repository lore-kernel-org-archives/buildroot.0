Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1465C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7355140884;
	Sun, 14 Aug 2022 23:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7355140884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojvPHG5oDGbI; Sun, 14 Aug 2022 23:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D72F40878;
	Sun, 14 Aug 2022 23:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D72F40878
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 091421BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D806B81C38
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D806B81C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjLqvw-S4WnM for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:40:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E41C81BF5
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E41C81BF5
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:40:11 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id v128so5829921vsb.10
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:40:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=YpGPTLQ2NihVtgmelt7amH9/4o3rOAr1pi5ur1SzyfA=;
 b=m66HjC/FprV5RFg9wXLFeY8bjp4KdFJ4AiIL8wiKdc3DgU5u8DL6n+li7Or9X2AnRB
 oWy9duuUWxqRygONpUeSMr0Nc/ii3TvK4ZhzfDzn6qXXPpXyzXj24WSUbiF/T0KrwVhw
 tUyfQ+j6uxRHmWrvbc5sNg1QLdQpFpkMc04YQ9QacdoBLc7wRDdSLV0MJvmKttxrfy3U
 5AsQ79rNZzzwChxygkJ4ezE1Mm/xCdfivPzUui5CrQIorCebkGEiM3g0QcnS8X/4RN8E
 hGltOp5QZoE1DSJDHhp5JVBybC/QsRYYcboQ5oq3WT6JRNn56f0/txrcdW/dxM2KZdPj
 807w==
X-Gm-Message-State: ACgBeo2X5vKaiNBFsoZ9nDX9Z57hu5UpcowyIFP1UOhW01K1C7/0Z1ex
 OyyO5Ttc4/OemH/++8KPnn1Wev0LIvY=
X-Google-Smtp-Source: AA6agR4tB/uKkdmQ6xiApNHbHpjYgoJ16zWTKL/mCTXe44mEinbdT3xNERaafPdRhjn6a8r2HCO/cw==
X-Received: by 2002:a67:ff05:0:b0:38a:8c2b:e29e with SMTP id
 v5-20020a67ff05000000b0038a8c2be29emr5415732vsp.58.1660520410908; 
 Sun, 14 Aug 2022 16:40:10 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:40:09 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:33 -0300
Message-Id: <20220814233845.2247022-22-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=YpGPTLQ2NihVtgmelt7amH9/4o3rOAr1pi5ur1SzyfA=;
 b=jQUuhhWFbQk86MVbVHtkdXQF9qbMY+UDPoEQFHT6MiBpIDkG+XZlamM0xCOREDRsyh
 E5f98vG0l/80fUO2aKik++RsGsvxuyCIKzl4srvmDGt5PiPToE5pWpKyGcTAHKqRNutH
 jNIXFXtam9RqvO36z46zKrmVgEjtYOHXowWViPHFFdMQ0MnUdaZzALo95Rb4CsY6wxja
 lD0SNxf0fZZPaVTEMGCTF9LPLRiad5nStqoetwWqktWVs2Wp10odK9LTzF85NUb+sgmx
 8za9Y9JtY9T4jEvuBgTG2INqkFnaP/sm1npovRiFFKicokd8n8PWNuacoI9qq05bOOyJ
 vKQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jQUuhhWF
Subject: [Buildroot] [PATCH 21/33] package/jquery-ui-themes: fix typo on
 BR2_PACKAGE_JQUERY_UI_THEMES_VADER
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added in 2018 by commit
'94c146282f jquery-ui-themes: rename options to have proper prefix'

Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/jquery-ui-themes/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jquery-ui-themes/Config.in b/package/jquery-ui-themes/Config.in
index 29359544ac..b372d40b60 100644
--- a/package/jquery-ui-themes/Config.in
+++ b/package/jquery-ui-themes/Config.in
@@ -112,6 +112,6 @@ config BR2_PACKAGE_JQUERY_UI_THEMES_THEME
 	default "trontastic"		if BR2_PACKAGE_JQUERY_UI_THEMES_TRONTASTIC
 	default "ui-darkness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_DARKNESS
 	default "ui-lightness"		if BR2_PACKAGE_JQUERY_UI_THEMES_UI_LIGHTNESS
-	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_UI_VADER
+	default "vader"			if BR2_PACKAGE_JQUERY_UI_THEMES_VADER
 
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
