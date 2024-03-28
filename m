Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F43CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 987C0417EE;
	Thu, 28 Mar 2024 21:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1bPtrwPvmeZ; Thu, 28 Mar 2024 21:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 845A0417F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 845A0417F7;
	Thu, 28 Mar 2024 21:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32C721BF364
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C905417F7
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHWWWThbloOX for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 21:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F781417EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F781417EE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F781417EE
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 21:43:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccba.dip0.t-ipconnect.de [79.214.204.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EE89A4C0787
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 22:43:24 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42618)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rpxWt-000000004kQ-2BE6
 for buildroot@buildroot.org; Thu, 28 Mar 2024 21:43:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 22:43:23 +0100
Message-Id: <20240328214323.2243001-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711662204;
 bh=itU/Aiut/xGV+KgTrEe8PrNjDg2ptcMSt78kmomaMH0=;
 h=From:To:Subject:Date:From;
 b=mcE0D69v8FMJRYEUYg3LIeIeB/CrEmwag9nDg8vy/r4lJSFsUBQy82D6zawAIrejx
 xZ5EdAPot6mkgtokACFaM2V29sspmhuoR4ZMWwDRojgH333XXaPgHWcN4idhBSbMRi
 7bGvNxi+wLAWfczYQ4ziLYf35d5fXVYD/s+G4O07Ntvv2LWbC9+yvksJuiWBi1yaoF
 Fwf865+BH4JihV+0WGodbI3P+gXDA5w41IszNdlF+9NoH9c9QNVcMcB/U2z7z1fukK
 wopbFVvy96gMWBPvnJwVmwNt3knj+kI0+SA8Hr4KwCh6ndATfBecGNSiBzZ4FRBcgV
 baUXeCL1WBNXg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=mcE0D69v
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
index 2767b709d4..bd58f8377a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4fa9f701cd..1ecb9052c7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8d0c8936e3140a0fbdf511ad7a9f21121598f3656743898f47bb9052d37cff68  linux-6.8.1.tar.xz
-sha256  a9b99fb376f9fcd699c7c252aeef3bb5ba26280eb049711ac091b2eb2b487c03  linux-6.7.10.tar.xz
-sha256  23e3e7b56407250f5411bdab95763d0bc4e3a19dfa431d951df7eacabd61a2f4  linux-6.6.22.tar.xz
-sha256  d150d2d9d416877668d8b56f75759f166168d192419eefaa942ed67225cbec06  linux-6.1.82.tar.xz
+sha256  9ac322d85bcf98a04667d929f5c2666b15bd58c6c2d68dd512c72acbced07d04  linux-6.8.2.tar.xz
+sha256  2c6497c971632fd9d056941a8a31369d36ef07baa755e4c1cdcc326acb090b4a  linux-6.7.11.tar.xz
+sha256  200fd119cb9ef06bcedcdb52be00ba443163eab154295c5831fed9a12211a8b9  linux-6.6.23.tar.xz
+sha256  88b69611093613ce4494527685f833af0c31b986dcbeda7086f69f18f9e0b190  linux-6.1.83.tar.xz
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
index 4c3651450e..674d3bef7e 100644
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
+	default "6.1.83"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.23"	if BR2_KERNEL_HEADERS_6_6
+	default "6.7.11"	if BR2_KERNEL_HEADERS_6_7
+	default "6.8.2"		if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
