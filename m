Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819D3C8303C
	for <buildroot@archiver.kernel.org>; Tue,  8 Jul 2025 18:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3035560ACD;
	Tue,  8 Jul 2025 18:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sPO_7p-iL39a; Tue,  8 Jul 2025 18:15:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6AAB60B22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6AAB60B22;
	Tue,  8 Jul 2025 18:15:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 89C621BF
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 18:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7086B40815
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 18:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lzgnc3M4v2TW for <buildroot@buildroot.org>;
 Tue,  8 Jul 2025 18:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E02D4080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E02D4080B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E02D4080B
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 18:15:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7c8.dip0.t-ipconnect.de [79.214.199.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 347DEA4C2DF9
 for <buildroot@buildroot.org>; Tue,  8 Jul 2025 20:15:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35918)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uZCr3-000000007xw-3UMQ
 for buildroot@buildroot.org; Tue, 08 Jul 2025 18:15:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  8 Jul 2025 20:15:46 +0200
Message-Id: <20250708181546.3524574-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751998547;
 bh=FZFrwkHE8qmbcGvB5Whn6HINJ3XgdS5X48f2Cl1SUyk=;
 h=From:To:Subject:Date:From;
 b=cnZLEa+gMd+Bkss0wcDp96NITjHw2Mxdif1M2lcs3/sxZScjtVbgUTUB9V2gN44HH
 U2SZTYJA70fwcMXh6VZuAYGwKXwZ/4W3zwpgI69OSp0BUkPLwOgOrAfmviZa8/uib7
 GIeWJL2moISFXHT/yQLImO0FZJlh7AY6iUYJQSRt08XIMWlvPP/yYtnWwpkJSlaE1e
 A+06V30EyOtLxwaO/W5tMVrgVdOQ7GbFt8RfhfkpVl/Ot/8kuxtE47R+a8CbvYxJ8Z
 H5nA7bZaGN4H8wLIrKIhHOteeNg0n61KLEhqiycgHFlujHJhlDo3xYH/dFvB1w/F7x
 4l78rNIbPJihg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=cnZLEa+g
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12,
 15}.x series
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
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ada39c10a8..be22d807ff 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.15.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.15.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 254682d009..a6cc67ac4e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0eafd627b602f58d73917d00e4fc3196ba18cba67df6995a42aa74744d8efa16  linux-6.15.4.tar.xz
-sha256  05f4e0b01dde578c3328eb539d305cccec7b84e939f6dd5f21fdaf5f313da748  linux-6.12.35.tar.xz
-sha256  18640ae9a2c952f8f8868324378df1a9e138ad29e6b93a9c38155764ea67ea85  linux-6.6.95.tar.xz
-sha256  dcd26ea135c96bddbb17131f96176bca1a9268ea0e1cb96dfb7d6970780fa3aa  linux-6.1.142.tar.xz
+sha256  2ca707939c14431232649874d438aa58f11b4b127290fa68d164f8bd79c688b5  linux-6.15.5.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
+sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
 sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2a8b2a863b..db6fb95f8a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -447,10 +447,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.142"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.95"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.35"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.4"	if BR2_KERNEL_HEADERS_6_15
+	default "6.1.143"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.96"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.36"	if BR2_KERNEL_HEADERS_6_12
+	default "6.15.5"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
