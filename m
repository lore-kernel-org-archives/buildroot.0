Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB12D5AE45
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 11:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5086740CC2;
	Sat, 13 Dec 2025 11:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2v5t8qV2ttY; Sat, 13 Dec 2025 11:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63BD540CDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765627159;
	bh=zKv0XUaqZ9tnDTRyQtj+o4tg39UbFzZgq4npeV2G/tM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JvvAgmwvE/JwJ+vS13qrd99xio3pbU0xJBh/bxXPBVmi5ovvEphaOOTxDsOBrAWTY
	 o315L0mtHOSzY3sanGnWx2XTAtzxJC9cdnGaYFCa5o/9v+12zOM9oZU9fYANzzNraq
	 sprUbHLjY+/tln6INx8q/t/OfMR143gV4LoQV3eJNEYTDOb37aOLVwaBy7wynegu5u
	 8E9qgUELSGflzRA5P3jojqM4P5qoLIIUlNZl2fxfk9dhvb0oMpr63/YviaqG+GZcLm
	 BwweooDYxteA9HaWzEBfQStapLSaDO3jw9OYvmewZIWf4gdJONT2Np0YWSxm6edMkc
	 ITw+HnjggKFEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63BD540CDB;
	Sat, 13 Dec 2025 11:59:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E189213D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D37FD606B1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:59:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-t7QGavj6oR for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 11:59:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB77C60685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB77C60685
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB77C60685
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 11:59:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E0811A4C341C
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:59:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47188)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUOHK-000000007Nd-2F4X
 for buildroot@buildroot.org; Sat, 13 Dec 2025 11:59:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 12:59:14 +0100
Message-ID: <20251213115914.1277421-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765627154;
 bh=zU40/bZc5GmM4qT8msdbfRiG+uQj64w3CAn+JBQpf5k=;
 h=From:To:Subject:Date:From;
 b=ZsIOmrM+g5nP0TaLL8w+3s0OWQFa6H7dLii+L0eAo2LD68l4DZqpfiWPYAje+Vwtz
 YY53dhFzrICk/QY8eWNSFuQpmyU6KTda90W5RFpwSsgiVGdvwtjZx8AkJ1Ii2W0YY3
 /WS78O1CVVcmz/K7Q0zah3qz8cOGPvY5++FVIxepz8XlNeI+I6engsWmMY6WJYdLV/
 hk6BxrSzMjH5g/2YWtyMb3iqDp3YojspHIDZRPL+VKoEIc+FWeFZKPsT+VbsekfXJ9
 ipP0fO7s0HxUQDH6ITM7310aPT+rOwvqRdo1zgPjSvgy19e3sC+1Xh1a1/vWvSyslA
 w+W7VPkkS0xcw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ZsIOmrM+
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{12, 17,
 18}.x series
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 10024bef38..7b1c9b61a2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.1" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d82ccf83c3..29950987b1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
-sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
-sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
+sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
+sha256  42780496f99194e9d66b21f13dc2bded952624d5c7bd83eade7f74ff658e98d6  linux-6.17.12.tar.xz
+sha256  13e2c685ac8fab5dd992dd105732554dae514aef350c2a8c7418e7b74eb62c13  linux-6.12.62.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 412232a571..0f544e07f8 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,9 +464,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
-	default "6.18"		if BR2_KERNEL_HEADERS_6_18
+	default "6.12.62"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.12"	if BR2_KERNEL_HEADERS_6_17
+	default "6.18.1"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
