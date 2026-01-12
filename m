Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB489CF45CE
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A070F61101;
	Mon, 12 Jan 2026 20:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkfMk2J09kiY; Mon, 12 Jan 2026 20:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E290610FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768251313;
	bh=1XeAnB+JgGoiJyaFh/ZvFpxWXQft65QzMGg18HGqtA8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=McP/T2ujL0eIfGYEiWZpGN8urTqhm9yhzFDsgf18n6tFovBoGIkxZOnPb7eAPrcql
	 Kip/p1pPFDJe3w0kbXYJmWQoTAZ9opoeQAuuWkVJjd6BdKPvw79gHsfenYU24HHCW5
	 KGaChTJYcs1Ep4Ndu15RqOfkZHm20rpm571+QKlmcqxKwXj7s9jIjLu3BZV2JPVqmK
	 FEhK3WtUyIa9jtQ269nc91AU1nLOaTSXC359dIBMUTRhGaugdtjuQMX0xZL1VBxt0a
	 xyBJkRuvzLESRfA5JMysMwqZ8vw7Gm6UfmS1JvZIORDLaFKEtAYkYq3q3CpfXvtdWa
	 TEqMJJHkefunA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E290610FE;
	Mon, 12 Jan 2026 20:55:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F4D18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 20:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFC3C81132
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 20:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcyUawDrcsas for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 20:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5A6081151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5A6081151
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5A6081151
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 20:55:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf07.dip0.t-ipconnect.de [84.161.191.7])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A5FB0A4C37AF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 21:55:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59684)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfOwK-000000007zu-3kqo
 for buildroot@buildroot.org; Mon, 12 Jan 2026 20:55:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 21:55:04 +0100
Message-ID: <20260112205504.3586930-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768251305;
 bh=AkIhi5CCzIJSJviB2n6pYykhpoN+PiyxrBdOHKqpVRo=;
 h=From:To:Subject:Date:From;
 b=sFODPYy/4jRrakLgDAc19vrjJtH5zp+E0BZxe9BDrCIMo24D1MDg8A7CTfdXTov1C
 +9Zt16D36hpYC4V1gWwMNG+G4NeZZKikd7Aot0HOjJGPkp2WpURJMy8vSsRgjtFS3T
 D4cXY6+BUs0+LhI3UOagC3NzsHwABnZvUIn0sUayJEQDshjG+vjJMiFZitBhOEcA7o
 OuHkb4LJDi/S1AaL5YEhzzkrHYrlqMx96emUpaZo/+N1T+Z2TLSbTCoVv5RZya87es
 KR8O0zIJMO7kHSaJ1DWsIZevlS8w/fW7hH7rwcOJEKq4tw8aHLE1rRiHBXX9UNRpWz
 r/fs4lL2IudsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=sFODPYy/
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6, 12,
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
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d0e11b3e33..12f8a87451 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 11db3e59b6..cdfd260ef1 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
-sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
-sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
-sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
+sha256  54e852667af35c0ed06cfc81311e65fa7f5f798a3bfcf78a559d3b4785a139c1  linux-6.12.65.tar.xz
+sha256  405c332d59eedc4fd78863ff07a06c040dfeef651e58f022910a5ac953e4dc21  linux-6.6.120.tar.xz
+sha256  0e8546a8437558be17ef5a87142055347bf2e7e9863ee58bb3996cbf0fd28496  linux-6.1.160.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
 sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f28ccaffe0..4710fc79a9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -458,10 +458,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.64"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.3"	if BR2_KERNEL_HEADERS_6_18
+	default "6.1.160"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.120"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.65"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.5"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
