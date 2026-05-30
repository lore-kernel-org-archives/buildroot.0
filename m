Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04634CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ECD185212;
	Sat, 30 May 2026 15:57:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5ulM2GkxIRz; Sat, 30 May 2026 15:57:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85808521F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156645;
	bh=QYIN2ju+neBbMqfCiKT0gPKcIMN4q3iXTP57b3LIwvw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rizf754gLx9xrpu1XFL+QpS3umi88SoRxttkPiqU3sSEmozvM87wWbnHsRmEJ5H74
	 DR3yRuuSjDh35JLnxtA4xAAtsv6vJ7UZD31Ex7+G5kY+h1SEhzd/xYjXLyyZMMGFCo
	 JjtXRjmhk8VTqLyzWRx1b6jAiGtmjGCO+GsPo3yV5D3uhNrisfvMPZXRpB15zuNY4o
	 nIdypJhfnKGJ8RiWlgNoOagjoMt8aY9gemqotGdgrJrforlF0cwpxFy9poj+iMC0cf
	 aHrkBdtYqcav2QADKHQvzN4QlHe+P2pPtduYEdMVyvTZoCVdB3LPBaOrhyaa+V+g2A
	 2+NCTHs82N/dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85808521F;
	Sat, 30 May 2026 15:57:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEE9D12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0129851F6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rW3AZTCgsRA4 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:57:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D0DA83B96
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0DA83B96
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D0DA83B96
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D1175A4C3414;
 Sat, 30 May 2026 17:57:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTM3q-000000001Js-3b6k;
 Sat, 30 May 2026 15:57:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2026 17:57:14 +0200
Message-ID: <20260530155718.657095-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780156638;
 bh=fBj5a0rqanIGbjPdqHcPP76BqHY92XjZwWXj6Tw18BM=;
 h=From:To:Cc:Subject:Date:From;
 b=JEPtPy2f3KJ2bGCW3T9/KrNyNdXm75G1qOMT6HHFFihtUVySXv8Vs7cwZc4we8hT+
 +wdNvvQlyJmzbfnajIqESrIMqQqcye8dRhk/OLzyKI/PiOoth1qePyEMmsL8nJLV8L
 ZDyrJQxdr4IToC+QQxT1hmbLcZYjC+Ck3ZUctjjjVlsRMNXLC0MT+eR7KgpvRqyP/5
 okbqYDzSb2LQCgULN00MkwYjXUfR1L6Vx75n/f7KRwgiJhz/ghfVziTfTz+HKA/RR/
 RzNo6o2z9q1pTxVbsaxMEJ+Xx6qaVbkDDjx4cVzkBnqZed8vIh7DoHtGkjMNuNegVq
 BB+5ejJF3bDwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JEPtPy2f
Subject: [Buildroot] [PATCH v2 1/5] package/stellarium: fix qt5serialport
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qt5serialport is only needed when GPS support is enabled:
https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L623

Please note that we disable telescope support by default so only gpsd
enables the usage of qt5serialport.

A backport to the LTS branches should be considered, adding
qt5serialport as dependency without gpsd support causes the unneeded
build of qt5serialport for stellarium. This situation exists for years
and is not caused by recent upstream changes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rephrased commit message
    Series passed qt5-based Gitlab pipelines:
    https://gitlab.com/bkuhls/buildroot/-/commits/d4c3a7f6096e3dc48fa33a27c697d76fc3f38d48

 package/stellarium/stellarium.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index 660d518860..48dadfec61 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -32,11 +32,8 @@ else
 STELLARIUM_CONF_OPTS += -DENABLE_SCRIPTING=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
-STELLARIUM_DEPENDENCIES += qt5serialport
-ifeq ($(BR2_PACKAGE_GPSD),y)
-STELLARIUM_DEPENDENCIES += gpsd
-endif
+ifeq ($(BR2_PACKAGE_GPSD)$(BR2_PACKAGE_QT5SERIALPORT),yy)
+STELLARIUM_DEPENDENCIES += gpsd qt5serialport
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=ON
 else
 STELLARIUM_CONF_OPTS += -DENABLE_GPS=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
