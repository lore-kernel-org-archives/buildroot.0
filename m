Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A1CC4706F
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 16:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A25D829DC;
	Sat, 30 Dec 2023 16:58:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A25D829DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijjHjQFevQNT; Sat, 30 Dec 2023 16:58:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4E882951;
	Sat, 30 Dec 2023 16:58:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F4E882951
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47DA21BF3DE
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 16:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FE4982951
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 16:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE4982951
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocngyxyQsSPo for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 16:58:17 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3BBB82925
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 16:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3BBB82925
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d5ae89c7bso30320995e9.2
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 08:58:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703955494; x=1704560294;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JwhJz7s9S8mxnHbPFAejf850xGm8F/R+wmpnEZG2OZs=;
 b=nwmOK82wWI1WYWQD3vlBPSVngvJSiXzK5yS3BtsoPtRK27yS+09kspd/kpKtQMKo1v
 Slrae1Lm31T27J0tSCLilQF3XR33D/7QIrTW6CViaDpwcEWDedD5urg1uXGa6sgnETeP
 9edXDKUs2m9lruyeiSXN8ri8WmGienItM0HpF/tQpmzhp0s6IVvew8uHkYbvHvash7rd
 jbo8NQiTyCY1yCtXsI/9auWO3VYW3Q2PSXYIBobZxq4rObsG5d0WGEN/YJ9VigFWuU9H
 x4y2Dqw5dYreUZOF3qJ4bxIya5rAfWWMS/GTxXltvrwZ4fhZC6Qy+uStUqxA694RALSA
 lxhA==
X-Gm-Message-State: AOJu0YxB9xuDAiq+/e1Rmo0mAZ3KnSyW8Ugn82GMioX/QPzBDZ6y4J5l
 zT+NGFhcMK1TVUm4xm7kMK4B5U3x3Bg=
X-Google-Smtp-Source: AGHT+IHieSwmDmzUMTaCilumB1XAachL/K/O8PZI4VqIbT4RtyNVj5KOHBqtLPEpTc4FRstp54henw==
X-Received: by 2002:a05:600c:5405:b0:40b:5e1b:54ac with SMTP id
 he5-20020a05600c540500b0040b5e1b54acmr9103271wmb.56.1703955493796; 
 Sat, 30 Dec 2023 08:58:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b0040d53588d94sm23950951wmq.46.2023.12.30.08.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Dec 2023 08:58:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 17:58:08 +0100
Message-ID: <20231230165808.869415-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703955494; x=1704560294; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JwhJz7s9S8mxnHbPFAejf850xGm8F/R+wmpnEZG2OZs=;
 b=DKGBYVehYzseGI8Jd8N37gKTarqDfhlibnB5xlyNjwI0H7MekXJRZC2tP1mYlXyEEt
 +daw+lTqjsqRixN56wrYt021Rr7hehZYxME9ecfN39KGb+qUHsIgAyrGYMm3PH+UgTyU
 jfusJZnVE0Rof7iiV+KGD5KDka8AuvkrJEGkFfDgKMaKmm8I442XGzwzLMuN4xMIIY0F
 wS0p9UIa3U5XICm0/7PrfFTHouK7fZzW2MLuWEg0H7YUYxZiEH8ppVINaba3xji41k9r
 ovpuiSKOrIuUAycRyvwDFougIpIwzowiumkALyF0CfHRDl67MdrDbpxO24vYB6Q22mjy
 jXFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DKGBYVeh
Subject: [Buildroot] [PATCH 1/1] package/cups: bump to version 2.4.7
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop fifth patch (already in version)

https://github.com/OpenPrinting/cups/releases/tag/v2.4.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...raster-interpret.c-Fix-CVE-2023-4504.patch | 45 -------------------
 package/cups/cups.hash                        |  2 +-
 package/cups/cups.mk                          |  5 +--
 3 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch

diff --git a/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch b/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch
deleted file mode 100644
index d1dff4e1fa..0000000000
--- a/package/cups/0005-raster-interpret.c-Fix-CVE-2023-4504.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Wed, 20 Sep 2023 14:45:17 +0200
-Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
-
-We didn't check for end of buffer if it looks there is an escaped
-character - check for NULL terminator there and if found, return NULL
-as return value and in `ptr`, because a lone backslash is not
-a valid PostScript character.
-
-Upstream: https://github.com/OpenPrinting/cups/commit/2431caddb7e6a87f04ac90b5c6366ad268b6ff31
-[Peter: drop CHANGES hunk]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cups/raster-interpret.c | 14 +++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
-index 6fcf731b5..b8655c8c6 100644
---- a/cups/raster-interpret.c
-+++ b/cups/raster-interpret.c
-@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
- 
- 	    cur ++;
- 
--            if (*cur == 'b')
-+	   /*
-+	    * Return NULL if we reached NULL terminator, a lone backslash
-+	    * is not a valid character in PostScript.
-+	    */
-+
-+	    if (!*cur)
-+	    {
-+	      *ptr = NULL;
-+
-+	      return (NULL);
-+	    }
-+
-+	    if (*cur == 'b')
- 	      *valptr++ = '\b';
- 	    else if (*cur == 'f')
- 	      *valptr++ = '\f';
--- 
-2.30.2
-
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 501d8c12a6..2d7bbf1aa9 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e3882b283138ba0e7262  cups-2.4.6-source.tar.gz
+sha256  dd54228dd903526428ce7e37961afaed230ad310788141da75cebaa08362cf6c  cups-2.4.7-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 4bc5eeedee..2ad5eeb5cf 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.6
+CUPS_VERSION = 2.4.7
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
@@ -13,9 +13,6 @@ CUPS_CPE_ID_VENDOR = openprinting
 CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
-# 0005-raster-interpret.c-Fix-CVE-2023-4504.patch
-CUPS_IGNORE_CVES += CVE-2023-4504
-
 # Using autoconf, not autoheader, so we cannot use AUTORECONF = YES.
 define CUPS_RUN_AUTOCONF
 	cd $(@D); $(AUTOCONF) -f
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
