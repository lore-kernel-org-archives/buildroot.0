Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF77E7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 22:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 118CF60BB1;
	Thu,  9 Jan 2025 22:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OO2rhW1d4OPy; Thu,  9 Jan 2025 22:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AAE560B9C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AAE560B9C;
	Thu,  9 Jan 2025 22:11:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E7FC940
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B5FD8376E
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 22:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElzaI0HA8f6c for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 22:11:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5A71883750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A71883750
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A71883750
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 22:11:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a4b.dip0.t-ipconnect.de [91.58.10.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 413A0A4C43A0
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 23:11:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46522)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tW0kH-000000007a5-0HU5
 for buildroot@buildroot.org; Thu, 09 Jan 2025 22:11:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 23:11:16 +0100
Message-Id: <20250109221116.3611958-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1736460682;
 bh=8oOVzscT202bpCf1IsJmXQL0NpN2eZMPtJ+qGtCxCrQ=;
 h=From:To:Subject:Date:From;
 b=l7vogv3HEdIWOowwuwxZGOy+2JLecwqz3TXgC5hjRZYCSOYevTwgMYwBf+Fnz6AXQ
 nH/EdVCsP4Aa3z/JLdVKUAvvs0qNTa6lSRDeKcBa/8veObP/xwGAtSIJFsD5TI0wRQ
 SDxnh+vUIynB6fs7H458IXFFfudDmNwNnvoh53YMGRSr9EkcHsziBbsUKx+5B/3St5
 1E0OEMvhYD4XMtEIv9m8kFJedzkwTKkFOicVBWcSO7E2eMhyibwd1ihE5u+p5ZvOcb
 5TEoCg+msVxkI2ldV0Q1hFqdolTTnkEqBTbNtSQZ7RTXqVAApfGtRia57J5+HbO+zO
 3O+xVET1EAAtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=l7vogv3H
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12}.x series
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
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 98db89f8ab..aec6da6f7a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6301673e07..05c7e803d3 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f785fb648a0e0b66a943bb3228a4b6ed62c90b985cd1ebf69da5d38e589da0cf  linux-6.12.7.tar.xz
-sha256  283ff410e3f352ceed161ae30c0020301326059db03e86efcb384d46ac5840e2  linux-6.6.68.tar.xz
-sha256  e892c0b380100b7e6249060282ad07fbded092f0a2ca1d647243d0fbe9ce6e50  linux-6.1.122.tar.xz
+sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
+sha256  84d23ee07fb26febbcb6d1295ba15efdc67ac382b4137b2c8853146c10fd2f97  linux-6.6.70.tar.xz
+sha256  ff4ef6d5cc626faa81fc6da7b5270de064924c919be460f114e6ad8cb9589827  linux-6.1.124.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  8fd8bbc80e7aae30aaca3b40576b283010b5e84e70f6fea1573589155ce8a9d0  linux-5.15.175.tar.xz
-sha256  fda44589a438dff8c718082e9a48843b15e5eb82f6cc2f98d48f48226063bef0  linux-5.10.232.tar.xz
-sha256  876fbae303723bcf9e01ab57b1a0a7d38045aacd481ff865dccc2cc89f591afe  linux-5.4.288.tar.xz
+sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
+sha256  239e57280f8c9159187e383d7b730d29f5cc8e1b30be218f004e0c90d1137f52  linux-5.10.233.tar.xz
+sha256  1e3e5fc052c8e15f8eaa37d30bf4f0b3eef7430dd234d9fed0d0005852a06d10  linux-5.4.289.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7878872f37..b0b0e73e66 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.288"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.232"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.175"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.122"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.68"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.7"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.289"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.233"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.176"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.124"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.70"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.9"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
