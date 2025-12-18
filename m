Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA659D6E2D8
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 18:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97258412BE;
	Thu, 18 Dec 2025 18:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yuCx6uEjcXV2; Thu, 18 Dec 2025 18:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C031A4108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766084007;
	bh=NGYnoaEG6XkQoUq/Ec3Py5e11Oj1zAAvICHxrQ2agT4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DfBjH97HTarL8Dx0skphuccw2wQvdBoeUiLb3qIZ37mOHCc+1JGPFwvODbDPf3R/4
	 KkudtAxtNAUt8NuD0FCwQTdN4RUEfoEJcTeY1RfLWBptqHNAnVpo6ZDKvvPgGYSMxi
	 hBHQ4fmtDq0Qsq5xRThux+v3AuUoeggRoU0Q2y72gCWc58/YKFWTdlhXqJN+4yPRId
	 cgCyDaXD7bo+ir9qGX0FZ8KNBWXQJUIXbPrRJO1+e/Ru007XTT9xS5R2CTUIVAoF2t
	 m8yqi+MCiQiOJ8Tm6t/ccL4jfURC21gYznl5FtwFUmd1As+WzMWkYuP/NQzR1C1v/a
	 M6H5fD7/vtpog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C031A4108A;
	Thu, 18 Dec 2025 18:53:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 740D41A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A56C4139C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AtRkHFQ_jSQ for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 18:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 290F84139B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 290F84139B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 290F84139B
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3EF35A4C08A4
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 19:53:23 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45574)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vWJ7q-000000008Rz-2l5r
 for buildroot@buildroot.org; Thu, 18 Dec 2025 18:53:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 19:53:21 +0100
Message-ID: <20251218185322.3943200-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766084003;
 bh=s0Wi955BNi0s+cmjaokjJkE8SCjsT38N8A5fYvk0ggA=;
 h=From:To:Subject:Date:From;
 b=rNqYIMxnM0k/aryGpSuoAMsuONyt7uintgEdW2unnXHcGqyYzEBvB9TpvY3rJtm/Q
 DA5CrIBfplos4AH76qOU1MN29t4PtHDxmKcgTHBdXL8JkSKVTj7zIZ9XzV7hoF5Ah7
 uP8kndyLheZShMOhajugquVZORM8KAx2U6ooDQ18rMDNf3H9ONx3ZbEFF8wxnce8f6
 b+SGOsjqu22VhvABum9dpzeityzXtnpJ91sgMohvOS8btfexnPiY5OFW93dXbvRj6f
 5XR9tRPJm1bHxWUVWI0BeL5nJ31ZGXgfv+xXwVENAyTVbzkgS7iFHQrhrLXwsh10IL
 VHrWx6okITO8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rNqYIMxn
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{12, 17,
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ac78097f07..e007c5eb47 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.1" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 29950987b1..06abb56756 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d0a78bf3f0d12aaa10af3b5adcaed5bc767b5b78705e5ef885d5e930b72e25d5  linux-6.18.1.tar.xz
-sha256  42780496f99194e9d66b21f13dc2bded952624d5c7bd83eade7f74ff658e98d6  linux-6.17.12.tar.xz
-sha256  13e2c685ac8fab5dd992dd105732554dae514aef350c2a8c7418e7b74eb62c13  linux-6.12.62.tar.xz
+sha256  558c6bbab749492b34f99827fe807b0039a744693c21d3a7e03b3a48edaab96a  linux-6.18.2.tar.xz
+sha256  116802dc3ad1646163cc6ffe9bddba24a8069b569135ec0523cd799064f2edb9  linux-6.17.13.tar.xz
+sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0f544e07f8..ca652962d1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,9 +464,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.62"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.12"	if BR2_KERNEL_HEADERS_6_17
-	default "6.18.1"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.63"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.13"	if BR2_KERNEL_HEADERS_6_17
+	default "6.18.2"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
