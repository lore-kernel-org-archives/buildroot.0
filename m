Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9EDEFCE47
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEBE581754;
	Wed,  4 Mar 2026 21:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHAcZoaGPvjJ; Wed,  4 Mar 2026 21:14:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14D8081703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772658877;
	bh=MLEFiLhemRKhZ8uA6Die/xqCff28lFm2y09VRE+/IRI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l3Qu2Vx4I1KKDRU06ERpxYmsHwOK86W7y2tD1UoHaG8zuiR/QdORXyr5/2/rKs0EJ
	 SdfqzkYe+A5N6NJfani4LwUpHP3o1MQvCa8/hD62lps9hQkktvbY2E+pZHY9INsMoC
	 wivozpYanT8c8ZDyx4vbZwoXRG1Caz2Od1YT4h0qGNmGDWG7sJW6sQX58SGOdU4ywB
	 sLDgZXi9HELmhjAOvh51qgTKP0prIAZDPSRDLiO8NWJfsQmYUd5iEVlByPu3iK4I2o
	 16uY+vMsRBe1B0pAGJ0VxGa3baHAqXP3MyHnq9mCCGPsd8CeBZi5g2gmfNJcEDtlxV
	 otiZNigv4ZhAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14D8081703;
	Wed,  4 Mar 2026 21:14:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6D45223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7ABC81703
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fdb8mVVNqcHn for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:14:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CB6181359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CB6181359
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CB6181359
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:14:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d35.dip0.t-ipconnect.de [91.58.13.53])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1E0CFA4C2707;
 Wed,  4 Mar 2026 22:14:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34390)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxtY8-000000003VL-0Aex;
 Wed, 04 Mar 2026 21:14:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 22:14:31 +0100
Message-ID: <20260304211431.618757-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772658872;
 bh=aolCCQAtpYTth/XUpcZqeGskkON8s9okmziSr6XPHts=;
 h=From:To:Cc:Subject:Date:From;
 b=F/PoouPOBmTA9tRLdIke8HlRXuU70ipTVIor0VoNiXpOIpn2MDiTzBOqrhq9e4cX1
 i/1/UkfMd13CAkjJ4yk1HLVfx3BSVzmaxdj6QMwyXT1HGUKvCPKftz6bpQTkH09EpF
 fEwTTlue1RLqpflapXCOY6xhGlpyRpUMQeqUyCeVG1yiWaZoI8wnTCAuqj3859+p8z
 J65ICjvdi1Oix/wiaOGy8q7zi7iUv6mlO7RzR5qeyJOx1ZB+/Ezj6EYCAjWRMcPfo4
 /y5hCCvXRkxNdFLq03m7/3D74slUKgW/mpkK/emlwsNJeMNKtbVUzOHI7PcH/dydO5
 RrRiXIuhlccBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=F/PoouPO
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260221
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

Updated hash of LICENSE.amd-ucode due to copyright year bump:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/LICENSE.amd-ucode?h=20260221&id=e399bb332bdaaeacb27923e8a0a68b0d6f303d49

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/linux-firmware/linux-firmware.hash | 6 +++---
 package/linux-firmware/linux-firmware.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index f1fdca52a9..ba2c88aa96 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,9 +1,9 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3  linux-firmware-20251011.tar.xz
+sha256  bd19acc4c1a02548e09d3df67f987fe6e378df735bab138c1d9e917962056d94  linux-firmware-20260221.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
-sha256  27907ae1d74b94fd6f1159971158ed3199e472f129ea1ff748ea13aded2a59d5  LICENSE.amd-ucode
+sha256  2103bd999f77522c5ab5fd35df0579ed00e2a6b885f6f8ebd444e97ffa482991  LICENSE.amd-ucode
 sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
 sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENCE.atheros_firmware
@@ -49,7 +49,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  fc3825c3807cf5028aa9c60a4f5936a8265e3e00fcbc85b5c016bdfc136e045f  WHENCE
+sha256  f347586920c214293245169711f81ef837d9c37410a04bddb44a583e2883c2f9  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6e58814279..285be95ac4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20251011
+LINUX_FIRMWARE_VERSION = 20260221
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
