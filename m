Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462B5CD11C2
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 17:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E8F41D67;
	Fri,  5 Apr 2024 17:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRX5DVFMmeFw; Fri,  5 Apr 2024 17:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E464541D6E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E464541D6E;
	Fri,  5 Apr 2024 17:56:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 718641BF406
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 17:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5EF5B40BB8
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 17:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OLMrCWTLxUg for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 17:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org;
 envelope-from=ralf.dragon@lindra.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA8D1401AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA8D1401AD
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA8D1401AD
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 17:55:26 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4VB5k256v5z9spJ;
 Fri,  5 Apr 2024 19:55:22 +0200 (CEST)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Fri,  5 Apr 2024 19:54:54 +0200
Message-Id: <20240405175454.14431-2-hypnotoad@lindra.de>
In-Reply-To: <20240401084841.439073-1-hypnotoad@lindra.de>
References: <20240401084841.439073-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1712339722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2RhUebiX1HRg3YUanlsT4ZfV19OUBtTimQd/OBkBB1c=;
 b=sWzVJuoJEJDLvG3iqK2zfFST3+x0hDv7LL3k57UhoN9h69f3OaQZ0VvOXauK3bAvRxM55O
 9P48E6pPcHQSxRrvjsxc5z4GSJq7AlCPbbYqhWBqdBm1b12J6o+xZTKF7k2lTEpPlSptTO
 4A9Dy4VZL48mQlQ5/rzTHwi5aq+x7WCvYp0DqQjh2N/+W/H2IpFCLfnRenvFpI3YxpDnOV
 VHCge+CANXfP4WU4kpYWrZOTFT/hQmbg7EnqafR+gj2aCtD9TQjyYgsHJ+91+Q0AWY8Wk3
 nna+SWWAEAqzVD25vFEfoslmr3DOtOd2Fr1FfFHzNWBYfMe5FpatPJe4Ghs9lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=lindra.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=sWzVJuoJ
Subject: [Buildroot] [PATCH v3 2/2] add missing SIP module for PyQt5
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
Cc: Ralf Dragon <hypnotoad@lindra.de>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
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
