Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E27BC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C23C40CA6;
	Thu, 10 Jul 2025 20:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vk0SQE8nnO2v; Thu, 10 Jul 2025 20:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9DE40C99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9DE40C99;
	Thu, 10 Jul 2025 20:05:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 266D412E
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C9E183C6B
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbkV332u70gL for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 20:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07CF683C5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07CF683C5B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07CF683C5B
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:05:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bbdd.dip0.t-ipconnect.de [84.161.187.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C133BA4C0258
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 22:05:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53146)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uZxWf-0000000080f-1kM6
 for buildroot@buildroot.org; Thu, 10 Jul 2025 20:05:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 22:05:49 +0200
Message-Id: <20250710200549.3666175-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1752177949;
 bh=uXanoze6FJFPTfb8FWRiI0NH+UsFzPEIPgx2bl4LdTk=;
 h=From:To:Subject:Date:From;
 b=thWDdzRYegLscbsCf1r/CmeTgKjeiRB9TodXG0k9+YTHYg/7KpUdXZV99aghIMeXd
 Q3CDsTxgw+BqoYaLK4xhb8q4IrVb1Ip0K0mILn4YQdGFzOApyGT2S+eXgR+sIp0BFq
 gsLl6N8x8DcObdSsjHNKu7lwXG5KymH0eRLudyZda7U29WiUBVHv5VzAySSuAbQxbu
 Dxqz1Bf9cPdY5i8XjMIagG2ZJKrS64+0esoc4XYioYnudrOLQx/AAdM6liwpBW1X8Y
 M3j5oNHJNSUaFgsCs8RSOP4RTDjxV+55tS6dh6zZ4HuJJEajdywhCFaR8beaerxs0T
 gYq/l1YWIW7IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=thWDdzRY
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 5.15.x / 6.{1, 6,
 12, 15}.x series
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
index be22d807ff..f74a0cef53 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.15.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.15.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a6cc67ac4e..c3426f6a6c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2ca707939c14431232649874d438aa58f11b4b127290fa68d164f8bd79c688b5  linux-6.15.5.tar.xz
-sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
-sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
-sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
+sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
+sha256  936fdfd2405b5e0ac38d4e094b07772610c22cd478f4bb257c9bf929e762ff95  linux-6.12.37.tar.xz
+sha256  3b67c170638142da56b7a9c3295f2483b88e8c4d3bc26b2bda63b6cf0cb9ee3b  linux-6.6.97.tar.xz
+sha256  0f49bda42fbd7506063d537fec7d4d147c373a0324655fdaf2a65a000c9f7acf  linux-6.1.144.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
+sha256  21786ee84981418279fcd60ae6ed98ab2f102b5a4a255bd81b881033f0afff14  linux-5.15.187.tar.xz
 sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
 sha256  c48158f7735668aac78b9d74bb3616f57a4ea0816ca09f7db83f7834d705b6a9  linux-5.4.295.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index db6fb95f8a..5c0ec12287 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -446,11 +446,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.143"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.96"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.36"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.5"	if BR2_KERNEL_HEADERS_6_15
+	default "5.15.187"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.144"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.97"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.37"	if BR2_KERNEL_HEADERS_6_12
+	default "6.15.6"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
