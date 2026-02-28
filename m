Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0118FFEE4CA
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 07:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C02D180DC9;
	Sat, 28 Feb 2026 07:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCutz3VHIMCW; Sat, 28 Feb 2026 07:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC9B80DC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772264256;
	bh=RpvWwVQiyHOH+TfMUT0V8kqgN/G7oR1rRCYFJhKL064=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q0fMsOeL50Sk2sLJFWHLT3pItWDqNrPcQ1X52XF5TdDNdNoRwTczx5Oom34B1LnYh
	 uWdmZHRdBK7v4DysJrVHmz32cgmDWxjlYQcoAZqMMRuSWHk9IxeuXtMX42Uccbu81d
	 7ajTTEC1RLzoVkYCEmN79PQ/h5YNLA6pq65+bLny/iXOvsFNNFC/dpN7iSkWHgq2nj
	 Nh+XoE+3b42lHkS7ehsCGqSdPDXbQgmskZQa7gY4aKOlVq08w1q9ukbnfe5pui77qg
	 PQ1nX7Clw/g1SOxPCwCJMZcDMiNT11P8KEngPI2VH021rLdWcbPXDMaoIUXUJsZLBy
	 Xi9R/XoIibmEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC9B80DC1;
	Sat, 28 Feb 2026 07:37:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1572218D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 07:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 073DF60E24
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 07:37:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvvbSkxMEjRL for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 07:37:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B72160D88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B72160D88
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B72160D88
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 07:37:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BDB6CA4C2ECC
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 08:37:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vwEtD-000000005zX-1Yht
 for buildroot@buildroot.org; Sat, 28 Feb 2026 07:37:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 08:37:27 +0100
Message-ID: <20260228073727.2196364-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772264247;
 bh=xHnqcHJQ/pq+5VOhUs7Itr0ecOZujkbExxcPVaVrrIU=;
 h=From:To:Subject:Date:From;
 b=ltHxEa2JYyZmjBegps+aGR52+LVbe9e/0Jx4XQpJjDzWtBuqyB79d+jUqQ20imss7
 PdSJfUh7F9HX8kRYTHdnUOrJdSYdaybG87z1W02oVtme193e/l9g+tbs98yixsqN7y
 F8iEf60znB6D06a1gqToYsKqIQgBcHbEtxlRk2MraWDlzbQW3bQ4+L63fLqYD/EZc3
 v36eMgZTF2U6NI4jjDbMuyQ6iMWnt0kNmIoKVxQR+RzyvYV/jXzoRVu6cEOiZWz1+L
 TSMZfGZaK2qKSaXogOYfBCggy2BZM2OPDkUZ20aXG5Qq5lHUO2uTmEbSY5HXyRzrtN
 KalkR+G0h1Qjg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ltHxEa2J
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{18,
 19}.x series
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
 linux/{6.19.3 => 6.19.5}                   | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.13 => 6.18.15} | 0
 package/linux-headers/{6.19.3 => 6.19.5}   | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename linux/{6.19.3 => 6.19.5} (100%)
 rename package/linux-headers/{6.18.13 => 6.18.15} (100%)
 rename package/linux-headers/{6.19.3 => 6.19.5} (100%)

diff --git a/linux/6.19.3 b/linux/6.19.5
similarity index 100%
rename from linux/6.19.3
rename to linux/6.19.5
diff --git a/linux/Config.in b/linux/Config.in
index e85cfd3175..5a0757fece 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 8f4d558e8d..20618f4da0 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0e474968adfcbee32916fd01a89d8ccfd1168d8d32569e76a5c664c793198ebe  linux-6.19.3.tar.xz
-sha256  ed2c3c55fd38e6836c094fce356f2567f9516130b73354a29857960368c5687f  linux-6.18.13.tar.xz
+sha256  95ae05c8c709e353c0e8506c072efc5598d85b8b7b564a1ebac7ee8345042ffa  linux-6.19.5.tar.xz
+sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.13 b/package/linux-headers/6.18.15
similarity index 100%
rename from package/linux-headers/6.18.13
rename to package/linux-headers/6.18.15
diff --git a/package/linux-headers/6.19.3 b/package/linux-headers/6.19.5
similarity index 100%
rename from package/linux-headers/6.19.3
rename to package/linux-headers/6.19.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4745ff148e..f8364d0c7b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -469,8 +469,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.164"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.127"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.74"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.13"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.3"	if BR2_KERNEL_HEADERS_6_19
+	default "6.18.15"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.5"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
