Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73093C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23C87408D3;
	Sat,  3 Feb 2024 18:48:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23C87408D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPbNGRk7YVwu; Sat,  3 Feb 2024 18:48:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B951405F5;
	Sat,  3 Feb 2024 18:48:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B951405F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC0F1BF285
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52EE583BE0
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 18:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52EE583BE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnVkbAp-wXcn for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 18:46:43 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70D8483B81
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 18:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70D8483B81
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40ef64d8955so28466175e9.3
 for <buildroot@buildroot.org>; Sat, 03 Feb 2024 10:46:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706986000; x=1707590800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+esnWrMqRyDAEZQ+Qj2WDshpqtmdhaR4CrYD+DFroo=;
 b=fLa54vDgp/AaA+kvWWHYK9zb8bqQTw0FoMmnYYh5Df0mVSLnUN8Ona31XgXofur+CA
 eimbomg/KHp1H+nRTmyaqz9twPqSMaY/F8HuK0uVoY4HH5vn8KDex+h9QQnxdTZ3Hw1j
 yQ8aVd5qgsel0+d25g1/r5z2JxeiUys16/Qk1/dIOSaO/sbDCBUwrKigT2CCxgFws8kA
 OF5Wi9XvE1Xj6CTJ5J2PDtMfbGk/Xe4eeKa7EzeLymO9topMvSH2iDdTkAv8Dk1NRzl9
 mrzDLXRyQWM4lEmOSmICcJsF9iSBBusU09fY7OAXfjcjByS9a9UZirhLcIgo3/jW2MDs
 0nTA==
X-Gm-Message-State: AOJu0YyNoQXU5NmNkg+yeHAU1q7tsUtHv1d3bbc9UVxkW3Zz0RaBI5zI
 AoXv1Towy0xvj6orPQhKaDyDdqDZAB4+aiI3ikW1k5CdoLfdqPGo/nwZ+6R5qjs=
X-Google-Smtp-Source: AGHT+IF3z+9tf8EczG3R6Zqj1HLUcURE9gc6nKAFH0mPxgxGSVFxyh9YY5HoSH6jHSiBv3RC4Q8z7w==
X-Received: by 2002:a05:600c:4715:b0:40f:86:fea with SMTP id
 v21-20020a05600c471500b0040f00860feamr1585291wmo.13.1706986000192; 
 Sat, 03 Feb 2024 10:46:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXgmRgzZ6nZ16jonwYqFmCMFVISXHU9dNPAUgOqYUYJsYAW9HY9aM9n9GXig1X2kNtPG6vPqAc53vqZph4TV+es/kib5gsu/QkqlanOk7yZ/qQ3ICqAAaOU08aqmCOTkxBiM8IKvyafAilallDul2kRvox0Movo1FQT81XMZ1NfEAg=
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i18-20020a05600c355200b0040ef2e7041esm3643724wmq.6.2024.02.03.10.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 10:46:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Feb 2024 19:46:37 +0100
Message-ID: <20240203184637.168548-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706986000; x=1707590800; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+esnWrMqRyDAEZQ+Qj2WDshpqtmdhaR4CrYD+DFroo=;
 b=PiGU5g/rz4nQqengeh2/e5lk87ttvMu9nyQ/JKndUdNVSdUamCe1JmhTtZh51RtyOO
 CYa88YfBBNaFQ6GVnlsdkn0RWIvx7+duXqoY8fktqLibN3la2wg1xy27eq8XVrlqlxs8
 WgI2ccauhl4p+cR4yyk9Gtl4rJf3hlc5uo8rNe0DPO6KDDoIxAnh889tMc8NWy75wcRS
 rBNcZ9bBJcRNXwcNaDbeLqU/cMr3O7AGSVSBcf4CMSdHHAj8m299mvQjQ9hODOn93DAR
 oeG8g9jcyENsMvPrRvOZV4/+tW/usmQ7p/PBtip/3LGCtsgmeCM514qXcEC7hldndvJD
 RSbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PiGU5g/r
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: update
 PYTHON_AIOHTTP_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:aiohttp_project:aiohttp has been deprecated in favor of
cpe:2.3:a:aiohttp:aiohttp in November 2023:

  <cpe-item name="cpe:/a:aiohttp_project:aiohttp:3.8.0:beta0" deprecated="true" deprecation_date="2023-11-22T17:09:16.157Z">
    <title xml:lang="en-US">Aiohttp Project Aiohttp 3.8.0 Beta 0</title>
      <reference href="https://github.com/aio-libs/aiohttp/releases">Change Log</reference>
    <cpe-23:cpe23-item name="cpe:2.3:a:aiohttp_project:aiohttp:3.8.0:beta0:*:*:*:*:*:*">
        <cpe-23:deprecated-by name="cpe:2.3:a:aiohttp:aiohttp:3.8.0:beta0:*:*:*:*:*:*" type="NAME_CORRECTION"/>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-aiohttp/python-aiohttp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 2cb9058b97..3dc822e832 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -10,7 +10,7 @@ PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/54/07/9467d3f8dae2
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp_project
+PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
 PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
