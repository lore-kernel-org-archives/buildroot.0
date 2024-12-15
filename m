Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F4FE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 17:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C847840CD;
	Sun, 15 Dec 2024 17:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eDRwrdi5TV8G; Sun, 15 Dec 2024 17:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B3D840CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B3D840CE;
	Sun, 15 Dec 2024 17:51:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38C76D1
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31FA7406B8
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tuHMpALLHxrg for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 17:51:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9803440688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9803440688
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9803440688
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:51:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be30.dip0.t-ipconnect.de [84.161.190.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 964B6A4C3D6C
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 18:51:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53104)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMsmN-000000005zU-311X
 for buildroot@buildroot.org; Sun, 15 Dec 2024 17:51:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Dec 2024 18:51:43 +0100
Message-Id: <20241215175143.945977-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734285105;
 bh=sb7MYrXgzTBH9/9M/lsFaO/TchouHhP/d28BLXY3tUI=;
 h=From:To:Subject:Date:From;
 b=T/WbIYPQSkid13M8Y0aqsP8d4F/EDcNGwXfMnulTRgvFPKVfFWtw0tQRVeLoUZ+Ds
 1zUf3QvVTkspyl/CJArbONNNlHkKQzjNHp5jjVfSD++Br0gADBjwlINdjtzfHDtG4M
 T+HQFgs1MiUSID3xCt6dy3PBGGl0hsy+7sdopQteaAb3kONmlIT1+JbU7Tyk9iIZPJ
 m0x6TjMg/oK0XK35fM8r+BjV8b50ZrdC7WSbeqMB2H15k8Bq9i+66XSyU8J8cMzjqu
 Cz8EsHYQIxwKFfQYkly0754hpTzOZ263rTGTdMyC7Vse7QPHO6UDl+1YS7SNkVp88C
 NKsKz3rV9ecYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=T/WbIYPQ
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
index d8ae3469e7..be44c00d7d 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f33d37957f..ccf6235166 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6f35f821433d8421be7167990747c7c4a0c451958fb96883446301af13d71152  linux-6.12.4.tar.xz
-sha256  7ae1476e8b4c86e7754e581d45d6fbce5932bfefce934758a2907d6d79eca3e0  linux-6.6.65.tar.xz
-sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
+sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
+sha256  9d757937c4661c2f512c62641b74ef74eff9bb13dc5dbcbaaa108c21152f1e52  linux-6.6.66.tar.xz
+sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
-sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
-sha256  180754f3df0e8d7f206625255b3f5a6e1f441feec83336df42613ca8f6b1887c  linux-5.4.286.tar.xz
+sha256  c3e63cb864a05b6bbc886613c9e91714106b7a9ab40c31c101da0ca5b64d760a  linux-5.15.174.tar.xz
+sha256  565a4883cc460af9f338966fca51a84bcba13dc7e47a563e32639115cba79675  linux-5.10.231.tar.xz
+sha256  0d0ffae5bf0e6f9c6a1ce42da2bc2a8696ca55721c103497eb1245be8cc04b20  linux-5.4.287.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 51972158d6..c1bcdf1611 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.65"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.4"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.287"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.231"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.174"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.120"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.66"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.5"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
