Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F19C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 06:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667E68119E;
	Fri,  7 Aug 2026 06:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNGwzdn3XWIG; Fri,  7 Aug 2026 06:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2891F8119B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786085681;
	bh=d+uGu7FWGO6vOcLn30PoAIe7Bc1FYLbMDZrPBz8oyms=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HrLsDZc3mICB5uPIcqKa0b/jsqDcvSQLpxkEMpZn+3hSh1U4UvrxCzRJyFVER9iiN
	 8nq7/o/YOf/gE56I12AkFZt1gDegv4aa7zvEs3qMXASsRGHr5YzqyzqRW+/ClW90RV
	 9U8o0m7fz2sZ2g50nGGMRgZTYNNX6m9p8WCvnmxo+8IqeJ8kEC9Hz6pRZKmsHSAR4x
	 V2HgWS25ygTISKeI58uvOaP0nRiNT9xeh3quovtlV4dU5m6chK/rbbuZzq6VyauqXJ
	 e4SkROkijnb55qn8HP6ExMgwuKAaZX3lufhaHytoBqKxzcLOkZ+OnI7QPUT4az8sTR
	 McE7LWu1yEjJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2891F8119B;
	Fri,  7 Aug 2026 06:54:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDAB9397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 06:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF9EB608AD
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 06:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqFw3Jfqoh09 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 06:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A104D608AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A104D608AA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A104D608AA
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 06:54:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c228.dip0.t-ipconnect.de [79.214.194.40])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 486BCA4C48ED
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 08:54:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41326)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsETP-000000006zt-0e8j
 for buildroot@buildroot.org; Fri, 07 Aug 2026 06:54:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Aug 2026 08:54:31 +0200
Message-ID: <20260807065431.3466830-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786085672;
 bh=Y/SlLC+dLX9Pn/t+F6psH81R9X8a2Ut+YJYMyiiuEP4=;
 h=From:To:Subject:Date:From;
 b=cY3o0+rwRaURIjrWqVWWP7u862kBxSoTjrY1Ol73H2Be24I1HLkoK3N5X131gtvyH
 eU72VpUUBY08L9Tbdf0H3qcgTGYubyraZ13J+DvRGQcltA1mPu5lzTEXkXOWxT7OyS
 4F/cpCUOR3fdcPsdykyiayLez8glc1FVjdcH9BBm9QjQEJeFPONoeKXDi7lDExWOok
 /P4SPakuL/aZS5+MLChYbaKsuAQCc80j+PJ2qqCLVq+NY/E9cyhealbTGpiijAnkgD
 qZ5ciXknUw32JMHvn6mwDjaq1GI5u4LZt3fNsGtDgtV2kSMzj0e4oWMcg+dOdDsvjO
 toFeMcb/XIldQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cY3o0+rw
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.1.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

Update the latest kernel releases to:
 - 7.1.6 -> 7.1.7
 - 6.18.42 -> 6.18.43
 - 6.12.101 -> 6.12.102
 - 6.6.148 -> 6.6.149
 - 6.1.180 -> 6.1.181
 - 5.15.213 -> 5.15.214
 - 5.10.262 -> 5.10.263

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.6 => 7.1.7}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.262 => 5.10.263} |  0
 package/linux-headers/{5.15.213 => 5.15.214} |  0
 package/linux-headers/{6.1.180 => 6.1.181}   |  0
 package/linux-headers/{6.12.101 => 6.12.102} |  0
 package/linux-headers/{6.18.42 => 6.18.43}   |  0
 package/linux-headers/{6.6.148 => 6.6.149}   |  0
 package/linux-headers/{7.1.6 => 7.1.7}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.1.6 => 7.1.7} (100%)
 rename package/linux-headers/{5.10.262 => 5.10.263} (100%)
 rename package/linux-headers/{5.15.213 => 5.15.214} (100%)
 rename package/linux-headers/{6.1.180 => 6.1.181} (100%)
 rename package/linux-headers/{6.12.101 => 6.12.102} (100%)
 rename package/linux-headers/{6.18.42 => 6.18.43} (100%)
 rename package/linux-headers/{6.6.148 => 6.6.149} (100%)
 rename package/linux-headers/{7.1.6 => 7.1.7} (100%)

diff --git a/linux/7.1.6 b/linux/7.1.7
similarity index 100%
rename from linux/7.1.6
rename to linux/7.1.7
diff --git a/linux/Config.in b/linux/Config.in
index c2b52bcced..5dd0e9393e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 779def28d0..34d3be41d6 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
-sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
-sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
+sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
+sha256  a7ef7a894d6c5111eb5281167819a76bf08914edacd953e7704de045b73ac3d0  linux-6.6.149.tar.xz
+sha256  d9b94ba489852aceb676c6f9e54502766a4e8363d9da114e6213bc0b6fb18908  linux-6.1.181.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
-sha256  fae7da8a9b97e5386f0a3dc3c5c8a88be17fcf2d0792a58a5a0c5b4f5775b483  linux-5.10.262.tar.xz
+sha256  61d2c47f4b7148ce101cb257b8dfde301c2df5c64b4b53eb2e038a2fa709e541  linux-5.15.214.tar.xz
+sha256  c93338f367aab6c746bff8a05bca82665702065493127e204be4a96d4e4c7da6  linux-5.10.263.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 8072305f0b..f527761764 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  995dd7188d924662b94b48fd6fb783587267590e5b8bb33dade2c771e7d855c1  linux-7.1.6.tar.xz
+sha256  ca8f2a6884a4d62043e9ab93ac1ab15efc2b6630fe8f768b2ef2ffdf4b5e26df  linux-7.1.7.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
+sha256  a1aeb926c7c4a1564368200b1082e45bb958007682d804aff88abbc3a7a47b5d  linux-6.18.43.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.262 b/package/linux-headers/5.10.263
similarity index 100%
rename from package/linux-headers/5.10.262
rename to package/linux-headers/5.10.263
diff --git a/package/linux-headers/5.15.213 b/package/linux-headers/5.15.214
similarity index 100%
rename from package/linux-headers/5.15.213
rename to package/linux-headers/5.15.214
diff --git a/package/linux-headers/6.1.180 b/package/linux-headers/6.1.181
similarity index 100%
rename from package/linux-headers/6.1.180
rename to package/linux-headers/6.1.181
diff --git a/package/linux-headers/6.12.101 b/package/linux-headers/6.12.102
similarity index 100%
rename from package/linux-headers/6.12.101
rename to package/linux-headers/6.12.102
diff --git a/package/linux-headers/6.18.42 b/package/linux-headers/6.18.43
similarity index 100%
rename from package/linux-headers/6.18.42
rename to package/linux-headers/6.18.43
diff --git a/package/linux-headers/6.6.148 b/package/linux-headers/6.6.149
similarity index 100%
rename from package/linux-headers/6.6.148
rename to package/linux-headers/6.6.149
diff --git a/package/linux-headers/7.1.6 b/package/linux-headers/7.1.7
similarity index 100%
rename from package/linux-headers/7.1.6
rename to package/linux-headers/7.1.7
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 563138a7f5..8f4cd3b283 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.6"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.263"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.214"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.181"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.149"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
