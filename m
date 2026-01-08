Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2670DD1D478
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 19:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD41D40390;
	Thu,  8 Jan 2026 19:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2FTxAtT6KtT; Thu,  8 Jan 2026 19:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA354089C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767901362;
	bh=stnoNcdyNNGA5Xvsd7j7TPVcU3HzUFBQlBvcfMxRM2o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VVFsWsrDoaErz1yMgK7zfNVcgxqd8esFuBjyUWvxMpFbQUHpS0gQI6/oOm++0N5Is
	 VuFzosid/YrVwY6vm/4vD2o09PCIa6PoFtDDxv1oBMHmH+jgAUf0MpCKOyNMh9Ih1e
	 djyzJFmk1DUAJ9dlI+dlwM+KWzVDuAGQNIf2BiOoRigPQtlQrPzfdAkod0He+69DNT
	 0ohs5+chbbhl2nRt+y1iCiSQAFINQwCeBbFl2/LnjEENQxRaXw04H3wGBs5mejbIim
	 m8mOuBIbeuwtdNc8DloFp1RTEKRyPmyF+uf7q23Hu/RUiZhgAJ9MD6lVBUxaUFp6Rs
	 LReHuwPiW8YAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA354089C;
	Thu,  8 Jan 2026 19:42:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EB3F278
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80C7281A6A
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBiipZ0UzkD1 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 19:42:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C519880D51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C519880D51
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C519880D51
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 19:42:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4804DA4C293F
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:42:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46494)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdvtx-0000000042h-3uDI
 for buildroot@buildroot.org; Thu, 08 Jan 2026 19:42:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  8 Jan 2026 20:42:32 +0100
Message-ID: <20260108194233.3499269-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767901354;
 bh=WDdDeURCw1IVbftoh71pBz+EA3gZHsU9SY21D5XVejI=;
 h=From:To:Subject:Date:From;
 b=VTYmAmIAgDoeeMv7766IJcioq8osqKGLnowYpuo40eYyFelgLuoAHuyzoRvDwpKLD
 8iHtWsZqJydVXCL6q9CVhmQfRpJ6id4OD2KFXC3bPZVelYHmJsiIs2PGSbEbqVdnIk
 jHBARSOVsDNFiE0jt4jYxhUXjfhWSpQG+cdfBYYbQquzjPe5hS+2+ip3vs5tiD5w5z
 ByTn9+J34jxN1H0+jdSMCrTftLR8qo41JvMLSJUlQlY0OnSXdHf2Kzf1RuABjaEJHl
 7f75u2UzruINqczC3qMuP9WHco72afZiV/CYzI540/D2Je6BkjHIQNiDCjVil8Uiiq
 3OLJlKgielDGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=VTYmAmIA
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 6.{12,
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
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index e007c5eb47..42214ccbda 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 733ef50d8e..45437f8796 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  558c6bbab749492b34f99827fe807b0039a744693c21d3a7e03b3a48edaab96a  linux-6.18.2.tar.xz
-sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
+sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
+sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 05a4822636..f28ccaffe0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -460,8 +460,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.63"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.2"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.64"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.3"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
