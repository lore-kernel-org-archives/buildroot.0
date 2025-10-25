Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C972CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 07:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83FFF81414;
	Sat, 25 Oct 2025 07:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VamSpkrMi7ZE; Sat, 25 Oct 2025 07:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39FB810FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39FB810FD;
	Sat, 25 Oct 2025 07:05:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 69B5E976
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 582CF40A44
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtkdT5CMqq25 for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 07:05:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AEEF40A40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AEEF40A40
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AEEF40A40
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 07:05:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf49.dip0.t-ipconnect.de [79.214.207.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD7E2A4C33E8
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 09:05:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34870)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCYL3-000000000jO-44iH
 for buildroot@buildroot.org; Sat, 25 Oct 2025 07:05:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 09:05:21 +0200
Message-ID: <20251025070521.3338270-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761375922;
 bh=aLrKmgDCfG4BjtGR5DNCxgeGfR/sIdWisIBSTwimxUk=;
 h=From:To:Subject:Date:From;
 b=1Ev7L39Fj+ZmBLHg63ki8NkS1CXJd6q+voyIsQCeK1/tqehgimRhBgelKDyqxdX8S
 xqizkEqfLvNUiIdOGYUokBWgyxUgmH3EgRw7GSG992XsQHH8nziO8bcw+GXTJEJHIJ
 zD4u1JjizRgB/SqzIw7vNZFEKNjX0dysZ/wKHwW2h+yHNoAGzR7RnFRS03WTqFmU2B
 GlHzHTjWed5QBxGH3egoJepyWQtghg4SDGEQhx89kruV44R/klPcxVvkPiPaOsizn6
 NLOjGj1W8JZesJ4fnCkmoQ7XPmcChmz9RykB4w639DXXYx7hpewuFXsVncLBv0peBu
 N7FXixYjdnI8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=1Ev7L39F
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 17}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7fb0e2aa64..541b7f3613 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5ea815260d..8666a82015 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  010a12296e6fba7597ff36681be2485fd3b1780ac8fd9e6a9f3cfe193f0491db  linux-6.17.4.tar.xz
-sha256  1b0dcd3390efeec44e528748609bafcf36eae895bb68c8f62ac5e5940943de62  linux-6.12.54.tar.xz
-sha256  1f95cfd2e461d192dd9c6130e47aefc9856529a74ace4191ad8e56ba1849c41e  linux-6.6.113.tar.xz
+sha256  c05faf36e9c2164be723cf6ada8533788804d48f9dd2fe1be2ccee3616a92bce  linux-6.17.5.tar.xz
+sha256  328f8f4608a653063a5fd82d29b17163faab2825fa419fa85b961740a342fb9f  linux-6.12.55.tar.xz
+sha256  ca4175a03ce2943ae192d77ad91e37ee292f1f1bb7b2954b062b0ef7eb0cb97c  linux-6.6.114.tar.xz
 sha256  a0a184e10221afcce4e87fcbec6af2ae9f63f64ad1985aa61e80c9596696f66e  linux-6.1.157.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  23d080dc32f99d3939c3d1bd65a68ed85b8f934f92cc1841a63f898dcdb9a441  linux-5.15.195.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd59e0c056..7281b13d40 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,9 +462,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.113"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.54"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.4"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.114"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.55"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.5"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
