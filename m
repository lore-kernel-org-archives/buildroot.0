Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C66C47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E7B42112;
	Wed, 17 Jan 2024 22:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2E7B42112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUcJsbcEdKpR; Wed, 17 Jan 2024 22:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 075F04214F;
	Wed, 17 Jan 2024 22:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075F04214F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D38F71BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD59283E64
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD59283E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRE9J1hFf5d3 for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:05 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9872B83E61
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9872B83E61
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6dc36e501e1so8499654a34.1
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531864; x=1706136664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rvo3R98yvQ5KZAFggGNjXRUIZrfoMtidTqpWArDPAW8=;
 b=jaavw1cE2NWcBVopKlHfiNVpU9FE/x3pas6aSJ1w6mAYu5WhG8iRhViZtRfyK+TU65
 6kjZBnCHBQ10ib3b3UATTA57SEGlYqqV7AGWI4OFfKt4XExgwylZv6HcK7M7mg0OPRIr
 0uNvsl0DPidx/EC/8iqF3r0KWaZlXDIyTT/cNDgUyupLRL+pSFHxQSMNt/0Tk0fJos5N
 QRHPRta7x/zgN6WdeRrc3kFrQ1wTG5T0bTMLv0ZF7cG0JF+w8tsjfv1uvQZSooxZhsdn
 JFLmPpSsow9ml2Z+wBu7k/46NhzbVJDEhQKbvDUlapoOJoMxg7xMML1FbOZmk3yXFeNf
 lADA==
X-Gm-Message-State: AOJu0Yy4A7ZDp+idzbnRhjHB6EfdtWZtVMml9OqR720cbuHl+CY6vR5w
 kQNUTUZvnFSnPI44MeuOfsvckqVfpJUbISc4ymFSOcefeXA=
X-Google-Smtp-Source: AGHT+IFlEJi42YB5DE34wilWQtHnUHelICgYtLHhjk7JEg6vupGE2a93twLMWoCRDN7PiETzjQAH9w==
X-Received: by 2002:a9d:4d87:0:b0:6dd:e885:804b with SMTP id
 u7-20020a9d4d87000000b006dde885804bmr12385796otk.77.1705531864010; 
 Wed, 17 Jan 2024 14:51:04 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:03 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:45 -0700
Message-ID: <20240117225049.28443-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531864; x=1706136664;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rvo3R98yvQ5KZAFggGNjXRUIZrfoMtidTqpWArDPAW8=;
 b=oa8CxfdaWQ8Txv0m90eMFbtCG7TRRSS0bpN2/7uRCZZ6f5OE2EyW5yvUUkiEkczOv1
 c0fZEopgAJqRGolelxi0USfzFalfhqHvCsdIIIwMHWEXWx+hMZ4Myrce5GJQWI9YXLnB
 HPkk7LRmug0QKdKbfdEtge+JTlu6SLyE3cnlk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=oa8Cxfda
Subject: [Buildroot] [PATCH v3 06/10] package/flutter-pi: bump version to
 75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
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
index 6c5371d18a..df47d666bd 100644
--- a/package/flutter-pi/flutter-pi.hash
+++ b/package/flutter-pi/flutter-pi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cf10ca9e26beea036ccf218e6a900de5f1f2000e00c03e7a48898c2a0c99f591  flutter-pi-f34d7bdbda713ba607b9625541ddfa314d9999a0-br1.tar.gz
+sha256  6b11f260567a4589915cf29ce2ffa62b6f80414242a65c616f01983ae3a177b7  flutter-pi-75e72fef8e8ce65ec72a002c00d9c6db4d1479d3-br1.tar.gz
 sha256  b34df9d3e1b4e5d1ba70b1740ec74b69f1189b44efd0c96b898b074ef8db1c70  LICENSE
diff --git a/package/flutter-pi/flutter-pi.mk b/package/flutter-pi/flutter-pi.mk
index ab640d704a..f1812b154e 100644
--- a/package/flutter-pi/flutter-pi.mk
+++ b/package/flutter-pi/flutter-pi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_PI_VERSION = f34d7bdbda713ba607b9625541ddfa314d9999a0
+FLUTTER_PI_VERSION = 75e72fef8e8ce65ec72a002c00d9c6db4d1479d3
 FLUTTER_PI_SITE = https://github.com/ardera/flutter-pi.git
 FLUTTER_PI_SITE_METHOD = git
 FLUTTER_PI_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
