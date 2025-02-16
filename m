Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA86C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1DA860742;
	Sun, 16 Feb 2025 13:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xsAX5dRd_bFX; Sun, 16 Feb 2025 13:50:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E40E660AA6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E40E660AA6;
	Sun, 16 Feb 2025 13:50:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C64DDE
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 045EC412B3
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcXTrFDpo_bU for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:50:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 063804128D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 063804128D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 063804128D
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b112.dip0.t-ipconnect.de [84.161.177.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33D41A4C1559
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 14:50:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35518)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tjf2r-000000000jG-0R7O
 for buildroot@buildroot.org; Sun, 16 Feb 2025 13:50:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 14:50:51 +0100
Message-Id: <20250216135052.2068813-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739713853;
 bh=auyjzWBy1GM5GTVy3A2cGG1mSTE6Hv5fsG08rib+TTA=;
 h=From:To:Subject:Date:From;
 b=l8yfX7OItx6x8arSfUUbk2vFthEjuOFgoZG9wHusw6c/GUqHKGZ+Cu3BF4pVJ+jks
 3yWpuMlZVBsSWIqgq5CPBcp3L5VdNYF1dQT6uVQQGVSZ7LcEj+LKTOPFCZmH/uReTP
 tgdqhuyNwyDpUrBXujKQYgvAkGB/4tVQFoGo0X86yqWa88dvlfY67Clx5jT52Y04FZ
 MF+ZNqWjeQaXg9L4kIg49B0OuWhWSDMS0RlfYzzlkqDQWv4vKitISS2l/N8D1UP85q
 81HBRaSrsw6fAog4lGA0erCJkodEFoer2LEfQw8F63ud98Nox4j0om0eCDWEy/gMwq
 4hoFL2ior3OSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=l8yfX7OI
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.1.2
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index f3f1e29933..862d01669c 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  db5788341789099cbfce212f64f428eb79739f578eabfcc6056f03f3029d3708  intel-media-25.1.1.tar.gz
+sha256  6c11cfe1b9012011d0354b010d191a527fa3a4086152726ba642ca51808029bb  intel-media-25.1.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 489525d8fa..215f5ae39c 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.1.1
+INTEL_MEDIADRIVER_VERSION = 25.1.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
