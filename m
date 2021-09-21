Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E26C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3848261183
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3848261183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A4460ECD;
	Tue, 21 Sep 2021 20:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jqxf2kbeQc29; Tue, 21 Sep 2021 20:22:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21662608B6;
	Tue, 21 Sep 2021 20:22:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B47D1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 630BD82D49
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMWARsQvnt38 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5098E82DDE
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632255699;
 bh=z/hFHGVchtd6z0+4lsGbf42/wuzxMyLHAOOczi1eJK0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kIav53FVyyIT5HgY//2xaTGpVvdp44DPNTL0XZSqQLkaQhV/FS1XHHHdJ+vlB73mT
 GtJVM/O79abwRx6zZAZVngMkhjvquR3/piIgkZXXBGIL+bySR3SzZGdrnuK7IAsBQg
 L7amI3NcWq/LhN/Q917rjc1WoeojjDLfvrQ4qVlc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.170]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MyKDU-1mnqrH0Otg-00yf1t; Tue, 21 Sep 2021 22:21:39 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:35 +0200
Message-Id: <20210921202137.7092-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921202137.7092-1-ps.report@gmx.net>
References: <20210921202137.7092-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:/Gv/KLOL8Eg9SPH00FjxCZAwLehwypHkMj6PNs7K0VthjjfocKM
 C0mbwQ4XevB1C0jGR4d7K2jS7aVoFjfVkPRWhNobLjAwpQ3MePP6cAhPWR+P9dXkWna1Xzt
 yRSaMVs2eHY2j3r+mi75WlkmGB1sIYziZnz4zbcLs9ErToRQhgNJSmGygRLi7w7SlAf02Kf
 SoBmV44i8uyN3cb/jXiaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RbfpmbYxV4c=:PLg9s9PlnEDBAgxZ/OJRX/
 1ecF+m/xt7m0L713OEw64QRiQvuWN+SXAug9jFu6Lyek5+vx0XKUZ5AL2MIgiQvyC+UoIvmfW
 dFPxLdrKZdcHqWbbef/c15IXsZB7JeR2b0OyeY5OBiviJ775NymHMRvGrflJXf9afD/i0MBK9
 y+a1Z7p1JAg/qJL4nZPSgKFyIrapDngrIhSDjpm0eJoihC4c/BCuQNOBSKDBKWWzwqinp4kub
 vJ5wJBIookA5kxJLkTYBJWCRwg/+ReGiqxKIwNVbfvdYizeFx5tRa1R9ecBjt275bjWYiEX9K
 Uddxr0YIBRhzcz56bzxe4XGcHWht/iyWmfLeOjyVbJn5mF4B+p2i+uTDEoA4dW+5EogtWfWtM
 3lfjaWkU+ssXMwbjo3Nb3pukjD0WTcrtq9NujYG8dWXBN0woTE9DsjYp9K2jwKKcg09GzqZwo
 i3R57wlBRpNBO1CerAhl4hBBAHU0kYBWbNv1VQM7EncOd+0Jx74IDYI9zoI0sMlVrVp5aRldW
 TuW1OiRaITy7S5X9d2qONp9ShQaeWXiirel46jggiYsO661ADSozKv9JYajSW2BXruh5drqVz
 csMGC9kMKGJ6q1klyf9YgDUgSnkGUOl8a/dgLb65fKDW6BdIt2F2lYMtol+WZA5QblsZA6Gnw
 LhCovrWr4rur3Q10aUDUflojO7RIDC9LAr2WruKJmj7dS8Ij1RsPt0lFOCTQ6l1TnZTHIk4sB
 deIMYFL6/xRklMeb4L68hJTbJktsVY5vp5q6DCdCnokoTb+SFgmMoMHPhJ4s7Maq++k4LDvte
 nadns8H+gmbHp5FHj6qOmP13eVrh9EkeLnh8xCYl86ql4q+vJ3RxncbvEHSWPvaFzQ5FnifzW
 qMcz/PFPkd8mUCqcXQfUSa0FfGkUFa1Zva3xUzVNRP+VRs6czZrEGLqyp3Sh3bK4d6R/DxtMy
 LPtRp1wfvy73PwecmMQYBBOMMqtf0LpAcxx99249RMQuByk0VkSScZj/YTjeRIsNuux7D0Fmn
 TRoyZYp4XJ0Avop3GdHrL9PtU9nQBm04tHchSFjMtB/dVjHEWUHNrYrZ+xGFSPQfZISFC2mSg
 QBiAZ5roA/lUkE=
Subject: [Buildroot] [PATCH v5 4/6] package/rpi-firmware: add option for the
 debug set of start/fixup boot files
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add option for the debug set of start/fixup boot files.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch

Changes v2 -> v3:
  - adjust to one-assignment style

Changes v3 -> v4:
  - no changes

Changes v4 -> v5:
  - rebased
---
 package/rpi-firmware/Config.in       | 10 ++++++++++
 package/rpi-firmware/rpi-firmware.mk |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 9e401829c6..f9fc0b0e5e 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -35,6 +35,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
 	  The cut-down set of files for versions Zero/1/2/3 (only
 	  features required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB
+	bool "rpi 0/1/2/3 (debug)"
+	help
+	  The debug set of files for versions Zero/1/2/3.
+
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
 	bool "rpi 4 (default)"
 	help
@@ -53,6 +58,11 @@ config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
 	  The cut-down set of files for versions 4 (only features
 	  required to boot a Linux kernel).
 
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB
+	bool "rpi 4 (debug)"
+	help
+	  The debug set of files for versions 4.
+
 config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
 	string "Path to a file stored as boot/config.txt"
 	help
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 38a84100e9..f9568ba50f 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -15,9 +15,11 @@ RPI_FIRMWARE_FILES = \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_DB), start_db.elf fixup_db.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
 	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
-	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_DB), start4db.elf fixup4db.dat)
 
 define RPI_FIRMWARE_INSTALL_BIN
 	$(foreach f,$(RPI_FIRMWARE_FILES), \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
