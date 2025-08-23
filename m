Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97954CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 09:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C0EF83C3A;
	Sat, 23 Aug 2025 09:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VfuKHSQOjmW; Sat, 23 Aug 2025 09:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1564683C2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1564683C2C;
	Sat, 23 Aug 2025 09:33:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CD25F19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B380D612CE
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihnoYH46T8t6 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 09:33:44 +0000 (UTC)
X-Greylist: delayed 338 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 23 Aug 2025 09:33:44 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5160C61229
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5160C61229
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5160C61229
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 09:33:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b990.dip0.t-ipconnect.de [84.161.185.144])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46427A4C42A2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 11:28:03 +0200 (CEST)
Received: from [192.168.1.144] (port=54508 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1upkXa-0000000067h-1lha
 for buildroot@buildroot.org; Sat, 23 Aug 2025 09:28:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Aug 2025 11:28:01 +0200
Message-ID: <20250823092802.3760544-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1755941283;
 bh=eVXrMEmBQlgtBSlo0UtygvXo8ZijMXm1sGKRc5caJRA=;
 h=From:To:Subject:Date:From;
 b=aWpS20VxkAI9Cj07DBM1kXGA5cnoYP0EARlgjXh6HvnoVRNMHJMVKYKEOPAHRAqZi
 rcHSQrLgOuFdZcH625ZGdCZI/nJVBpZXcZFcLM90TrMbCmJym0vKrmNVSJcJChuBOR
 yBKT2Klr0F4mElx7F/PVyurhLkph7SszWFbStdwqcNG6gLUOXG2LGY0CV7eIhzM25s
 stPTtPbnFRAJ9km28e+w1iP2e1iXKGYjRIpiwKLwb5tLyPnGTA+GHffUo9WO5LUaPl
 CIFqIoDej0ZPtF/PUFsVErk8G+BbsAL1YLQbqP+DXQe9tPAK6MTJsljS0mDlO4jhA3
 cIgO/SocbRORA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=aWpS20Vx
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: drop 6.15.x option
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

The 6.15.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index efb59dc535..0bedc24dce 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_KERNEL_HEADERS_6_15
+	bool "kernel headers version 6.15.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.15.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "libcurl removed BearSSL support"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index f5e2d663d1..80181fd78e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
-sha256  e94f3af85492302f7a819441458f80bca0ad9912e5a4c83c699ff3c63c52957d  linux-6.15.9.tar.xz
 sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
 sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
 sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b49eeb1e94..401a41b763 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_15
-	bool "Linux 6.15.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
-
 config BR2_KERNEL_HEADERS_6_16
 	bool "Linux 6.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
@@ -458,7 +454,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.9"	if BR2_KERNEL_HEADERS_6_15
 	default "6.16"		if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
