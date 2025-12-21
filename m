Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A681E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E677782211;
	Sun, 21 Dec 2025 22:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kuX-9SsujWpz; Sun, 21 Dec 2025 22:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1B0A8220A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356691;
	bh=Pzuve2z7C4K5sF/MLfgDGrZPUCzJFkvl+vr+bYoymIY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YqDPoWQB4Rbd5NOusqAKJSqj/u7HJ+Bf5YzCSEg6XYrDmGuiGEv5AHlhcuNqRrW3s
	 /z/oXN6K0qvhJ0nphXEixMK/td0f8e+gl54XzD/1NPovHclUiTZP8Pb5u7mIPv2Km1
	 fR6j/74OHxllxvcLyz01Gwg0GSD+g5FyC7TLS9Mq1dFpUsvrLwG1jC0NZUmb3Kfbc+
	 5u0RA0ENcG0FeHMUrwu2/ZjXfombI7kvlJexfC0Eab8eOpi5QdngC0jpYOiRpcbohs
	 aAg3ffFLcWv+gpPw/1SLrNOi94iiE7hcIEKy1UDgFVBEU+CRrtQFtyoaj0qV3fArCA
	 RTTwzCOUapU0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B0A8220A;
	Sun, 21 Dec 2025 22:38:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5A38119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2FCF60810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q73b7XOzSHrO for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8D63607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D63607F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8D63607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:38:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7567A4C4E54;
 Sun, 21 Dec 2025 23:35:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-2E3b;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:36 +0100
Message-ID: <20251221223441.185169-18-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356505;
 bh=va7cp5LGlzwnLbyc9mcNxWov9oFyQC5mq2udKh+SfeA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RpSPcc4m5mkXoDBAOBFIZihReekHBjdXs60ZT/0NwKvUter6efTN1AkgZLGLOWWuv
 8W5NVbagCMx8j1QxU8NvPGATZY2gB0EbgnStveO4ZQ1BmcKpXoaa8ZnaLdbUX4cYpm
 vWKaT4WmwxRHctaZ8p6vtQu/znRG3flXt1K4L/fJs3mJGU6pysdVi7GfbZCzPW328M
 llDiPAo+kOnh8/jF73IgJQJQDSYDHsMRKZXFNLeGZd8Zef4yoMQtsSt7+wy+3KR077
 y0IzJGDa1EmcBTLJqidArb5raVdT02y3Cd8lhxc3vhFdrxYkHeXEhGe7hGQS9ai/ev
 Sg/TLSFAYU9og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RpSPcc4m
Subject: [Buildroot] [PATCH v2 18/23] package/python-pyfatfs: add md5 hash
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyfatfs/python-pyfatfs.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pyfatfs/python-pyfatfs.hash b/package/python-pyfatfs/python-pyfatfs.hash
index 05e940779e..58f02ed7a0 100644
--- a/package/python-pyfatfs/python-pyfatfs.hash
+++ b/package/python-pyfatfs/python-pyfatfs.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/project/pyfatfs/#pyfatfs-1.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyfatfs/json
+md5  df7f61cdec5567ec16956cbae14514e0  pyfatfs-1.1.0.tar.gz
 sha256  9725ccd0a4da1c09c27358abbf10f08c043ac84210af576803e087f51a2b30e0  pyfatfs-1.1.0.tar.gz
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  df8f053d3cbf23fe7002e6a34b06580653a74d40dc2e54f3b717a963ea9b70cb  LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
