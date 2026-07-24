Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01BEC53200
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 16:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1422340B7A;
	Fri, 24 Jul 2026 16:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYmalC4ZBpTz; Fri, 24 Jul 2026 16:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A599409E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784911537;
	bh=oVkHzwdKP+MboUq9AX5aZYonOAWWiML15W3veo55Jww=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fCJpLd2M3NRK6UFeN48dnoZnTWVCr0KXTIweduCrR1o6VH43BnDfGyv/8CWoSDWI2
	 q8fDT+mvrPS09GBxaUZEkTTmLrX/llrbcrB58eBSFNcg+6pL98QC8+OP8JFZGIbFem
	 2T48I1PspC0yv6W9Q7/+WU5jqqqU1Az8bTrB/wSOh6UzTTjIT+4/VN0oxxzI29q9gT
	 4GITVaU2XwSvGF3EVDqbd/+2HTTUazi8I5mNVen/nzvfyRFBIU4b70s6z+Fg9F+opd
	 wHSiqhiY6ClbtiBgYKKIEd2dzz3LsI30r+FICnDp9z8U0cN+lKgx9xIQVk7zSbuBo7
	 0GG3/pKPppGxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A599409E9;
	Fri, 24 Jul 2026 16:45:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63EFC390
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AB9560B79
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vPqrrJwJ0R9X for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 16:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 370CB60B53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370CB60B53
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 370CB60B53
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 16:45:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a00d2.dip0.t-ipconnect.de [91.58.0.210])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF263A4C3D99
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 18:45:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55860)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wnJ1T-000000006Uw-0Inq
 for buildroot@buildroot.org; Fri, 24 Jul 2026 16:45:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 24 Jul 2026 18:45:18 +0200
Message-ID: <20260724164518.303546-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784911529;
 bh=COLY78tRM9qC+C8V2iuenLedr4HxlMRfYCnda+coP1Q=;
 h=From:To:Subject:Date:From;
 b=R4PgF1FUcQzwdW1lbgXCzxckw6iJEaFrUZlLle2KrDqDrxVuIW+tOTbkMcN+NTr/A
 6c4v5kaxkWlsdYfPp/nmASuV7JGDZnvIvzga/uSXMKvpGz8SoUP1y+xNz9FNazs7vw
 d6aMnaErlyky3UscRuVnmbIu0JVEtawSV8ybvNgG4RYRdLSUikk9FtYGK31n0g1PaN
 pjEbpn9FMgAqOd2TTGuejNPExsCiS5JNGadXZckcOO16lIuEKTdSuN9CcTpZm/hrbs
 wtw+5Cio5jR32n/yZmTNbbrQFaAnSdKOcJrQdDhERc9D9sZ91X0VRcrUvH+UQnQfXC
 txwgOqwWAyqaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=R4PgF1FU
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

 - 7.1.4 -> 7.1.5
 - 6.18.39 -> 6.18.40
 - 6.12.96 -> 6.12.97
 - 6.6.144 -> 6.6.145
 - 6.1.177 -> 6.1.178
 - 5.15.211 -> 5.15.212
 - 5.10.260 -> 5.10.261

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/{7.1.4 => 7.1.5}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.260 => 5.10.261} |  0
 package/linux-headers/{5.15.211 => 5.15.212} |  0
 package/linux-headers/{6.1.177 => 6.1.178}   |  0
 package/linux-headers/{6.12.96 => 6.12.97}   |  0
 package/linux-headers/{6.18.39 => 6.18.40}   |  0
 package/linux-headers/{6.6.144 => 6.6.145}   |  0
 package/linux-headers/{7.1.4 => 7.1.5}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)
 rename linux/{7.1.4 => 7.1.5} (100%)
 rename package/linux-headers/{5.10.260 => 5.10.261} (100%)
 rename package/linux-headers/{5.15.211 => 5.15.212} (100%)
 rename package/linux-headers/{6.1.177 => 6.1.178} (100%)
 rename package/linux-headers/{6.12.96 => 6.12.97} (100%)
 rename package/linux-headers/{6.18.39 => 6.18.40} (100%)
 rename package/linux-headers/{6.6.144 => 6.6.145} (100%)
 rename package/linux-headers/{7.1.4 => 7.1.5} (100%)

diff --git a/linux/7.1.4 b/linux/7.1.5
similarity index 100%
rename from linux/7.1.4
rename to linux/7.1.5
diff --git a/linux/Config.in b/linux/Config.in
index bc18e9d4e7..18b789d79a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 4212f73df0..a01be54f09 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
-sha256  ec19b8307b495078cdc03749e63cb3802ac23cf6122c82eb9719feeb4557ecc3  linux-6.6.144.tar.xz
-sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
+sha256  6cbddfa3bbd2229026f7cc5e48f6b7d6b46d39742de39a9257a2f490a0f45c6f  linux-6.12.97.tar.xz
+sha256  de100e33d8ad8b6f4b3d2335b179e961be3c00ae7a39efdb052182a8d8bf0126  linux-6.6.145.tar.xz
+sha256  7d83fa67ca75032b1ac6ef49973722073963c0cb9bc3aa7ef3efa749cf6c720f  linux-6.1.178.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
-sha256  47a8297131505b7d38338d39ad8a9d592507d33c695b27b1bbe55f25869a6b84  linux-5.10.260.tar.xz
+sha256  c396aeebc90c7aecb7f7abdf504c19b372c9926eb0cf0e91f9f09d7d870b65fe  linux-5.15.212.tar.xz
+sha256  a19ca1100640a5fd3b452eb15fe9de32f8deb4ab1866dd7db52183b1a2fad7c4  linux-5.10.261.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 75556f7ac3..ff4982267e 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  1c63922a119675d38e3ae0f8f6ee07f15c41a786ab9ed66563749bb8c9a08e2e  linux-7.1.4.tar.xz
+sha256  22a0196b3cbcdf34dc27b77561f4d040585fd3447edc9ab3531a1ac79e3041e7  linux-7.1.5.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0  linux-6.18.39.tar.xz
+sha256  3712fc1ec839e4daac981176c8518912e8f452650aaedfe4381da4419613a431  linux-6.18.40.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.260 b/package/linux-headers/5.10.261
similarity index 100%
rename from package/linux-headers/5.10.260
rename to package/linux-headers/5.10.261
diff --git a/package/linux-headers/5.15.211 b/package/linux-headers/5.15.212
similarity index 100%
rename from package/linux-headers/5.15.211
rename to package/linux-headers/5.15.212
diff --git a/package/linux-headers/6.1.177 b/package/linux-headers/6.1.178
similarity index 100%
rename from package/linux-headers/6.1.177
rename to package/linux-headers/6.1.178
diff --git a/package/linux-headers/6.12.96 b/package/linux-headers/6.12.97
similarity index 100%
rename from package/linux-headers/6.12.96
rename to package/linux-headers/6.12.97
diff --git a/package/linux-headers/6.18.39 b/package/linux-headers/6.18.40
similarity index 100%
rename from package/linux-headers/6.18.39
rename to package/linux-headers/6.18.40
diff --git a/package/linux-headers/6.6.144 b/package/linux-headers/6.6.145
similarity index 100%
rename from package/linux-headers/6.6.144
rename to package/linux-headers/6.6.145
diff --git a/package/linux-headers/7.1.4 b/package/linux-headers/7.1.5
similarity index 100%
rename from package/linux-headers/7.1.4
rename to package/linux-headers/7.1.5
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b1c0da9647..a484096649 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.260"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.211"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.177"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.144"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.96"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.39"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.4"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.261"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.212"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.178"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.145"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.97"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.40"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.5"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
