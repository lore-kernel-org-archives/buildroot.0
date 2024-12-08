Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E8DE7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 21:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7F65606B1;
	Sun,  8 Dec 2024 21:48:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hYyD8JXLSCK; Sun,  8 Dec 2024 21:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA9E60609
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAA9E60609;
	Sun,  8 Dec 2024 21:48:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E99A9ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF7A280E0E
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLpSnbNg21K7 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 21:48:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6320A80DAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6320A80DAE
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6320A80DAE
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so577407e87.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 13:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733694492; x=1734299292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/eedltY4be4DVeyQ4cuxsFEwcL+B5fKX5r7+WgNs2s=;
 b=paWiMWiJUhc9XVO4RBSyxNzhZEjg41xy7tSGsBb7JTWuVodz0+/g2BjtOfxvlzVAH2
 tKCjuqk55JPZjTB/DBcs4KB7GHiyE3JITaE3sMhi+NLFht0RR/NsZhczQzzYp0RlV0nm
 aYedmz2OjZ2ljbbieKkfvzG91mS2OpmKOvBp5XVTvBxVQJLW4cZYqySWBDIYlPjW3rY4
 gXdBWNPPNW7O397asL1ihRdWaEmKLTlQwhsJVqrCkaDR76NSczhY8HvvuWF3sQ0lmb+4
 nNfqY2ljs9AkpFeKo5kVY839tYUsop4S1W3pSmRIoffFV9DBIJr2SbXAt7oYNUgD8aMh
 0i+Q==
X-Gm-Message-State: AOJu0YxntCZLpuv9z6vpvyOcQoZoHXBzVtFJ3MVjHPKzb47exx4mx30h
 zNDkacCP52SBXfhwrGkWcSFDkDSo8g+V1aPGbqqlKZqGRKhaYjAPAI+XyQ==
X-Gm-Gg: ASbGnct0cATB/CQsrFxDSOxIUXPyCQ2crMMhRG7nBis8S7CcVI3RIT3ldGYofLUc7fV
 Di5im3zBR95DMnbngk6TSUQNvK8W+0HzTciYuTfTt9FZq/rD1OFPOiyRUJ6EYhoUoBY7hmdG+qH
 SWnXUXYK8wMHTs3JowKaZahVnbkQXLGRIJjPDYJfORD51c5VBELQSW3eXa6omW/OQF1HSWL4C69
 3bUZMKphdi9Ne/dOqL98KGovYjAvemH5Zzyq+wt39of9R7bMDcFsvFahlJh
X-Google-Smtp-Source: AGHT+IEltLbxuZhszL0jy27QnagabXzr5Ac/0IrB3faPZ9/fMFLqmYl5pd0PiZU8GRM4UwSp0kji2g==
X-Received: by 2002:a05:6512:61b:b0:53e:3a73:d05a with SMTP id
 2adb3069b0e04-53e3a73d106mr1567757e87.55.1733694491999; 
 Sun, 08 Dec 2024 13:48:11 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54020798a43sm49328e87.12.2024.12.08.13.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 13:48:10 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  9 Dec 2024 00:46:19 +0300
Message-ID: <20241208214748.524923-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241208214748.524923-1-geomatsi@gmail.com>
References: <20241208214748.524923-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733694492; x=1734299292; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/eedltY4be4DVeyQ4cuxsFEwcL+B5fKX5r7+WgNs2s=;
 b=iP6s2yuLA/G42EotFey4quk8g9OmooMDk/V77LhjONsEb7RP3jsiKo9NHnPw2qwFZa
 7JmdG+l1A2JyWCU4AeKkj46+OQmZLYz0gCHk7vmngJCbygnIIev25jZZtStfweyRiuCZ
 WW5uNpgccpAvI/v6tZ6gCRqKdaUHjyitaR/06dJ/IWcgxpmcSpAQhvF53tK7+Y6LF1Fq
 UG3o5Tbe/2NXDPraNnOiMVHL6okDvxFHz7S0/dtvYhl3hDRuJI2npr2lWuBUNRSOednx
 wGROgl9ipwNMUma0kh3dzBx6ahpMAC5QwmOgXJlWdMRXXR5bf1Xmk8tSN3TV++IAcdCC
 IyaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iP6s2yuL
Subject: [Buildroot] [PATCH 3/3] package/linux-headers: drop 6.11.x option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The 6.11.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2ef1e19516..56b8d407ee 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_KERNEL_HEADERS_6_11
+	bool "kernel headers version 6.11.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.11.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_FCONFIG
 	bool "fconfig has been removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 67bdc32372..d37188b4b2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
-sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
 sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
 sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0b517534c7..826320c96e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_6
 	bool "Linux 6.6.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
 
-config BR2_KERNEL_HEADERS_6_11
-	bool "Linux 6.11.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_11
-
 config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
@@ -442,7 +438,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
 	default "6.12.3"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
