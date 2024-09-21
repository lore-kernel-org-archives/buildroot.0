Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A4CCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 17:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 286FC40499;
	Sat, 21 Sep 2024 17:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6XoZbnDLVsR; Sat, 21 Sep 2024 17:27:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0172D40538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0172D40538;
	Sat, 21 Sep 2024 17:27:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9759C1BF479
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8675880FDD
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 17:27:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tele5mFOg1r7 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 17:27:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6222D80FAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6222D80FAF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6222D80FAF
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 17:27:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b0be.dip0.t-ipconnect.de [84.161.176.190])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81414A4C2463;
 Sat, 21 Sep 2024 19:27:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43696)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1ss3t1-0000000048F-0zX0;
 Sat, 21 Sep 2024 17:27:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 19:27:09 +0200
Message-Id: <20240921172711.3642889-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726939631;
 bh=seClpFaiiV4NVdbzigafuldDPdPpg5HdmbwXCfayf2A=;
 h=From:To:Cc:Subject:Date:From;
 b=WeQ1g2xxZnuIfJUHRY72cfCgITRdlQKFaUP17+Vz79xuItgD9TVMjtTx5aRBFo/o9
 IPiNOeiuG+ao+3x0W7zcviBDiImJ199UeJnHyrvN1JqkqEAXH0/V+d0IOZs8hqbRot
 i4dTFzUt6EAmHpWOOBJYgu7aqI5cAEHE6NCj+1HrNfEVopxWyD7JpiKqbCXt7A2L5A
 r1rO/sx9LZsEP9ykfteHJVInmjxWVqjLqOTNQ4caXlsuqqLMEc1R5KvbxCy/y4l6HS
 xIIJRCGVaOeg7BKgCDkO8UOSF1j+Bf/3Zo+p3Xv249ZjbzRvBR/cmJjieYm7P+mmK7
 YKtcPW0V+/Auw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=WeQ1g2xx
Subject: [Buildroot] [PATCH 1/3] package/intel-mediadriver: bump version to
 24.3.4
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
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
index 16f02c1f12..14742bb455 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5eb35a1dd601c75ccc3af3c5b21acc82b245ae79ac8d7264f99215be8d064194  intel-media-24.3.3.tar.gz
+sha256  58978f9ee4981532e60be2f2768673b1f3825db09971ebb98fbd7e8819cab6eb  intel-media-24.3.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 3424d7168e..106efd1f2c 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.3.3
+INTEL_MEDIADRIVER_VERSION = 24.3.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
