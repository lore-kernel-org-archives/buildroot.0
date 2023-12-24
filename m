Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A10C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 19:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 090A960B46;
	Sun, 24 Dec 2023 19:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 090A960B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8LLsSydMYBp3; Sun, 24 Dec 2023 19:18:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C5CE60ABA;
	Sun, 24 Dec 2023 19:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5CE60ABA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 562BF1BF38D
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 19:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27E97605A5
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 19:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27E97605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQeOjTZqc1Dk for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 19:18:22 +0000 (UTC)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 618076059D
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 19:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 618076059D
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-7b7f2c72846so141476239f.2
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 11:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703445500; x=1704050300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Ob6XItRA2V/TAElgL7NCs8Kj2KcNRypaGY7SgLFNE4=;
 b=fj7nvRomusapbJMCDuykPjzj7Bojd6jeH27UWhMnGI3TBvb1RSEKfYITaI6grTTQAr
 64mNdbHG1JP3tJ5UmUkGV1bdqVRIYEZRHpYvD4UScLI6mJf7KUU1OHBfoTo/oYIlY0wW
 SOYdVWtGT1xTQYHQZJnihMDAxLAv4WGhVLXKeJopG6qiSGy6CbjuBjBd9N34eD8W5ESK
 Pey1gaMAO29yzqRH3b8+M6QDYZD2qX4//r3xcyF5a+Bzetymp8jyIXgPpdlFWlnGIEZM
 xdYy964IqJCWhj8J1Yq126L6T8E6xeTCGYoAG4huo1H3PoXJHUNOis8WGlM74RSCVpS4
 wJOg==
X-Gm-Message-State: AOJu0YzAFcx+Wc9Gr+Wk5bq14qdk7ybdCCDL6vWtZ/Tw7LqHMbHM0Qkr
 jlUd86eXwdq5GYLERJcr487rQ+AnXXwOVy0EgUJ+q3eOUgs=
X-Google-Smtp-Source: AGHT+IHzIHCUvhx6tUokXsm7EqDQwjiq3aSBEdVHfYZSg4CbqzLrWkoz0dzxhKc4DN4JU1eiXYevNw==
X-Received: by 2002:a05:6e02:3047:b0:35f:e963:b990 with SMTP id
 be7-20020a056e02304700b0035fe963b990mr3208921ilb.54.1703445500716; 
 Sun, 24 Dec 2023 11:18:20 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 s2-20020a170902c64200b001d075e847d5sm6876730pls.44.2023.12.24.11.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Dec 2023 11:18:20 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 12:18:16 -0700
Message-ID: <20231224191817.9599-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703445500; x=1704050300;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1Ob6XItRA2V/TAElgL7NCs8Kj2KcNRypaGY7SgLFNE4=;
 b=Dh44C6a7f/oYAg9QapySz+sUFnrB9rtq9flutyHLGw+IrIdh6rE2MiiZNtf7r6/rJs
 izGHyJCW3SUGfrgo2tH5qsylHSy8KA51P+g5Qr4HyUOVL0rgeNyh+vURJiWAL4QL97Tz
 sY24TFSn+JsnYAdQn5/4nPtxYryLQXBXiWxzs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Dh44C6a7
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: remove aduskett@gmail.com
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

I will only be supporting Buildroot in a professional capacity from now on.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9492ebe79b..7a00b6c2da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -26,11 +26,6 @@
 #   infrastructure, and will be CC'ed on all patches that add or
 #   modify packages that use this infrastructure.
 
-N:	Adam Duskett <aduskett@gmail.com>
-F:	package/firewalld/
-F:	package/vulkan-loader/
-F:	package/vulkan-tools/
-
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
 F:	package/dmenu-wayland/
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
