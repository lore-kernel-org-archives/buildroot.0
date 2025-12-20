Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EBCE668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B446B60E44;
	Sat, 20 Dec 2025 21:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT_zE8C8GMr5; Sat, 20 Dec 2025 21:41:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81C3760E26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266915;
	bh=VvyBatO/WY8mHasZXTSsbD3fVc2aAaFrys6Cm6WUAmU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CJrCYdY2fqBPWyBAd+78IDhruuPsP7XcbBvj2D1RCs5IOofLZfV/XE+g2GhfQ/0cf
	 W7dhfeonbdwYWVQ4eaxNNPabT62uCAvSsBx/DQmt/mXRDRlK8vgD38YkhLkDa95dgn
	 T3X66aqJJ6773M3LROdcc7pGy76nNCxCofyaFH/KjqfWtq7xXfqq3NrPvTxoY3Ju3C
	 gvVamfSJ2D3Yj92TeJoK12Gpo2rOsn3IOFYiaGm9m7AZYucudMO91/5C4izpla+Hef
	 raVkb9Sq9Ib5zD7HzB3duSz8Pq72twJ0rHMMonz0w3ewQ6Fsk7J2vCvbn9bnKdg3U/
	 uglFxpUEF3mlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C3760E26;
	Sat, 20 Dec 2025 21:41:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9E4223D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB38360E26
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dlh5vAhnJ4iK for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:41:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9A7060E1B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9A7060E1B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9A7060E1B
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7316A4C4D86;
 Sat, 20 Dec 2025 22:39:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-0A95;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:37 +0100
Message-ID: <20251220213946.1088820-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266796;
 bh=9perd4Nz1gm4/vHSDBTWMzHSqTD7CZdQZpnoCFGVw4E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=j8jKQy54AxuHxJqTdXFCAgocqAR8ynHinU38dN9XXbdBGu1DM1Z4ELmFUnlNH1HQU
 Lo+RmYMsJeL7fLSmP7E2q/z36BYrNTtaI/lgO18IR0goLLnsxf978RdJDYoYeBTJDw
 KGzErhJ2YsWtUMQrFA1do2keJiz2N5f8T/SrgMLpIwATDrOys+bX89p27DMzAQXaMi
 IHV3kRYnPpCTB4SHHUb/olikjdkFbQndKbMsPkQyb23XKeVRZe6rKpiagOzFKrJ+Gy
 kjogLNRrK8mBAEGI6DLrzBo2MLQ4BoY0QVJ1U6tbP0jd/bkgBYROdoc4nAlzko/RoO
 JfmAzElAilWyQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=j8jKQy54
Subject: [Buildroot] [PATCH 06/15] package/python-dockerpty: update tarball
 URL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-dockerpty/python-dockerpty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-dockerpty/python-dockerpty.mk b/package/python-dockerpty/python-dockerpty.mk
index e6fe6e3b49..7ad98c6b94 100644
--- a/package/python-dockerpty/python-dockerpty.mk
+++ b/package/python-dockerpty/python-dockerpty.mk
@@ -6,7 +6,7 @@
 
 PYTHON_DOCKERPTY_VERSION = 0.4.1
 PYTHON_DOCKERPTY_SOURCE = dockerpty-$(PYTHON_DOCKERPTY_VERSION).tar.gz
-PYTHON_DOCKERPTY_SITE = https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
+PYTHON_DOCKERPTY_SITE = https://files.pythonhosted.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba
 PYTHON_DOCKERPTY_SETUP_TYPE = setuptools
 PYTHON_DOCKERPTY_LICENSE = Apache-2.0
 PYTHON_DOCKERPTY_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
