Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6504AE6F094
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 22:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DE6960783;
	Fri,  1 Nov 2024 22:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjplqwONLyq7; Fri,  1 Nov 2024 22:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41E096072B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41E096072B;
	Fri,  1 Nov 2024 22:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6208F979
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 433F760783
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_QaUrA5dQEQ for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 22:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 304046072B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 304046072B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 304046072B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 22:55:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0255.dip0.t-ipconnect.de [91.58.2.85])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACB00A4C1A32
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 23:55:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53146)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t70YD-000000005vz-0Vs2
 for buildroot@buildroot.org; Fri, 01 Nov 2024 22:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 23:55:29 +0100
Message-Id: <20241101225529.278284-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1730501729;
 bh=NnF4uMQFe57/OiRoHOnSk/vyEYyrQF2IyoUiQp0U3yo=;
 h=From:To:Subject:Date:From;
 b=dmMVCCU7gyvk9KvfiyThDzrh39l16HysV5Jb89BtzyVnIwy1Oy2/owdXHZ+NY+8fB
 v3PtXHqXl8MthPKjGKayShvYB2b9IoKG59dDSJ+VHGIa0r0F+anBkUYLwoMFdJ8OtM
 3snsWfhOkuNgnJWq+SsA6YQdqHRKB61aKUJxyHalZ/XQ30ETTxmW5EzLdsaodO1S+V
 MQfhchKtB933tj0JaWKZc6aVa+HdajrAuO4ra9GFp0Gng0SjZOhqgZOztz3btZQQYC
 3r7SuzTbNvarA0mCpCe7361XZ58IpX2rjKG3Er+0pREwl1i6JUvOMKXLwrNOg4dkb+
 UHJktcM1kYr2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=dmMVCCU7
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 6, 11}.x series
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
index 1734477069..16c015b412 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.11.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.11.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 21b553b8ce..a52cd623cd 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  471485b3b7f2fb637bd8fe3d00944c4c135c7d8ee02f357f33690baab0752a07  linux-6.11.5.tar.xz
-sha256  e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  linux-6.6.58.tar.xz
-sha256  2286e4a02ea2fbe65023dbf779f20aa994ba2b8d37ed559049378089451aa256  linux-6.1.114.tar.xz
+sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
+sha256  23616808d8c08f12815ff898f4edb4c11397a2b2843d029ee62452d21833a76d  linux-6.6.59.tar.xz
+sha256  0fd8ba827e1f1888376d88fd1d1c80d707c587c75b0f18c26530824be437ba6f  linux-6.1.115.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e618c6d845fd1bc89477508e8d084bbe791fc88bf7623adee2deb6ecb2275370  linux-5.15.169.tar.xz
+sha256  fd596545a3d6d93196db3fa29e4926e60900b9c05b3b9ccdee9e35d8e376e7a9  linux-5.15.170.tar.xz
 sha256  76cc8d7f1528f87902e38697229661d0617a7d6ab86166be9f3ef9a613b17b72  linux-5.10.228.tar.xz
 sha256  77221ab9aebeac746915c755ec3b7d320f85cd219c63d9c501820fbca1e3b32b  linux-5.4.284.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 32cd7a464e..2f7a731d36 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,10 +431,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.322"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.228"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.169"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.114"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.58"	if BR2_KERNEL_HEADERS_6_6
-	default "6.11.5"	if BR2_KERNEL_HEADERS_6_11
+	default "5.15.170"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.115"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.59"	if BR2_KERNEL_HEADERS_6_6
+	default "6.11.6"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
