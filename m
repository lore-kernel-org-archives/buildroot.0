Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7645EC27C53
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 08:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 289B540242;
	Wed, 19 Jun 2024 08:26:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SNDkf3QXrIVC; Wed, 19 Jun 2024 08:26:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EC1640249
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EC1640249;
	Wed, 19 Jun 2024 08:26:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 519521BF947
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 08:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EEA16108C
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 08:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wryb8dGESS7f for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 08:26:23 +0000 (UTC)
X-Greylist: delayed 903 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Jun 2024 08:26:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 500A661085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 500A661085
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=58.32.228.46;
 helo=mail-sh.amlogic.com; envelope-from=yang.li@amlogic.com;
 receiver=<UNKNOWN> 
Received: from mail-sh.amlogic.com (unknown [58.32.228.46])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 500A661085
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 08:26:23 +0000 (UTC)
Received: from droid02-cd.amlogic.com (10.98.11.201) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.6; Wed, 19 Jun 2024
 16:11:07 +0800
From: Yang Li <yang.li@amlogic.com>
To: <buildroot@buildroot.org>
Date: Wed, 19 Jun 2024 16:10:49 +0800
Message-ID: <20240619081056.430390-1-yang.li@amlogic.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Originating-IP: [10.98.11.201]
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amlogic.com
Subject: [Buildroot] [PATCH] package/linux-firmware: change Amlogic
 Bluetooth binary path
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yang Li <yang.li@amlogic.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove bluetooth subdirectory, and use generic pattern aml_*
to install all bluetooth binary.

Signed-off-by: Yang Li <yang.li@amlogic.com>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 13dbc6d98c..22ebecf6c6 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -53,7 +53,7 @@ endif
 
 # Amlogic SoC Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AMLOGIC),y)
-LINUX_FIRMWARE_FILES += amlogic/bluetooth/*.bin
+LINUX_FIRMWARE_FILES += amlogic/aml_*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.amlogic
 endif
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
