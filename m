Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B96C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 17:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C120F60801;
	Thu, 11 Apr 2024 17:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LAT94CjQesB; Thu, 11 Apr 2024 17:44:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9AAD60844
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9AAD60844;
	Thu, 11 Apr 2024 17:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8871BF3FC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 387A040196
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 17:44:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7dZPQglc9Ve for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 17:44:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17FAC4011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17FAC4011A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17FAC4011A
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 17:44:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1be10.dip0.t-ipconnect.de [84.161.190.16])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 271E9A4C0EDA
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 19:44:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48060)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1ruyTT-000000002Ll-2QCY
 for buildroot@buildroot.org; Thu, 11 Apr 2024 17:44:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 19:44:34 +0200
Message-Id: <20240411174435.2499446-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712857476;
 bh=Ez1mImxbdPaa/m7/D/nLTimsQW9WLCeVKs0JBgrBCF4=;
 h=From:To:Subject:Date:From;
 b=lgiemkV9dJD/FCO2o0hwhEWaIGUB9BZ+9zg8uhd3HS7rdH+7H0VAzQxuxqH2lrmOs
 Zmlq6iuJt6OiM/LHKQ4Hkhy3gPSa30Vl8lJLU8+Zy3GWCGxk/G90+p8QdhIdRilqd2
 TrB/5jfr/w+qyW1DGKuwZTwJPPlNYqcIRrHwmX7i64GXxNUA++ft1XgnVJ6dGSHmdo
 zxoBFJeshKZEgQP5qBGTVYaOyvA+OmR4eNQiuM0dybOVvRSnwrZNRnPnnITXw5McZ6
 kjsgjltgrTmzffbX7cHc2lsZIMW73Mzov+mVh5zoR2U+WKTL86qE5yqUtzt4dn3HEv
 PskWfgxC+mwRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=lgiemkV9
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 4.19.x / 5.{4,
 10, 15}.x / 6.{1, 6, 7, 8}.x series
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
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2767b709d4..c19ad6a3f8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4fa9f701cd..e382ba48e7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
-sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
-sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
-sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
+sha256  138923e5d73748b4bdbe9b5a0b8f36dfac9fcc16753a9222928dc6c963effa89  linux-6.8.5.tar.xz
+sha256  6c2979e3948806a0dbacba193f8453ea42c179c1eb9f6136e3c35d87e5707984  linux-6.7.12.tar.xz
+sha256  af54b449f4fb93b8e8daa346144a7309e8e95174bd962c4b5917cf56120456d9  linux-6.6.26.tar.xz
+sha256  33fe9bcc597c60021a2b2abacd4e0f6f546200ab99594c9a07ad600258b86274  linux-6.1.85.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f0805225f4a5b24d0bba9302c2c2f261c04f737ac5dd931da9b112e9f3e4a47e  linux-5.15.152.tar.xz
-sha256  84cf30223239ec3333a5f7b2a7fba2042bba70d1582a139f7543956af871ad80  linux-5.10.213.tar.xz
-sha256  3599d5959a403e64be407d7f05e56cb270d6ddd154e89a596609919ab1e2e366  linux-5.4.272.tar.xz
+sha256  17f85ea79ff2bcd2a577be9d8090e70573a671eaf1d35d897e739ce0603d0698  linux-5.15.154.tar.xz
+sha256  40f014d53e81f204f6d2a364aae4201ae07970dd1b70dc602d7c66c1a140f558  linux-5.10.214.tar.xz
+sha256  8ba0cfd3faa7222542b30791def49f426d7b50a07217366ead655a5687534743  linux-5.4.273.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  95ec94c4ab8f46d8a54430893f9bd653c46b0f1587d216818aa8f52fd313de69  linux-4.19.310.tar.xz
+sha256  260b387525514ef705817adaaa0cdd0fadec80ba2f22f8251f8e7de5d9e0bc81  linux-4.19.311.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4c3651450e..0091afd39c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -419,14 +419,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.310"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.272"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.213"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.152"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.82"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.22"	if BR2_KERNEL_HEADERS_6_6
-	default "6.7.10"	if BR2_KERNEL_HEADERS_6_7
-	default "6.8.1"		if BR2_KERNEL_HEADERS_6_8
+	default "4.19.311"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.273"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.214"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.154"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.85"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.26"	if BR2_KERNEL_HEADERS_6_6
+	default "6.7.12"	if BR2_KERNEL_HEADERS_6_7
+	default "6.8.5"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
