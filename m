Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C87CA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 05:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0066740AD1;
	Fri,  5 Sep 2025 05:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3ZDVLIHqTIP; Fri,  5 Sep 2025 05:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F148A40ACC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F148A40ACC;
	Fri,  5 Sep 2025 05:50:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB3621E04
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 05:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFDA281432
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 05:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZVW63XZyYnT for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 05:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DECF780E30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DECF780E30
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DECF780E30
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 05:50:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0bb.dip0.t-ipconnect.de [84.161.176.187])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3B593A4C210E
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 07:50:17 +0200 (CEST)
Received: from [192.168.1.144] (port=47546 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uuPKy-0000000059X-0arl
 for buildroot@buildroot.org; Fri, 05 Sep 2025 05:50:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Sep 2025 07:50:16 +0200
Message-ID: <20250905055016.76056-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757051417;
 bh=+o1STokQ/RfL9Ba6HPZq3q7+3cqjLz24+9E9YO2Swus=;
 h=From:To:Subject:Date:From;
 b=vRnXj3A82q7YWWHTGjw3uDySMPntDRiKPjEuPGwhLRrewCrkMFvg4ksatC8YLjoOw
 QD4oUs/gNauCdDIMw5uuT80bHjurPnlpTSihAW6uYuIDJuLJyIxnvmYYsKhhAmK2Ty
 Ui9M43y+T1gL4aEUfNleBBK4/poPDTPkSAT9cH4J/KiRqxQAuFrkbAB410A1PHAHnK
 WTQwszvBxc8FMkRz0ARLeJtKPnB5CAIONQtIS0VlXp0S8KCI1f/TCyl87QwqI8tkfX
 h+FG2AGrw5AVNRtjsnFYNWZLslc+lfCUABWoq2hqsxGWrzieJKV7EMX1CRf1zOMEnY
 Qi/hLisBmjJ7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=vRnXj3A8
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 16}.x series
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
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index afcebe78b1..e5c08d91c6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0613a0d909..bd876d5ee8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d6a5e3c71a10b533a756251387cc8bf48bbd5c76d842ba5e957d8b1c316ab622  linux-6.16.4.tar.xz
-sha256  b650210ed3027b224969d148aa377452a9aad3ae7f2851abedd31adfef16bdae  linux-6.12.44.tar.xz
-sha256  d288dd38c3e62ba576ba6b3ad2a84cfba65cd43b702f6c50d1f701aee942b18e  linux-6.6.103.tar.xz
-sha256  c4e906b8d39a5866d25e06371d4de4454fbfaaeb67979a04e4137e807877be39  linux-6.1.149.tar.xz
+sha256  76bffbae7eab2a1de1ed05692bef709f43b02a52fe95ae655cacf0fa252213f3  linux-6.16.5.tar.xz
+sha256  8f95a8549cfbdfb89c1181a1f55a971f04dfcd629508a2ed70b777ab92f9db3e  linux-6.12.45.tar.xz
+sha256  2a772f9d661afabaaddcdfd1116239acb2d943377aceab9e0baed2b7a915e36a  linux-6.6.104.tar.xz
+sha256  001bffcc08e2b544fb507c0588f9270f8b5b1138508a4be1205492e3c57824ef  linux-6.1.150.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  62b814f1a48e1d67764a28611f23ca1f1ce1084ad7f1d319acc05720a9a68604  linux-5.15.190.tar.xz
-sha256  08c1e982064c81f8445a8fff2293d430c716c11fd3185606b8275718d696d8d6  linux-5.10.241.tar.xz
-sha256  f10cfcea7acf7588087d7cc17ebeeb7d3ff783c040536698c544eed7c5e8a841  linux-5.4.297.tar.xz
+sha256  7a2db3ac34a3edb6f497204cc287497c29bb3218fdb7876951f8bceac46e924e  linux-5.15.191.tar.xz
+sha256  bc3ae7003174e26c9a39534cfb8d66cee1a0ba6e1dd0381a9fe092f9de6ba9cd  linux-5.10.242.tar.xz
+sha256  01163bed1abadc1e5e6480f0d694c360281cbff3446023c2e015f1e24504e4e6  linux-5.4.298.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f7c015725f..f8a259b2c0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,13 +454,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.297"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.241"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.190"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.149"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.103"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.44"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.4"	if BR2_KERNEL_HEADERS_6_16
+	default "5.4.298"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.242"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.191"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.150"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.104"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.45"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.5"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
