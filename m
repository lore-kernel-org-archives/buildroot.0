Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DC3C83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 16:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43C35611E4;
	Tue, 22 Jul 2025 16:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnGDP0ffgrTc; Tue, 22 Jul 2025 16:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDF560BB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FDF560BB1;
	Tue, 22 Jul 2025 16:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64104DA
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A5641586
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ynGwCL0ytGTt for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 16:30:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.176;
 helo=smtpcmd15176.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC35241538
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC35241538
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC35241538
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 16:30:53 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id eFtCum7DLX2UCeFtCuxZja; Tue, 22 Jul 2025 18:30:50 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 22 Jul 2025 18:30:49 +0200
Message-Id: <20250722163049.2584798-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGVbmLee5J7d2LcHyc0DRcfWoQ2/krA95k5zRxqTKDTn+lqAvDcbmWZdt9/ccqU3Z6+XrYkpRmwuVdM4ra3Nzjz+4yt7qr3EvoQMioYMbGjUkGaHCl0Z
 FRzBr5r1mBEC/eHNGch45Pk0FF08I2V7IsL2498PCXERb22L8759RydxJ1rNtS9E7eFQno4quZiqIqNEeJXj+ONfnxUYAeeh0LxjhkNMm9aVkkNrAmpblwyn
 4vFjyjuRj35FYRttvvwoDF6u+1Qs3MrAEDsDcATsTBkA/8gjEIalm9BkmpdaVxV1ETiAAyN6bfi+i352eieMYA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1753201850; bh=oWmGPFZVhgNjSBb1envBwiLsAFQuOZfTihU3k+STcmc=;
 h=From:To:Subject:Date:MIME-Version;
 b=O+G/uz5laK++6SpjGs/URy4qeGPPemVj1PJgdWBj7bFoYO/dxfHddJvNHkAVMN66Y
 d3GC3ySi21zq0LCVSoX2nETkd4C6cDHX+VjWufQCSsHCZtkxQtb4EO/ycTrEjhBL5a
 Gov3M4zfQraf2SipczVGuN99V2pA6Dyz5LQc0lrlwMD1K0f4fMBEOzb244xQ76gNDR
 p+fxubPQvFVse0Ax6Mw4REJcawd8nxf0MXfi7Dgu12A04ezuV+39sSAfA32hAGbGUV
 cTYqJPVAdR9fuxkGk2HLlOiF7q3G4N7XUzye3OPVicYfsI6n6/4psc6s28qOcCwO/e
 EWXD0LQkl5ZkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=O+G/uz5l
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to version 2025-07-02
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

With this patch package builds with Linux up to version 6.15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index aec440c97a..3189b3b7f1 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  09cd694a9424e9fd61fbb323d52a9f721e0b2d364ccb40ed854a79bd927f5df2  xr819-xradio-180aafb14191c78c1529d5a28ca58c7c9dcf2c55.tar.gz
+sha256  049849b0821e5a41a3f7ce291caf216775f8fa2060de6d49351165cc4e6aa7f3  xr819-xradio-506fbc323f1c675d037eaf7ee928939394761aee.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 8a76570693..5315ab0ef0 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 180aafb14191c78c1529d5a28ca58c7c9dcf2c55
+XR819_XRADIO_VERSION = 506fbc323f1c675d037eaf7ee928939394761aee
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
