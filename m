Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A83C27C53
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF13640185;
	Sat, 22 Jun 2024 08:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwcMW3V4eX3U; Sat, 22 Jun 2024 08:34:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA7D8404A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA7D8404A5;
	Sat, 22 Jun 2024 08:34:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 585A41BF5EA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46AE060675
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:34:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qksdX3KOEHcJ for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:34:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 257A8605D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 257A8605D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 257A8605D8
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:34:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4BD90A4C0287
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 10:34:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52444)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwCF-000000000O7-3Ti2
 for buildroot@buildroot.org; Sat, 22 Jun 2024 08:34:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:34:07 +0200
Message-Id: <20240622083407.9499-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045248;
 bh=xCc6iF7moE28uXGJ3ovYPYZqW/dlyfGETobNqS+KMvE=;
 h=From:To:Subject:Date:From;
 b=Foy2fwh+VZDjoPOeH/fGkV2APHo5+VBTmQBDk5/+9chNF62JYk8ksyArtb1AwaKaH
 bCtxXoDE6k1yxOT+U3n1OUI7UG+rDhwMjDo+2B1ncgrdeN3FO7OrFb7bsXb7zq/lwm
 KDULNLwIr5T57w4fR58XpA2f8hkMzYbLL4cYqtKNpyMjX1DGxFA/uVoyq2BP4f2Oeg
 MWCzE88VUmLOgR9xQMG7dSGrG0oTKH6yQ3Sjru8bPjpeHTg+b3CDAB8Xq8xoormOM5
 iGKE33v8d7spp6TjkEB64bfHKFsLR4cvvp39WGRZSLorIf/Lr72hgcTMCltXt4Rkxt
 vrNzQM6UJqnjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Foy2fwh+
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.10.x / 6.{1,
 6, 9}.x series
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
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 588d7cab10..decc520680 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.9.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.9.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 3e2b923cfe..85a2e7e391 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a51fb4ab5003a6149bd9bf4c18c9b1f0f4945c272549095ab154b9d1052f95b1  linux-6.9.5.tar.xz
-sha256  c4e0ec8f593aa3717e85abad940466e7d7cbc362989426eb37f499330a461ba0  linux-6.6.34.tar.xz
-sha256  38ea71ad22ae0187fd8ee5ff879b33b0d9bd58161ac9a3e868ae0b4c66b95369  linux-6.1.94.tar.xz
+sha256  5d4366e2b89998f274abe03557ef3bc78b58e47fc62c102d51e6f49e5ed96b4b  linux-6.9.6.tar.xz
+sha256  fce3ee728712ed063aa8c14a8756c8ff8c7a46ba3827f61d2b04a73c7cf5dd9e  linux-6.6.35.tar.xz
+sha256  2960f0aa1d75665f39114ad3c272a999c54796e553a2355d0379f5188d14dfbd  linux-6.1.95.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d629f78680dc4b65e3d78b61406fb7757b960c83c206e63ad8c2606b3e3c474c  linux-5.15.161.tar.xz
-sha256  93b73f15cc376463e6422cce09ccd9d0a20fb113921ffebddf3352c44d84cd30  linux-5.10.219.tar.xz
+sha256  7cc3aff924e9707a5dbf1200c79a7f01617e097b9b175d02bda8ca762aeee19b  linux-5.10.220.tar.xz
 sha256  e5a00606115545f444ef2766af5652f5539e3c96f46a9778bede89b98ffb8588  linux-5.4.278.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  e4ff378baca72149d685abed9b59ba784fc97412b161796adcf3284a3287be52  linux-4.19.316.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7fd603db2e..0a17e7947b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -421,11 +421,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.19.316"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.278"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.219"	if BR2_KERNEL_HEADERS_5_10
+	default "5.10.220"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.161"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.94"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.34"	if BR2_KERNEL_HEADERS_6_6
-	default "6.9.5"		if BR2_KERNEL_HEADERS_6_9
+	default "6.1.95"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.35"	if BR2_KERNEL_HEADERS_6_6
+	default "6.9.6"		if BR2_KERNEL_HEADERS_6_9
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
