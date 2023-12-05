Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBB0C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 23:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FB8B41C22;
	Tue,  5 Dec 2023 23:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FB8B41C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw7W2DdaNFRW; Tue,  5 Dec 2023 23:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5DEA41855;
	Tue,  5 Dec 2023 23:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5DEA41855
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5B61BF279
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 726674031F
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 23:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 726674031F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hcyd3DRiO7K for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 23:59:31 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49448400E4
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 23:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49448400E4
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d04c097e34so2624345ad.0
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 15:59:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701820770; x=1702425570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFH72rRjFrE5Lvb9Y31d8MJ4ta6UhFUZZwqXOuVHkk0=;
 b=gC0VE2FK9BXUqJOsRrByig/ekjiXNexB/nhVSNJ8AQIIpCK57xQJoN2tQswysuKW9U
 oQV8IeQFkzEtuUo+YNQxNdyjI1XzcRnom2vwUMp3fDYT1+fRI/sRON0TLG1VpRGHv0Rz
 uvoedFxRjzuikDzWwBVk+Kj4gFLDXBhyJuuilYZIrZNFTU+Wu76u+qi4ZpCfxbWrkOo7
 DpPAkRY2o9CHzOlvHuN6WdO+4pB22f1DOYwcg6vnLfo6MWUsEPK/SrYa3LdVM1bJWQfm
 MahBDkDJhgzv6Dn38xJaQomrsJIaTka3AcGC1Ck7p6m4H3hwoy0lWgHHgQYZjnTQspa3
 ycGA==
X-Gm-Message-State: AOJu0YyUTizFvDFo6IJhLLdMNdVZdqh43W2Eus7ThFmodN7Lhz6OBQ5E
 /QUOL/i9fqe8mFP7BYHthTlEOD2hlqYGJOEar8U=
X-Google-Smtp-Source: AGHT+IEVN9boyUeglcwD8Wb5hvvMv9I0H6pNZ/oVAo9Vj+3ht+cyGH8Jy+9V0DZQI2opM13iQLcurQ==
X-Received: by 2002:a17:902:ea86:b0:1d0:7908:ab64 with SMTP id
 x6-20020a170902ea8600b001d07908ab64mr58599plb.10.1701820769786; 
 Tue, 05 Dec 2023 15:59:29 -0800 (PST)
Received: from localhost.localdomain (75-174-247-100.bsmr.qwest.net.
 [75.174.247.100]) by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ab8d00b001cc20dd8825sm7246369plr.213.2023.12.05.15.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 15:59:29 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 16:59:17 -0700
Message-ID: <20231205235919.510051-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701820770; x=1702425570;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oFH72rRjFrE5Lvb9Y31d8MJ4ta6UhFUZZwqXOuVHkk0=;
 b=jhL5cGl+DlyEdMZ/7xeN95EKD/+evn0WeYAN44Y1Hp+djq5z8FnuLzO9Df4FOIDM++
 GfLe/j6Ee0OfUlmg5pXSSXPtRaKl3aXjYc7zqsZ7lcZSscROOhrHkJ6kscg6h0uzgFbn
 UgTKqUMY1kRt74fPkkQCKdrxaj8eQzuMfteA0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jhL5cGl+
Subject: [Buildroot] [PATCH 1/3]
 package/giflib/0002-Fix-CVE-2022-28506.patch: New security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/giflib/0002-Fix-CVE-2022-28506.patch | 34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/giflib/0002-Fix-CVE-2022-28506.patch

diff --git a/package/giflib/0002-Fix-CVE-2022-28506.patch b/package/giflib/0002-Fix-CVE-2022-28506.patch
new file mode 100644
index 0000000000..35d5f60a95
--- /dev/null
+++ b/package/giflib/0002-Fix-CVE-2022-28506.patch
@@ -0,0 +1,34 @@
+From c0cca041fc4fb6748d8dff3675fe7a839253d668 Mon Sep 17 00:00:00 2001
+From: Sandro Mani <manisandro@gmail.com>
+Date: Tue, 5 Dec 2023 16:24:32 -0700
+Subject: [PATCH] Fix CVE-2022-28506
+
+From: giflib-5.2.1-17.fc39.src.rpm
+Fixes https://nvd.nist.gov/vuln/detail/CVE-2022-28506
+Upstream: https://sourceforge.net/p/giflib/bugs/159/
+
+Signed-off-by: Sandro Mani <manisandro@gmail.com>
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ gif2rgb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index 8d7c0ff..d9a469f 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -294,6 +294,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+             GifRow = ScreenBuffer[i];
+             GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+             for (j = 0, BufferP = Buffer; j < ScreenWidth; j++) {
++                /* Check if color is within color palete */
++                if (GifRow[j] >= ColorMap->ColorCount)
++                {
++                   GIF_EXIT(GifErrorString(D_GIF_ERR_IMAGE_DEFECT));
++                }
+                 ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+                 *BufferP++ = ColorMapEntry->Red;
+                 *BufferP++ = ColorMapEntry->Green;
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
