Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C615FEBFD16
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 08:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C3A760E66;
	Mon, 13 Apr 2026 08:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-j2xJuXOtQ7; Mon, 13 Apr 2026 08:27:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2281560BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776068850;
	bh=VhvE0M47Tjn8wnP5c1FSv0/LCGl8jwYQxpccLQ7ASG8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bu4n9oXrjPKg0A53hHE5VLiECtAhxPa2u725GkVxIUTixk6glkWt2mQ4KtO/wCu8e
	 ZvejcxMopbYZwGpsWkHv+0OiFCtnbh2Nu+WkEt85GWr6/AaWpaqXB+SJg4m23UVcKO
	 qTyiqz44FbBmWU+S1wTFOGSf4KocQM+5iFyXPrbtvYMJyX+Z0jvfUF2dMRwyvbCzeN
	 vKzQ6PfyZQO6DSn1ifDCmolbNe4z0lJUXjdcCEyVV0vW+qwzUHMjwhShBHLg/cRKE+
	 ca44y6EqHr19kZ/ek3oDhkk1A0iKXNuMlKg6slMCTeuoetwax8Oaw0KfK5UqP+9MMx
	 dC69j9rUYG8TA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2281560BB3;
	Mon, 13 Apr 2026 08:27:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76F11237
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CA4860D9F
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3t5GoOmXWCF for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 08:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40E3260BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E3260BB3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E3260BB3
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 08:27:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccdb.dip0.t-ipconnect.de [79.214.204.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55BDEA4C169E;
 Mon, 13 Apr 2026 10:27:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34872)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wCCdg-000000008R3-2Jsu;
 Mon, 13 Apr 2026 08:27:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Apr 2026 10:27:24 +0200
Message-ID: <20260413082724.3553453-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776068845;
 bh=hHE+86b+gRePFcNd2x8HZCIBLYTf0qnvlA5m+63yJew=;
 h=From:To:Cc:Subject:Date:From;
 b=LukW+6xwQzaBZ3eM5x+5tVxfHCf+eyeR1+NhkgqtEm93cMd5Ht3k+2vUFa3y18Qss
 TY82slOFsvBkZergb8jXXoLuBSeOS5lNdrPMee4snTM/C1O4n0yQj8ybfo55lJOtN0
 sQo1KYVVOe5D3KhmFKvFUdcCwbJ8yeigbmRnM81LtR4MKcM4zG6QfHl0pY/hSC7el7
 UbFwRt52+yOEPltJBKubW1rC83O/0M5OYOflAA1rEKbY1kAEFWa8VQf2UbLji7VERH
 Yh/jSYsrpzA5zr223E43uX/t3yiKStEygzFKMX0cZJQZ2S+qmFzsbGnlkH6Iz86s/J
 6FtxeAfIex34Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=LukW+6xw
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260410
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
index c891c1a868..ede4d7fa67 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/kernel/firmware/sha256sums.asc
-sha256  c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c  linux-firmware-20260309.tar.xz
+sha256  b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178  linux-firmware-20260410.tar.xz
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
@@ -50,7 +50,7 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  b763b1df1341d86664e8e881f5214333d5f904c31e8cc58bb5302774f0369630  WHENCE
+sha256  c282239a5a2d849677e9304e6f361e475e1b6e71e7c771c03f8986f71b309527  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
 sha256  26b3c946f1f378ff25bb3bb7c365d108a2bc0bf08619e5e08bc0e4f9aaa6ee1e  LICENSE.xe
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4fe1c4d5fc..6561e1cd1b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20260309
+LINUX_FIRMWARE_VERSION = 20260410
 LINUX_FIRMWARE_SOURCE = linux-firmware-$(LINUX_FIRMWARE_VERSION).tar.xz
 LINUX_FIRMWARE_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/firmware
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
