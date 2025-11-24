Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A3CFD356
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 20:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C57C83B83;
	Mon, 24 Nov 2025 20:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQGT9pHT0lnW; Mon, 24 Nov 2025 20:32:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 330AE83BE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 330AE83BE7;
	Mon, 24 Nov 2025 20:32:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A21F9359
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8855B60EAD
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvlhmC7_1JFr for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 20:32:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6C79260D7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C79260D7B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C79260D7B
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 20:32:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1a8.dip0.t-ipconnect.de [84.161.177.168])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 124A2A4C48A7
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 21:32:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51018)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNdE9-000000002N7-3u4B
 for buildroot@buildroot.org; Mon, 24 Nov 2025 20:32:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 24 Nov 2025 21:32:01 +0100
Message-ID: <20251124203201.3480276-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764016322;
 bh=XaMIB2/o0Z+XgDBTKj2cjF8TpmO4XaR3udPoFmluWFY=;
 h=From:To:Subject:Date:From;
 b=uVabsJZbHbzYI9kVBVFFkUxKGvO8e9FekhG00wuIsRRykQpXYYJoH7iZcu0bq4qOI
 X+wRICCH8Bj3dNsk6OyoGh5/VpVEiOHnI5xpdkqNLwbJMZTnB7aMW3szeOxPA8tOQn
 iCLybV2ChLjoBXhreWHp2qBGrSN7gein1rzD4ffRl3k5ENZ6lDP91Wr7Bvieyz67wp
 qZOuzyR3JvN0LBfzf6onfZ39qA7NACJCnr63HPSwJ7Y04vCLSXTuC7xiemszlr4Oxi
 6JchQsLbFSexAJQ5ZpCmIRkSveYQGmqtYNOBjdyJ2NYCroWMpWdsohOgnFcd0oqWRn
 t3CBR0U5lQbow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=uVabsJZb
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 17}.x series
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
index 04486c0fbd..c7b313516a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 308d12b701..943b3dc9f4 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5a8de64a75fca706c01c6c0a77cf75a74618439db195e25f1f0268af6b2fb1da  linux-6.17.8.tar.xz
-sha256  5f1c4c546660a6a81046fdfa6195306bad2c8d17c0d69876dc100a85ad4613ac  linux-6.12.58.tar.xz
-sha256  a9a59742c29be284c205dc87cbe9b065f9688488132c8f5a6057a5539230a51d  linux-6.6.116.tar.xz
+sha256  6d08803b953c509df48d44d3281ed392524321d8bb353eb21c0555790c8f8e06  linux-6.17.9.tar.xz
+sha256  a1d2cd7327f10eec022615c1bb12c06439bd110d2020164be97f698f43ca58be  linux-6.12.59.tar.xz
+sha256  a8fbffe691974a3bf6a21d34eefad71a64c2a1fcc4513218356f1a87e390788b  linux-6.1.117.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 038105bd16..dc68e71b58 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,9 +462,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.116"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.58"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.8"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.117"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.59"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.9"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
