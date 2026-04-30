Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F30FF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 04:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D0061B10;
	Thu, 30 Apr 2026 04:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMLaKPaugJVP; Thu, 30 Apr 2026 04:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2295B61B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777524070;
	bh=Z+QAAH2enEAeGoZOEwpEkRofX8WLbNicEQQwst9ZDq4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mHuf4C/D+Sxx3pRIdA5DHru/aLkdzFhE2nQzVIK+y7e8zKVhe5Qjg19fu7yhACpvG
	 3WSHZiXwt16BKXmu0tfGywcfhArBxe1uUVKjoQDsC8Xl2+bE077AKye9uoi9MzehMW
	 gRCsGbtd077sAmuPCfG8SXHZZNAStJ8JBIAfvBslz8EvkOOySFFaCmfJ7f0bu+5PG/
	 sVEpolK2Pdtu7ANVO1Qe63Aod09yuyb9I3Cm4pjW5rIKUvUoobuT58P98VUvfJZuD5
	 +dBlt4bxQhQOzXdiHXjfON0PRE9gRMYwDn/aYQAqyfcpY6D+nG5+BGKFTvqCGiI/PZ
	 aWXtW/hNSivXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2295B61B38;
	Thu, 30 Apr 2026 04:41:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 091EB192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E33E3849EE
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3t4QuBGKiGPU for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 04:41:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA436849EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA436849EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA436849EF
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 04:41:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9586A4C1709
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 06:40:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37186)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJCj-000000006uE-3Mfg
 for buildroot@buildroot.org; Thu, 30 Apr 2026 04:40:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 06:40:49 +0200
Message-ID: <20260430044050.7637-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777524050;
 bh=pq9eqXDSvd3xVSJhncZdqJOcgZ8UbY5SyTdHvg49nzs=;
 h=From:To:Subject:Date:From;
 b=fp+5+wXESiQ4RZSJ2H4PPP89PTwzc/ZqSESsox8RsCggczTrJCvdUhgMiRxLIO1gO
 +6of7Bl2lFu3Q04M/87acc1Trlqx0Ghb+il3CoF5QD9PliJhDNBzhnxrsdyRdjneUE
 D5oGo6bLmdNXUz1K4V+ZbY61+o9M4JqEJEvVHANuu5t83iHKmZpJ6OKHXvx1+BT+eY
 73iZW5wBrWF78jPQyPHrawaGwTdUm/ZC1ELc6n3+tSaIVue/etghKQVTjD2ZhfIejR
 83IlmTq/c27vlptN4xHm/VFIl/IEVoobNcYy9+uFMo3z6VlUmuNwP5xWxPpsi2zhM0
 J2Quxskte7+kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fp+5+wXE
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.2.0
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 38ff675617..bbdd3eedd9 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  85743dad01a54c85f3fbd0285bbdb01c00cfde0f8a79efa5b66376d536221420  intel-media-26.1.6.tar.gz
+sha256  32f984333d0804ec8f784f25cf443499ee86074a7da7791483d9a9afbfa97c74  intel-media-26.2.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 4709c7438b..6cc0933e90 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.6
+INTEL_MEDIADRIVER_VERSION = 26.2.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
