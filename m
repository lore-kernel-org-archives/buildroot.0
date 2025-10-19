Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B20CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 18:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46D7E6118B;
	Sun, 19 Oct 2025 18:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWDOyxhjUPqp; Sun, 19 Oct 2025 18:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B96561187
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B96561187;
	Sun, 19 Oct 2025 18:13:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E78ED177
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDC4F61187
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qx1HA9q8NeN for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 18:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36C8661185
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36C8661185
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36C8661185
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 18:13:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95301A4C28F9
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 20:13:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60184)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAXua-000000005JI-2f6V
 for buildroot@buildroot.org; Sun, 19 Oct 2025 18:13:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 20:13:43 +0200
Message-ID: <20251019181344.54880-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760897624;
 bh=sZ/+/ZA56t4a/7sQLBiHRgKEaPfh9r6u5viz3qorb6M=;
 h=From:To:Subject:Date:From;
 b=nS+VH5IlQ6cgA2GVZUZogXBau5VCH8Ohz6Fu08O0jHMG6WIj8/H9z5125fiZlq9s2
 tSL2aWDEHGHSO8BNgk0tnyM9BgQWQS/m/lXiZfkkQivrK7UbUfKVqy8bDDAcIGzNYw
 M76f2nEc5NL6ITJ8U+qQ3WYezA2iC1tf1KqNSeJtUitDBRjJXJ4f/JSXVFv44IAJj5
 ZCclK8ZFAEJy3UGhmCQDeW5B9a/DvB43p4oE4gTvR2fg3GZKE1C1zqijsJp6U6PhXO
 OzhLRI9tJm8ShNLCqw0YQ57QWfBzGtAI47nwoZVHevobbWacFby6wzB3+sqKlLHiWE
 Bcj4rhEuAiWjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=nS+VH5Il
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
 6, 12, 17}.x series
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
index 90a0ccd0c5..7fb0e2aa64 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 3bdc4cd9b2..5ea815260d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3ecc8619d8a5b5f675224d2f52c71d1fc09bc3f9c019d8bd82d0581e03689499  linux-6.17.3.tar.xz
-sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
-sha256  6c7d92bf316a56e91de41cb60da1f63d94a4f8aafaef6a13055df0c291138a22  linux-6.6.112.tar.xz
-sha256  d4bb148b204e5aed38690489736961cdaf925fe7b35cf1f56c47ad7a09a0228e  linux-6.1.156.tar.xz
+sha256  010a12296e6fba7597ff36681be2485fd3b1780ac8fd9e6a9f3cfe193f0491db  linux-6.17.4.tar.xz
+sha256  1b0dcd3390efeec44e528748609bafcf36eae895bb68c8f62ac5e5940943de62  linux-6.12.54.tar.xz
+sha256  1f95cfd2e461d192dd9c6130e47aefc9856529a74ace4191ad8e56ba1849c41e  linux-6.6.113.tar.xz
+sha256  a0a184e10221afcce4e87fcbec6af2ae9f63f64ad1985aa61e80c9596696f66e  linux-6.1.157.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  23d080dc32f99d3939c3d1bd65a68ed85b8f934f92cc1841a63f898dcdb9a441  linux-5.15.195.tar.xz
 sha256  131e75eb14da6fd683b3882bcd856085cfca47cc1aa89cd2deb1b48d22d29d9f  linux-5.10.245.tar.xz
 sha256  9949210093ca924d7b41162bb4772becd3f28ff726a09d061558929690a1815a  linux-5.4.300.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3fbad38e6e..fd59e0c056 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -460,11 +460,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.156"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.112"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.53"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.3"	if BR2_KERNEL_HEADERS_6_17
+	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.113"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.54"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.4"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
