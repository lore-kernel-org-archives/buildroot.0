Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2ADC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 17:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 561C2827F0;
	Wed,  3 Jan 2024 17:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561C2827F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iej9Jr3E7ikz; Wed,  3 Jan 2024 17:26:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B42F827DD;
	Wed,  3 Jan 2024 17:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B42F827DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3DCE1BF4E6
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA91E40571
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 17:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA91E40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lLH6OnbujAEP for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 17:26:24 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18ED840132
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 17:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18ED840132
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1d4c27cd502so11146265ad.0
 for <buildroot@buildroot.org>; Wed, 03 Jan 2024 09:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704302783; x=1704907583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wbuwWME722dHyBGjQpnTDJ0K8kmULMVkVOdI0hY81Jc=;
 b=YHsk6Ray9lfDBYn0giPPWdBxplawxBeIVEGoeh8pKKUftxm5YQ+aYEW98dL/tULCWt
 DmaulOmmh3ifHCCtn/gqfste+nAIew2Fch12tf5G2tTGB3sZ1VCxpKmasUaRzlk+KGHX
 HbeToLO8vQTOkE0P+8nuBEfXTeP0T4VmWlgeg1URp3AenWQl8cFRUBNxwPLk/EtuuQr8
 gFXSmb0udrpylBRf0lbsC6lUfbWtfZbKzSfnnGlihAppJYO8u2mkHiwhpxgekh1Y8zh2
 6zVKvGUhaxWuhQ2DpnVGjblgj4RHZoreXVlBbz7tNjKGNEIOV5i/IIhC4AwuoCagLoGg
 3Y/A==
X-Gm-Message-State: AOJu0YyMxYR5luRRyJAt30yu1tLFPGkUbFzu8c4rvHzquyiEeglpXW/L
 nagNUI9wammyxfXfsPO73fiCUDS1yy8Yi7044IaH/OlRGvU=
X-Google-Smtp-Source: AGHT+IFB+YM8k4cs3Pjj7mc5yfO/sFBWnrY+uYv7DSSASSdeFkSCDrc5AwAr2IDAu0CH1eXii96Utw==
X-Received: by 2002:a17:902:e88a:b0:1d4:be4b:8ff8 with SMTP id
 w10-20020a170902e88a00b001d4be4b8ff8mr2530430plg.125.1704302782663; 
 Wed, 03 Jan 2024 09:26:22 -0800 (PST)
Received: from desktop-oi0kn2b.lan (75-174-33-82.boid.qwest.net.
 [75.174.33.82]) by smtp.gmail.com with ESMTPSA id
 y11-20020a170902b48b00b001d3f68db03fsm23788586plr.153.2024.01.03.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 09:26:22 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 10:26:19 -0700
Message-ID: <20240103172619.1156235-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704302783; x=1704907583;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wbuwWME722dHyBGjQpnTDJ0K8kmULMVkVOdI0hY81Jc=;
 b=pHeVn+JL2HuvFfBFGWVUqy/itz0IYAES7GOcs7LFYbWRoteRpgXLe4UxO0ohQfxmtm
 rfE3eA7dveoPaQ1soI03YzX3n6+RM11srMWz7qZQoqk094Relc4Vrpb0juRkYI1v9QtH
 pUnUtWB3Pwu+1oNDX3iHayzNNKOP7t6J2Ig3o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=pHeVn+JL
Subject: [Buildroot] [PATCH 1/1] package/fcft: disable uClibc support
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

uClibc support does not include the threads.h header file that fcft.c includes
on line 8.

Musl and GlibC, however, do include the threads header file. As such, it is
only necessary to turn off support for uClibc. Furthermore, the only package
that currently selects  BR2_PACKAGE_FCFT is BR2_PACKAGE_FOOT. This patch also
updates the "foot" package to match the dependencies of BR2_PACKAGE_FCFT.

Also, update the comment for BR2_PACKAGE_FCFT and BR2_PACKAGE_FOOT to mention
that a glibc of the musl toolchain is needed. The wording of the message
borrows from the liquid-dsp package, with the word "required" being substituted
for the word "needs" as the word "needs" already existed for the fifth and foot
packages.

Fixes:
http://autobuild.buildroot.net/results/1b2dda32a90d7db8117eede09f46d44cffe60993
http://autobuild.buildroot.net/results/5f03bb5c0c107a2b908be974421ae0a032d4dd89
http://autobuild.buildroot.net/results/31a1f022414a8a1888cac4a5cd1761257d0f2196
http://autobuild.buildroot.net/results/4522781e0448b325b54e93bbfb20f8295ea7061d

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/fcft/Config.in | 4 +++-
 package/foot/Config.in | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/fcft/Config.in b/package/fcft/Config.in
index b65515a3f1..d6da101d51 100644
--- a/package/fcft/Config.in
+++ b/package/fcft/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FCFT
 	bool "fcft"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # threads.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
@@ -48,5 +49,6 @@ config BR2_PACKAGE_FCFT_SVG_SUPPORT
 
 endif # BR2_PACKAGE_FCFT
 
-comment "fcft needs a toolchain w/ threads"
+comment "fcft needs a glibc or musl toolchain w/ threads"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/foot/Config.in b/package/foot/Config.in
index 24b3f78821..a88766fca6 100644
--- a/package/foot/Config.in
+++ b/package/foot/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FOOT
 	bool "foot"
 	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # fcft
 	depends on BR2_TOOLCHAIN_HAS_THREADS # fcft, wayland
 	select BR2_PACKAGE_FCFT
 	select BR2_PACKAGE_FONTCONFIG
@@ -32,5 +33,6 @@ config BR2_PACKAGE_FOOT_THEMES
 
 endif # BR2_PACKAGE_FOOT
 
-comment "foot needs a toolchain w/ dynamic library, threads"
+comment "foot needs a glibc or musl toolchain w/ dynamic library, threads"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
