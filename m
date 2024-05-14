Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F9C25B79
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 21:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A8A817A2;
	Tue, 14 May 2024 21:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3dEok-Z4qHc; Tue, 14 May 2024 21:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E42C81B6D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E42C81B6D;
	Tue, 14 May 2024 21:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8003D1BF42D
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CB9B60708
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 21:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4LhOZ65rdqFJ for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 21:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BECE606D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BECE606D9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BECE606D9
 for <buildroot@buildroot.org>; Tue, 14 May 2024 21:55:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a09e6.dip0.t-ipconnect.de [91.58.9.230])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 89E0BA4C43FE;
 Tue, 14 May 2024 23:55:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54934)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1s707D-000000000PD-256Y;
 Tue, 14 May 2024 21:55:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 23:55:16 +0200
Message-Id: <20240514215519.2866643-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1715723719;
 bh=S1pXHugG1d7+KoGukqoXYVsG4SxfuyaRkgdfxgt3Iw8=;
 h=From:To:Cc:Subject:Date:From;
 b=TDirdp2xZPNCAO91/Npw8UKINRSXYCHEWRM4j40Vef6SywyFhDx/BgAraxozm0l9F
 oqnhvF2zYCg9X9TTTKFs08M+QC/ClydlPSNizst25xiU9XcXM9WASII2LkrCDZvkkX
 tQp0qArDN9em0d4hrZgwJUl0RU6YlfKD7gWSaNYwqGnVjkkoJV4BblrQM5GqU75p2j
 anjwpyKpAz9+jxcftYPcwxhZQz248bTeHBv4JeF+piZ4JlWyt9zQjg7YE3IWkvvCvi
 tTyoahCWEfMEAGa/AqxxWMQSp8Hakos2Z45SKif4NVvEoDkraHeVB4Eo4Dz2/F8MJV
 bi470sc4bPRFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=TDirdp2x
Subject: [Buildroot] [PATCH 1/4] package/intel-mediadriver: bump version to
 24.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index fcc7b9dfbb..8a23f9cd7e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  94dfcc4d2e6f75d0b9b9a5c95c1ff5d69178440888ff2ab98ec095d4adf8e955  intel-media-24.2.1.tar.gz
+sha256  7d0d43e201706ab2dc62741b7873d52dc3779a7b1187b5a321cd0a37223b2b8c  intel-media-24.2.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index c1a9c54c61..f074261bbc 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.2.1
+INTEL_MEDIADRIVER_VERSION = 24.2.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
