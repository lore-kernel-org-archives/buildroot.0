Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4113C197BF
	for <buildroot@archiver.kernel.org>; Thu, 27 Feb 2025 18:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79C1041711;
	Thu, 27 Feb 2025 18:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5mGYOX8VGv8; Thu, 27 Feb 2025 18:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 450544171E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 450544171E;
	Thu, 27 Feb 2025 18:56:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0746711
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 18:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B40F3414C0
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 18:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pW8tRMZ6RS2Q for <buildroot@buildroot.org>;
 Thu, 27 Feb 2025 18:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48314414C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48314414C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48314414C1
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 18:56:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0987.dip0.t-ipconnect.de [91.58.9.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03309A4C0140
 for <buildroot@buildroot.org>; Thu, 27 Feb 2025 19:56:07 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48964)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.1)
 (envelope-from <bernd@kuhls.net>) id 1tnj3G-000000008Uq-1YGD
 for buildroot@buildroot.org; Thu, 27 Feb 2025 18:56:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Feb 2025 19:56:06 +0100
Message-Id: <20250227185606.3305729-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1740682567;
 bh=jO+i/HYqySGuFuD+Au6EMZGOHiuf3JhlknY5fiSk5GE=;
 h=From:To:Subject:Date:From;
 b=dS92k59JF4C7h3maxFmPmHhprDptc/6bPxIKC81RBJppivggIvHr5MO2cneNMoOLZ
 KjHK2uGeKdrT+l0Jx88eiw8VOqy/8A0ukeoIQHJ1bJjrqc/P6OXg5Mh6Ex78LaDOhK
 Z7Wl6BqR+wWdhl8Si0zYB14B+FwzF9vhe18vLAxy7OexsY8k5/jY4tE+zJKrv1FGqL
 byPKsOhhwPUAxK/FQ5lp1+AWgfQtB3QLKzgjTunVpi+rI1DPw0hxqgwmTsxaju9qav
 8FE3OJgeogm9Ps5S4lem/okLP9sr20XOzukOQLumxAMxtm43DX+BCasWyrWr7HhpKV
 Ki1NwRrhhUEdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=dS92k59J
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6,
 12}.x series
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
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c7c8cf3492..30fc9f095f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.17" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e6ea2ec3c2..a229630aba 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.16.tar.xz
-sha256  07a6f904470da1a099aa1683e3025a999dd82f2438f78b006b80c6ae2e9dfe8d  linux-6.6.79.tar.xz
+sha256  5c205cd34f80974e4973e321cb008f5f6895a8aa8c2577f06a9448cd77de63b3  linux-6.12.17.tar.xz
+sha256  6cf911d01324f45c9dd2f44cf06f55bda0ecf383bc498f132a0c549768531327  linux-6.6.80.tar.xz
 sha256  9d63e3bfde75a44a99e18812b002e5e5c0797b4eb3db408a7a9225c2c719b52b  linux-6.1.129.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6ddb308fa8..54d5720af2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,8 +432,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.129"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.79"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.16"	if BR2_KERNEL_HEADERS_6_12
+	default "6.6.80"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.17"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
