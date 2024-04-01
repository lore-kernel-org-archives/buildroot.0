Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FAACD1283
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 08:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6873740518;
	Mon,  1 Apr 2024 08:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFs5jaoY9Iu8; Mon,  1 Apr 2024 08:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089D34051C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089D34051C;
	Mon,  1 Apr 2024 08:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF34E1BF239
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBD6C60799
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 08:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxEm39BBeNII for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 08:59:26 +0000 (UTC)
X-Greylist: delayed 616 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 01 Apr 2024 08:59:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3690C606E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3690C606E5
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org;
 envelope-from=ralf.dragon@lindra.de; receiver=<UNKNOWN> 
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3690C606E5
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 08:59:25 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4V7Pnr5gpyz9sWt;
 Mon,  1 Apr 2024 10:49:20 +0200 (CEST)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 10:48:43 +0200
Message-Id: <20240401084841.439073-2-hypnotoad@lindra.de>
In-Reply-To: <20240401084841.439073-1-hypnotoad@lindra.de>
References: <20240401084841.439073-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4V7Pnr5gpyz9sWt
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1711961360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qY2sfC0GVlC8CEAgVfAUxbY06ltBANXsuAaHYFxM5sk=;
 b=MKFZ9MPKfPDqsjY8FttBrSncYrNBd29XxZrjVqHHeLUXO33G1yPBGCCn5lS0xEPCndxOsS
 j3jxjo/P7L67y03v9IDhOE7N5t8zq9/0ryPoSyt+GeyyMuHLPcU52J0Xss6kaXsiItiyq/
 8LJdcEAErvpFfniuIiPugdy9PMVr+OTK0rzM82cd6XywkhHRff9DmXpag74DOYP1+ZgUrg
 q2Kzn/lBgp6oI51ESe7AW0K+TmHuJf18ua4O8KBVUAjuPaIejEehsicFTm7d3Yk/Tm0Flg
 oTi4KcTuSB+Dr+9nCDHfohTAvFgFBFoXn/PpmWyhjCIYgNzYv54PW6gpjaeqqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=lindra.de header.i=@lindra.de header.a=rsa-sha256
 header.s=MBO0001 header.b=MKFZ9MPK
Subject: [Buildroot] [PATCH 2/2] add missing SIP module for PyQt5
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
Cc: Ralf Dragon <hypnotoad@lindra.de>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following runtime error when importing PyQt5 in python:

from PyQt5.QtCore import *
ModuleNotFoundError: No module named 'PyQt5.sip'

The problem was likely triggered by the atomic upgrade from 5.7 to
5.15 in b36ce7e. This commit is part of the 2022-2024 LTS.

Signed-off-by: Ralf Dragon <hypnotoad@lindra.de>
---
Changes v1 -> v2:
 - split off the new packet to separate patch

Backport to: 2023.*.x 2024.02.x
(2022 LTS branches are probably also affected but I could not test any, 2021.11.3 is fine)

 package/python-pyqt5/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyqt5/Config.in b/package/python-pyqt5/Config.in
index 9fa7676f98..0b37f14317 100644
--- a/package/python-pyqt5/Config.in
+++ b/package/python-pyqt5/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYQT5
 	bool "python-pyqt5"
 	depends on BR2_PACKAGE_QT5
 	select BR2_PACKAGE_PYTHON_SIP
+	select BR2_PACKAGE_PYTHON_PYQT5_SIP # runtime
 	select BR2_PACKAGE_QT5BASE_GUI
 	help
 	  Python bindings for Qt 5
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
