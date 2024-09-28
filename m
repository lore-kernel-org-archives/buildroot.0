Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5878ACF6493
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 06:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0047F6060B;
	Sat, 28 Sep 2024 06:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b93SUaF1DSuI; Sat, 28 Sep 2024 06:39:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05D4D6061B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05D4D6061B;
	Sat, 28 Sep 2024 06:39:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0B5B1BF304
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 06:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAAAE81768
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 06:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dOYTj71h9V2a for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 06:39:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD92A81766
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD92A81766
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD92A81766
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 06:39:18 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5367ae52a01so3261239e87.3
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 23:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727505556; x=1728110356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=09wk9sTO1/1rP03NZo2d8yixue14DuOP+wVNGiRjpOs=;
 b=EN8S+xydLSdKPjWyC1w81vjRqxyHkUD1tBpgykTTJBvUXy8FOkHQVK7ofZUldfzR5L
 imMcBckw1xf4xF6o/CUtP8TcjGarHraK+qli4uR1++6jdYIrj+P8Uh567sgERCMKDg4s
 pbvBxRO5XVz0tTlpdm9myRLqZKvUXICE7k5L1yqmBGBUSmqHIDUhZjSQgZ9d8AL4IzVL
 5oov7Gii+DxY6OXODRmC4Dv5x5qBTkWnibrwDyzAkASj7e9Vwsip0SsQdTY7Dmpbv3cT
 43rSjxrVdov1llbdNfKh7fQdRPAqQm7Ko/zy/8SV7GkVRIkbGUcbkq0Y68FzE9g3AfTl
 wdvA==
X-Gm-Message-State: AOJu0Ywcqt8Ix5n8Qr4SDbWs/3V4EQ78KFLV4T8SaoxQJHUhJ1dxEAn6
 1oxiaZgXY+Hz4CbI7nSKfV4tPxEt3LuhOcbLVPvcAcYFHBOAmOAkNFZXNA==
X-Google-Smtp-Source: AGHT+IHw4S861eHvW87/ipXQiyyWlRAMmR0ta7ce7V2JHKrfLi1NMOHiEutjQUI69VnXzftQcTZSVw==
X-Received: by 2002:a05:6512:448a:b0:539:8d9b:b624 with SMTP id
 2adb3069b0e04-5398d9bb6bdmr335833e87.55.1727505555293; 
 Fri, 27 Sep 2024 23:39:15 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0439898sm549820e87.186.2024.09.27.23.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 23:39:14 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Sep 2024 08:39:09 +0200
Message-ID: <20240928063911.1045471-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727505556; x=1728110356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=09wk9sTO1/1rP03NZo2d8yixue14DuOP+wVNGiRjpOs=;
 b=GBStCKKYoI1eRh8O9MYv2J6ULPCnP1utyNfc9ViBpQgRQe3/rvIX5+kqZcuHCRTEPB
 H9MVyVdHH7y3POm0CHLhT8tK55SfUiUidAu/51nfyYX1FPOXVKg97QOkR8cdmHzU5ng+
 BWUulSJ/m8D6XoC2+g9pqWpBJGe1u4XHmkIzTenqBTpv8TCWalYnrQAPO/qSJc1VkRpY
 8i6ezMyteh/GuVaPh+dg5L4s7qFlO4q0koWxek+7LyLSPd7ThbZ3ApIJWLGuOwbZNoaA
 6vz49dj145TSgpoYb6h0AdlU3LFksiVttuYlt8jY/DQh8yeNDeMXfpkPYiXbq128uSMW
 OFBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GBStCKKY
Subject: [Buildroot] [PATCH v2] package/dlib: add missing dependency on wchar
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
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes: https://autobuild.buildroot.org/results/f5c543bcf57181373680d0c16a1814d21b000bcf
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v1 -> v2:
  - remove slash in autobuild url to fix link in gmail

 package/dlib/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dlib/Config.in b/package/dlib/Config.in
index 2419af967b..7862f8d074 100644
--- a/package/dlib/Config.in
+++ b/package/dlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_DLIB
 	bool "dlib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	help
 	  Dlib is a modern C++ toolkit containing machine learning
 	  algorithms and tools for creating complex software in C++ to
@@ -9,6 +10,7 @@ config BR2_PACKAGE_DLIB
 
 	  http://dlib.net
 
-comment "dlib needs a toolchain w/ C++, threads"
+comment "dlib needs a toolchain w/ C++, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
