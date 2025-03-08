Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CED3C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 10:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32C1880D3B;
	Sat,  8 Mar 2025 10:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1gf5CRd-NZp; Sat,  8 Mar 2025 10:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FE3384033
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FE3384033;
	Sat,  8 Mar 2025 10:04:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E19E26
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 10:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4036402F3
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 10:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7MYZp26C252 for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 10:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AAED4022A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AAED4022A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AAED4022A
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 10:03:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c397.dip0.t-ipconnect.de [79.214.195.151])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FF21A4C17F0
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:03:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36048)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tqr2B-000000007yD-02Nz
 for buildroot@buildroot.org; Sat, 08 Mar 2025 10:03:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Mar 2025 11:03:55 +0100
Message-Id: <20250308100355.3345292-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1741428236;
 bh=9JGBI/neGtEcEwsD+EkDyaRN+fzRw2dJoxc9bnC1ohE=;
 h=From:To:Subject:Date:From;
 b=kEQMS4BR3Go6DrTw9k2GHDpo0owsYzFFXc44/9vlMuOIeLR+VT+PbThUXL1c6dg/k
 F8n235hzk7FrrcBT1La1BLnlmyIcf6EIJC4AD45iLbCaiWcM5UtiOikmbh5YvY0td9
 P0GnDL8o2AEK+eQcQp4iPwEoeKbX9zb9I1hbH4RGqXxyCAzJ+doM41tTFlYluToeKb
 5Wyj4xQ/Z/wvyjaEJybwX3mN6XsVzEHVNCPobejaSoUjfHLiK6MPbYj3tHlKgJLOIa
 8FlQO+EmGm/YWRUnQVXr7D4JxXQsXE2pJDX0/zI75LuJSInbTgW40mReNlAbah3E/h
 Ir+/ALVAhKTWA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=kEQMS4BR
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
 12}.x series
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
index ad9bb57439..ac7b054d0b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.17" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a229630aba..8d24138c9f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5c205cd34f80974e4973e321cb008f5f6895a8aa8c2577f06a9448cd77de63b3  linux-6.12.17.tar.xz
-sha256  6cf911d01324f45c9dd2f44cf06f55bda0ecf383bc498f132a0c549768531327  linux-6.6.80.tar.xz
-sha256  9d63e3bfde75a44a99e18812b002e5e5c0797b4eb3db408a7a9225c2c719b52b  linux-6.1.129.tar.xz
+sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
+sha256  af483828e67f1b9918bc438d789cdbb06c13a4d43a41d5f35d44c9a6d620318f  linux-6.6.81.tar.xz
+sha256  9416b2c2d448ec7f54bb0ce5713fb34c32dae4a4edf1abd8cf7a8995cbac66fd  linux-6.1.130.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
 sha256  9597c4fee2f1ce452acfec516f4325ad342155872052fd5f0d9ce2ddcc26ebe5  linux-5.10.234.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 54d5720af2..2fb661a59b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,9 +431,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.290"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.129"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.80"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.17"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.130"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.81"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.18"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
