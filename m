Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A25E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 16:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E047B80B13;
	Sat, 14 Dec 2024 16:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqxE9qqXUL-u; Sat, 14 Dec 2024 16:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE646840C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE646840C6;
	Sat, 14 Dec 2024 16:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DC87C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E477840C6
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeYkRjlMicaM for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 16:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66AC780B13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66AC780B13
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66AC780B13
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:11:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c577.dip0.t-ipconnect.de [79.214.197.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76EF2A4C3BB5;
 Sat, 14 Dec 2024 17:11:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38340)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMUjN-0000000057K-0GIp;
 Sat, 14 Dec 2024 16:11:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 17:11:01 +0100
Message-Id: <20241214161101.3283121-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734192661;
 bh=m53nrAZ+sRElUgnxCHU3xOJiXXWfSLu7DSLDXgt+49U=;
 h=From:To:Cc:Subject:Date:From;
 b=AwNVQhdyHMyCKM4aIlt1+L7UV4Sg8UsMuHSHJjjHHhz31OthDCE8rH85+uWXTtC5b
 vh4d5fP7CzvEHgn3KOXShroaMAj6awa5/fvXFuPsONZ1hVibAcyScThzhZOiZA5fQS
 g5fPHZYX7VmsLIK/bh4nEg0Gy1a4WHcj54S81GIzHzNpGK9Al3z5BBQjEL/SztLGZY
 q5oEEhq6Lk1mhuCvhjXqK+HfraryjyoaRLr9gmHPz1+nZcYZkGgNlmVqAvEU3Sajqi
 16+R78wk2d8n0rKV2vJKaBlCBW3DjTDIwOMVAPS9+MuoGAMvDPBBJiUvltWfDTS+4f
 ZtAkcB3cgXCNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=AwNVQhdy
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20241210
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
index 97004505c6..9125352475 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671  linux-firmware-20240909.tar.xz
+sha256  2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5  linux-firmware-20241210.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -40,6 +40,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  d6a8d8b935d275e4092a0ec578eb430f9ef70bec34165d18bcabfa4a81f65724  WHENCE
+sha256  feb7f80e7805e0c88b1ea7588410822710e5c3c5cd5b685f75327a4d35798447  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9ffd52dff5..76bc6127f7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20240909
+LINUX_FIRMWARE_VERSION = 20241210
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
