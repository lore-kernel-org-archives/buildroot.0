Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC41E6ADEF
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 10:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E0C42D45;
	Sat, 23 Nov 2024 10:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id McxKEUfbqDBQ; Sat, 23 Nov 2024 10:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2238642D38
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2238642D38;
	Sat, 23 Nov 2024 10:24:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EAEAE11
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D1A16148F
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjkT_HNYFzvK for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 10:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D8E6860A5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8E6860A5B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8E6860A5B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 10:24:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cdd1.dip0.t-ipconnect.de [79.214.205.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0334A4C33C3
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 11:24:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60198)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tEnJX-000000000up-00Gl
 for buildroot@buildroot.org; Sat, 23 Nov 2024 10:24:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 11:24:30 +0100
Message-Id: <20241123102430.34661-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1732357471;
 bh=qFaoK4IlpE+krvWVWPq6bHOFGGF52QZ99svSotzcVq8=;
 h=From:To:Subject:Date:From;
 b=JiOTY0y8PsU57Kk/4gT7Kwq4IkbRDlimV1xlu7aI102AhBgDnJ9U4iRPi6lAOxKOy
 3FWoNhKRR3cbOZhh0Rm9oVCMsS/f2tWgsdIWxskehwIDH2ukGnC5MZOA0+QDb4qdxV
 ZgGLohpD6RJa3zFJfKoPbmqM39kAYJxcx037bSVhd2dXbqCytJmFeKGPeDR7ZGkszQ
 BnOr/eHYQozt7YDtaQlD0Pa9ZfouwBdW4HrH60+PQUgNnG1VIoWKnbLlCwxP60B8xv
 fMF7+ceqWMq4yK9SPDwmK+WZJkeYLFBPcESTZTc7oJILZwu3MTYb7y6o/SzxKlu8Rt
 3D3zh6NQHjccg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=JiOTY0y8
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
 11}.x series
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
index 62f0b06d7b..92aeda5e6f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 07c1ce7e4f..0135a14119 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  75658a7aa3bd9598c96ee1e5862c5e1d34fced75c28d825c727a1510a6f384b4  linux-6.11.9.tar.xz
-sha256  e2c35611775534941b9d4dd871f3ae5b988b6594dc9033b5ca784366e07d9336  linux-6.6.62.tar.xz
-sha256  010784bd7161c32c4cd68a423d4dcb14e4587677d238b2825a31fe012869224c  linux-6.1.118.tar.xz
+sha256  4bc184915290629d61f935aa1eb1b6e711b8e47d8f289a39f0d584ecbdb4fe77  linux-6.11.10.tar.xz
+sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
+sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
 sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f74802adc9..9cf31c484d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,9 +432,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.118"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.62"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.9"	if BR2_KERNEL_HEADERS_6_11
+	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.10"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
