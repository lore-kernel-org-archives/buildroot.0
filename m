Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCF7C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 21:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559368186B;
	Tue,  8 Aug 2023 21:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 559368186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GgSr48fTwZA; Tue,  8 Aug 2023 21:42:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 197B68196E;
	Tue,  8 Aug 2023 21:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 197B68196E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 86ECB1BF82D
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D15760DB7
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 21:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D15760DB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVOmu2gyAv5r for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 21:42:02 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E98560D80
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 21:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E98560D80
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bbf0f36ce4so40737175ad.0
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 14:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691530921; x=1692135721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V++/MemyXLBLpw4YziGfbLveD3x/z5Deur3Q0h4r+yQ=;
 b=jZDnmt35ON1fZT9Y0MvtqdrqWD1VqXSjo0crC7boL7xY0dLYwFNU0KzJVSSoN4qe/2
 skPX/oS4Kl47znCzBUEaZzFi3cfU2fBL6n3sooldZV/NkHoYauFaOZhyFIRCBwh7gXtS
 Om/IqeWxkULGocZ9QTF8EYdWkAkVi3iaAPymJK5KlleHejfmtPJXwHTz8zBimh8KuSeh
 GTy9/0x77jXk+MoJdYDOMIOURaRYULDNYIMSMrr+kus+611yl5J7baxHmJcwDAIPEVp/
 HEa8ZGcDtwJRcQY90C/Y/BkWaYrYcRDI32YUJEgBpcl/9ezucV8NRqVVmK8MIjOnDTlo
 VeGw==
X-Gm-Message-State: AOJu0YwPXUckCkbGw8untVb2xNEEmLgmL/5a05FTVDBhQ8Hrl6x8paGA
 yY/gzzWqo+i10N2H16ruGBVtK4FxEfXhLg==
X-Google-Smtp-Source: AGHT+IE7dq3UfDW8Q2nGHBxywHGKWjRVKR23tSAPM/Dls7wxrLQyd/E4DtM56ZusenfEunxDpGHfdQ==
X-Received: by 2002:a17:903:124d:b0:1b3:9d13:34b3 with SMTP id
 u13-20020a170903124d00b001b39d1334b3mr1050827plh.37.1691530921457; 
 Tue, 08 Aug 2023 14:42:01 -0700 (PDT)
Received: from localhost.localdomain (ip72-194-116-95.oc.oc.cox.net.
 [72.194.116.95]) by smtp.gmail.com with ESMTPSA id
 s21-20020a170902989500b001aaf2e8b1eesm9493107plp.248.2023.08.08.14.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:42:00 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 14:41:53 -0700
Message-Id: <20230808214153.1453666-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691530921; x=1692135721;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V++/MemyXLBLpw4YziGfbLveD3x/z5Deur3Q0h4r+yQ=;
 b=UgGsjenOoMVPE6SCe2bX74clO1krA4ptnFq7Q0O/XayJ43vZ7j5hKLP0Fb/ZHnCFOe
 lGT0h5YAu8oss+LVe352ZYQxHQQw43mttzkY4YS1NI2JyTwFgb5ZcWZnO7pMoSrCk3KJ
 dWYLz0acmzQtDMz+qIys3xB9Yn1mF5+cJSR8WvISqeMsl9dxGDs2M3LTbBQ/km2SdwOH
 f5KtRiWqgoLwhDkXCscxYwg99ecjh4xhFmfg3m01RI96JTjf8YMD+TkZZkTG59NlAqKm
 CWTIJEWpflpsRA060PbprOY0GctYVfMwp/+JM0ak3sF2AQDqcy2VAwYaB60O1/jeKocl
 ddAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=UgGsjenO
Subject: [Buildroot] [PATCH] arch/mips: Allow building for MIPS IV
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

MIPS IV is an older ISA than R1 but is still useful to support older
MIPS-based systems (e.g.: Cobalt Qube).

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/Config.in.mips | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 7f44f06c9df6..29b4180d21ab 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -40,8 +40,8 @@ choice
 	help
 	  Specific CPU variant to use
 
-	  64bit capable: 64, 64r2, 64r3, 64r5, 64r6
-	  non-64bit capable: 32, 32r2, 32r3, 32r5, 32r6
+	  64bit capable: mips4, 64, 64r2, 64r3, 64r5, 64r6
+	  non-64bit capable: mips4, 32, 32r2, 32r3, 32r5, 32r6
 
 config BR2_mips_32
 	bool "Generic MIPS32"
@@ -97,6 +97,8 @@ config BR2_mips_xburst
 	  to be used in order to prevent emitting these instructions.
 
 	  See http://www.ingenic.com/en/?xburst.html
+config BR2_mips4
+	bool "MIPS IV"
 config BR2_mips_64
 	bool "Generic MIPS64"
 	depends on BR2_ARCH_IS_64
@@ -262,6 +264,7 @@ config BR2_GCC_TARGET_ARCH
 	default "octeon2"	if BR2_mips_octeon2
 	default "octeon3"	if BR2_mips_octeon3
 	default "p6600"		if BR2_mips_p6600
+	default "mips4"		if BR2_mips4
 
 config BR2_MIPS_OABI32
 	bool
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
