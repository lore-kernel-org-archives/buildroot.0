Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24BBE77180
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 13:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88DCF846C9;
	Sat, 14 Dec 2024 13:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tqMfV8XF0GnA; Sat, 14 Dec 2024 13:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 788C4846CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 788C4846CA;
	Sat, 14 Dec 2024 13:04:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 271FDCE
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 217624130C
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEnlKAJgDPrI for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 13:04:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F0B4341301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0B4341301
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0B4341301
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 13:04:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c577.dip0.t-ipconnect.de [79.214.197.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 506BCA4C3E1C
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 14:03:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40160)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMRoG-000000002Je-3rSU
 for buildroot@buildroot.org; Sat, 14 Dec 2024 13:03:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 14:03:52 +0100
Message-Id: <20241214130352.344022-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241214130352.344022-1-bernd@kuhls.net>
References: <20241214130352.344022-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734181433;
 bh=jID9ig/noy03NviXMnruct8pogiKHbr4ZMiY4Z2z7E8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a0aPfKAyA12nX9X3UlTBdnN1uh1iYwzkY4ZpERUYbRfRV59a5uGK5tcF17MUwwFOT
 iIY1etQO/5aUVNnV+j4oUEA3UpdDJ4tH06o08d3b++peH8s2wCvGlh65TDe8kFlAl3
 9pFtCNt2WGTX00kD80KB8eeH3lzDqTBYTZ1JZWsqzmIS+cSiINv2gfGatoTB4irYnk
 M+HEMOk/vejTnmRmo4cLv7CZcJe317WgNm+ejtGzWaXTn8s9vkKWo5fTssHvqo5t1E
 RnzmZtIsxookI51EZ3R9jMA/PWj8zi2qriuVCKGfcVTFLK95+EDuFB5P4P4lEgrrXR
 x+H3+aWghA5Uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=a0aPfKAy
Subject: [Buildroot] [PATCH 2/2] {linux, linux-headers}: bump 6.{6,
 12}.x series
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
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f537dd7adf..d8ae3469e7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 18051600cb..f33d37957f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae  linux-6.12.3.tar.xz
-sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
+sha256  6f35f821433d8421be7167990747c7c4a0c451958fb96883446301af13d71152  linux-6.12.4.tar.xz
+sha256  7ae1476e8b4c86e7754e581d45d6fbce5932bfefce934758a2907d6d79eca3e0  linux-6.6.65.tar.xz
 sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1bcfb9c861..51972158d6 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -432,8 +432,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.3"	if BR2_KERNEL_HEADERS_6_12
+	default "6.6.65"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.4"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
