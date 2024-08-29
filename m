Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B80EC87FCD
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 17:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F409541A20;
	Thu, 29 Aug 2024 17:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ll42hWYFjAxd; Thu, 29 Aug 2024 17:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99E6141A5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E6141A5B;
	Thu, 29 Aug 2024 17:21:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9791BF28B
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 17:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C6EF81E82
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 17:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcUhYnht0G2K for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 17:21:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CF56D81E7D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF56D81E7D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF56D81E7D
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 17:21:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf8c.dip0.t-ipconnect.de [84.161.191.140])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0160CA4C0AD5
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 19:20:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41550)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sjipN-000000004M0-0fkp
 for buildroot@buildroot.org; Thu, 29 Aug 2024 17:20:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 19:20:57 +0200
Message-Id: <20240829172057.3504356-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1724952058;
 bh=utJxBkm6SIr7VJZOzzWXcZ3VP6Wj4DBIq+Sc7n1981A=;
 h=From:To:Subject:Date:From;
 b=vXiFKFCc9L+mbH2auQ6EwzRD1b+zM0ptYSHgNl3PZV3QoW6FBN8vWrW3fH/n35Xh0
 xWeLFa27y5kFyif0sLgxczS2ruhmx2gvpYNyJksKBOww9U8gfPwbuK4O6mEc7uF/f5
 a+BDkAxgYs0WhydZ3rX9DPDM5ffwdGJjwLzvadbx/O4HhWZ7hRruKZErGrD4XSrCKz
 tlByKZ224R8QT/yKfljgOFZmR7brKFneZipjDItr4g8ODMd+ii4bzzd2YtV2BejOWU
 K31fRKCRM0YsYCEnoQLsFgTAwXXkBewDPFBMHZvF/MYy3SESExwFuETLehiBnf3XyL
 ukHUEWD9RcQmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=vXiFKFCc
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
 10}.x series
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
index eab5cb8511..526dd9ff00 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e8a9e0f0eb..ebaad029b8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e0d50d5b74f8599375660e79f187af7493864dba5ff6671b14983376a070b3d1  linux-6.10.6.tar.xz
-sha256  d43376c9e9eaa92bb1b926054bd160d329c58a62d64bd65fe1222c11c6564f50  linux-6.6.47.tar.xz
-sha256  3773c9052c7ba7432e8337ca84bee115c1a94ccef9d62b72b99ae30c4cd5f80f  linux-6.1.106.tar.xz
+sha256  900d567ff01824708ce24c3b37faaef03e6f6145411dd447a6ff2edc8c5db3a9  linux-6.10.7.tar.xz
+sha256  6b16df7b2aba3116b78fdfd8aea0b6cd7abe8f0cb699b04a66d3169141772029  linux-6.6.48.tar.xz
+sha256  f43229d1d73011fa0a37400320a26972946f8ff295c404c31c0dd0407228b0e8  linux-6.1.107.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  a36dd3e82ceb634afded31f2656568f57c4d9c4b399859f298b18116df11c6fe  linux-5.15.165.tar.xz
 sha256  19b099c67324bba6378e22dc51ad3906e4dcd6a908d137766b4bfa9174ddd11a  linux-5.10.224.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 934f427e4e..51706f582a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -427,9 +427,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.282"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.224"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.165"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.106"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.47"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.6"	if BR2_KERNEL_HEADERS_6_10
+	default "6.1.107"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.48"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.7"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
