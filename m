Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042E0C5AD4E
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 07:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5E426063E;
	Mon, 10 Aug 2026 07:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CaMi_lwZKEpD; Mon, 10 Aug 2026 07:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4806360632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786345342;
	bh=wsPDBjgNa9Bv/VZn5UwDEckmJO9hicQWI1ftZvlW//o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=axyWcLc8DQJvE4dNnIpf07SCi/mkDzEYwJDiEdRvvdPP9ifd+c3axyf/3Ww1kLjk/
	 B+d8sYWXSLV+6VXhk0znmGcvGVRLtiEkpCDi81oayrNUP1DmahA4iyIGp2KA4/RUD+
	 szCOcrSNL/mL/vr6IOAXG3duGJPNKqG4GEU/Gw1YqRNI5CpIYoYYZq5nEWI8hwcRV4
	 /e5xLPPDaVPTxkp88HgEBQcN8lgPkZ2QHOo8Eoe9J5obeMIPbo6SHvEUVwKkTgk2HU
	 ZgIA6etGI9H9qEUXIoSlA1uHtuVyVC3Gs7SpdqtLhZH/v84wjS01VSvBWx1RRyLi41
	 rJScQbvQi7EWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4806360632;
	Mon, 10 Aug 2026 07:02:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C082923F
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 07:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2A9160632
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 07:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JjexkbYmwalJ for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 07:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3787760628
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3787760628
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3787760628
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 07:02:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c005.dip0.t-ipconnect.de [79.214.192.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6916A4C4704
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 09:02:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43476)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wtK1W-000000006uB-1lPF
 for buildroot@buildroot.org; Mon, 10 Aug 2026 07:02:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 09:02:14 +0200
Message-ID: <20260810070214.3484125-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786345334;
 bh=fGqb8SqJFkjXHcGb9eRQyVvqr/3ZBO68JnxOaWoKL7E=;
 h=From:To:Subject:Date:From;
 b=eiS8v9B6I9tfwNwKB0oYGV3UUXDIKEyH6dYDaugwPtksj8TxhCJ2KKoi/6nn/HPbv
 2v2nSARsqKfDhHqgQvDte5CPXlYlNPEYDxdq5zg4wwaxcHYV9GpaXU2H20d4lHB7zD
 FJX//mKYqJSGkapgS9AEfo7jLeQfWZyo3E4GyVvelwVYG6wfGdNteMs8EEM8V3myHl
 97znd7yA0Jm3BXG1vFoe3qsFrz8rnioge1sqwQuIpb537wFsZ+nala0/HvCAc2aTup
 yyOlqSjpZ7pArE2YcMSexblBcZ9nfmcO4Keaj9vPgV4TNdHPsnENMfpy/wf4WOChkM
 p/KfyrUd5atdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eiS8v9B6
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 7.1.x, 6.18.x series
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
 - 6.12.102 -> 6.12.103
 - 6.6.150 -> 6.6.151
 - 7.1.7 -> 7.1.8
 - 6.18.43 -> 6.18.44

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.7 => 7.1.8}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 4 ++--
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.102 => 6.12.103} | 0
 package/linux-headers/{6.18.43 => 6.18.44}   | 0
 package/linux-headers/{6.6.150 => 6.6.151}   | 0
 package/linux-headers/{7.1.7 => 7.1.8}       | 0
 package/linux-headers/Config.in.host         | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{7.1.7 => 7.1.8} (100%)
 rename package/linux-headers/{6.12.102 => 6.12.103} (100%)
 rename package/linux-headers/{6.18.43 => 6.18.44} (100%)
 rename package/linux-headers/{6.6.150 => 6.6.151} (100%)
 rename package/linux-headers/{7.1.7 => 7.1.8} (100%)

diff --git a/linux/7.1.7 b/linux/7.1.8
similarity index 100%
rename from linux/7.1.7
rename to linux/7.1.8
diff --git a/linux/Config.in b/linux/Config.in
index 5dd0e9393e..2c6b94aed2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7102a69377..c1e447e255 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
-sha256  6eb823269151936c0af9e050678ed5c70ca515d6b20a09af741852b02d228979  linux-6.6.150.tar.xz
+sha256  f143aaade8877ba5616e788b4482576db28481bcf557ef537f4fcc3938fc3176  linux-6.12.103.tar.xz
+sha256  de01e5ae73412b70bceb41a6f97da6d0f29b6536f1f00f8b6a6fd40c729969f7  linux-6.6.151.tar.xz
 sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f527761764..bb9750191d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  ca8f2a6884a4d62043e9ab93ac1ab15efc2b6630fe8f768b2ef2ffdf4b5e26df  linux-7.1.7.tar.xz
+sha256  ff01dcb449279d5b4cfccdb01fee639cf5ff1803f1749a77844dd33915422c49  linux-7.1.8.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a1aeb926c7c4a1564368200b1082e45bb958007682d804aff88abbc3a7a47b5d  linux-6.18.43.tar.xz
+sha256  0f72d938f06828e82c90405174fe572287db7bfe089e2fc46572a99a7f240d43  linux-6.18.44.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.102 b/package/linux-headers/6.12.103
similarity index 100%
rename from package/linux-headers/6.12.102
rename to package/linux-headers/6.12.103
diff --git a/package/linux-headers/6.18.43 b/package/linux-headers/6.18.44
similarity index 100%
rename from package/linux-headers/6.18.43
rename to package/linux-headers/6.18.44
diff --git a/package/linux-headers/6.6.150 b/package/linux-headers/6.6.151
similarity index 100%
rename from package/linux-headers/6.6.150
rename to package/linux-headers/6.6.151
diff --git a/package/linux-headers/7.1.7 b/package/linux-headers/7.1.8
similarity index 100%
rename from package/linux-headers/7.1.7
rename to package/linux-headers/7.1.8
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4fa0bc80f9..ad1a5bd70c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -475,10 +475,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.150"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
+	default "6.6.151"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.103"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.44"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.8"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
