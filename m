Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2504D2503F
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8D84807CD;
	Mon, 12 Jan 2026 08:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uK_rEVVDGu6W; Mon, 12 Jan 2026 08:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F34B9809B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205480;
	bh=ecImfGLyn1qDRkKK/gy5jFRecRUZ4YtuhG6nQXSrHaU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiCrbFENbW9qTFyjq6LLZdMN1y1xM2p4vIuhY6Q97W3bVf8cslYrHsJWvblJOZwJP
	 XfSKURGLiqUIVw2z2OUy6gPOdXxzXeg4CW8WjN7hTA+XMpy1h/He24Ao611k4Mb+Cv
	 pH9yf4307vJGzReDYAKLX71b2Ph/4was3pj4p4ka6Xrjy1DfTYvnj7AuO0sveExRCA
	 M1UqV8QLLJat/vv5Qw0e3NUheZZxr0Lh6MRb9S0Lurk+HXN6jnHiuu+c7pPJeLHS2m
	 YntTPuT9JZF/vBicRtFnt3UKCznL6VB/yMvV1MmCJd8djq/jjhF279pqv4KUw2HFVc
	 lCvFowrRn/2qA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F34B9809B4;
	Mon, 12 Jan 2026 08:11:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AF06B12E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A150A4031B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bh9xgSyT3s11 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:11:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8DEF5415C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DEF5415C1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DEF5415C1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:11:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2AB06A4C3BC1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:20 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCua-000000003M6-1Upb
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:58 +0100
Message-ID: <20260112080419.2516889-83-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205120;
 bh=CUZL6d9/jSMkYpA50PIEqZyao1/OZUL8UzXA43L9gfk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=lHNqeXqLrWSrmMDJ2C/lvZTNYGhM+e6DO9urLtMBBEbXWItrP3T2Nsi/UICLuMZgl
 noqVt+BULRV3YlyIVlsdAJEqK1BBWMwYz2EffpGnwu5LMPJgH1+kzmJ4qd2Mxd/hHZ
 kaE/brX8CJhUqhEgKWOpFMfbbXbnVZtZKQxnBW5xJ1mWgHkRuWWtK9e6oeu0hIKPpZ
 QpxZd5nyHQiAmAxVbhV/onmN9vL2jHdsj3hy3oHwRI1rOlPS9RlT3FeK0henYQXzBl
 6NUAnIf0PMvilFW0kmLvVk3QJHm3RpxvY+o6bPlR0314isTYfbmevieBNmU/odR/DX
 h+RAGVUI0234g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lHNqeXqL
Subject: [Buildroot] [PATCH 083/104] package/x11r7/xapp_mkfontscale: bump
 version to 1.2.3
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

https://lists.x.org/archives/xorg-announce/2024-March/003471.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/mkfontscale/-/commit/a631117eb3d816e8b3fdb969017fc5d3c7357ba3

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash | 8 ++++----
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
index cad6c11365..eab8ddf403 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003144.html
-sha256  8ae3fb5b1fe7436e1f565060acaa3e2918fe745b0e4979b5593968914fe2d5c4  mkfontscale-1.2.2.tar.xz
-sha512  4c846816325347c91008d76b3a5610c1e58a8414fd55117e7ccf51310db4b20b8397ecf6c9177ff77322e27ee088bf034fd175c9210465c50b094bab8dada4b3  mkfontscale-1.2.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003471.html
+sha256  2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e  mkfontscale-1.2.3.tar.xz
+sha512  816e7b2885bb7a4b2eb0e506b659600011bfa4ec1a3010243c2cc2241fa0b792f3c8de1dec1855a4d13de89405973967074e379b0d01dcf9de8a1277a2fc4296  mkfontscale-1.2.3.tar.xz
 # Locally computed
-sha256  80df6f5b759f7775042313e4586506db60f26fd15b98b532cf518bd8cf1e8488  COPYING
+sha256  7555388a38693cccb140946065534f4b7743aa334c883209a34f41abaeb62bd1  COPYING
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 23b2e2283a..915241dfdf 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_MKFONTSCALE_VERSION = 1.2.2
+XAPP_MKFONTSCALE_VERSION = 1.2.3
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.xz
-XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_MKFONTSCALE_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_MKFONTSCALE_LICENSE = MIT
 XAPP_MKFONTSCALE_LICENSE_FILES = COPYING
 XAPP_MKFONTSCALE_DEPENDENCIES = zlib freetype xlib_libfontenc xorgproto
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
