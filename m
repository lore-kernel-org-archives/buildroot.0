Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B0F459EB
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 14:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D8E4832DC;
	Fri, 10 Apr 2026 14:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iz6Bx9ZjzpLo; Fri, 10 Apr 2026 14:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A9F7832C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775833144;
	bh=cpSjlKWIklnwhpWnvtOCeP/ircG55/J2E5Yz5Yt8riw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=sikgksunHvHjJ2mt2ajfrw//4SlQo90IoYDp3/1OGUe+JXbxMDY9/YnsOu/hrQTWa
	 t+a8GdpquUPUo0dR87yth94eaBtEhYxP5i7lmfh8OlZdnqcORqCyctO8YzSpl+2VVH
	 CZzC9gfwUFG3/4AuHlhAoMJYD4CR1KAIgbMyh5bxRaAKW0Gu8rmd9zQQ+4HP/gGzBz
	 38Rf/7Ye2hCPmhxS9gT2GhiNNDucS9F4xQjRsZrEGxyyjcc2j9fA2Dc3/Jkw+Il0vt
	 bYCOPHpMu2AgVdDp+ZmIgpVbVYgVCg5qrmXZOFB1FGGrIPMEqe3ZaBeVnJM+FiLi0r
	 B1o5Ci3SaCMUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A9F7832C6;
	Fri, 10 Apr 2026 14:59:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 152FF1F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06BB1832C6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2MLoru8cWm7 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 14:59:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2135E8329E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2135E8329E
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2135E8329E
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 14:59:01 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3E3642C84735;
 Fri, 10 Apr 2026 16:58:59 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 16:57:05 +0200
Message-ID: <20260410145709.271512-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1775833139; bh=zb8qmeUkPuFnVlJ9onmBLl1xLDsz038wz1AavQnpUfs=;
 h=From:To:Cc:Subject:Date;
 b=T1MAZfzTl+MDW0e7rmHWICwGyMhKPlk+dSPQT2e/C30MvFMi3xfGcpXHG0mnjjj0S
 Xm2k4RyPUJtexY32n3JwnJmk2qy+0akS7YBxIJ0d+pN0woMGT1Qh+5AH84aoESsM+e
 6bol6nXtyQSUWBO2vfr4Qrt02ckpOO9aAq9xiaocu5XpyjweSPZd20UUqq3DYbQBXD
 ocRre1tOGOHwzdkZ41MDuumjLs/mRVPhBLKcjFHFpeE4dxvbQ6acIR6JOO+WyKWxkc
 qTR7Ch0EcPEtBxh/6SIpxD5XX47VuKMpZVpefhBvKYGjUSLywiGY5HPC3b6EmtShgH
 8bfhLxQYKDJaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=T1MAZfzT
Subject: [Buildroot] [PATCH 1/2] package/libgpiod2: security bump to 2.2.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Boerge Struempfel <boerge.struempfel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes:
- fix buffer over-read bugs when translating uAPI structs to library types
- fix variable and argument types where necessary
- sanitize values returned by the kernel to avoid potential buffer overflows
- fix memory leaks in gpio-tools
- add missing return value checks in gpio-tools
- fix period parsing in gpio-tools
- use correct loop counter in error path in gpio-manager

Improvements:
- make tests work with newer coreutils by removing cases checking tools'
  behavior on SIGINT which stopped working due to changes in behavior of the
  timeout tool

See: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 157e605ed5..a12752261a 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
+sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index 8803a282fe..d83fdbd94a 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.3
+LIBGPIOD2_VERSION = 2.2.4
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
