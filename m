Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F7DC54E76
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 22:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D5A60EA5;
	Sat, 18 Nov 2023 22:12:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D5A60EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HLg1_t2yx1F; Sat, 18 Nov 2023 22:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE7B860AF0;
	Sat, 18 Nov 2023 22:12:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7B860AF0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA62F1BF354
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C2840129
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 22:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2C2840129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RV0I1IpBrLah for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 22:12:14 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D098440106
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 22:12:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D098440106
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1cc68c1fac2so28458685ad.0
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 14:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700345533; x=1700950333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1k1OZpv72jhcDqHRRCI2Zhd7bhFwGDjhDIo3DjErK2I=;
 b=QNFwpd/tsLIBP34sDFIL92IljLf8GUj1GLWW/g+lZk2VDG0kLzzgzz+Qkb6qbYSb+x
 QWdyGKFYM6BgcL9B3JkZM4ZWfPvwmsn7DB+U4ZNmQ/uTsUsPVDogwae1P0YAfm2i14jU
 AcLwJrDaf6omvfmDhl8uqv8OJFpN9YpOl9oN4iJM0XfBK1I/ZG60VEQiZT/JhG/rGpkL
 zY/4maYz3Kz1ZqvAzI5LHvwoZ+L/Q17okIRshzKIpLRIpAr6FAvnrkHNZ5U1shA4BYLS
 ve49U1w9QWl20B5CFPWLMvfZN8IbgoMYclvoliuMXoema2t6oSsBrkXESVEk2kuHAyYo
 nu2g==
X-Gm-Message-State: AOJu0YwXw8fG9MCGlPfBOE9C3X1YTIrfVru/86JI4xI/A8HlIDEp6Xwq
 rcUWYP5gS3NuFWrsvzbdM6rc9QQiHKjOZkHCQfJp9w==
X-Google-Smtp-Source: AGHT+IENd9D2u6UyzDaZrx5GM1I7IAfaM6rTBNHyNLa4+IrQGLnel1QGjbtYeB5tkS1q14RYl73Jyw==
X-Received: by 2002:a17:902:70c7:b0:1cc:29ef:df7d with SMTP id
 l7-20020a17090270c700b001cc29efdf7dmr4218513plt.65.1700345533336; 
 Sat, 18 Nov 2023 14:12:13 -0800 (PST)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.106])
 by smtp.gmail.com with ESMTPSA id
 jw19-20020a170903279300b001b9da42cd7dsm3423699plb.279.2023.11.18.14.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Nov 2023 14:12:12 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 18 Nov 2023 15:11:59 -0700
Message-ID: <20231118221206.1369389-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700345533; x=1700950333;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1k1OZpv72jhcDqHRRCI2Zhd7bhFwGDjhDIo3DjErK2I=;
 b=aNave5J5eelite7d3hd47CzfcGW5YHaXhFHydu1EEjWaxwyZ1OCdCJetg92UoSe2oP
 e0nXrNjfa/0u3JOuHMr5lWUrfvI1rwvlZD0+fs5OUw+lRng4d3XWX6bB2fbP2h2IubNf
 AJHUZ/PLilZZoy1ETkvPEnKLjo6sGQTXIllRo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=aNave5J5
Subject: [Buildroot] [PATCH/next v2 3/9] package/flutter-engine: bump
 version to 3.16.0
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
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index d31d435d79..58ebda5ca9 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.9
+FLUTTER_ENGINE_VERSION = 3.16.0
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
