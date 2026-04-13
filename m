Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F763EBFD18
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB28660E41;
	Mon, 13 Apr 2026 08:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uy9OclIaAFV8; Mon, 13 Apr 2026 08:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC06360BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068809;
	bh=hwVqCY0+IPKfxpRXUA04jwX++uxidvpQFTrgS024p7A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ok2rsamWMXff1Dwx1eeL/ccVZoY1LuUcXDYruy3pSfqBvZPMaA+n6Nnk7Q3UcS9/X
	 ZDgzOlRpIySIDr0/51Ls0cf9fSyrpxx4QSFJtLjmQs+hlyr3BV+KChD3oCmeom2TUI
	 5XwjHhtTcfVoRp9k6kKjITaH6qJJmzQFPsOIiUKVI6HqTs9EUXYFNLr5djImob/uCk
	 8r0w4UqH13NNUaJKMjOusfiDfKVEpSkbG3YuvVW+jQ1k6z3pV5AWUReXHpUq3rLcEj
	 tGgRUDc67GQmr1DmQOeonkiA2pgxtI7qfOIjZDYFCDUrZz33o2aA40PX5e2nyggPS6
	 eaovRgCLW+SUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC06360BB3;
	Mon, 13 Apr 2026 08:26:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5739283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25E660BB3
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6nsn6UM_KIgK for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:26:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B0CB60B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B0CB60B73
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B0CB60B73
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:26:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE399A4C21A2
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 10:26:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36914)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCd0-000000008JL-2N0m
 for buildroot@buildroot.org; Mon, 13 Apr 2026 08:26:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:26:41 +0200
Message-ID: <20260413082642.3553355-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068803;
 bh=gaBcPNWiCkCb8vJXyfToOD5NGvrLlLaJSQoX1guKMzQ=;
 h=From:To:Subject:Date:From;
 b=ogcMXIVxDizZPDH0U1IIFEtLquc1YTX1TeEwIW3W+x8fZOLA63FprtB8qLwGbo3c0
 3L8bsp0H05xkY8y82FM81/dm6m7aVBEDwJtYPmEhVHTvAQb97sJE7RVzjhpnNImme4
 DKygOEoOj3lgUiTm88UpjINJr2wlYLlZs9e4ICtxpfpaSIx7WUSLHl5cPhbU5NU4xs
 kkpx71Cd0bdkUC3RR31td5XAsuoxcA+Gr+SnCD6l7EhgxqJf8DgwsPp0E8hsF7lyTL
 uqriPWy1URP6PbUATrKmEZr0dplcfWyTjOhB6280p6njgXy3A1X8x9I1lXXIqF+FFf
 RFfzU5si3qPmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ogcMXIVx
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.1.6
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index d0f0d36eb6..38ff675617 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c56899fecc003d047ce6afbdf471851512e0ceac66c2ef22ac36f1e6ce46170c  intel-media-26.1.5.tar.gz
+sha256  85743dad01a54c85f3fbd0285bbdb01c00cfde0f8a79efa5b66376d536221420  intel-media-26.1.6.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 52a9d1d99c..4709c7438b 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.5
+INTEL_MEDIADRIVER_VERSION = 26.1.6
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
