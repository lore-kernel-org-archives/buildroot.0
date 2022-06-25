Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4653DC43334
	for <buildroot@archiver.kernel.org>; Sat, 25 Jun 2022 21:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988F0417A8;
	Sat, 25 Jun 2022 21:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988F0417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6qprGzW8_z9; Sat, 25 Jun 2022 21:35:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4013A41758;
	Sat, 25 Jun 2022 21:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4013A41758
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9C4E1BF95F
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A139360F9B
 for <buildroot@lists.busybox.net>; Sat, 25 Jun 2022 21:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A139360F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UealIVmkAMfU for <buildroot@lists.busybox.net>;
 Sat, 25 Jun 2022 21:35:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 885E660F93
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 885E660F93
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 21:35:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id z9so3132851wmf.3
 for <buildroot@buildroot.org>; Sat, 25 Jun 2022 14:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Epl8dmn+nPkYDk8eR/mI4juCqVYAEH5JwL4G9yZ0XT8=;
 b=wDodUSYCy/oJ182I1IVRQCwIecj6OJnvFzw4DN/w+Sak2VeHdBmfyT3a3JJ6LBZ0gV
 6vLBMxWAkYEFUt/bZk3SrzDonUu+NJbett8BeQYc0CGbclLw+ugK4HuIoqVkuaHqbd9j
 5ok2bFvrnueT8x718LReOsj24qVkI/Me7rn/uhfK3THNUEjXz2j5VfrQrxbCcBZ1BK/i
 SnJ3Q5aRd7U2YaW1nPE1TRkAJRdkLdZtlgaQ1C0vbE7urehbSBP9pvtppJgEEQJh9c/M
 z8UoR79jpKIRxAbh+DhtInl63Ib7wd/V35qAUVyNTVNwEybzOgwPUDOZIP3Gn2xhVkqP
 rBHw==
X-Gm-Message-State: AJIora/edMNkaVcjfAuPWSILoyrD5KbKUcDHzlsCzP9/LGUGwm7st8d8
 ljEiP7pYCLscTFNf/XJDTYMS97Zd0Nw=
X-Google-Smtp-Source: AGRyM1tmz50tq6hkhCBDDR8B5xoVJRPxSHc8pgarVbohNSxVP8N409wuZNfONrcJKRRX9iEzKKv1/w==
X-Received: by 2002:a7b:ce06:0:b0:3a0:39e0:b322 with SMTP id
 m6-20020a7bce06000000b003a039e0b322mr11702589wmc.55.1656192949362; 
 Sat, 25 Jun 2022 14:35:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 c7-20020adffb47000000b0021b9504cc83sm6114254wrs.31.2022.06.25.14.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 14:35:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Jun 2022 23:32:53 +0200
Message-Id: <20220625213253.625319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Epl8dmn+nPkYDk8eR/mI4juCqVYAEH5JwL4G9yZ0XT8=;
 b=UbbctEL9+1wTguq6+Ouk5UnDzWcKaBu+CoDGuDC0t2QdCCHyVID6dSf/M9RYzrmQKx
 RMfbryLmAr+TbwIxMukGi0H7xu5Og7jViv9vEZSaUmfd4oO6WwG1qkNh6POEeDZcWNZA
 +F344XMI8i+4AfKs0egiKip4H3ZIcIRvdZLn6ILQ2mjm8LHx0GN8lOyzujDgC8E0dm0p
 k0HwsaGDA8TefavSsTD71TyhgEcjUn66/y5R1SE+gbOKI9WjYhwV0dF2YU6VqGkwhCJd
 qw03ltwWB/fI+4aXrqZ6UXWCEJcvsfo4/Gw/nay2mvqgsoDbGPuaTGlmLvd1RttcSQxP
 rdzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UbbctEL9
Subject: [Buildroot] [PATCH 1/1] package/cups: fix CUPS_CPE_ID_VENDOR
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

CUPS_CPE_ID_VENDOR is wrong since switch to OpenPrinting upstream
repository in commit 8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopenprinting%3Acups

While at it, also fix URL in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups/Config.in | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index e23f069a8a..51cf10b073 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_CUPS
 	help
 	  The Common Unix Printing System
 
-	  http://www.cups.org
+	  https://openprinting.github.io/cups
 
 comment "cups needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index ab56b23bcd..2bd5f3bbb6 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -9,7 +9,7 @@ CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
 CUPS_LICENSE_FILES = LICENSE NOTICE
-CUPS_CPE_ID_VENDOR = cups
+CUPS_CPE_ID_VENDOR = openprinting
 CUPS_SELINUX_MODULES = cups
 CUPS_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
