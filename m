Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06265C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9602812E1;
	Fri, 10 Jul 2026 07:21:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uaHITRab3KAQ; Fri, 10 Jul 2026 07:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBB0812C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668066;
	bh=PJoTJyDhRZzXHl3OmQ2t9vuayk7bSvvZFW1UHYh3k88=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EveaDjAw0NN8jZSgYnpOLysijxA1HhYugh6N32yjl5paa2DQhg2edNnMAlfBT9S4D
	 e4Oea0dIgljS0qHpYeQSqZv2sBDqQ/K4Th1AhTeKEHRFv2ckQNyYqpwMErAeg3EJ9p
	 XYPRe7Lwy+e2/Dwgikd48bmwawwi7d8CbTy0mARcdNA7RAIanOF57c9FlSq4y7hosC
	 lgoLMVbMxXKmp3vHPgxj7apMrLGFiJHJpJFNLD1tXRIN/nFTxppAEiIbJxDOG52tD3
	 OjMhpcMSPrAPrpFsQ1gHHNQSrh8MWDXSo9O+qeThuAQJEogLsg3R9pOV2aN9h9JToC
	 EbnD2Y2KjZ+XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBB0812C5;
	Fri, 10 Jul 2026 07:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 314CCFD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23FD6812C5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KyvVuUT64yGH for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:21:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F2B0812C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F2B0812C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F2B0812C4
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:21:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CC59A4C2F5F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 09:21:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wi5Wl-000000008GF-2mnK
 for buildroot@buildroot.org; Fri, 10 Jul 2026 07:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 09:20:02 +0200
Message-ID: <20260710072003.160464-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710072003.160464-1-bernd@kuhls.net>
References: <20260710072003.160464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783668062;
 bh=7muFJmUFAistn2HM1UvJwbOOli8x/G2iGPK6tIXNcrU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ngm/jFRVcmOX9aWpJRDYputbjy74XHN/vlzqZWoG6PgkJSJiLxoBOPLa/iFCXAyVL
 FOaMg+D+5DxW3KfgtF6uOLmwKiQp8giHjkg2A7T96WHFeOCWBSqw4hy8T8xKG/UeMk
 G4bIXbLPTuNNO6YHWSqCmaFajfOZ6Z0J8vkvLgZl4Zogww/+dDmnRyYIcHosl4WYnl
 AEddZCNKKQrEQIWcV/GrUOo7bXDAIX2Rvheck0rniY8TrVX+I79QITWKjY5d3qsSv5
 aayFCmMX7SsZGLlDrfP7LeDIQEajpon20XwPAb1J7oxNRCL3sFTFvTCCZsjanBOM8u
 XG5qRvKfTfq/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ngm/jFRV
Subject: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version to
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
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/668fc1fd6c25e7abbad7dbfe140e34c7187e1f75

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
