Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ABAC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450E160A9A;
	Sat, 13 Jan 2024 20:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 450E160A9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sgLCH-uY-zew; Sat, 13 Jan 2024 20:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7E460AD4;
	Sat, 13 Jan 2024 20:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7E460AD4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A2F81BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D60468394A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D60468394A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pmtwvzz6xhtn for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:29 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D230839B8
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D230839B8
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5ce74ea4bf2so4881224a12.0
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177228; x=1705782028;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lCmBUy0jU0zXNqI1+qnYtugp4vQHLgvT/WGChrvWbTk=;
 b=UauA0zgezjKqrAmSL5IjWixw9LI/PzXB46sRQ7F5mCu8CHy6o+TTN4KWVEdCiBkXeL
 5TKoEXM2qcMyUwM/eQ/JsjYICWAKFeMHcNnuLZs+t5PYwYUwH6lpHcwMLYsbKWK1yKb2
 3n0V6Z3tiSsDhfPexqgZDqYFFOWH1MlAuK1poF8Jd7KUzY7hOUnuo8lNbboAMnBtL2/v
 03tTqwAI9toK5t+6tH3Tspqfd17rmQfUsFc/siedU/psBGsbOhMh3NYGVn8JRLoL5zBd
 f8o5uF+uTaJDRA4uIou8K6E0uzS+jmqtTN97AI37zGbKSc0bhXwLW3R1VAJOSo02i6UC
 JAfA==
X-Gm-Message-State: AOJu0Yz69tHguS1kLXgZNa0DKzyXnSi5Sxy2bmlCz2qbL8DoPw6E5EFU
 Mc/u9J3/jBVHpFMeVze+rzq4F/wKY5mZPmsuBC8JN6eZscM=
X-Google-Smtp-Source: AGHT+IGSVSPBuQUt4HqCxqA65ZkN+Hkhyke3Piteyy6MkamAdpTWuYwS/g1Ln6VK2ocugqqONHFKDw==
X-Received: by 2002:a05:6a20:320d:b0:199:a2eb:ee7b with SMTP id
 hl13-20020a056a20320d00b00199a2ebee7bmr4003881pzc.51.1705177228368; 
 Sat, 13 Jan 2024 12:20:28 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:27 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:14 -0700
Message-ID: <20240113202020.21747-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177228; x=1705782028;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lCmBUy0jU0zXNqI1+qnYtugp4vQHLgvT/WGChrvWbTk=;
 b=MKma3LPwi6PKV412sdcXOAxQr0wc30NsuZxcxAjiMh2LU0XdYydrJML6kqL6DsbqHT
 6xA+k7brZS9vFvL0h+kQgxXio2c/xmOouhKxsin7s5ubf30LQ91Tc/wWuX8irkO5h6KP
 Y/q/UPkJTr8cR+6MUwDpRHV+k1HubBB3ZP5Eg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MKma3LPw
Subject: [Buildroot] [PATCH v2 04/10] package/flutter-sdk-bin: bump version
 to 3.16.7
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
v1 -> v2: Bump to 3.16.7

 package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
 package/flutter-sdk-bin/flutter-sdk-bin.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
index f0a855f2c9..84a7300753 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29  flutter_linux_3.16.5-stable.tar.xz
+sha256  a10061a15f7a829337c284474b9703635350f8abeec4922534c8363816fd5eb4  flutter_linux_3.16.7-stable.tar.xz
 sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
index 5e5042bea8..760a603eb8 100644
--- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
+++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUTTER_SDK_BIN_VERSION = 3.16.5
+FLUTTER_SDK_BIN_VERSION = 3.16.7
 FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
 FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
 FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
