Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A5ED72345
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40B160608;
	Fri, 23 Jan 2026 07:44:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYMxVaZKtoMo; Fri, 23 Jan 2026 07:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC0D66060E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769154277;
	bh=qwabrs7BSbYLhuRNHPrbWd7pH9iXpVwe3Q6hgohdl1I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RGP27U+x4c43iNtPHz66LY3YZbNIFhRn52cT52EFGncE/nFR6SfPFg8f2DIgEhJa9
	 0xkwYWri72iPBeTxGXK741xHDtXRGnvYvhfyjt4ZaCjF+hx3ZJ9sulesB0/Voh0w7r
	 ffwLgMxN6X4HP1KcNvLSdLrsqGyzo6TnXt/cigFAIi93jaGoU6kva7sMr6qJsBsTCH
	 LtESAIQs5spTdr8CB3++0HkSmR3jXswJAhB6jRTjUgS5hgZ4cN4xnw3FC8rY3U3v5X
	 7EemU5YqxmGVAHdQLr2ZvOwnEpNJacrjGWp+OKWJte7+UHa8H2LcDn4m6kndcVRuZz
	 WFn+CbDZCoplA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC0D66060E;
	Fri, 23 Jan 2026 07:44:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C893122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 07:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A8040521
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 07:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwzZ3OXNF9Xy for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 07:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BA0B4051C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA0B4051C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BA0B4051C
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 07:44:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c7cb.dip0.t-ipconnect.de [79.214.199.203])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3734A4C492C;
 Fri, 23 Jan 2026 08:44:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46514)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjBqB-0000000066m-2w4h;
 Fri, 23 Jan 2026 07:44:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 23 Jan 2026 08:44:24 +0100
Message-ID: <20260123074424.3991140-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769154269;
 bh=ORfT/40nG6aS0VhH/g293TU1yBSe/NCt2YxOoB3PW54=;
 h=From:To:Cc:Subject:Date:From;
 b=Bi5RvYWymM9c2DmBtgwYeZcr7wL/1o6yVvgkeIC3uz7R0QkkuAodvAHfyekVPxK5R
 x687kWdqBTSXgB5By8vrkaolSktHIPF37+s/DdL8OGPeqzaDBksRo+nRgT17a8G9ZT
 du12yVrTJbDVHk2wjnDqbvJwG7sPVST05vocmdkOhEjM0qWkj6nJOMZrr4XAoKxeCz
 Ak+LHiCoko721VCbIOhMziUgCqgo5GK3N5EBQ+xUF4vMIuTt6rPz81F61yYVW+mHE5
 6HOOK6ZIART6E8Wgn/miGRrCjvrzOUHVMCZc4gNy2nlryE83+VF/4GDDYthQnGTjVR
 qAxDQeomXYgvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Bi5RvYWy
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: bump to version 12.3.1
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

https://github.com/harfbuzz/harfbuzz/blob/12.3.1/NEWS

Added sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/harfbuzz/harfbuzz.hash | 3 ++-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index cb5b63507c..c5ac08c615 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,4 @@
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/12.3.1
+sha256  3ee7133f7f160b27bc34c058e147a559bb781c2b8208bc760db9fa9fa69cea07  harfbuzz-12.3.1.tar.xz
 # Locally computed
-sha256  8660ebd3c27d9407fc8433b5d172bafba5f0317cb0bb4339f28e5370c93d42b7  harfbuzz-12.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 5aed4e31f9..c0cdd15367 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 12.3.0
+HARFBUZZ_VERSION = 12.3.1
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
