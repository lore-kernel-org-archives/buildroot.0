Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3042BC5516E
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 18:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD58140CC6;
	Thu, 30 Jul 2026 18:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnxMM2SEh_tQ; Thu, 30 Jul 2026 18:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB12D40CAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785436530;
	bh=GaUUcDLbtfBliWIz/BbUXMKD6VZXZmGE8ilUzwSvC+4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DxQ5tGbXOsvsqUmo8hL+0S4J85PliiH30FF86p9ldywrUQR/k/wPrD1+o1RROxccc
	 4yUWaHXcq/wp8ZjRw6WqCayCHEsPE//Td+o+3DjWsT/Ogp7qnJRfVyiuSuBzzrVKnH
	 xcQnBZ8sSxbWv3fQIFYcsrC5X66ubiji1pj+dvVaqVTOD51AkNasXclTb1oK+gQD3v
	 Efp0jByjlxgZEey9pc+QQWpwa+VRgOm0KC656TWSZwNDg6yopnoI1IrFa9AiE/t7TK
	 LD4O2MEzE0vNfgZ7JUOaUe1+CdvuBcRt/tr5KNmcS9I+puDoNuiYGU6MSE4nUYdzq4
	 w2J9u9DKTcH7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB12D40CAA;
	Thu, 30 Jul 2026 18:35:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B25069
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C00340C28
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0WYpN7JmZUr for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 18:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0F3B940CAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F3B940CAA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F3B940CAA
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 18:35:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021a.dip0.t-ipconnect.de [91.58.2.26])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4949A4C4479
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 20:35:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37962)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wpVbI-000000002pO-073M
 for buildroot@buildroot.org; Thu, 30 Jul 2026 18:35:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 20:35:23 +0200
Message-ID: <20260730183524.1145030-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1785436524;
 bh=eO1v1y+N8yAZBYhcOCoQBYnjl/G83AdDiF9f/SujFp8=;
 h=From:To:Subject:Date:From;
 b=mxZ5LbT+B6I9Ye+n9qI+ZIjzowFrd/KBqDbAK0VKYcFZqVPO+4/zLEESjBssQn1zw
 CFy79TkZ7dnzzQ0HeImZA5Hd2DV43xpjpuFy7ZYy3lX5APGUdC0AbEYP35LbXKjunm
 jxn/1a0+XMzYVKcEOSuGzZlUnWrkq60z8/c50/UVCLSgODU8XofO9xvz0zFpqT8TiR
 xGLD34SLvMWYzO/Sr/OYJzZWmYj/SiDxt14wG5Yysn1pMEgncXviHywujCxik3P31p
 8wPAn0dI9cyBnbhdytxstklEZDnIvjkMXPvJnSLL+fNX64PF3KoeLTLvzhmdLSmSO0
 2Lp32kVv4FwQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mxZ5LbT+
Subject: [Buildroot] [PATCH 1/2] package/php: remove CFLAGS for OPcache
 extension
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

Buildroot commit aedf131da66d2f2ebce64788deab07be17ce33eb bumped the
package to 8.5.0 which made opcache a mandatory dependency but kept the
CFLAGS added in 2015 with buildroot commit
e05476491720f96fcbeb926b4599d111efb598a6.

As it turns out we need to remove the CFLAGS to fix the build with the
bootlin-aarch64-glibc-old defconfig as detected by the Gitlab pipelines:

ext/opcache/shared_alloc_posix.o: In function `create_segments':
shared_alloc_posix.c:(.text+0xcc): undefined reference to `shm_open'
shared_alloc_posix.c:(.text+0x11c): undefined reference to `shm_unlink'
shared_alloc_posix.c:(.text+0x19c): undefined reference to `shm_unlink'
shared_alloc_posix.c:(.text+0x1b8): undefined reference to `shm_unlink'

as they seem to disturb the detection of librt.

It is unclear which upstream commits added since 2015 fixed the original
problem so a backport to LTS branches is not advised.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/51c99b64d676895c0820ed5dc12edebd1095c585

 package/php/php.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 56d66e40d7..0e9e68a5a9 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -78,15 +78,6 @@ PHP_CONFIG_SCRIPTS = php-config
 PHP_CFLAGS = $(TARGET_CFLAGS)
 PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# The OPcache extension isn't cross-compile friendly
-# Throw some defines here to avoid patching heavily
-PHP_CFLAGS += \
-	-DHAVE_SHM_IPC \
-	-DHAVE_SHM_MMAP_ANON \
-	-DHAVE_SHM_MMAP_ZERO \
-	-DHAVE_SHM_MMAP_POSIX \
-	-DHAVE_SHM_MMAP_FILE
-
 # We need to force dl "detection"
 ifeq ($(BR2_STATIC_LIBS),)
 PHP_CONF_ENV += ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
