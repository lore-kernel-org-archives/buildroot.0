Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC08C9830C
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 22:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 845914067C;
	Sun, 18 Jan 2026 22:50:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YFZVfz-8kq2; Sun, 18 Jan 2026 22:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE98F40668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768776644;
	bh=PmbI6UkIgJyN6HV3xA6Z6+4O55pCgZQquKa02+u46eY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fWrSQGHIXyr67YReygKz8cIYBAkpFcT/6TfViUrhtIv2Yk6MePu2hxTjsnnXU1FlU
	 dHUG323YgA8eD6ZQ8m4MoCTRe0MzWlHG1aNdOl3kgzSz0YuvonZ3pnWlytjpvkvYVg
	 LENSOOdEfmiqfq8qFxoQmZfrkzt+2hirPuBbdgNXpmztCXyrY/vwfZApU11QOhm7B7
	 YPghag4h6bcCllbDYjOprVp66Hsqjw83ApnY3Kb1bT+H0BHWgh/I79EkVUm8hgrs9q
	 8tgNcPp1wp1c8f0JXXrKu656V2EZd6JGHREpemn4CdSgexMD9aJYu5jzhUhLLfRavn
	 0IbAKSrRREtcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE98F40668;
	Sun, 18 Jan 2026 22:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5876A2A8
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BF5F80D76
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVvu-HfWWa49 for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 22:50:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D23080D73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D23080D73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D23080D73
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 22:50:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 95E64A4C47AF;
 Sun, 18 Jan 2026 23:49:49 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vhbae-000000001R1-3MOs;
 Sun, 18 Jan 2026 22:49:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 Jan 2026 23:49:45 +0100
Message-ID: <20260118224947.3879017-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260118224947.3879017-1-bernd@kuhls.net>
References: <20260118224947.3879017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768776589;
 bh=QH1B2hysfWcdtlXjaiiy4yV56bISmvOuW2Fc+5xRKBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=O4+rz5xImHqI5dgFsxN2UlJpM0Exne34nk6obWo7g2Q3K2YP2YwQssXNTmphNn4vx
 AP2mOZDeT7mV7DZt63JXt+2buKGfRBga2qMnzK32VeuKNZ4iR9ROFLCgCI+8N0cgMN
 io9zNfykHgT/sDMAIElE9rxywPl8phhWNc2+OfZs9HaFi1qOfbScYssxPGosxd89Hu
 rc51+bWvnDjhh+bt+IX8R4YIJALRVuWSgFivpRGyb0AFnI4i7VqTHL/H3X1Qj8bLDN
 JJtPUSDLmAV83K6BfYLTeG5Snx+hb5dYHr9XaYW1/Q2nsuS34LMgvdd3AcVNd1Oc3p
 lgoOjIqNShLNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=O4+rz5xI
Subject: [Buildroot] [PATCH 4/6] package/php-xdebug: bump version to 3.5.0
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

https://xdebug.org/announcements/2025-12-04

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Nicolas Carrier <nicolas.carrier@orolia.com>
---
 package/php-xdebug/php-xdebug.hash | 2 +-
 package/php-xdebug/php-xdebug.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php-xdebug/php-xdebug.hash b/package/php-xdebug/php-xdebug.hash
index 9470a7d4e8..9149545a6e 100644
--- a/package/php-xdebug/php-xdebug.hash
+++ b/package/php-xdebug/php-xdebug.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24  xdebug-3.4.7.tgz
+sha256  f6daf55a5c7adadb07dd2af25ff78b1cc9b1c58d6cc442a463eba015b678aabf  xdebug-3.5.0.tgz
 sha256  bc2aee27f3f0806be39e329d284ddbbfb14602a49af261df305dd6122d988eb0  LICENSE
diff --git a/package/php-xdebug/php-xdebug.mk b/package/php-xdebug/php-xdebug.mk
index 272d331f7b..85a00d10fb 100644
--- a/package/php-xdebug/php-xdebug.mk
+++ b/package/php-xdebug/php-xdebug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_XDEBUG_VERSION = 3.4.7
+PHP_XDEBUG_VERSION = 3.5.0
 PHP_XDEBUG_SOURCE = xdebug-$(PHP_XDEBUG_VERSION).tgz
 PHP_XDEBUG_SITE = https://xdebug.org/files
 PHP_XDEBUG_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
