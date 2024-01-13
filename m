Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5828C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599FC60B4C;
	Sat, 13 Jan 2024 20:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599FC60B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqgF_OK-DWH1; Sat, 13 Jan 2024 20:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6C7760EEC;
	Sat, 13 Jan 2024 20:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6C7760EEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E368D1BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9E6F83AA6
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9E6F83AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gyIzwG2W4OCu for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:32 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A9978394A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A9978394A
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6daf9d5f111so5975358b3a.0
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177230; x=1705782030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2CUbcaSE7M3rM3+0A86U2DtUq3oooDsiyvarm5iLFE=;
 b=aHRm1+beQvcFSgx9Dqa/3PSBRElN6wpHUGKePEXN2OQQ6cxR469jqfOu/FC0VN3irc
 goLhpV4wMT/7JOnOGWrgGun5+DfRTITcWBHq7ftVPNcKeicTVS5Uv0qjO4kiR2RTG3rL
 uoFKWMN9lgMOEcOScFWx03rA/TOi2apeZCASScVbljpD+PGXYcUtbs671ciaonnqGfih
 FDiL+J7JfQC8DFQalKzN3kvu7fJeZmhQmOp4kTcOegOIUWjaDz7V43mZRsMj1UJDTNYT
 vJEjmzYRUyyKzNiQc+a4qbsPDRBGkbxhPnhq50zLVsrQVlowB1YBoUND5FO3vXVIgGTj
 aVlw==
X-Gm-Message-State: AOJu0Yy5vVjl1oxWTGZNo+X8HB0pwSVMl74cCCTXEy9PJx8txltm5I5i
 +add1crTWmuJ/16Zui9Y2Spqq0W/XcCwWhjW/Ly+TjQQJMk=
X-Google-Smtp-Source: AGHT+IGC1zOlDhbEt2NT8wAFZl3C5XW2rIklVEWjDnxVkCWOxt/usGbwR3ZfCAMoOHOE83hZfqGS+Q==
X-Received: by 2002:a05:6a20:8585:b0:19a:4353:a0c0 with SMTP id
 s5-20020a056a20858500b0019a4353a0c0mr2425521pzd.67.1705177230622; 
 Sat, 13 Jan 2024 12:20:30 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:30 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:16 -0700
Message-ID: <20240113202020.21747-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177230; x=1705782030;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2CUbcaSE7M3rM3+0A86U2DtUq3oooDsiyvarm5iLFE=;
 b=lZktKEHxE3dQbEexwQnUndnAeBTwbYr06yX7i5EYyMIYJIpHKBjuvIf8d3HfhofZQe
 yQAWyKPBR2Lrf2m9CEIC8bglE22MW0HHYKguR27zfPYorrEkKuxjLTe8o4pvh9b8wnW1
 UPqGMlmtm4CL6fioL/VIzt9yDZNJyAoqKRf0Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lZktKEHx
Subject: [Buildroot] [PATCH v2 06/10] package/flutter-pi: bump version to
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
