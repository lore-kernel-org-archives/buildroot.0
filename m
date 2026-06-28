Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E492C43458
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 08:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC9C0607B9;
	Sun, 28 Jun 2026 08:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFCPnsei8PJ2; Sun, 28 Jun 2026 08:39:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4802860777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782635972;
	bh=DRA7dYD9MjoGb1fmxqEBfpq3G9ZT4n4wpfHxlC7Do2k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jSxuFplOJOFWwE3FOpK10FJvKezzyDFV1ZIXLYE6DA6+QytNVLQSMDtFA4n3ofCy4
	 GaSNfnzVtqGfLG+rNTvdQYMYmzMx0qy0+X44MQgWB9KTEcDN2vCaUfQp7GBc0VDdVS
	 UFEPHZRZWZjt0pSHDxgYisETFuOtQPw7jAloid/hb/Ru68IHhULoquHtCwCCrtKLw3
	 5XD9wLUovKhNGKjobmkwvGrn1FA6gzE+Y24d8JxRq2fkQPbVNeSu/UKqlJSPFFH4GA
	 TFEQrZogZ/Li90FPp9TFKq36dhNvutyqj1hkGqvF+ENKD+8DMoMWXW1YrKpjRoOkj+
	 sR15OZs5YmIGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4802860777;
	Sun, 28 Jun 2026 08:39:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 934CDBC
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 08:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 783C981BF4
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 08:39:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UcB1wsb9Ah8 for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 08:39:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E312881BC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E312881BC6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E312881BC6
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 08:39:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c10f.dip0.t-ipconnect.de [79.214.193.15])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E3CEA4C097A
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 10:39:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58046)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wdl2z-000000007xe-3sYp
 for buildroot@buildroot.org; Sun, 28 Jun 2026 08:39:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jun 2026 10:39:25 +0200
Message-ID: <20260628083925.2912708-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782635966;
 bh=z1kGQIrsky4Tu/zt4RAV7NA74CTSykRJ1E+bjoDuJak=;
 h=From:To:Subject:Date:From;
 b=RjBTa9ile3x2Zpjuq1XwhSOc755AAQDmH5sfwnp84S/H45ZuPyfqomQEgH3+Ns7Rr
 xIQhZghHRGL+/93dC8YwA1WVr7PsFr6jUXiUp1Xw1wxYvms95l5SLtVJltdrVM2Z+G
 69t27JEhLsPh+cUrxYaWDN+67Vmo8VISqLJ1N1y3SlMaf+UwYKIYAlo1+OS2vqyr38
 tVAtE1SlHIXDODu7DwZzhsLhflJQCkfKtmEskTbDirY2XLRo5/STV85k97G82hblqs
 DWrLXgJCBwA7qXRZS2PJk9BtqxN9pcs9+jvwMVF+tbfo4tzyiV2lIS0yc0708tl/GQ
 q0taiTo9GihbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RjBTa9il
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.1.x, 7.0.x,
 6.18.x series
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
- 7.1.1 -> 7.1.2
- 7.0.13 -> 7.0.14
- 6.18.36 -> 6.18.37

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a6494fab01df4bfdfe2c911326a8f3f04c42a6ee

 linux/{7.1.1 => 7.1.2}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 6 +++---
 package/linux-headers/{6.18.36 => 6.18.37} | 0
 package/linux-headers/{7.0.13 => 7.0.14}   | 0
 package/linux-headers/{7.1.1 => 7.1.2}     | 0
 package/linux-headers/Config.in.host       | 6 +++---
 7 files changed, 7 insertions(+), 7 deletions(-)
 rename linux/{7.1.1 => 7.1.2} (100%)
 rename package/linux-headers/{6.18.36 => 6.18.37} (100%)
 rename package/linux-headers/{7.0.13 => 7.0.14} (100%)
 rename package/linux-headers/{7.1.1 => 7.1.2} (100%)

diff --git a/linux/7.1.1 b/linux/7.1.2
similarity index 100%
rename from linux/7.1.1
rename to linux/7.1.2
diff --git a/linux/Config.in b/linux/Config.in
index 0aa35bd028..320a2c5574 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 33ee9dc232..e611478e30 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  5215fa3541dc7e7f5bcd51bf7e57f169cec6fce508ca54e3dc85fdee14371d7d  linux-7.1.1.tar.xz
-sha256  3c81edd0f716aca3dd48dff691681827580cc53d35a8eec3be47d346d1f89913  linux-7.0.13.tar.xz
+sha256  37198c93727be247c9fb5309bb86cd5e496c61e5322cd8c4eca9476bb0b5883f  linux-7.1.2.tar.xz
+sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fbab86c9f471c81075b280cca30bd85d790c060063a1245859b6344b07c9c44e  linux-6.18.36.tar.xz
+sha256  a83cd200e6646db52866b8309e9137b9e9048b613cbda10ced2b811aae125255  linux-6.18.37.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.36 b/package/linux-headers/6.18.37
similarity index 100%
rename from package/linux-headers/6.18.36
rename to package/linux-headers/6.18.37
diff --git a/package/linux-headers/7.0.13 b/package/linux-headers/7.0.14
similarity index 100%
rename from package/linux-headers/7.0.13
rename to package/linux-headers/7.0.14
diff --git a/package/linux-headers/7.1.1 b/package/linux-headers/7.1.2
similarity index 100%
rename from package/linux-headers/7.1.1
rename to package/linux-headers/7.1.2
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a890c8f161..54fa189217 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -481,9 +481,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.176"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.36"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.13"	if BR2_KERNEL_HEADERS_7_0
-	default "7.1.1"		if BR2_KERNEL_HEADERS_7_1
+	default "6.18.37"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
+	default "7.1.2"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
