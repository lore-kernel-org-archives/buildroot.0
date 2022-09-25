Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F587C6FA82
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 09:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03608417C6;
	Sun, 25 Sep 2022 09:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03608417C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A8oyPcUib45L; Sun, 25 Sep 2022 09:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2BC4176D;
	Sun, 25 Sep 2022 09:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC2BC4176D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C71C1BF5A9
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC421827BA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 09:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC421827BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-qGubtf4pqz for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 09:09:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8FF282437
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8FF282437
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 09:09:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id B294B1BF205;
 Sun, 25 Sep 2022 09:09:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Sun, 25 Sep 2022 11:09:20 +0200
Message-Id: <20220925090920.1585682-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
References: <20220925090920.1585682-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664096969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nvt/1r1rpwT8LvupC86/YtKuCoUHhPSwje90ikzmmM=;
 b=h5pgMpfTZpbst2qxvDVngmAuwKxPGNBLHaFUmoRcpS5lcbPVQdRutlH/TYfrBYOr253Y+h
 KBYMwHMZGhDiTqA9f86FoJsROcYHVW8VBYj4qvoqkUpTnDSv0JPaDo+mgSAODiSmaR7Wsf
 appIdsG7+NJhuygkZxC1MeZCv8jeT9wCueZG0ExQhvG5ISvQlqIV8y7fyGAw03GOH9mYnT
 F34fFDyQntwZXL6HrfUbGsPnEbgILKm4yDfceBhNtFi1XlgdP+wXVkirDolSXy5KTrCw5q
 OxsUDUfnCc5xtgKZCKBmFUEyHCgGVP9aYhW4JbiB1QGqzTSVwONim6smPd2CcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h5pgMpfT
Subject: [Buildroot] [PATCH v2 5/5] configs/qemu_xtensa_lx60*: use new
 BR2_xtensa_dc233c option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that Xtensa DC233C is directly supported as an Xtensa core in
menuconfig, let's use the new option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/qemu_xtensa_lx60_defconfig       | 3 +--
 configs/qemu_xtensa_lx60_nommu_defconfig | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/qemu_xtensa_lx60_defconfig
index cb78106091..845d466caf 100644
--- a/configs/qemu_xtensa_lx60_defconfig
+++ b/configs/qemu_xtensa_lx60_defconfig
@@ -1,7 +1,6 @@
 # Architecture
 BR2_xtensa=y
-BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
+BR2_xtensa_dc233c=y
 
 # System
 BR2_SYSTEM_DHCP="eth0"
diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/qemu_xtensa_lx60_nommu_defconfig
index 4be1b66edc..f94019540f 100644
--- a/configs/qemu_xtensa_lx60_nommu_defconfig
+++ b/configs/qemu_xtensa_lx60_nommu_defconfig
@@ -1,7 +1,6 @@
 # Architecture
 BR2_xtensa=y
-BR2_XTENSA_CUSTOM=y
-BR2_XTENSA_OVERLAY_FILE="https://github.com/jcmvbkbc/xtensa-toolchain-build/raw/95291b7c39e6f790d0b2f062c945a630290f2c81/overlays/xtensa_dc233c.tar.gz"
+BR2_xtensa_dc233c=y
 # BR2_XTENSA_USE_MMU is not set
 
 # Use minimal busybox with hush and networking tools
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
