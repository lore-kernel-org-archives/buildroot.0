Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C68ACFD376
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 06:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F08B83BF0;
	Tue,  2 Dec 2025 06:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hf02yYgc_ruA; Tue,  2 Dec 2025 06:12:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76AE683C75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76AE683C75;
	Tue,  2 Dec 2025 06:12:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27CBAD3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1219B83C75
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_WLjp8t7ycm for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 06:12:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8AD0883BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD0883BF0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AD0883BF0
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:12:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A05EA4C7801
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 07:12:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50804)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQJcs-000000004XA-1lcE
 for buildroot@buildroot.org; Tue, 02 Dec 2025 06:12:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  2 Dec 2025 07:12:38 +0100
Message-ID: <20251202061238.5078-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764655959;
 bh=8XCkWHWwJmdqalsvDDjnmG9bPb4Ho46IJUtaFnVhNuQ=;
 h=From:To:Subject:Date:From;
 b=T9fO4fWc6PIt9p4KJglAXOJFBkM+c2k8Ck8dPvOWzy3WMS50XHMD2GNdYreF9eSCg
 bSwxBVhvKefs8PkTMtSbMS/7PJLqN+hJIHYvis1nX42P1JeONEspEFJ8YK91x7vdGh
 My5/oWTBkQR2Tj3B7+9Kj6+bGDIMZYlhf5YTBCrcyVU9YsgETEI1R1XPOx+CJuG/jY
 Vi6ysG7UJpCbzslUzKCyug4H/xzQsh2/T7TdYu70IQCiI60JQC2zJQDMTSyC4wqwkP
 iThBJn5RrGoKBieM4Jb6rvvkIT/3Vvad26WkwIDbuace/llbqvGkTFuv75gjxsI8l3
 sjwiLdKGHAWDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=T9fO4fWc
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
index c7b313516a..305cc34968 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a01162c3b5..4df1c5696a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6d08803b953c509df48d44d3281ed392524321d8bb353eb21c0555790c8f8e06  linux-6.17.9.tar.xz
-sha256  a1d2cd7327f10eec022615c1bb12c06439bd110d2020164be97f698f43ca58be  linux-6.12.59.tar.xz
-sha256  643b31079222fdbda70cfdd0b68c514f05a3926104be4762a4685f62818b43d1  linux-6.6.117.tar.xz
+sha256  fa7f344f3a50dad0af2e0066d51bd3b9183fd24587861042343ded3d1fd5c8cd  linux-6.17.10.tar.xz
+sha256  a63096b2147411d683cecbf87622bb2ff4885bac2b3641d3d4f10250c89cdcf8  linux-6.12.60.tar.xz
+sha256  4bdddce35474afc8d26f74ebfbcd0e1045ecd15f69e60f53529dba143374b17d  linux-6.6.118.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dc68e71b58..4ab3516d61 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,9 +462,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.117"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.59"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.9"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.118"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.60"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.10"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
