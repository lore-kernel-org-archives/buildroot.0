Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C4BC282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 19:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C21A83AF2;
	Thu, 13 Mar 2025 19:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RlZISIjqaMws; Thu, 13 Mar 2025 19:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F81E83AF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F81E83AF3;
	Thu, 13 Mar 2025 19:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94E7CC8
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 19:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92A6E400DA
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 19:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpcJYe14MIN9 for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 19:16:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A550401A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A550401A2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A550401A2
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 19:16:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8f2.dip0.t-ipconnect.de [84.161.184.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48192A4C1277
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:16:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35712)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tso2G-0000000088y-1cwj
 for buildroot@buildroot.org; Thu, 13 Mar 2025 19:16:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 20:16:03 +0100
Message-Id: <20250313191603.2659137-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1741893364;
 bh=ZUt1gSVk5gSQGJqGSR6T8PajdQNd+O57ANi5INRWjMY=;
 h=From:To:Subject:Date:From;
 b=XNDKXH2rHjjanu3EFeIn5R24wcY12QwSjiYwGGmERYkuFs95ZxRTZbEM0SvBoofdZ
 ye+1GZ7l0QlvQZzphO73Vkm10MKFbUOqdD4vlk9rs2GP2mm2WtZb3KNHKra/8o24E0
 iYklhP5+A3Mz4Gkdr/3620BKSDfez7VdwBJ+xcR4K8FE8RicsqPaKe5b+Tizmgcnx8
 YqlcuE/H5JAS2znbdKQzktSdzVnCF2A80M7NgjoBcghYzq1sM3a/6VahZ+9+lhk81i
 DHdvHLYs0o/XE0X9Fs9PIq8nf7hi6dn5fbld9042zH4PFFYHpJkUgs8Tdk22okWWj4
 6Zk3yOH4ztYBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=XNDKXH2r
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
index ac7b054d0b..dc6c5d384f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8d24138c9f..8d1f3700e2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
-sha256  af483828e67f1b9918bc438d789cdbb06c13a4d43a41d5f35d44c9a6d620318f  linux-6.6.81.tar.xz
-sha256  9416b2c2d448ec7f54bb0ce5713fb34c32dae4a4edf1abd8cf7a8995cbac66fd  linux-6.1.130.tar.xz
+sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
+sha256  894bbbe63b7484a0bc576a1e11a8dbc090fbd476d6424431bdc8435e03c2c208  linux-6.6.83.tar.xz
+sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
-sha256  9597c4fee2f1ce452acfec516f4325ad342155872052fd5f0d9ce2ddcc26ebe5  linux-5.10.234.tar.xz
-sha256  6cc73cf2a7f50580f7d8c7e99d2f2e8ada8b7d2f4e76f5896f0daf691cc2a456  linux-5.4.290.tar.xz
+sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
+sha256  953be3931101a94a93a644c1283ca41a7e567447ca87d3069ed4dd712dc1f1cc  linux-5.10.235.tar.xz
+sha256  b3ad64a4476a7c5450b92eab9a888b84ecb64dc613fcb0128f653f58e958ef6e  linux-5.4.291.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2fb661a59b..432d5d1749 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.290"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.130"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.81"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.18"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.291"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.235"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.179"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.83"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.19"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
