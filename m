Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EBBC4707B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 515C342E02;
	Fri, 12 Jan 2024 00:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 515C342E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcNaeafxVTfM; Fri, 12 Jan 2024 00:58:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A367742E14;
	Fri, 12 Jan 2024 00:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A367742E14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 981261BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E8326F563
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E8326F563
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGcPnYvyDkAL for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:33 +0000 (UTC)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B381160D77
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B381160D77
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3bd4e6a7cb0so943253b6e.3
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021052; x=1705625852;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2CUbcaSE7M3rM3+0A86U2DtUq3oooDsiyvarm5iLFE=;
 b=PyrThLd4KzSojg104uRyStAzGTksXbl8X1SsV4nCcaL/p+2aVWdeoDtxx4KpySFywM
 9LvXyc2VDctfVZ5Ie4HRapzVk+fEd4bj5NyH1rtCmgmmvuTPDDhIhqxDUQIZGFIDGfEB
 JNVp1xwB4fENSeLvfsLRvW/7pIQCtfKv73uhww14d/ahV8VQmRw5Ow+w3ABhpZKSTi9J
 wVSBJwnsiuz3HIltOaO3CmQPnH0OvLJhsPwKr/Fr9mHundEKo+AQ7oKnWfT90tlCzWcG
 fAuG/lQJKNQyvksKvmWQg6McIN2QhocfKo5pwuSBMDiuau7WdnpWO9JZplwQbXF4SJRm
 gV+g==
X-Gm-Message-State: AOJu0Yy4Y2C/t9jr8eCr44n9LsrRvjsGD5XOjLrh29Zs+qsjv3bMD/Sw
 DOzvhjouOIrkwjisZEJ4aN9AlTGunc6mawB94t8aCpeUheY=
X-Google-Smtp-Source: AGHT+IGx3CWAWu34Smo3bXiyP105vVkd+mfhIwq0U8tSzPs7s65LFJXCCtMXaH9b+w3Cij3iYsbDng==
X-Received: by 2002:a05:6808:2e9b:b0:3bb:c5f6:f0c with SMTP id
 gt27-20020a0568082e9b00b003bbc5f60f0cmr263768oib.112.1705021052013; 
 Thu, 11 Jan 2024 16:57:32 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:31 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:15 -0700
Message-ID: <20240112005719.1082305-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021052; x=1705625852;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2CUbcaSE7M3rM3+0A86U2DtUq3oooDsiyvarm5iLFE=;
 b=dH0zdWneuCeRlwQm/aieBTByimUUB1AU4PDLvQ/+PMpE8luMrsd5CF2UeLQ/1Gnp16
 e2VVAign9Fgd56NrrL/FVHNP5+9FtEe941JDFgLNw7YkfYDm++rrQ9NPUO4Zge6qXoO/
 nRct7PoBtKEzcvsCCjq+tKnpoyAFP17P4/PMA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dH0zdWne
Subject: [Buildroot] [PATCH 06/10] package/flutter-pi: bump version to
 b816d8cff40e917ed0bc7905ec5f8611c08b5875
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
 package/flutter-pi/flutter-pi.hash | 2 +-
 package/flutter-pi/flutter-pi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-pi/flutter-pi.hash b/package/flutter-pi/flutter-pi.hash
index 6c5371d18a..f5e72d384c 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cf10ca9e26beea036ccf218e6a900de5f1f2000e00c03e7a48898c2a0c99f591  flutter-pi-f34d7bdbda713ba607b9625541ddfa314d9999a0-br1.tar.gz
+sha256  3952cc3471c9424908354a01dfa5ce3ceae376ed0749d94200dedecbe7610c1f  flutter-pi-b816d8cff40e917ed0bc7905ec5f8611c08b5875-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index ab640d704a..cb4f5d093f 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = f34d7bdbda713ba607b9625541ddfa314d9999a0
+FLUTTER_PI_VERSION = b816d8cff40e917ed0bc7905ec5f8611c08b5875
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
