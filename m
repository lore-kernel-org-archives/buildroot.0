Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22C5C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 21:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25EEC606B1;
	Mon,  3 Aug 2026 21:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGWcKtw4Zpqa; Mon,  3 Aug 2026 21:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0EE76066F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785791281;
	bh=Zg9WYNUUtk4ms98GMTyyxVgJqC4h7Ubz3jDXSt/N8ZE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sirXhC4Lh6cNWCDr2qa+/VeWoHsfBwmhg+3fWoriLJH3/8HXX3lM6BqADkh7KZQMU
	 /SH24YrnZR/5/060nnhXeqK3l057j85OkFjvtrWt3B7Z7jVuQov+3JGUJDQbw19SvM
	 1xg5MIzzQTCw58PMOipFEcgytMfnHjSiHdSjpBeQYmfldFiElnIQgcqsMh/EK7Wurx
	 EecHJ6w+5o2ep4e857X4X1EN5xa97k49GqdwzZO2m3lhCTMISORXHrdZ/zKWQCU+/X
	 ljacxN1I1JhpHfBjB2KG3k7GzGbWx30vDTuwuj0V//BkilEHj+XH0jjbQ11dBfTRtF
	 kASJDDthHcs8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0EE76066F;
	Mon,  3 Aug 2026 21:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AE422DE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C4844010D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 21:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ytl0OU8--jKt for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 21:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A1F1F400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1F1F400AF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1F1F400AF
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 21:07:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ddb.dip0.t-ipconnect.de [91.58.13.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED7AFA4C43EB
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:07:53 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wqzt3-000000000V6-0LJy
 for buildroot@buildroot.org; Mon, 03 Aug 2026 21:07:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Aug 2026 23:07:53 +0200
Message-ID: <20260803210753.11940-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785791274;
 bh=1wYuHAfxhRHofAH1KwDuhk9jnS8ZESKR6DVj15bGxQM=;
 h=From:To:Subject:Date:From;
 b=XdH9tXQfkdLbziOLzWnG6r57mv+t2TiL6ZCsHO5xwGxZShbUNtedb/j+f2jG37+T1
 BJlcdphQRZvJNajTeNZqohhZrw30ZMLfZ7JuGuD9w1cggXNd6Dc56PIaGC1oBL/Uzq
 qQCUHMoL9IZsMKEsKwtN6/4fHM1h5av35zbylq+j2cYfLopuN7kjumJuJgwhf7q4Ll
 TmK5nborsqSbmGS2DvVm6I8Udo//VxxqqFfktlw6RlSAm6h40DdtvG+RmGt1OnqGy9
 bvb8OZZxxjZYa8qK05QoJ4p5JlKbO0yBcnrkaoDSD0nKURveMzERc7UNehD1eLvrcd
 9Iok8Qn57dkoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XdH9tXQf
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.6.x, 6.12.x,
 6.18.x, 7.1.x series
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
 - 6.6.147 -> 6.6.148
 - 6.12.100 -> 6.12.101
 - 6.18.41 -> 6.18.42
 - 7.1.5 -> 7.1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.5 => 7.1.6}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 4 ++--
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.100 => 6.12.101} | 0
 package/linux-headers/{6.18.41 => 6.18.42}   | 0
 package/linux-headers/{6.6.147 => 6.6.148}   | 0
 package/linux-headers/{7.1.5 => 7.1.6}       | 0
 package/linux-headers/Config.in.host         | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename linux/{7.1.5 => 7.1.6} (100%)
 rename package/linux-headers/{6.12.100 => 6.12.101} (100%)
 rename package/linux-headers/{6.18.41 => 6.18.42} (100%)
 rename package/linux-headers/{6.6.147 => 6.6.148} (100%)
 rename package/linux-headers/{7.1.5 => 7.1.6} (100%)

diff --git a/linux/7.1.5 b/linux/7.1.6
similarity index 100%
rename from linux/7.1.5
rename to linux/7.1.6
diff --git a/linux/Config.in b/linux/Config.in
index 18b789d79a..c2b52bcced 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f86991284b..779def28d0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  67f973533406492e86774bacbcefae50d50d5c34cbf703c47ec526a5efdcee90  linux-6.12.100.tar.xz
-sha256  e76329b7ee046883d55a1868253cffe67c526a6da6140ebecd3cd6ac44db4abb  linux-6.6.147.tar.xz
+sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
+sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
 sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index c8be87c361..8072305f0b 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  22a0196b3cbcdf34dc27b77561f4d040585fd3447edc9ab3531a1ac79e3041e7  linux-7.1.5.tar.xz
+sha256  995dd7188d924662b94b48fd6fb783587267590e5b8bb33dade2c771e7d855c1  linux-7.1.6.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  17fc72f0f8d4a8a8633a5d20085f5d9c5a5ec51ee896a0b7ae1ec25da31273ea  linux-6.18.41.tar.xz
+sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.100 b/package/linux-headers/6.12.101
similarity index 100%
rename from package/linux-headers/6.12.100
rename to package/linux-headers/6.12.101
diff --git a/package/linux-headers/6.18.41 b/package/linux-headers/6.18.42
similarity index 100%
rename from package/linux-headers/6.18.41
rename to package/linux-headers/6.18.42
diff --git a/package/linux-headers/6.6.147 b/package/linux-headers/6.6.148
similarity index 100%
rename from package/linux-headers/6.6.147
rename to package/linux-headers/6.6.148
diff --git a/package/linux-headers/7.1.5 b/package/linux-headers/7.1.6
similarity index 100%
rename from package/linux-headers/7.1.5
rename to package/linux-headers/7.1.6
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index faa31b5733..563138a7f5 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -475,10 +475,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.147"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.100"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.41"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.5"		if BR2_KERNEL_HEADERS_7_1
+	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.6"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
