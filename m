Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5BACD11C2
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 15:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E37541930;
	Fri,  5 Apr 2024 15:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FpfdBGeN2w0Y; Fri,  5 Apr 2024 15:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD17241934
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD17241934;
	Fri,  5 Apr 2024 15:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00B291BF2B6
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 15:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE2B941930
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 15:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwSCg3x2MD2B for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 15:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74F784192A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74F784192A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74F784192A
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 15:36:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cabe.dip0.t-ipconnect.de [79.214.202.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90429A4C1DD6
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 17:36:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34910)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rslcF-000000001nf-3MBC
 for buildroot@buildroot.org; Fri, 05 Apr 2024 15:36:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 17:36:32 +0200
Message-Id: <20240405153632.3348708-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712331392;
 bh=4z2TITTk5oBQ3x7kSC7UlPDoGEQWgr2lKR8SZLFImBU=;
 h=From:To:Subject:Date:From;
 b=h9pNi7BlVE8gX0Vv+vp+Ovxv3HCsa4pkBkECUzlokeD3ycbK8wYGEVeng4VC3K1/9
 wWUC7DAJW7SmNbQUS4+uoo1JbvknRqZ1hwPnnotciutTs+lNEY83/c9m2h0X6deeUa
 9TjkDTvgcYfoJWhsD6rbbOzTRkBgfIhM0bT83EnFfDhcS5+A+1bgVhn0xKoJoHLvoq
 LgcZ7FquvX8PFkQIn0J/YWyOMFDevrV0vNZ4qyUhplME1VB29ZgKVb22UVXEWFIck9
 SLITWwbYdC8hYNnKIt7Bev0JkdpNW+Lu8hriryrU3041bWC42eOI87/29Qee0k1/xL
 kYx7++GpF9FOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=h9pNi7Bl
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.19.x / 5.{4,
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
index 2767b709d4..d35a365f9f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4fa9f701cd..81f4406e65 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
-sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
-sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
-sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
+sha256  d5dec495fc00605fa9e04114df547fbc92b33d9ea7a4a2b7073c589590e79e63  linux-6.8.4.tar.xz
+sha256  6c2979e3948806a0dbacba193f8453ea42c179c1eb9f6136e3c35d87e5707984  linux-6.7.12.tar.xz
+sha256  99d210be87908233a55b0fadc0dccd3b95926c0651b6b82e37350b2029de1f44  linux-6.6.25.tar.xz
+sha256  af97d2ebe14765d0db3af6560309daf08535da25bfad36e5fb3e436f22a1707a  linux-6.1.84.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f0805225f4a5b24d0bba9302c2c2f261c04f737ac5dd931da9b112e9f3e4a47e  linux-5.15.152.tar.xz
-sha256  84cf30223239ec3333a5f7b2a7fba2042bba70d1582a139f7543956af871ad80  linux-5.10.213.tar.xz
-sha256  3599d5959a403e64be407d7f05e56cb270d6ddd154e89a596609919ab1e2e366  linux-5.4.272.tar.xz
+sha256  d7ddb1e144a88773b56a5b4a71baea0b241f3996d446be45290537c6997c84bc  linux-5.15.153.tar.xz
+sha256  40f014d53e81f204f6d2a364aae4201ae07970dd1b70dc602d7c66c1a140f558  linux-5.10.214.tar.xz
+sha256  8ba0cfd3faa7222542b30791def49f426d7b50a07217366ead655a5687534743  linux-5.4.273.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  95ec94c4ab8f46d8a54430893f9bd653c46b0f1587d216818aa8f52fd313de69  linux-4.19.310.tar.xz
+sha256  260b387525514ef705817adaaa0cdd0fadec80ba2f22f8251f8e7de5d9e0bc81  linux-4.19.311.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4c3651450e..152f52714e 100644
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
+	default "5.15.153"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.84"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.25"	if BR2_KERNEL_HEADERS_6_6
+	default "6.7.12"	if BR2_KERNEL_HEADERS_6_7
+	default "6.8.4"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
