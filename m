Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1295AC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18DC56072C;
	Sat,  4 Jul 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cbvMKvdf6jb; Sat,  4 Jul 2026 10:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80311606FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783159627;
	bh=+i1FfmMJHqCksdxGO8U8aN3ufPK+RsdAdzu5ShxhkK4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=di+x6PIkMFAUN4u5LWOJrZCL0xj0bw0WVKYY/S0PkF2j94BdHnrQaMeEs7h/FSeY2
	 6prCodENZ/nA0pBCiuDwxCyH1pw3P0Ju00e8kZHgRwObSMRd9nDaBKf/1NkVFP0F5m
	 606+f8V8PenwNi59TBMn3L6Bq/Fqowh4Cczj4xweAX4+w1KIMpPBRjTCLOYL6CN7bW
	 ZHVeuhW6e2N8PSKopnqggV8StbzxBsarCERTQDr4kUSx530njwnzEjCxRxRuyvrS5D
	 D7xz4M7BX4KdqOIwOVbbhqRJcHl+uV4iA3oHyx3Rzo2VUXUlMLiaRZqh7Wv0GUxSRH
	 NmBpMLDVninbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80311606FA;
	Sat,  4 Jul 2026 10:07:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B71F514F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9464780E80
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rID7BWERtuPv for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 10:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4EB7E80E7F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4EB7E80E7F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4EB7E80E7F
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 10:07:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39DF3A4C0FC3;
 Sat,  4 Jul 2026 12:07:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36778)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfxH2-0000000062m-3V3c;
 Sat, 04 Jul 2026 10:07:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Jul 2026 12:07:00 +0200
Message-ID: <20260704100700.2336075-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704100700.2336075-1-bernd@kuhls.net>
References: <20260704100700.2336075-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783159621;
 bh=HnF1apINf10gk0RB0AdJflW7v046UvpnSPWhdqoT+mw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bci4YbotrJvrWC9QttGgT0bWCCRKpwz592E6NHpbYW6A8SF3/4u0cdtGtMBVHFJ2g
 IICwHwLxn0UmLJOJ9WxIGfyEkHjHq9tlfGqzJHN3AfXnVn4KZTOMq/rUDeg3I6JJ7v
 8h0aBCqdDCK183dC3tUCgE2kVH9lRnmG3t7u3x9wyGSRHSyHKGiciqyPvnw0FkvL7c
 7biftV/2HI2oyB+aEX4G/zEOZ+RxJj4T77hxWg2fw64mBFSoCv7+fCoqve1qdcj0sH
 9EBjCWVZvyfq3RmaZZEOrdUpOfZUHyf9/fAhT1pxes4SfsJ8eaof+4w5cfC6FJVMOh
 lmBHZJwVZqhXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bci4Ybot
Subject: [Buildroot] [PATCH 2/2] package/libnpupnp: bump version to 6.3.0
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

Release notes:
https://www.lesbonscomptes.com/upmpdcli/pages/releases.html#LIBNPUPNP-6.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/c8f5032e343bc13beaf098027b748575fecec56c

 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 9e4f211ecc..74d8fb685b 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.2.3.tar.gz.sha256
-sha256  563d2a9e4afe603717343dc4667c0b89c6a017008ac6b52262da17a1e4f6bb96  libnpupnp-6.2.3.tar.gz
+# From https://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-6.3.0.tar.gz.sha256
+sha256  082d999178291ed45ae24c3fd9e781120d3ec94d61d11121e5bac90c69365cda  libnpupnp-6.3.0.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 38b631fe58..97fdb6a5b0 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 6.2.3
+LIBNPUPNP_VERSION = 6.3.0
 LIBNPUPNP_SITE = https://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
