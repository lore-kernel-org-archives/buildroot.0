Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DDBC54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 08:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E687182024;
	Sat, 24 Feb 2024 08:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1WOd_sezCvrC; Sat, 24 Feb 2024 08:23:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F26E2820AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F26E2820AE;
	Sat, 24 Feb 2024 08:23:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF4C71BF2FB
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 08:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA37A608FC
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 08:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDALqKpaUeTb for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 08:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92F4C608E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F4C608E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92F4C608E7
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 08:23:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 73A74A4C11D5
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 09:23:12 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56126)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rdnJQ-0000000013G-0glD
 for buildroot@buildroot.org; Sat, 24 Feb 2024 09:23:12 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 09:23:12 +0100
Message-Id: <20240224082312.33187-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708762992;
 bh=4pjjAQH7TWDmdU1aCAg9fjRA67JuMH0WreDvklpn+iQ=;
 h=From:To:Subject:Date:From;
 b=xXzZn9biFjHLkPCH0m3VvSif/2cenAgqn5EM/Z/0+xWk/MxEL67kcWpdpRX8wK6ek
 Q9nJdijJOFRhh5U9F3ZT8bv1jv4AHm7i14fPi4OZMqSmZYeOp4Z6Anaozd+Gm6ATZI
 SdTmkv68QZqcwXR1/sIhuhjXKBsyI16sbFBI0gVgrzY5WSIFyxWJBY/vAy9qt+NT74
 nzluRfsxLASNVbcEjd47LwJD3mHTqo8KmG452yHjxFg/rSggvSANydifWsQ45LjUx+
 FLSO70WbkEV9ItHpBkzCsW7p3hoAc91ENPXb+fMJrKxU7Z5SIE0e+TMvuLouJME+Og
 /7B+aazxvOk9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=xXzZn9bi
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6}.x series
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
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 773cb4fbb5..07d6b2b5ec 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 52fb480af2..15c0dc8d3d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b21d5795a3bead4f112916423222faa8a0f519e4201df343e3eb88dc9e4aaa30  linux-6.6.16.tar.xz
-sha256  3b54ec567716cdfb3618caf38c58a8aab1372cc41c16430633febe9ccdb3f91d  linux-6.1.77.tar.xz
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
+sha256  faa49ca22fb55ed4d5ca2a55e07dd10e4e171cfc3b92568a631453cd2068b39b  linux-6.1.79.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c48575c97fd9f4767cbe50a13b1b2b40ee42830aba3182fabd35a03259a6e5d8  linux-5.15.148.tar.xz
-sha256  44e22fad647c638726a8eae23703c4263bead612d17c89ca7ad7ab32b5ce88d5  linux-5.10.209.tar.xz
-sha256  afc8aca6cb56fea489f6508bc24357df1cf8a8f3d7dcfbcccd94b7f968492620  linux-5.4.268.tar.xz
+sha256  bd84809a367eb400eb04e0e70294e6ba12fc03b6bfb5a7dfaca548f8947501b0  linux-5.15.149.tar.xz
+sha256  4ea63c5a90fdc3c459ab35c11ee8c93d2364a7cdbfb101100f8cab70d490ef6d  linux-5.10.210.tar.xz
+sha256  ff54bec6d053c7994f3bb8c45021de2858ff9f740d2ccbbcf072b87821a918cf  linux-5.4.269.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  b91be40fa61ff7d42958e2154a4b7602dc071982128b9b58b6d911dec111be19  linux-4.19.306.tar.xz
+sha256  83eeff613405d0045d0f717c6ac14c178678fe0a163c41d9dd8878ac0f73e352  linux-4.19.307.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 69857566e3..63e82c49df 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,12 +403,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.306"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.268"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.209"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.148"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.77"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.16"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.307"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.269"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.210"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.149"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.79"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.18"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
