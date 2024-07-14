Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F3C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 555A960605;
	Sun, 14 Jul 2024 16:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W341nASqnQBF; Sun, 14 Jul 2024 16:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DEB960614
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DEB960614;
	Sun, 14 Jul 2024 16:05:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2099E1BF4E7
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C29A811D0
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eOInQj4pRZHl for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:05:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 31E7B811CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31E7B811CA
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31E7B811CA
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 98A9D323EA;
 Sun, 14 Jul 2024 23:05:16 +0700 (WIB)
Received: from localhost.localdomain (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 139A551276;
 Sun, 14 Jul 2024 23:05:14 +0700 (WIB)
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 23:04:52 +0700
Message-ID: <20240714160457.39434-1-foss@athaariq.my.id>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:mime-version:x-mailer:message-id
 :date:date:subject:subject:from:from:received; s=dkim20240121;
 t=1720973116; x=1722182717; bh=n3eBI4L1UzEJ35+aaE8eW/X48SBEIZcG
 bbZTv9pz9Dc=; b=V2rSddfcT9qquTFW3E9ZnUWa8U/hXaTIiJC9LnzO2q2aAjS5
 Z/JaEaDXQcQvCe/GOvlAHVxLSGGTtrfD7sd1WPnPhcrKRLoxTYYsWitEzFnroqFK
 wWJ1n/jt0s7w40nhwIvdi6chrbzdLRibW29lnhQIxGhSwdgyFaxHEP4lc4F1rlpv
 HEbc0XZ/KcKJAnOEMgTO6NkvZLH9eAhlKhXyPmwjPmc1Ho+S1pMkSHxo6k2C119T
 xXN0xv2GJaX3ykMwPEe5nx00GOVjcpihR4gdQe9/cSu19wF2IjzVfD/X8rr8XnKh
 rVUSDbUyblRYGlBPOwbC2V1v6kk3zbmezE0BuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=V2rSddfc
X-Mailman-Original-Authentication-Results: mail.selirafood.com (amavisd-new); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=athaariq.my.id
Subject: [Buildroot] [PATCH v4 1/3] package/rpi-firmware: bump version to
 1.20240529
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
Cc: Athaariq Ardhiansyah <foss@athaariq.my.id>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Latest RPi firmware already provided support for Raspberry Pi 5.

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>

---
Changes v1 -> v2:
  - Fix missing description due to terminal issue

Changes v2 -> v4:
  - Change back from commit ID to commit tag

Signed-off-by: Athaariq Ardhiansyah <foss@athaariq.my.id>
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 4501db739c..5dc6efd8b3 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  00fe5487376e9d5ed14cbc72a9b7a5bd8d6900c84aee10f6d656f192a26d161c  rpi-firmware-5476720d52cf579dc1627715262b30ba1242525e.tar.gz
+sha256  48d0b1b041bf77dc81d7ed04c423a7f4ce0afd0e3fbea26462309e738b89a552  rpi-firmware-1.20240529.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 7ae9ff6c28..81066f0fc0 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 5476720d52cf579dc1627715262b30ba1242525e
+RPI_FIRMWARE_VERSION = 1.20240529
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
