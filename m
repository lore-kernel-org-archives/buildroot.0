Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA3C83F1A
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 18:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177F481E07;
	Mon, 14 Jul 2025 18:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xb5XKeDEXRpz; Mon, 14 Jul 2025 18:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B73381465
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B73381465;
	Mon, 14 Jul 2025 18:35:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 501B05E
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 18:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D36F40744
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 18:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UTQoa7YEcIna for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 18:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3E8540719
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3E8540719
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3E8540719
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 18:35:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cef.dip0.t-ipconnect.de [91.58.12.239])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1C96BA4C3424;
 Mon, 14 Jul 2025 20:35:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42424)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1ubO1F-000000003aF-31o2;
 Mon, 14 Jul 2025 18:35:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Julien Boibessot <julien.boibessot@armadeus.com>
Date: Mon, 14 Jul 2025 20:35:17 +0200
Message-Id: <20250714183517.2354615-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1752518118;
 bh=r8YfJTWpOi1tJFKypkdCfp7aD4D3NYhKl/4XMyRZIVE=;
 h=From:To:Cc:Subject:Date:From;
 b=JXyKjDE9TQjR3eo5BiVygDsDzElk1SN1VAYAs4APL1aGCysiTkGTLz/rQvrIE8yvK
 /LQ0x4WQwrRvFPHP/fYZU0UAF60wwg0G4MCxnWbn5EFuAkn/5xfW90FJkX6N9ymy4C
 tKDrs/89fSld5JRVJVOGCIDWIPzcutCwl1DRVJApQfqTWmAtChR6Z/h163NwtFU6/v
 7z6sV2934ayynP1L7xBRHPGbcW+Kx9kHtBBIpS49BLXH63v9PwLQNP+Q+0WH9C9Xy9
 vqielRG0WLWBjlynsbZjvEcV5KZ53mp2tu1pgAZyeCthiC4pTaMO6yWs9A5aH7yemW
 ovcyg3NpkP6Mg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=JXyKjDE9
Subject: [Buildroot] [PATCH v2 1/1] package/libcddb: Fix build with gcc-14
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

Fixes:
https://autobuild.buildroot.net/results/723/7236cf5fd4f33aabd3178586f877dff04d754abe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated patch (David)

 package/libcddb/0001-gcc15.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/libcddb/0001-gcc15.patch

diff --git a/package/libcddb/0001-gcc15.patch b/package/libcddb/0001-gcc15.patch
new file mode 100644
index 0000000000..379e654951
--- /dev/null
+++ b/package/libcddb/0001-gcc15.patch
@@ -0,0 +1,17 @@
+Fix incorrect type.
+
+Upstream: https://sourceforge.net/p/libcddb/patches/9/#b9ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- libcddb-1.3.2/lib/cddb_net.c	2009-03-01 03:28:07.000000000 +0000
++++ libcddb-1.3.2/lib/cddb_net.c	2025-07-03 17:58:30.064232649 +0100
+@@ -305,7 +305,7 @@
+             int rv;
+             fd_set wfds;
+             struct timeval tv;
+-            size_t l;
++            socklen_t l;
+ 
+             /* set up select time out */
+             tv.tv_sec = timeout;
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
