Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178C3C88E6E
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 15:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DDB40608;
	Mon, 14 Sep 2026 15:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVge7v0MZ_F3; Mon, 14 Sep 2026 15:56:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 537C24057D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789401363;
	b=OyL3TNBPiZQwJRMZRp9mJpUhA3SYrkDMsHesZdEQoTCMSsCNT00tQerXQGmwSXCADbvD
	 tYZpFFFeBavIANZ4WvaEli5+u4eKnQ4SxjKcqTlW67/80wQ8PuJMGa/j9f2dOdsPe0ty8
	 UGj+YVyXbT56ifc1t8erqwLeBCENd95mhYbmZ9rYeh+zbnZwmomUt9uGKi9TZmQ35GPm4
	 aVP4sdUiu0/aC/CWH/pZhuemCVwbMfzsBBdXO+WYYqvWxdz2FSIaklVyCS7nD5if/cXIb
	 paweP54APaRqeaIZ5flXgceGgTTJ8ryHcd/b1iyOLvwCfAx6juhoVNngMycWPq+8XbQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789401363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=wgyt08eBbaAlMChwFcZpN08jbB+qXyfL5vdAfA5J1RE=;
	b=inw47KepVDmmnHSZ3/oP/zXNkLZt0GgzXxb5XkHJn0vm6CtYGFkpnqyRDO6bGpUbOtqy
	 m+KAsnsQsNiQfWsu7PsJXcOIKXUaVj86rcFhqYFi7soOP5A5izG9yhtjOz6DMWBBck901
	 1X3ezwRSPawy0xV/pnyzfZYE9NvJTRlYZCeG7a7Y3Yc5yoacXoS1HPGp5c6ho5Ie+sABN
	 6LQvbuJKXx5KJ/5u/EEnqS8mLqx57WRfvVRkhVRHHC86lfXr4KFOYozWgbPdnpJyGjoSp
	 2c9rCkyHrcCkXOPCEcScLGeGJg6fIoazM0PYJxDxr77ZluLuK+MOn7BE6qG6dQLs9Iw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789401363;
	bh=wgyt08eBbaAlMChwFcZpN08jbB+qXyfL5vdAfA5J1RE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AuFh8cesCS+Lh2GhgLRkEorZEfzlys3flLXnSUAmOUXH5ZEy7LsZN+Skd7QJqcj4M
	 KMkz3P0NYcDo/XD80i4i+e8ZQah09pH2W1qvGfblaA5mewYSEKz2zBjQnLNDXLY2dW
	 TAVzYruIMbErKS16W5vkpSS4BgqlCGBFnrGHk23nIOE+0Qk4ou/Khb1kd9MDx9ykGx
	 gi9PyclcLcqc7uq9+ZysJHhHzRb+ptKDcx0K+deIBXiUI5RW3oJe00jkRfCx6eUilp
	 TFwlL5JjkT/DM0Q/LeFNXY1PMh1ytc21FAbv9CqaANRLQUV7JyEknie8vMGkEvj2og
	 Wki1oGlLmf9vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537C24057D;
	Mon, 14 Sep 2026 15:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C136C2E5
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E54940144
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AT4YBnjwH320 for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 15:56:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org ED9384013B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789401360;
 b=NGO4ZG76XWERBdzbbK4jrzadZEnTWJscQ0DA+gm8w/dwRbRJ8iiXPo6EaevzE+LGGsCz
 50pBh3z6GTVoOp3Ypwp9lsRL+7aUwlA33Y661dbolcgdjOHTvM8CurPxiIxq/oiClqlt4
 mWo/bPq+wf++4MDqdLhjRylkr/NlSkWFlMqpcZr22CvYHIknxmF66mpyepDHsgNgqDPEK
 jJw0GdkIzbSz9hLCDLykDDi7kSVhPCLPYTD3JdY2jnDRGI7900JbOd5MAL0rlG+h5maVa
 Ev0K58bqxd4LTk094t5GbJthES8tiLdWqVHOqvJgcIG1t6zw6iTu4JsEIjjuTXj7XWA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789401360;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=CO6d2JvhrFKqgWDLNA1oCdlPoonXdQzg1x5jZKlo3DY=;
 b=kI85KQhj5K6H7qnZ57Os77cywafz4xevmoa7RoNtmnxzCWG8lTZ0FK5gmquV4gMlPgse
 dO42LpgtXZ+LMJzGmkfuKmiyrdvA4vl8pH5PnzZMEOmdZweBe0fzfb6VRvDrRTJ9iHDiG
 e20P8vV15bGix9JJD6/GgPiGiQ5uvfV7SitxTNgMfygNIKAWBxPTqceD1v4yMfQlZzmyN
 8GiVUUYP1o15nHeoZMC8LugQ/jIglveRDMbL4k+J7zuYB/L0ilmJcMrbDfEdP50eYBef8
 JWzh18R6AM4ffu2oLXWIt3XH1PBnAgZeCGVq7rIF5fVwjAqKSigErGDyhSLgtenQdNw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lAVnkpNT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lAVnkpNT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED9384013B
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 15:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789401354;
 bh=CO6d2JvhrFKqgWDLNA1oCdlPoonXdQzg1x5jZKlo3DY=;
 h=From:To:Subject:Date:From;
 b=lAVnkpNTcfvPAXXA0JIe/lIqdNnDZrFb5ZYbGdzJg3SEpE6djD6n5j1B3LYeFS1BA
 9HLM0Y3sEDKE0ol1SHh7doPrSvaBWqZpBB9Z+0EFOw1MvjLdbaAFHrdGmir2q9WARz
 LlhocMlC2E4UoGZz7ILCddX6XPVBPQdbiGlh2o0QFSrXGqiyNfrEixNtTEsKAglPiv
 Xe3l63YWEvQmfeW6HqNui/4LEPxjmMycM66xGPBUIrnqxPxegoelV/N3jAXvkUY8FU
 HOCXrms8Jqs+mKmNn5GSJhx+icj1gKCV05poFs+u204YBONVHgUVagRr0M4gCcjcpC
 PtoF0LcRcX7oA==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6F14A4C3B0D
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 17:55:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x692A-000000001tP-2axp
 for buildroot@buildroot.org; Mon, 14 Sep 2026 15:55:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 17:55:54 +0200
