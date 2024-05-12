Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6017FC25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 18:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1083C605AE;
	Sun, 12 May 2024 18:13:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eabfBVnLjMqx; Sun, 12 May 2024 18:13:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14357605C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14357605C1;
	Sun, 12 May 2024 18:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 678991BF2F3
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 543EA40382
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 18:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ambxH5NbNF2w for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 18:13:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36F30400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F30400FB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36F30400FB
 for <buildroot@buildroot.org>; Sun, 12 May 2024 18:13:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c36b.dip0.t-ipconnect.de [79.214.195.107])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93216A4C41B6
 for <buildroot@buildroot.org>; Sun, 12 May 2024 20:13:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50798)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s6DhS-000000005w5-3C15
 for buildroot@buildroot.org; Sun, 12 May 2024 18:13:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 May 2024 20:13:31 +0200
Message-Id: <20240512181331.2106108-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715537611;
 bh=/jmZvQqsUFTEPFmGwARA09SyBQELLCQlQ4EW36QiZ0g=;
 h=From:To:Subject:Date:From;
 b=j/G7b0byOp1Y9qWraFql+q/8lwjpwLLAZAmCokCpvKPEWLHSjgCwcYxWJXbp2PNAY
 OKUkd1VGUy0E+Yb38/l5wOjqZJ83e1GOmdwMze3hBhKWNVlsEWhx3v3gsQcCCMxfFC
 l2rR5cUvuFqyfZnemhqFC7JRQu5aQMlgNWVaWq17LR9wjj+/zWlmL6JtYnik4RqMuU
 zMgNbUxoUoiakpogLlDpkiEyRkgqyIqoFWw6KFRxemC5Ebne62L2wmuapKV5O6A3Li
 DLeVeHefnBPEnpGqLsjvGN0SDEG8V5FTuoeNOyM8SYV3U8lf2evReEsGo6DwZWwlAn
 uMIBDifqPAx0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=j/G7b0by
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 8}.x series
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
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ca6b9a08b0..d3d4c42910 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7154fc75bf..af82148e80 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9e723232d603ab45ebf043c34714c48f277ab195c29abcb8472f2a4c3a5a1995  linux-6.8.6.tar.xz
-sha256  639e50060e3c8f23ed017cb10cfeacc6ba88ff5583812bb76859b4cc6a128291  linux-6.6.27.tar.xz
-sha256  d3d3c8c44f0f0a870a95bd2823f9d91979d1aa6f266da5d8cccd0c4b15e3115b  linux-6.1.86.tar.xz
+sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
+sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  83a3d72e764fceda2c1fc68a4ea6b91253a28da56a688a2b61776b0d19788e1d  linux-6.1.90.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c85859b86d2e6d1fc91ca1be8b44f24a9b5bb9f86869b04a8665a3a6559126e4  linux-5.15.155.tar.xz
-sha256  879ca159c34ea9d3a6775f292cc59c2d3931d57dca00f0bebe2675ea0c82c6a9  linux-5.10.215.tar.xz
-sha256  eac7b421a43cd46a3dbebf7c85d075faa7e164d80d215d31fcd35544b6f79ed4  linux-5.4.274.tar.xz
+sha256  f9071c83a4fd8b80af026b48cfc1869bfa25883f9148b92b5dc1e1e1e26dd5c6  linux-5.15.158.tar.xz
+sha256  e310588c4b23f0959614e60f007afc20e9b1a8f296d682b041fa129f96fbe151  linux-5.10.216.tar.xz
+sha256  dad2b068946f0ca0026130d7ab17601d5074d90b381379c4479314d4edf4304c  linux-5.4.275.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  a394fa5ffe321ee43dae9cccc724572f49fbb289875d39ea695adf712e51f74a  linux-4.19.312.tar.xz
+sha256  a8145e2ecf8437b6d06400c3358a595c47a74443b164890cf12a07d8722539c8  linux-4.19.313.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 5fe34456de..d8f48ed0b7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -415,13 +415,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.312"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.274"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.215"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.155"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.86"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.27"	if BR2_KERNEL_HEADERS_6_6
-	default "6.8.6"		if BR2_KERNEL_HEADERS_6_8
+	default "4.19.313"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.275"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.216"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.158"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.90"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.30"	if BR2_KERNEL_HEADERS_6_6
+	default "6.8.9"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
