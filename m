Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E5E810B1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 09:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C85CF41F8B;
	Wed, 27 Sep 2023 09:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C85CF41F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UjWfvaUTgDiI; Wed, 27 Sep 2023 09:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B2C41F63;
	Wed, 27 Sep 2023 09:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9B2C41F63
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93A4C1BF593
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 09:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AF4640412
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 09:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AF4640412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnR-sa-ks1Pe for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 09:17:08 +0000 (UTC)
X-Greylist: delayed 1120 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 27 Sep 2023 09:17:08 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3669940359
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3669940359
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:17:08 +0000 (UTC)
Received: from [134.238.52.102] (helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1qlQNF-00HFHx-0r; Wed, 27 Sep 2023 09:58:25 +0100
Received: from ben by rainbowdash with local (Exim 4.97-RC0)
 (envelope-from <ben@rainbowdash>) id 1qlQNE-0000000EaeX-1pJh;
 Wed, 27 Sep 2023 09:58:24 +0100
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:58:23 +0100
Message-Id: <20230927085823.3477476-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=codethink.co.uk; s=imap5-20230908; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Xg4x5bEhglgj9+Bp+0GF0GqMLsBB4HU2QZpQk1+EY4=; b=OS4ZZiTY4jegeqD4lTjhLOkdM5
 UgJQYZViZnNz8UUARFp4GiVgmDzBawP6v71VzdQYawygyfWVW/SLL0PeGEGiIKy4QYmI8Oxp20Rsm
 vufJ3eO5xjIbZgnyWrBWlnGyTiNnFLCddFIH77ed+yxeNsN2VsA+F95PPBPBJJ5sLu32+1t/ymBOd
 +wHSxijMeG9++yWh+SC/gFTQ8pPLCJ0etSmc5J20dDDY/NhsPVqkbyVHMjvoIBX9sfEPHWAzzK+wu
 nth64ExNAORrneGCZnGkaGXmNvv3EDo013oRXSadMJQ6s7vGE8Fl7b0/0JE6XOyTqRuKUVmpZIJoZ
 S4csAEGQ==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk
 header.a=rsa-sha256 header.s=imap5-20230908 header.b=OS4ZZiTY
Subject: [Buildroot] [PATCH] board/qemu/aarch64-virt/linux.config: enable
 base ACPI support
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
From: Ben Dooks via buildroot <buildroot@buildroot.org>
Reply-To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: romain.naour@gmail.com, Ben Dooks <ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When testing the virt machine with EDK2, the buildroot 6.1 kernel
will not boot as it has no base ACPI support. Whilst you can run
qemu with the -no-acpi option, it would help if basic ACPI support
was there as otherwise there is no output from the kernel post the
ACPI BIOS initialisation.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 board/qemu/aarch64-virt/linux.config | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/qemu/aarch64-virt/linux.config b/board/qemu/aarch64-virt/linux.config
index f9763b73b7..971b9fcf86 100644
--- a/board/qemu/aarch64-virt/linux.config
+++ b/board/qemu/aarch64-virt/linux.config
@@ -12,8 +12,7 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_VEXPRESS=y
 CONFIG_COMPAT=y
-CONFIG_FW_CFG_SYSFS=y
-CONFIG_FW_CFG_SYSFS_CMDLINE=y
+CONFIG_ACPI=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_BLK_DEV_BSGLIB=y
@@ -34,6 +33,8 @@ CONFIG_PCI=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_FW_CFG_SYSFS=y
+CONFIG_FW_CFG_SYSFS_CMDLINE=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
