Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CB5CCA471
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 08:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B1F611F3;
	Mon,  6 Oct 2025 08:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLoPEqFYzcUi; Mon,  6 Oct 2025 08:33:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C7D611F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57C7D611F5;
	Mon,  6 Oct 2025 08:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C33FD909
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 08:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8F9941295
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 08:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GT3BOeqYdyoL for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 08:33:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AD694128A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AD694128A
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AD694128A
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 08:33:33 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v5geu-005H79-Ao; Mon, 06 Oct 2025 10:33:28 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 1c1e15de;
 Mon, 6 Oct 2025 08:33:26 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon,  6 Oct 2025 11:33:20 +0300
Message-ID: <20251006083326.889345-1-aperez@igalia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aOmXdxcktIibsBYWEnLXxq5jFz07zpPfJVaqq7PtgBM=; b=SeLgYLCb01wo/Y51z6VDX6qn0S
 82uKf2PaAjWoz1SPXonjR2Oxu57mpc8CJWQOCppHFblEDC1s/zlaIcRVgFdu4jDGxsoxrkGcoyscI
 dBTBbwtLMzEx9gGPRbX59lj6Z73u4FbHopT36wmBiC+YVfAxWWe813rgAZofxMuIUOjGnJT0KVplm
 jEpIXE8X1WLZKPOUR5pcO0cuta0ENxveIYqYqhqhzr90w2erxLrTgruCM8GWu5k/8POMxNg2lJcGh
 aSMkv+eN9gUIl/5LsqjxnGVlhVG8PNyQ7HYvJYFgsRJbPY2H0/TjVom8oYWEemJDPSivP73pPXdBF
 lX6s1++Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=SeLgYLCb
Subject: [Buildroot] [PATCH] package/libwpe: bump to version 1.16.3
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The main fix is being able to compile with CMake 4.x.

Release notes:
https://wpewebkit.org/release/libwpe-1.16.3.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libwpe/libwpe.hash | 8 ++++----
 package/libwpe/libwpe.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
index 45bba04d35..1c88105e48 100644
--- a/package/libwpe/libwpe.hash
+++ b/package/libwpe/libwpe.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/libwpe-1.16.2.tar.xz.sums
-md5  689306c9baf6f8d6844146a5c84fc932  libwpe-1.16.2.tar.xz
-sha1  499b62ddd3c1becaffc3b344ff5131c37d527144  libwpe-1.16.2.tar.xz
-sha256  960bdd11c3f2cf5bd91569603ed6d2aa42fd4000ed7cac930a804eac367888d7  libwpe-1.16.2.tar.xz
+# From https://wpewebkit.org/releases/libwpe-1.16.3.tar.xz.sums
+md5  a26e3703d2a35ba3e57436cd6b76a656  libwpe-1.16.3.tar.xz
+sha1  969897ea9b908f92ef0b4f6feaaec74f23425c39  libwpe-1.16.3.tar.xz
+sha256  c880fa8d607b2aa6eadde7d6d6302b1396ebc38368fe2332fa20e193c7ee1420  libwpe-1.16.3.tar.xz
 
 # Hashes for license files:
 sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
index 5721b83784..d8d2caa08a 100644
--- a/package/libwpe/libwpe.mk
+++ b/package/libwpe/libwpe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBWPE_VERSION = 1.16.2
+LIBWPE_VERSION = 1.16.3
 LIBWPE_SITE = https://wpewebkit.org/releases
 LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
 LIBWPE_INSTALL_STAGING = YES
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
