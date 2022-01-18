Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C2BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3EE64149F;
	Tue, 18 Jan 2022 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3hOzRDBiJrh; Tue, 18 Jan 2022 21:15:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B05F414C1;
	Tue, 18 Jan 2022 21:15:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 831491BF995
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FC63414C5
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id txgacJtrUPnF for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 21:14:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EA86414C1
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642540477;
 bh=qOcyd9GEBANxLa+Q56hIF3Cls+12eXPcT1tyhvCV3UE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GPsNqXmYIKPFNNgl/ZfUQCT/ra0TdwmIO/YvkOEwzgjcy9b6XZR7jb1xbfe8H8UU5
 IeI1AezAJgWIWFhaHV/JRoiLk0/X2pYnZ4Ekoi3JHpfSfmJFkrS5C6HQi2allSHxKJ
 mmVsihezUOY4TwouhujvAeUTx5mncrQ4jYBbSGC8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MyKDe-1mOqQb0XYS-00ykHN; Tue, 18 Jan 2022 22:14:37 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 22:14:32 +0100
Message-Id: <20220118211434.9854-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118211434.9854-1-ps.report@gmx.net>
References: <20220118211434.9854-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Nn4jj3DHh/4T9rVRwpvXr0R3+Rc764T1UuEz/Ilw787cZKCWg1Z
 aM3hufb7k1phbr86t4YaoCyGsCKFM5J+NyIzhFVWQcfN/xpo7q7W6O5BRbLtlJ2RLDtsNxR
 Dpv2dsz0GLeY5fpl+w/mZhu17evjjhfTJNY4d5iDjDDkvNBTMs57SCnlM5yTWZCEu2AZoW9
 ZZAtl4Q1e3eBvTSWQE+PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VygXOUJRweQ=:KuWrdMYUT39eLFcOTiYU+H
 I6z/ZvQZSQ3t/FyydcbRnYmMPa3JU6GOSQiCu0lD1aSTo+Hn6dJ2y71P5Eu0UqB3hkwZTl/Lm
 f60tekB2prN3K5CDJsAA/OPDFI60CIzCB6HMwT5AdYcAs9SwWxEBKZ1qMZeFjWKmrPT6hSqzn
 xarMoYPILBzGXpci/+G1QNHiDaxRiAWEIS6xWmA7VOo1Uq0+POHSyx6ix1kiDynsi932PdleI
 zoODgL7Gb4BLMa6jB6wvtScwGU0PS7N8hXawpDpKk87xg4W9HMIbcxrqYdRmeiLAWSw7z3IYM
 WZ9JSg/VUbNOd15/yA5bAxecFWJdkmRLjIddsM5iomfcSJ1d1OuhAnXiHSWRXRmWkzgCytjzj
 3O8sWoGxFJgK4TEinavQoqrWR9hdpBLFFDkDKJblq+lp7k0kjckUwAVbIW6PTHZUavjiBP0//
 rR0tkclInlbvWGEx30mUuehKZUhHBeXOB/OYEPDb+TZRdmQbbbVq0SYiL6KZ+FGQsfUBYsULN
 stsTtgQ1GzSgI6zAaGhxoMvlxdNPEt8msdmrK+ZCW1jd6C72sgm+mIDGwgul1NJkuqqLhJqC8
 CgGzMtecQCP2h0HKU/Rn3at3HzKrbqKmGF3+4jKRgIFYQ2joO2VZx6s5dVpGkIjYbod9sj0Eg
 8Z0dKv2ii+CC/1kKkfZj81QXNBZmSdwKqc/tHe6XGWm4LR76L0kGMxt1HW5PxMW8wdP9K+KTR
 NX3+FhcnBQdYfGC1n+VoWCYFAK82kcfHSDlrdeiFCvCmtsG6cEWo6GHo+68OHmMCAnlSdeYG6
 9OMzHhK/ni2Q1DmG/R0S9lz2ty48/2Ax3bejjmelL6QASRQLk2N8GyzB2ax0Mx2Q3SXBPY/Iu
 nE/MBh3gYPlOKK5OVLD47ESS/GdtiaQYkbRnmlWgWArjiVtC0PjvEsVWuX8ktsgbhdtZf4pRx
 NLfZgq39cKN5qhLqN6Yz0krOkJn/YB2tnWytcyWI4rPSf/e7KfZjk67y8E+vtJeJxShBusD8h
 Dmgq2L180eJ4aBrsuzTItNE5+G5i+Lq5bofrZk/S2T+WlS0vu+abi+vpRJfgOGmmBHtKt3Awe
 Zpec4xOb+0U6iU=
Subject: [Buildroot] [PATCH v1 4/6] package/rpi-bt-firmware: bump version to
 ea9963f
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chanelog (since 3888ba2):

  - Sync with RPi-Distro repo
    Switch to "bullseye" branch which moved several firmware files to
    the cypress dir.
    Add 43438 firmware 7.45.98.118 + external clm_blob
    Add 43455 firmware 7.45.241 and clm_blob

  - README.md: update link to RPi-distro repo wifi firmware files
  - Merge pull request #19 from HiassofT/2021-12

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rpi-bt-firmware/rpi-bt-firmware.hash | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.hash b/package/rpi-bt-firmware/rpi-bt-firmware.hash
index 7e60aa4632..a575a02e97 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.hash
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9bd61431d42322eb0610bd7eed218da255c4472efc203be4332a0872bb562ade  rpi-bt-firmware-3888ba29898bb3f056d5f1eb283cb8de4c533bef.tar.gz
+sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  rpi-bt-firmware-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/rpi-bt-firmware/rpi-bt-firmware.mk b/package/rpi-bt-firmware/rpi-bt-firmware.mk
index 8d658ce435..f2d54f33bf 100644
--- a/package/rpi-bt-firmware/rpi-bt-firmware.mk
+++ b/package/rpi-bt-firmware/rpi-bt-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_BT_FIRMWARE_VERSION = 3888ba29898bb3f056d5f1eb283cb8de4c533bef
+RPI_BT_FIRMWARE_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
 RPI_BT_FIRMWARE_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(RPI_BT_FIRMWARE_VERSION))
 RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
 RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
