Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F92C02198
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 13:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF4260B5A;
	Sun, 16 Feb 2025 13:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id it8kZEIeMvOo; Sun, 16 Feb 2025 13:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C337C60A6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C337C60A6A;
	Sun, 16 Feb 2025 13:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8652D72
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79F87403A4
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id za301UulRdGt for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 13:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 104F140291
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 104F140291
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 104F140291
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 13:50:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b112.dip0.t-ipconnect.de [84.161.177.18])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97C03A4C4BED;
 Sun, 16 Feb 2025 14:50:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47676)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tjf2D-000000000c6-1iW5;
 Sun, 16 Feb 2025 13:50:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Feb 2025 14:50:13 +0100
Message-Id: <20250216135013.2068727-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1739713813;
 bh=+nMFkEMSXtgIRH7xiCNC5jfK+DD+mlZf8H2mq1TuYzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=ORys06jLkrBxjvisnFpbGRFiHOPpDLFei3sbjW/VpvOAowI9BLHeM4QJTxFu7h3em
 hDtW3TRDUXYQkzGtWHsG/jxv77UoJxUimIhYWeihRUoPg+WfaI0HBcQdFzuef1JEL+
 JNzB3QjPuYc0n35qKvfSMNo+6p54Bsf8IO7oafHReDNPjoKCldcwwzfCWQfl94E4UK
 OPuTMGPQNeTD0GvxCegVtEfaIw2vVfZF3MRz/9lsijxgeGhAgHHu+hJx5GXZyaJpwU
 JLvoxxQrLeMc+dCsErPmUfOQrv9qLwIAKxnlFRxSpdwc5jVUrb94EkijS0FSgeMlQE
 QlkrjvOGiauAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=ORys06jL
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20250211
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
index 9125352475..29a191d335 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5  linux-firmware-20241210.tar.xz
+sha256  2de1345897bf839d532c5de0fdb348770ca2a5f4edfb21971582597abb45297d  linux-firmware-20250211.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -40,6 +40,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  feb7f80e7805e0c88b1ea7588410822710e5c3c5cd5b685f75327a4d35798447  WHENCE
+sha256  93d681cbd8ef106f2c9470aa835aa4176bfb7010ba168e6b467db6a5b4dee024  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 76bc6127f7..e73d688592 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20241210
+LINUX_FIRMWARE_VERSION = 20250211
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
