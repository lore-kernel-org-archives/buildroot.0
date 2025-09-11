Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9963CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 18:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E90160E4B;
	Thu, 11 Sep 2025 18:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBm6dAzJ6pdo; Thu, 11 Sep 2025 18:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B94EA61C3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B94EA61C3E;
	Thu, 11 Sep 2025 18:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA7B234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 169DA84A53
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec0AL6KjvSkl for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 18:07:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24D6384A49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24D6384A49
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24D6384A49
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 18:07:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b21f.dip0.t-ipconnect.de [84.161.178.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 432F3A4C3B46
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:07:06 +0200 (CEST)
Received: from [192.168.1.144] (port=54870 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uwlhK-000000007jJ-0oof
 for buildroot@buildroot.org; Thu, 11 Sep 2025 18:07:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 20:07:05 +0200
Message-ID: <20250911180705.3980737-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1757614026;
 bh=0QpG0I5sV59SdoVlV6GRXzBKjAwfy5Rw5hF8F1Nt/3Y=;
 h=From:To:Subject:Date:From;
 b=Ujz7EcfYDXiLVnf8FZj4wWzHx6a4C4nN9x1EvSYiYBRd9pTV1dM5Y0sqhBAbrgbBp
 xaGGuA0QN9bJPsz5qthuqMcU1h9bfH2NEiof1S8GWFaOpW851MTHkhNhNflYFyJEwK
 gwUT+bV/9x+29EP492MNC59Pkogg+B+5Kagk8SaC3ZJcWm4w8tcwR0pQrYvWZGoQL1
 Aph8X66mqsNLb3PaALPRnbtcCWZgBFSGOOGtkqElpTkkQIyilAFOHYt2zfTTNXR3H8
 g+mrhshwRc5MUkL75ATxMMSsuCkqBzDtXsdlNpnzkhyXjO5vMiK6KdMgA8+Oh3aMp8
 4uE6/weoDXo5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Ujz7EcfY
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: security bump 5.{4,
 10, 15}.x / 6.{1, 6, 12, 16}.x series
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

This bump, with the exception of the 5.4 series, fixes the VMSCAPE bug:
CVE-2025-40300.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e5c08d91c6..1f1c014ba2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bd876d5ee8..8a02b43a67 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  76bffbae7eab2a1de1ed05692bef709f43b02a52fe95ae655cacf0fa252213f3  linux-6.16.5.tar.xz
-sha256  8f95a8549cfbdfb89c1181a1f55a971f04dfcd629508a2ed70b777ab92f9db3e  linux-6.12.45.tar.xz
-sha256  2a772f9d661afabaaddcdfd1116239acb2d943377aceab9e0baed2b7a915e36a  linux-6.6.104.tar.xz
-sha256  001bffcc08e2b544fb507c0588f9270f8b5b1138508a4be1205492e3c57824ef  linux-6.1.150.tar.xz
+sha256  5be3daa1f9427b1bdb34c4894d9c1adfac38cff674376fe0611a3065729a1a81  linux-6.16.7.tar.xz
+sha256  e82fe40871743048226987bd349ef107168b15aab90140e872ca4ed470922e25  linux-6.12.47.tar.xz
+sha256  0c3180e2d8dcd0b70fe83554d9c440e31bab17873e360b89c4ab62a4fd26a8a0  linux-6.6.106.tar.xz
+sha256  1a173be2a9cc886698b8205e639e4482b6cd84ba0be988d519415c7d2bb5b7d9  linux-6.1.152.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7a2db3ac34a3edb6f497204cc287497c29bb3218fdb7876951f8bceac46e924e  linux-5.15.191.tar.xz
-sha256  bc3ae7003174e26c9a39534cfb8d66cee1a0ba6e1dd0381a9fe092f9de6ba9cd  linux-5.10.242.tar.xz
-sha256  01163bed1abadc1e5e6480f0d694c360281cbff3446023c2e015f1e24504e4e6  linux-5.4.298.tar.xz
+sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
+sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
+sha256  88de95aeeb8d941fe61497f5e2e886bed25a79d509aa71ba25a2727fd7f0bf2d  linux-5.4.299.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f8a259b2c0..d0555ccde4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,13 +454,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.298"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.242"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.191"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.150"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.104"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.45"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.5"	if BR2_KERNEL_HEADERS_6_16
+	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.152"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.106"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.47"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.7"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
