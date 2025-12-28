Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A67BD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B830340706;
	Sun, 28 Dec 2025 22:37:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAnMHpH2JDsK; Sun, 28 Dec 2025 22:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5553F406DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766961423;
	bh=c1a/n9iouIH2E59QCmzXQKzGjn/igO9ZDJJYzQWAf30=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIHqNej48RJOH5pxqX1eZNtyh7p/2ts813y/DtMW17RbR/0BDQO1mPpx3VV4x0Eq3
	 9CizycF8O5xkyRSrFkKkAvesujhZJ5/wknCifnMrqKduwhFgEIexxQD2Kn9Rf5VUaG
	 4n4p09FUL/6BS/sWYZyX1QfuOD997xhwzZBg5+hWqfGUBgiaOeeQ7dLD4R8b8kJIj5
	 oNKpOblZhv1T4ob6aJf0VMmXJ8pkZWA2QEUsrbxHBF6Ciffgz3BAbJV2YsxffV1Zd1
	 o0G6noWu9aNdVtd47TtrUkDF1BRjXcT6cTUXwJ43nRcPM/e9hlzRyXR7SMg4g6iNqD
	 rqUVFoZVcX+hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5553F406DD;
	Sun, 28 Dec 2025 22:37:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3066ED8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20C7960A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_qSmp-DXswk for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:37:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2E5D360785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E5D360785
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E5D360785
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:36:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id ZzNevXm0uGVgvZzNfv0YY1; Sun, 28 Dec 2025 23:36:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 28 Dec 2025 23:36:53 +0100
Message-ID: <20251228223653.2130377-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228223653.2130377-1-giulio.benetti@benettiengineering.com>
References: <20251228223653.2130377-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLoda1M2PiKchFCdsUUVuCJ3gWGTCV9lmObike8+vNtYEjFSXz3MnP6H05Bb6tf+HkNge0PkS9QqD2qjltq+lcGHwufMV9/pMWde6wTnGn7EyBNDPg6a
 tD7dcwtgpelgbZphH1x4wHpb953n6o/1OjD6Gm9wCWuU/8a00R08s0HHWxn7Ex32s34CXWhM31smxhT13A2nlrDYljT39BNhlt7gEZoF10xhARczDqpwgBN4
 bqhSiD01AOULEZapJqAberGHiuC7graKsuGkdDXj4AU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766961415; bh=thWHGoqen2ar+c40bSZrN6rPQB1vjLQYalDnN+eVHsw=;
 h=From:To:Subject:Date:MIME-Version;
 b=D0w6eWlKO+s8mUIXvVsAA5i7vseg3UW5jrKJLnuvi0Ib4XbyyMIZvceOqO1b+4Ob0
 nB64b9S1gvqedRkFuD16am7uMBKcVUGUxzy1rR0DLxXE9B7lbZYUkmPrholE5wT1HK
 G0GQDGLqwLJk2oVCcKH+NA/gMMbYaxGCFnHsxrvtomVipRQDv286EfEHO719sFUN34
 hDsgscoy2ydX8my4vf7q6BydHLg5IePTgWIO7JZJxoeGNrY6AKI4Vv+9P9+G/WI0fB
 XSpr1d9shh5JGhP/nF4a2XbebNGA9jQPo0S4d3/aKbRLBtK4JkAs2v8lwm9YC7uwKB
 pUFExk9IvE3qg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=D0w6eWlK
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 12.3.0
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
https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index dbe10255ec..cb5b63507c 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ecb603aa426a8b24665718667bda64a84c1504db7454ee4cadbd362eea64e545  harfbuzz-12.2.0.tar.xz
+sha256  8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7  harfbuzz-12.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 268e4ac5d0..5aed4e31f9 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.2.0
+HARFBUZZ_VERSION = 12.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
