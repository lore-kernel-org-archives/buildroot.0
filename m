Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36100C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 12:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9496F415AE;
	Fri, 28 Jun 2024 12:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kUVFUE3Wn39; Fri, 28 Jun 2024 12:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289E4415BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 289E4415BF;
	Fri, 28 Jun 2024 12:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C36DF1BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD35840319
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vh_SsEHz-9Ai for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 12:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.3;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F646401D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F646401D2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F646401D2
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 12:32:55 +0000 (UTC)
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wD331DmqX5mpydUAg--.13026S2;
 Fri, 28 Jun 2024 20:17:44 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 20:17:40 +0800
Message-Id: <20240628121740.2810640-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD331DmqX5mpydUAg--.13026S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF1UJFyxArW3CrW8Kry7Awb_yoW8WF43pF
 1DXF45J3yqgw1rJFW7tasrZr45Zr4kCrWUG34Ika4rtFyUuryvv3yDGFs5Grn7Cr12y3y5
 ua17GrWkuFyDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUeWlDUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0goMXmWXyqmEfAAAsj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7Hh1j
 mNwkvSg0OFpSa5GB6Q4t6JJH5+75ptcqRf5Dm4=; b=IxuugqSO8gEscSKrMQesh
 /8g2N6lHnJPHaSWdKOe+jAQ/IJrsnCJVMUVQ+I+Lv3maH7JvWFmffumX5N7uHe96
 ygP4bNA476vabq8m61z1w+lOxkhCV/YXQQDSxfNmAUy17Abvl4b4QkcjJVurIMVr
 NHP6ScM6jywE3wlMRDVl3c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=IxuugqSO
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Arm mali CSF
 firmwares
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
Cc: Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arm Mali GPUs that belong to the 10th generation of the
hardware architecture need a binary firmware to implement
the full specification.

For the panthor kernel driver to be able to execute jobs on the
GPU it needs this firmware.

Signed-off-by: Andy Yan <andyshrk@163.com>
---
 package/linux-firmware/Config.in         | 9 +++++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fa08b342f1..acea16fb16 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -681,4 +681,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_ATOMISP
 
 endmenu
 
+menu "GPU Firmware"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF
+	bool "Arm Mali CSF firmware"
+	help
+	  Firmware files for Arm Mali 10th generation GPU
+          needed by the linux panthor kernel driver.
+endmenu
+
 endif
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 13dbc6d98c..6a1b99f438 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -883,6 +883,11 @@ LINUX_FIRMWARE_FILES += intel/ipu/shisp_2401a0_v21.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.ivsc
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF),y)
+LINUX_FIRMWARE_DIRS += arm
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.mali_csffw
+endif
+
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 define LINUX_FIRMWARE_BUILD_CMDS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
