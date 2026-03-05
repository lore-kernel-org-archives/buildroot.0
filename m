Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77018F47CBA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 19:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ACB360A61;
	Thu,  5 Mar 2026 19:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFGRK5Mrm8u1; Thu,  5 Mar 2026 19:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B4E60DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772740085;
	bh=kc4WRapXLsvwEO+62B4ayYqLTNOqDoUfOsVYumEt6Cg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ji3PbQlj2NXICtMuT2TTgZgVBSTJeylW4VJ2nkRn37tJYF9TMZQ4+xD/66B3/pRVY
	 Vg3RJMqQ56j9u9D0+2L3uNs4MiT16nROzEUu1iukkoJrQO47daA9vaZdtgVh8rWZYf
	 7nA6MKOEAi5x/E+7XZ1debBUIyeJsFPzau+tP8k06urPq7Qlhj6hr9fakP6Uui0OhX
	 YcnkjEvfm4AT61OLrcLs8WaTxOTySxhJfo2aXw7AxkpNMrzAZ44qOtGt6Ibfip0YYA
	 m/RqssKoeHNzcVk/7WE+JEsrcTLkr6Nv6Okxn7PLoaoZC3VEis98W/c43Hd8IZlTt/
	 XtIoHLcx8enIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B4E60DC4;
	Thu,  5 Mar 2026 19:48:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA2B6223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC47182438
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:48:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hcXNZXo0KZ51 for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 19:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0EDC82437
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EDC82437
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0EDC82437
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 19:48:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6257AA4C33AC
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 20:47:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyEfv-000000005g0-0CH9
 for buildroot@buildroot.org; Thu, 05 Mar 2026 19:47:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 20:47:58 +0100
Message-ID: <20260305194759.89133-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772740079;
 bh=+t+ntW3Fou2PA1S41HZ0HS1o7BBDUQ9wrxcB69YglTU=;
 h=From:To:Subject:Date:From;
 b=lOAGLINT9dSLGLTlBM9ddwNvDqFThwvasKjdAFFwPvayqWJMjTfLbB5iOJeKjzG1N
 AbKGykUHgZNYjRgfz93/6QGIYj/fFTy80Xu2OwXWUmiyDoMkkc8q6ALekU7YuvdlPV
 F7mf54Dr6L9IBBvxwCF7kVwM85NG4x8pdmkFrFUK2mjxn1ADgQMXr23tNcpBgCLHnC
 hTQEyj2wsI9UO9faNEQ/Mjrt8iOTQ+hGwb37qlxtcdLeT1/dJNt6XfCxcM3Q6WN9GP
 h1aZCk4zQfQvhs2RfAqP/QnXy4HWv+8ZGD6Y4nGRY36SgSaIaZ8wzkVUM70HO+vV7y
 2g+22dOnAfvPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=lOAGLINT
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
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
 linux/before-6.17/linux.hash               | 6 +++---
 package/linux-headers/{6.1.165 => 6.1.166} | 0
 package/linux-headers/{6.12.75 => 6.12.76} | 0
 package/linux-headers/{6.6.128 => 6.6.129} | 0
 package/linux-headers/Config.in.host       | 6 +++---
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename package/linux-headers/{6.1.165 => 6.1.166} (100%)
 rename package/linux-headers/{6.12.75 => 6.12.76} (100%)
 rename package/linux-headers/{6.6.128 => 6.6.129} (100%)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 233dacaff8..90e67be8bd 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  06ee7927556ff1aa8810c4826501b0fdb169ebdc180644b882cf7c143ac1c177  linux-6.12.75.tar.xz
-sha256  669633bb8480021f15c38883fb2f6fe2087cc8b69a582f26f6b7d4ae6b348e48  linux-6.6.128.tar.xz
-sha256  5a817184f1be901b75c7e0afc02376bc3ac51624e03ec6f7b8a5f9d395d22ef4  linux-6.1.165.tar.xz
+sha256  bbb43e834c46e6bd49a5c28f22e679a937443404e1f653204d4b24929f3ad896  linux-6.12.76.tar.xz
+sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
+sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
 sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
diff --git a/package/linux-headers/6.1.165 b/package/linux-headers/6.1.166
similarity index 100%
rename from package/linux-headers/6.1.165
rename to package/linux-headers/6.1.166
diff --git a/package/linux-headers/6.12.75 b/package/linux-headers/6.12.76
similarity index 100%
rename from package/linux-headers/6.12.75
rename to package/linux-headers/6.12.76
diff --git a/package/linux-headers/6.6.128 b/package/linux-headers/6.6.129
similarity index 100%
rename from package/linux-headers/6.6.128
rename to package/linux-headers/6.6.129
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4ef19c2e9c..7c2f9a7aa2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -466,9 +466,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.165"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.128"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.75"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.76"	if BR2_KERNEL_HEADERS_6_12
 	default "6.18.16"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19.6"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
