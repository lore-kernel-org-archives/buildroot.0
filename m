Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6DEE6B4D
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 20:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E70E6611C6;
	Fri,  6 Feb 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SU3ZyYDoBYMO; Fri,  6 Feb 2026 20:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDFBA611BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770408161;
	bh=FUBNGSbwVF9nEc1gUJjeA2HBtCv03oiKlb1QzZGdTRg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X4eSYIyiqz5QuNGHTKqBB5T9B7LLFyAOaW7kH658aJXrY2qdk32U1hlxhd2vGrTwN
	 1OtKqF+xiSk6OGWP+AHQ2bSIhBJRLMKQnzfoN0VHmfM7DTUvYDC4p7s3AYOQY9aJyN
	 36Ow2NQzDvKL4ohI2sjO6gVf4mtoVO8AfmqWb6aJk+bLvrjgMU+Q4nxrnxrHqUP/eF
	 s5gClG5QhgV6ad7ZaMBr4yp1rs4sXZ9b3r1to6mz0xF7fWMtI1TfDVZz501uYf3ZjL
	 Fo15oXdaYsUWEv8zHEQgf+Sig7WWb2LjqJ8Y655fpR/xuugm2a8eF5HxtyUA49gqI5
	 hSK0GcPp99BYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDFBA611BF;
	Fri,  6 Feb 2026 20:02:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94781173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7693C400B8
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSMHANuEKXCn for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 20:02:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F19AD40022
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F19AD40022
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F19AD40022
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:02:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 53F31A4C3E5E
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:02:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60308)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1voS2D-000000005tu-0aM2
 for buildroot@buildroot.org; Fri, 06 Feb 2026 20:02:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Feb 2026 21:02:32 +0100
Message-ID: <20260206200232.1976939-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770408154;
 bh=fD6mg+ujeFL+7vEQgvqwnOGnA9sBdry0Vl3Y/Moj/1c=;
 h=From:To:Subject:Date:From;
 b=dKwPShdttKOu2Jeoi4cPgdnvAo8q70yPLEGpdHkN/TgP9LXSDz6vCeQ28Tw6kazPw
 2jNC/wbCASRMAvxJ13WNvR2E9G444ZhMQG3gQmUiYX8bfyxj7AwnsSIcckkiYKh3i4
 bhtkXjAzvzjAJLPwD6+xXOIQS+Rad2sqZVrTkKwRzRgqnVThjY5MJaLdb2RfO0RlC4
 UF0de6sqOxwIxussXo97UasVeR+MDM4HeI9x+RVkeKDenQDu/vsfJUBHbzHWUZcez3
 MONCNYT5S0ohtcpoHI7QpA8KwJ7oQS7eBIQDqxwjSSBOuEZstkO5iz2F9Pm83nIS10
 caSpYGg+ExlTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=dKwPShdt
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x series
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
 linux/before-6.17/linux.hash         | 10 +++++-----
 linux/from-6.17/linux.hash           |  2 +-
 package/linux-headers/Config.in.host | 12 ++++++------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1e469a3957..48e5fc57ab 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 4d5850641f..90e2bf73cb 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d367c7504bd4da520dd01eb08125d2d0ac088bc8af4cd56d236f2074dd4225b7  linux-6.12.68.tar.xz
-sha256  d48e0d9de04bef2fb9740bdb0124548bcab8867cdca00ff9712c110282b299d6  linux-6.6.122.tar.xz
-sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
+sha256  4b493657f218703239c4f22415f027b3644949bf2761abd18b849f0aad5f7665  linux-6.12.69.tar.xz
+sha256  a616d4b5a18a9097e2df8e03dfd2ba366ddfc1321b16d648651dc512b3e945b1  linux-6.6.123.tar.xz
+sha256  9766422a49b9a24ea911ebc0b4e7d1f3d84fba3bc374387ae3c4bc60bec6d089  linux-6.1.162.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  5d4c0994580dd3bbd5ffc5fcb81c22dd305b844c9d8c7b176cc41b28f7e29743  linux-5.15.198.tar.xz
-sha256  b5e6e4f1f904a3377dde32ef3bc322f03a78f045c4d666483d383153902de005  linux-5.10.248.tar.xz
+sha256  01c0d3ae4c138a51891cb54d21374259fd07bfe1076e06362ec0ae0a822fbd2e  linux-5.15.199.tar.xz
+sha256  b990ed34261149542f932e5eaf1ba58535c5d48c147ae36bc2747c65e54d1046  linux-5.10.249.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 4d7f67daeb..f158e49815 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
+sha256  030115ff8fb4cb536d8449dc40ebc3e314e86ba1b316a6ae21091a11cc930578  linux-6.18.9.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8f59dc89e2..7b3efe74b2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -456,12 +456,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.248"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.122"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.68"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.8"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.249"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.199"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.162"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.123"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.69"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.9"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
