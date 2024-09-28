Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F2BCF6493
	for <buildroot@archiver.kernel.org>; Sat, 28 Sep 2024 06:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E740605F1;
	Sat, 28 Sep 2024 06:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SGd0OiQY164B; Sat, 28 Sep 2024 06:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C4AC605F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C4AC605F5;
	Sat, 28 Sep 2024 06:42:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 923AD1BF304
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 06:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 806BC4014B
 for <buildroot@lists.busybox.net>; Sat, 28 Sep 2024 06:42:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX_VfuYJJ3Bg for <buildroot@lists.busybox.net>;
 Sat, 28 Sep 2024 06:42:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46BD14012D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46BD14012D
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46BD14012D
 for <buildroot@buildroot.org>; Sat, 28 Sep 2024 06:42:25 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f77be8ffecso31095141fa.1
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 23:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727505743; x=1728110543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qji6izlfMH4nMyj+dMk1qyqXz4Lih/rLFnoCydJd2F8=;
 b=CAirD3j1c34gniVXYeKeQEKrO8k8gMj5Fdxov65nkd88PnBTHoTISo00D9mRmlEc2i
 F5EyZ3vNrJSNtDr0o6jF+m9VdeGhfV8AHg/0ZYgZrBCXk1MGsmKn2ZJ+B6uNxIkzIFc9
 j5vUcHiQEliTCHWUUVmSFbPg/tikFAifEQwxd7SVED+1P0en6t5+y9zUJc7FNREnmnow
 Z2h6HPCgzegJ8nyTfs0tVhRfNR/YuvIBsgSKjKhDNM6xKb601orE1yw2K+m44aD+Ic93
 Ujh/xSdRzlcN+ROEZG8+0kWPyWgr4CeVgRvxItZvPnDHSrtYnQs2aBBbrZcZ7fqt+ThZ
 banw==
X-Gm-Message-State: AOJu0YwcH87zmMulIWyMstH7FsqbCKHA73PKlUbbuleFxbPjGDKPS4Jt
 v0QNSyd8DO45m243OBYkDM8UvNQu5Ff9KVIps58dhBrg7NajddqlXEQrbA==
X-Google-Smtp-Source: AGHT+IGvD4lE0TGzp309VIEF9gbcvT5E4zyGrtSCjL9hm+kDADdSdTVk6hix9cSxvtxDcwIMB7FnNQ==
X-Received: by 2002:a2e:a58d:0:b0:2ef:2555:e52f with SMTP id
 38308e7fff4ca-2f9d41978f7mr34763611fa.35.1727505742414; 
 Fri, 27 Sep 2024 23:42:22 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f9d45e1972sm5895121fa.58.2024.09.27.23.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 23:42:20 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Sep 2024 08:42:15 +0200
Message-ID: <20240928064217.1047737-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727505743; x=1728110543; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qji6izlfMH4nMyj+dMk1qyqXz4Lih/rLFnoCydJd2F8=;
 b=RTLS4fmcOCngMCmg/QU65YPOUWNiFF5WIoZoBkppyCOKU93Aa21WMbNQ11u9hF/gVG
 VHpOGBh8DfMUy8ZKU62kLO8U0XlYboketZsQ8dPyZV4Xa9x97/CVKeNkFXqCFIHBy81N
 KG+ftejED9mL4N2J3UOArzbDyBb28lJpGf95y0jLDqVWOnbke8eKYMP4T2mG8kIMX4EF
 9laBQDg4dLl0MxpFNFIgc716mrexZ0tyUvD20U/mXhXAnQ6gkCl8uAIs+c68LXk+Keh5
 Vo1ClWFqBUYydjGpIsiCWIw/U1iTXqLZl43o7ieL9PTK/M2Tdo8blcEiArjzUSKfY3TH
 r7iQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RTLS4fmc
Subject: [Buildroot] [PATCH v3] package/dlib: add missing dependency on wchar
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

Changes v2 -> v3:
  - that did not work, so add space between Fixes and Signed-off-by

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