Message-ID: <20260914155554.1136170-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.2.x, 6.18.x,
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
 - 7.2.5 -> 7.2.6
 - 6.18.51 -> 6.18.52
 - 6.12.109 -> 6.12.110
 - 6.6.156 -> 6.6.157
 - 6.1.187 -> 6.1.188
 - 5.15.220 -> 5.15.221
 - 5.10.269 -> 5.10.270

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.2.5 => 7.2.6}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.269 => 5.10.270} |  0
 package/linux-headers/{5.15.220 => 5.15.221} |  0
 package/linux-headers/{6.1.187 => 6.1.188}   |  0
 package/linux-headers/{6.12.109 => 6.12.110} |  0
 package/linux-headers/{6.18.51 => 6.18.52}   |  0
 package/linux-headers/{6.6.156 => 6.6.157}   |  0
 package/linux-headers/{7.2.5 => 7.2.6}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.2.5 => 7.2.6} (100%)
 rename package/linux-headers/{5.10.269 => 5.10.270} (100%)
 rename package/linux-headers/{5.15.220 => 5.15.221} (100%)
 rename package/linux-headers/{6.1.187 => 6.1.188} (100%)
 rename package/linux-headers/{6.12.109 => 6.12.110} (100%)
 rename package/linux-headers/{6.18.51 => 6.18.52} (100%)
 rename package/linux-headers/{6.6.156 => 6.6.157} (100%)
 rename package/linux-headers/{7.2.5 => 7.2.6} (100%)

diff --git a/linux/7.2.5 b/linux/7.2.6
similarity index 100%
rename from linux/7.2.5
rename to linux/7.2.6
diff --git a/linux/Config.in b/linux/Config.in
index 8cae599484..19c845a608 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.2.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index a2e1a81725..dea492b9b5 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
-sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
-sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
+sha256  8cee19e1839bb6ff4d5254d761933ae6ab670492d5ed030e09a80538320d5c4c  linux-6.12.110.tar.xz
+sha256  b74a43d0630809b7871cc906ac155e956cbc0b2e78a7451f5e6c8bfcb1208c30  linux-6.6.157.tar.xz
+sha256  ed4d0acb1307c235230c89efc094e210e6290593f94a7e617f28b1001101a33a  linux-6.1.188.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
-sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
+sha256  c07882e1e528efe206567a26de30b192db8dc4369974d4ef4ce708691fa1148c  linux-5.15.221.tar.xz
+sha256  de73d528b04be91f6eb86660aa67a4d53b96bbf20bb5a326e78f802d744debe7  linux-5.10.270.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 6f0de8b94a..9b4e1eafed 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  55ddf0df8325d9dad96fcff7bd93977d22e3f50af06527572af59b77c7632b78  linux-7.2.5.tar.xz
+sha256  039aef84f2b0994aeda3f4fcfc3d02ec9d7a9bbb9020ea264c43f446c860f606  linux-7.2.6.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ba2f60f858bf4d1f929101faa356c93dc8b925b17aaa9f95eabd4627758df613  linux-6.18.51.tar.xz
+sha256  2b69564f7d4fea0c859b1959ba33709ee6e9139bd100e30a853b57159a8221b8  linux-6.18.52.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.269 b/package/linux-headers/5.10.270
similarity index 100%
rename from package/linux-headers/5.10.269
rename to package/linux-headers/5.10.270
diff --git a/package/linux-headers/5.15.220 b/package/linux-headers/5.15.221
similarity index 100%
rename from package/linux-headers/5.15.220
rename to package/linux-headers/5.15.221
diff --git a/package/linux-headers/6.1.187 b/package/linux-headers/6.1.188
similarity index 100%
rename from package/linux-headers/6.1.187
rename to package/linux-headers/6.1.188
diff --git a/package/linux-headers/6.12.109 b/package/linux-headers/6.12.110
similarity index 100%
rename from package/linux-headers/6.12.109
rename to package/linux-headers/6.12.110
diff --git a/package/linux-headers/6.18.51 b/package/linux-headers/6.18.52
similarity index 100%
rename from package/linux-headers/6.18.51
rename to package/linux-headers/6.18.52
diff --git a/package/linux-headers/6.6.156 b/package/linux-headers/6.6.157
similarity index 100%
rename from package/linux-headers/6.6.156
rename to package/linux-headers/6.6.157
diff --git a/package/linux-headers/7.2.5 b/package/linux-headers/7.2.6
similarity index 100%
rename from package/linux-headers/7.2.5
rename to package/linux-headers/7.2.6
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 613ada58f3..f855af4a79 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,13 +476,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.51"	if BR2_KERNEL_HEADERS_6_18
-	default "7.2.5"		if BR2_KERNEL_HEADERS_7_2
+	default "5.10.270"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.221"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.188"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.157"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.110"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.52"	if BR2_KERNEL_HEADERS_6_18
+	default "7.2.6"		if BR2_KERNEL_HEADERS_7_2
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
