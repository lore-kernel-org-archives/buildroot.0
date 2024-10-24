Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CA5D0E3F7
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C125606A5;
	Thu, 24 Oct 2024 20:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA4UYyDVwtaD; Thu, 24 Oct 2024 20:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A4E60763
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91A4E60763;
	Thu, 24 Oct 2024 20:15:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBD89497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D729860763
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j3RSNjPrQyMA for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91278606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91278606A5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91278606A5
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:15:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf36.dip0.t-ipconnect.de [79.214.207.54])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6634CA4C0160
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 22:15:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44722)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t44F1-0000000045k-3JlM
 for buildroot@buildroot.org; Thu, 24 Oct 2024 20:15:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:15:30 +0200
Message-Id: <20241024201530.2626984-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729800931;
 bh=9ZW5SXat+J10pfbAayPOWRtbV7GHrOmixH5iCW3liGU=;
 h=From:To:Subject:Date:From;
 b=MdgcvEIB4bwpebA7VSUcQVPf+z0t1NfdaIfZSkJbJX0RNs8xsT34yB/tHB/Tnbrzl
 MKLMJDErzNqhcohzqvQJuNGsQ0/ZyWCBIJngOo6Hjq4g/7MzaSOYlQDhcY0OP9kZIa
 eqyCDMC1FEYscTXalp4oyzuhUTWjt4LyBZUHACc71ZOOiu46lo5BqfK/jsAybDBahf
 n78we0hWkvZQ1fAqmSc4pCFPYR9Lx7b2xprynqrE1q20XbAA0X6bGx5t00UD7ae81B
 H4lrJ+JiSZ3tL2nnTBxzsPrBesy9quc8IIfKxCtfPqxt84/cfAR9Ar1pjrJqtl4JFj
 iQW27ehwULsZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=MdgcvEIB
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 11}.x series
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
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 497b507945..1734477069 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5233de2b0b..21b553b8ce 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  057263d0afc17d5253794afd3d239ba4da4aa734b22fa36c1665f41b95449b73  linux-6.11.3.tar.xz
-sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
-sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
+sha256  471485b3b7f2fb637bd8fe3d00944c4c135c7d8ee02f357f33690baab0752a07  linux-6.11.5.tar.xz
+sha256  e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  linux-6.6.58.tar.xz
+sha256  2286e4a02ea2fbe65023dbf779f20aa994ba2b8d37ed559049378089451aa256  linux-6.1.114.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
-sha256  f6a19a64785965b9fcac0bcb6fd2412b45ca449495bb03592d46f9a50be51ca6  linux-5.10.226.tar.xz
+sha256  e618c6d845fd1bc89477508e8d084bbe791fc88bf7623adee2deb6ecb2275370  linux-5.15.169.tar.xz
+sha256  76cc8d7f1528f87902e38697229661d0617a7d6ab86166be9f3ef9a613b17b72  linux-5.10.228.tar.xz
 sha256  77221ab9aebeac746915c755ec3b7d320f85cd219c63d9c501820fbca1e3b32b  linux-5.4.284.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  4e27cdf999359876a0ff489bff6ece7ba5798ff37c2289db0c9e9422a9014162  linux-4.19.322.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7c1611699c..32cd7a464e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -430,11 +430,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.19.322"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.226"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.167"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.3"	if BR2_KERNEL_HEADERS_6_11
+	default "5.10.228"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.169"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.114"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.58"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.5"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
