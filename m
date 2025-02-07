Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D03C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9DAD847A1;
	Fri,  7 Feb 2025 18:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMXjx6Ho8ioB; Fri,  7 Feb 2025 18:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7742847A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7742847A6;
	Fri,  7 Feb 2025 18:20:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A134CF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D041847A1
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vH6lcSuwUvZ2 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 316648472B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 316648472B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 316648472B
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:20:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F159A4C490D;
 Fri,  7 Feb 2025 19:20:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50538)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgSxt-000000003Dm-28nm;
 Fri, 07 Feb 2025 18:20:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  7 Feb 2025 19:20:31 +0100
Message-Id: <20250207182033.2746438-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738952434;
 bh=DJ8braMl8MpD7qEfHx8taJ8CPDfgwb4L4cvkH0BuQRI=;
 h=From:To:Cc:Subject:Date:From;
 b=mSTVIYPsEW411geUTkLRfVUdOZHC0S7iJnAuF51hNOPc/jIyqIHRytXxBUmy5GSU3
 tQAOwy/WK178K9Kt/e2f/f1pKuJCQ0mqYNygyh8KP1paTCECVzjkKfLxc2PnWVByA4
 YQJxSePZiX3bSGpWEtOKxlmO+FVjJ2OH0iZEinY6yVA9z55OaHzcC+6bWJ5xdIGJcW
 fvGmt5F/rVSBaM+9fueuy0dbl8zaqdQxJo6klIVwFcu+kfbXVSFw8by0jN4k1MhB7V
 xyGEG/mJbSNKeHh2pvIBNTgQqceMiF0c7sCnUtMFJGsdmIfFSr5Z4OrespJixgssPw
 8spfBUr1Q7Ulw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=mSTVIYPs
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 5.{4, 10,
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
index 63e64c5d65..1e6842c44e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 50c2ecf5ab..ebd39c2bc7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  475172fdbd87a153f123a57952672e773bdb6daf5b58a417d1a5e419fcfeec49  linux-6.12.11.tar.xz
-sha256  f15e2b1a8bab0eba494b07858a5abc88d8f788e25f6fe4a572a77840bbd5494d  linux-6.6.74.tar.xz
-sha256  18b0d41d1a7fbad56045cde0d7fc176bfb18361d29c9f07e57109bbf21bf7876  linux-6.1.127.tar.xz
+sha256  e98942d17ef7063b3f2d6d7692bf24899e2e021cf832d19b55308ec8e8e08eff  linux-6.12.12.tar.xz
+sha256  f7dfb1fa9716ba139d0b4c8161535816d400dea21d5943f513448429b1790290  linux-6.6.75.tar.xz
+sha256  874d67d3181570e69ac6b33853f0448f05fc90d4cf3e4baaadc4a9cede7c50f3  linux-6.1.128.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ea9eb8088d4231f8a01b191ceef5f4d92238f6c7519f6fbcb57e448ee9e0a6e0  linux-5.15.177.tar.xz
-sha256  239e57280f8c9159187e383d7b730d29f5cc8e1b30be218f004e0c90d1137f52  linux-5.10.233.tar.xz
-sha256  1e3e5fc052c8e15f8eaa37d30bf4f0b3eef7430dd234d9fed0d0005852a06d10  linux-5.4.289.tar.xz
+sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
+sha256  9597c4fee2f1ce452acfec516f4325ad342155872052fd5f0d9ce2ddcc26ebe5  linux-5.10.234.tar.xz
+sha256  6cc73cf2a7f50580f7d8c7e99d2f2e8ada8b7d2f4e76f5896f0daf691cc2a456  linux-5.4.290.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9a0db19b29..a0cb484bd0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.289"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.233"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.177"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.127"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.74"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.11"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.290"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.128"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.75"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.12"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
