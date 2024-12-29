Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC93E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84ECE80B25;
	Sun, 29 Dec 2024 17:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ExYLUWnjbDf5; Sun, 29 Dec 2024 17:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B80580D8A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B80580D8A;
	Sun, 29 Dec 2024 17:06:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C70E72
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F7F780D93
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dcEGOhqBYB6j for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 17:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1985880AD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1985880AD5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1985880AD5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 17:06:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c38e.dip0.t-ipconnect.de [79.214.195.142])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7506BA4C4149
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 18:06:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56720)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tRwkR-000000003zh-3CoD
 for buildroot@buildroot.org; Sun, 29 Dec 2024 17:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 18:06:39 +0100
Message-Id: <20241229170639.1307928-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1735492000;
 bh=BgomBj9uFm7G2BAD46Ik+wXsSrS2uOH8GcxRVPIYK38=;
 h=From:To:Subject:Date:From;
 b=RvJG6N3pm255dA7G3ZBkoXdnj55KA5KqYkAQLvoJcgFSMqqgKSnmL9BptT1HA0R1M
 7qWs8GNOVSXK3gqEy29IVJ8iPO2Zy7XNGb/SdIjH8qcE5hPScBAeRjemWHSkiU1KR4
 cWkW5SgpEn9RyCnjTbOfgs8zj+ClLnQ406v4OIDru9AgWjdubY4fSfAPIePrCdN7wE
 8XbPjJw6RbqiqdelpSGItF3daCa2aNrracnHHrYmuQP4AmNu0OOx9dcMm3lWr+nGLi
 GAdrjWGA46ItCRo5d+UjRawnK8mNenF4qhWBzNWYBgnSo+hRpUUdyABN9AWqkFjvyO
 JhPuywObaN4wA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=RvJG6N3p
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
index be44c00d7d..5d348693c2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ccf6235166..6301673e07 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
-sha256  9d757937c4661c2f512c62641b74ef74eff9bb13dc5dbcbaaa108c21152f1e52  linux-6.6.66.tar.xz
-sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
+sha256  f785fb648a0e0b66a943bb3228a4b6ed62c90b985cd1ebf69da5d38e589da0cf  linux-6.12.7.tar.xz
+sha256  283ff410e3f352ceed161ae30c0020301326059db03e86efcb384d46ac5840e2  linux-6.6.68.tar.xz
+sha256  e892c0b380100b7e6249060282ad07fbded092f0a2ca1d647243d0fbe9ce6e50  linux-6.1.122.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c3e63cb864a05b6bbc886613c9e91714106b7a9ab40c31c101da0ca5b64d760a  linux-5.15.174.tar.xz
-sha256  565a4883cc460af9f338966fca51a84bcba13dc7e47a563e32639115cba79675  linux-5.10.231.tar.xz
-sha256  0d0ffae5bf0e6f9c6a1ce42da2bc2a8696ca55721c103497eb1245be8cc04b20  linux-5.4.287.tar.xz
+sha256  8fd8bbc80e7aae30aaca3b40576b283010b5e84e70f6fea1573589155ce8a9d0  linux-5.15.175.tar.xz
+sha256  fda44589a438dff8c718082e9a48843b15e5eb82f6cc2f98d48f48226063bef0  linux-5.10.232.tar.xz
+sha256  876fbae303723bcf9e01ab57b1a0a7d38045aacd481ff865dccc2cc89f591afe  linux-5.4.288.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c1bcdf1611..7878872f37 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.287"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.231"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.174"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.120"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.66"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.5"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.288"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.232"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.175"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.122"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.68"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.7"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
