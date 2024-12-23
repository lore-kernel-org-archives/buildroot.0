Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A453AE7718B
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 14:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55EAF81311;
	Mon, 23 Dec 2024 14:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfbyrScz1UfV; Mon, 23 Dec 2024 14:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4088D81321
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4088D81321;
	Mon, 23 Dec 2024 14:22:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54E3DD3
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 425CA40A9B
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m--eBKRwitll for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 14:22:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E89CB40A60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E89CB40A60
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E89CB40A60
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 14:22:50 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-844ee43460aso335560439f.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 06:22:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734963769; x=1735568569;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p1idhWPUBGGGJPzb+bpVqh7PShocSqqWPWvbsexStTU=;
 b=o1KsoEPwAW14ZPcOuFlLmlMkEaDGtA2gPHKbFEZqbluIdvQZAWyny98KcCBnmyPiqf
 UBly1aFIbaKm52Mk09rYMnwTOg+y2BXlUgpbAthfMZLTBqwbjGgRAorvPgbl1/T0N/bs
 KJ54GRNxArRfb+damN/tHKofWXaXNn9zlUbSR4mZMjy/u/n/XrU4O3PA1bZdYg+BODmA
 vIeuZXsGPRrv7yTmTV77H/v1lBYoPGfGAnKNSkxncg77wNTRQcHLJig3WOd752auAQ8n
 CZiPX595hWaoPC1BGRLFZ/eSg4PFqDSlbinphRExAh0qoV3Uk5TBkO3gzA9L3lO2Llnw
 n+og==
X-Gm-Message-State: AOJu0Ywh48Vy9SoO1eAvD1efLqOnV0bdH8POZgKGiHNXDkNHlS6Od6i6
 O/chfBXmBVXwqLgHMxSnwd4DfKDrBXlyDOjHnt+xa07op0HYquc8oP1ZXcjnG5k=
X-Gm-Gg: ASbGncs2W75ZohTzKB1Nu3vJISiy4V2K84DLHAzSayB8KKt15gjtx29l5Ka6YjCKgYc
 /XeH7NL86/IQkfHTAMC2NZvNO7Ym6BaGoqjJ6JvMrr9CtwpNjw6ApCpxYQ+EvIY/Ze4uX2S/NA5
 8W2zEwrxclWvW5foqkzjBSuWrs5bqvCE/YHeVIKMTm7z3SrOnxl1SiqL0uxgLCD4byD73nm4/8O
 0w1gDC0Oaquxm1rfwyTRUgUU8bnBoSJzAC5JPYTh5OpqnEPyUn+6HQysH56AMlYXg+uo2x3n/Z0
 RR3MLwx73c5eAcIymIQnaWFCd3/8Y7nuvw==
X-Google-Smtp-Source: AGHT+IE4R3YilafhxMkjxTMppGNAbd+4hkTtWwevIY7hCTkkpHt1wJ0fiQBeT16H5wwF12NuLe8m9w==
X-Received: by 2002:a05:6602:6013:b0:842:ff2d:c3de with SMTP id
 ca18e2360f4ac-8499e49f168mr1071012239f.1.1734963769531; 
 Mon, 23 Dec 2024 06:22:49 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf4f41bsm2219261173.16.2024.12.23.06.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 06:22:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 07:22:47 -0700
Message-Id: <20241223142247.1712612-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734963769; x=1735568569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p1idhWPUBGGGJPzb+bpVqh7PShocSqqWPWvbsexStTU=;
 b=FNlfXSk05CZOiPVgZFxFXHYB9+7ZRQUKSD2XLgGr7kGHr3KiNA7dRkCJHMA84Lujtf
 npvnOJdpEidDl9lfyv2VrMFFPrXrYC646CJ8pMCtratuHCJOWByUGM9mCnMnwV4S9SaH
 lOqV1E2C7fCu/+MbcuhscK7lJOb+QdeZHDC/o4NfoRN6/9m9aVYHjztskYcy8epX3P6b
 Q/5jqHMXnIc6RXR1SOWG9LZMHZtvRr8+CZonM9/EnVDTKQ3a5LU712AzOmkYmAgQwQAl
 b2zWEJeJAgZimL/T5MaKagPP5tDO/6T3+cGX5xNQhWw42ASjUnsjnCwfEiHhI4A/afmd
 dYcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FNlfXSk0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp: bump to version
 3.11.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-propcache runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/Config.in           | 1 +
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 01a1ed8a3d..08883316d8 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_AIOHTTP
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
 	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	select BR2_PACKAGE_PYTHON_PROPCACHE # runtime
 	select BR2_PACKAGE_PYTHON_YARL # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index fd3ca7d72a..0aa22e9fa3 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  fa0526dab4bf4b755537ae5718a43e25  aiohttp-3.10.10.tar.gz
-sha256  0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a  aiohttp-3.10.10.tar.gz
+md5  17f04b60068122e998a60a3010679501  aiohttp-3.11.11.tar.gz
+sha256  bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e  aiohttp-3.11.11.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 17eeae72b3..19e62745e0 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.10.10
+PYTHON_AIOHTTP_VERSION = 3.11.11
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/17/7e/16e57e6cf20eb62481a2f9ce8674328407187950ccc602ad07c685279141
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/fe/ed/f26db39d29cd3cb2f5a3374304c713fe5ab5a0e4c8ee25a0c45cc6adf844
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
