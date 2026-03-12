Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68E8106ACD0
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC3984DC3;
	Thu, 12 Mar 2026 16:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAsuHIDR2P3B; Thu, 12 Mar 2026 16:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B122B84DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773334203;
	bh=6w1yi/cNKwTq3MZi+Uk+mTw9TJDma+V/9SZCNCkHG6A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jM/yUarAgCt3igJUtiQmrLscO9vjNHVll86DIdCSBjuMaaxPnOiQ3qpYran0aterC
	 J0gS8bBn3e9QrQQ2zZiNYNX++/hkcrTVBrFeC8lGsYWyhC+0fjri4lDQFEzkRyz5/8
	 9gqu7U6LZIFVrrFRggJhVMtrc2tBWJNOtT4SD7M+kvNz57l4cgs32QwoCJ1ZBX9xpa
	 D0vfSIWv5J0sVmDZ9xl/Kdn0z9a95T+LxQMKAfnJqMwyCi41hcbYZPXvIOQPyHUMTw
	 SxS13Erbqo/kaQFqC82PxH6aE+o9Yvg5b17upDMv3j/OOT9xoTe4pHIMsNSgtCTlCY
	 0WEE++HOaKr8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B122B84DC6;
	Thu, 12 Mar 2026 16:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 065FB282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04386F28F
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wvu9icDSs5h3 for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D7F16F1BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D7F16F1BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D7F16F1BA
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:50:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 81193A4C09F4;
 Thu, 12 Mar 2026 17:49:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60356)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0jEU-0000000058g-2Iw8;
 Thu, 12 Mar 2026 16:49:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 17:49:58 +0100
Message-ID: <20260312164958.3197885-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773334198;
 bh=ZoUNd49+PsOuC6Fpsvrwh7qZPOW94XKEcShl5ZitncA=;
 h=From:To:Cc:Subject:Date:From;
 b=b950lIpmxwlC1cPt2S/05a8hdIpm13i7W42jtkvfP4Uaap4YVVBbab/zqnNyKoiDz
 RCq78qGbgozGhww0kjjQK6Y3CK3C1C9Vcepw0V0W5dWRdvOtnjNthQgN+v1YiIVtjt
 7xS7TC4wLx6MApgz4noZ82Xlxkq/BZgWcdYCy/7f4RQTpT08xEnK+IlxhkiCogfGTY
 zcT9CyM0Zx2Z9uY22qZ+30hbFlMFY2DoHLkeAfnuaBDj44EculK1RvPMJYTF20c6rq
 L6sZwKzT0U+HK+mYfhvEc847brxZw94pdyy7Ymiu6rFcTeu3Zl4mT91QbeSEaS4wRT
 g7/qNnyz84hwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=b950lIpm
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260309
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

Updating the hash of the WHENCE file, due to firmware additions and
firmware changes, but no changes to the redistribution/licensing
conditions.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 4 ++--
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 7b4d1d224c..c891c1a868 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  bd19acc4c1a02548e09d3df67f987fe6e378df735bab138c1d9e917962056d94  linux-firmware-20260221.tar.xz
+sha256  c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c  linux-firmware-20260309.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  f347586920c214293245169711f81ef837d9c37410a04bddb44a583e2883c2f9  WHENCE
+sha256  b763b1df1341d86664e8e881f5214333d5f904c31e8cc58bb5302774f0369630  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c58d3e4b56..4fe1c4d5fc 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260221
+LINUX_FIRMWARE_VERSION = 20260309
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
