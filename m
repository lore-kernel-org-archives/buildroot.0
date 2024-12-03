Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25877E74AC3
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 16:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C586160A59;
	Tue,  3 Dec 2024 16:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARnC2hJIMK-m; Tue,  3 Dec 2024 16:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E291F60A66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E291F60A66;
	Tue,  3 Dec 2024 16:37:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78EE42365
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 16:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5843D43033
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 16:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3RdhyU8YWiCi for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 16:37:22 +0000 (UTC)
X-Greylist: delayed 2273 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 03 Dec 2024 16:37:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3343343023
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3343343023
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.246;
 helo=fllvem-ot04.ext.ti.com; envelope-from=sabeeh-khan@ti.com;
 receiver=<UNKNOWN> 
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3343343023
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 16:37:21 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3FxRfe1636991
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2024 09:59:27 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3FxRJk039351
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Dec 2024 09:59:27 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 09:59:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 09:59:26 -0600
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com
 [128.247.83.36])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3FxQhE115812;
 Tue, 3 Dec 2024 09:59:26 -0600
To: <buildroot@buildroot.org>
CC: Dimitrios Siganos <dimitris@siganos.org>, Bernd Kuhls <bernd@kuhls.net>,
 Sabeeh Khan <sabeeh-khan@ti.com>
Date: Tue, 3 Dec 2024 09:59:20 -0600
Message-ID: <20241203155920.2147390-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1733241567;
 bh=RJ1zKKBrWQZS3J0cc6eZFkhq87fmbZhDkgpiluNOU0I=;
 h=From:To:CC:Subject:Date;
 b=KWhikLFVtddV/x3K0Cg3VT8Rd67RDxWCy8dvfXJRHv1pHjhPrWJ2axZhK+dAwgx3o
 55cJH0ajRvYVA7N0ybX90hBUSI1PTizZO/oIOJBlGqqdEIbQLKbag6K4LA60vQeO1Q
 vyViWGLn2vzf474FhclT6UnMXL2Je+GLHro8ZdKg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=KWhikLFV
Subject: [Buildroot] [PATCH] package/wireless-regdb: bump version to
 2024.10.07
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
From: Sabeeh Khan via buildroot <buildroot@buildroot.org>
Reply-To: Sabeeh Khan <sabeeh-khan@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index ca11551579..a3b5973bad 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb  wireless-regdb-2024.07.04.tar.xz
+sha256  f76f2bd79a653e9f9dd50548d99d03a4a4eb157da056dfd5892f403ec28fb3d5  wireless-regdb-2024.10.07.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index fae21687de..2aec19c507 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2024.07.04
+WIRELESS_REGDB_VERSION = 2024.10.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
