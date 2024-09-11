Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF0EE57D7
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 490A160B5A;
	Wed, 11 Sep 2024 20:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZV8PX828-eTk; Wed, 11 Sep 2024 20:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F731606B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F731606B0;
	Wed, 11 Sep 2024 20:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 84EDF1BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 740E4606B0
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:47:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7diJTSteBrtX for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:47:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0AE156061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE156061F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE156061F
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:47:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d4f.dip0.t-ipconnect.de [91.58.13.79])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C47A8A4C0A1F
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 22:47:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45850)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1soUFC-000000007jP-3laI
 for buildroot@buildroot.org; Wed, 11 Sep 2024 20:47:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 22:47:19 +0200
Message-Id: <20240911204719.47461-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726087639;
 bh=bTODcqdQLwO0LH4GUkE6UFMgo8y45kDSLjJ5hRnHH60=;
 h=From:To:Subject:Date:From;
 b=r+Ax/MXVTHdE2znVbLLWAPXb0U4vtCvCkPZwxtRAjueyMBQhHvHMbHDk6cIps0GyE
 whryV++nXERfURhreCVAVbfAvzsgDkKKgz9I/CM9eql+qvTqwPUjNtjbxT5KuWKQ6Y
 dyk/ULaWkeVrpPT2rC0b98sQNvOyZTVFH/JkxZZiPjeBI6pUdY9MXSOCega+siIABt
 Uv2RP/B/oeUZ6W2kU/CCZG5UqO4zF4TQkmj0yqsHUNRlJPHdn1RKqkJhbddkv16Wnb
 EmEqgcDhyCX+gBUCV9o1T3kl8SnCpoQJT/RS9b32/v1Fgo6EiObJhFjWgL7Yb1rR/S
 xnEDQlIXt63NQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=r+Ax/MXV
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1, 6,
 10}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
index e38f8104e0..023fa0a2ec 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ffc25f7959..5c745f7c7c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c0923235779d4606bba87f72b6fe11f796e9e40c1ca9f4d5dbe04cd47ee3c595  linux-6.10.8.tar.xz
-sha256  2c56dac2b70859c16b4ef651befb0d28c227498bd3eee08e8a45a357f22dd3b7  linux-6.6.49.tar.xz
-sha256  3f4e4e89a00e221a6dd1174779e0028794f44f4624ad6a31c79f3b7796688ca2  linux-6.1.108.tar.xz
+sha256  a4489b70e0a7c2dc8f501b9cd7fc76989be2febb5519e163ecf816064f2f6858  linux-6.10.9.tar.xz
+sha256  c065e36daf28210060c91a37ef3e92ac5814784e634577e04e406297ead2e86e  linux-6.6.50.tar.xz
+sha256  732ff40ac63642c5ddbb7d65c24c90ed08b95af0e8c92df4739e9703eec01ac1  linux-6.1.109.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e56caae259b85b7685ee589075d58bb7b227024497a60fa27a7b43e0b48839cf  linux-5.15.166.tar.xz
 sha256  85d7bf3a807538b9032e3f798ab978da9b77352bcb526534038c351a4f39e01c  linux-5.10.225.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 52971ca8bd..003c2f6a66 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -427,9 +427,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.283"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.225"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.166"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.108"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.49"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.8"	if BR2_KERNEL_HEADERS_6_10
+	default "6.1.109"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.50"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.9"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
