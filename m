Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E0AC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 18:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D460340D8D;
	Fri,  3 Jul 2026 18:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTC3kqnHRUSu; Fri,  3 Jul 2026 18:54:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C1F040D79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783104866;
	bh=IJZSLYwfyP5sRqKAPLgPrkYP1ZDK/IfZIygdkTd5m0o=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VS9sKPgRQM35bTE3gi2Jg063CbbiucXYD/jtD3JqMRnqj49SFXmEucPV8e+4w+8Ns
	 IyQ4x3KMHq0XRkn8yeGamBCZ/7qCod8gB88t6wmPj2oSVCr70Llu3QaJBGcGIuMn5w
	 WatVNDjd7DytiRZxqG03AUUbuIsoPzr9xiEmPTs/Kc2e923MB09lQnoHIRO5NCalaW
	 9z1XXQZU0uU3Kvc7PGeYP4CqeIWXYy13YeniQx6+W3g7KZDsLb2rkRb+yUPmN0zhOT
	 bELD4erSP8ZF+MkqRGv1kFu2pqCAlMbJNWKH8/aum7ZQ0Upj6u0AUjjpR/BBfc/kW+
	 oq6vqpxxZL/Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C1F040D79;
	Fri,  3 Jul 2026 18:54:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B50C14F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DD8381F3C
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2EiDWk4qzj3 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 18:54:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29D4180A6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29D4180A6D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29D4180A6D
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 18:54:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F88EA4C0465
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 20:54:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47278)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfj1Z-000000001Mz-1r1k
 for buildroot@buildroot.org; Fri, 03 Jul 2026 18:54:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 20:54:04 +0200
Message-ID: <20260703185405.3686443-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783104846;
 bh=Qr/3L8X9LjcbOuoyNEl82Ljv3vjLmKqq1CaiUw8HFJk=;
 h=From:To:Subject:Date:From;
 b=PmxZRztjzbTrxkTRsxmT8mEFgeezhPCIIZKfaAHbqH4a9NYKEfDfXPJi2xu0myBBM
 oQLYEKoop7GkBAjzNHV68JsCa7M0YfLFJrasbav14IgQAIxQBHNiS+w+lxPo8QhGzc
 +aFrqYbffcFn2RmCYv8CHNKtJxnIK3UXlaf6n2nvVPYWe8ppG/wRLrJZ+a0HRRjXBU
 5AfPYuwfoNpixksowvigUGusAp3b+Hpx64k73EJ3+e8wqk04hTLomwHsLWcIQh6l4y
 AKEjJfHLb1IdXpDdbCGQx3XWPH0bOKy2yXNrawwZr22VQhuhVxSdE/GGKu8RpHzxAz
 2OUV7Z5JpSTzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PmxZRztj
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.2.4
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipeline:
https://gitlab.com/bkuhls/buildroot/-/commits/3eae7f4dd008dc8ee96d4b3b0165cb01bd03d588

 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 6fbe8689ea..99764cef98 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2e10b1565f45fd2052c9704639bb6144fc56b21979039f3b44151dfe5b281e18  intel-media-26.2.3.tar.gz
+sha256  a23185fca05c8fa8bdec09ea9ee8a20361163c87035ec978de4e2bb048a55534  intel-media-26.2.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index a197c2a6de..6c77ef83a7 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.3
+INTEL_MEDIADRIVER_VERSION = 26.2.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
