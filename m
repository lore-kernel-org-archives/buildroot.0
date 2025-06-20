Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA5C7115B
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 06:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3D134093E;
	Fri, 20 Jun 2025 06:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FP3G_igB7MjD; Fri, 20 Jun 2025 06:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2D9E40C18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2D9E40C18;
	Fri, 20 Jun 2025 06:26:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3059A16B
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FA6060770
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJBbv4d37Q6i for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 06:26:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F05060DF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F05060DF7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F05060DF7
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:26:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0ED57A4C2461
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:26:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42752)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uSVCw-0000000016g-0R0U
 for buildroot@buildroot.org; Fri, 20 Jun 2025 06:26:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 08:26:37 +0200
Message-Id: <20250620062637.20844-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750400798;
 bh=LxcD+8xFVJ3NxVAxIsKsK2n6FbOD1Nw5rIBYDdSQaPs=;
 h=From:To:Subject:Date:From;
 b=cY80OX02g0bG5+Y1ApChhtay054L+bAlwKGx4Yy8BP1blGD/Z2dwWuhhgQu0e9lpo
 y0UDCJrxxSWQMz+lEChQ1rIocJzgEaXr3pgz4uwgjkgiDqLbh4/vzF/hTFc9FnHVJ6
 ggH2o9IvIL9qXxJrQwvZj2HreZmFknqZifn9rhyjWouIQLDImne1r1k5o4HWZ1aTA1
 aFRpQIaoeSHDJO+EUjPgDeQL1t8gSh0NhaCxYBzloICXl+vYRgZD1cclMpWumqJM8M
 //068+ZLaPZGLvJaG37NsL4c5kLM4w7xfE7vEi8oG2yHO+c4f28qfnGVR305CGEpLb
 Tgv1iD0h+BLNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=cY80OX02
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0ac84aa4b4..3dcdbd5128 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.15.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.15.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 38ba9b474d..db1da163a0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3458cd6a6c508e161dbc5406e72b99d5dbdf929faf704a67db9ba46d07514858  linux-6.15.2.tar.xz
-sha256  c0a575630f2603a20bb0641f8df8f955e46c9d7ac1fae8b54b21316e6b52a254  linux-6.12.33.tar.xz
-sha256  0d79ff359635e9f009f1e330deed5f3aefd8c452b80660bffdc504b877797719  linux-6.6.93.tar.xz
+sha256  12b50c89925438d9cd7385a0cafc9c433e6562ac5df00a21889fce9f548d65b0  linux-6.15.3.tar.xz
+sha256  a7f3fe381f67eca4172e9b63efb61a14bd7f9e1278e03603d0ff5a93f270c24d  linux-6.12.34.tar.xz
+sha256  713981ea26b20b476ba4ce880b76b21294576788d5db1c2188b167bcb06ecc56  linux-6.6.94.tar.xz
 sha256  bc3c45faf6f5f0450666c75fa9dad9bc7c0cf7c7cba0dbd94e5cfdc58229c116  linux-6.1.141.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  3d03eb798910f32929f7fda5a56e4bb1a121f10bde320d6f3063639c009313dc  linux-5.15.185.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d16aa265d8..8a27e52c4c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -448,9 +448,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.238"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.185"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.141"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.93"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.33"	if BR2_KERNEL_HEADERS_6_12
-	default "6.15.2"	if BR2_KERNEL_HEADERS_6_15
+	default "6.6.94"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.34"	if BR2_KERNEL_HEADERS_6_12
+	default "6.15.3"	if BR2_KERNEL_HEADERS_6_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
