Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CE5CF9C6B
	for <buildroot@archiver.kernel.org>; Tue, 24 Sep 2024 19:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F0616059E;
	Tue, 24 Sep 2024 19:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpZpGgrqIXYr; Tue, 24 Sep 2024 19:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A32F60685
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A32F60685;
	Tue, 24 Sep 2024 19:57:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C80001BF3CB
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 19:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C44D38164B
 for <buildroot@lists.busybox.net>; Tue, 24 Sep 2024 19:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDq1enFXEM2T for <buildroot@lists.busybox.net>;
 Tue, 24 Sep 2024 19:57:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.153;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2658D81E75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2658D81E75
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2658D81E75
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 19:57:12 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id EFD042E1ED8
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 21:57:10 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out013.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id XtGD2WoZSDia for <buildroot@buildroot.org>;
 Tue, 24 Sep 2024 21:57:07 +0200 (CEST)
Received: from int-mx009.mykolab.com (unknown [10.9.13.9])
 by mx.kolabnow.com (Postfix) with ESMTPS id 09A6E2E1ED7
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 21:57:06 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx009.mykolab.com (Postfix) with ESMTPS id EC1FF2126EFB
 for <buildroot@buildroot.org>; Tue, 24 Sep 2024 21:57:05 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Tue, 24 Sep 2024 21:56:27 +0200
Message-Id: <20240924195627.596208-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1727207827; x=1729022228; bh=Ac3FLoXnlCNJaEi/cdH
 0hzbADPDJpzwgwpIWhgOROVg=; b=hZHjbksgyDtI2nLDZ60cWvBd2U65fbbfyLw
 UxTH/tfaNoFfzrvLLVKn4Kl6czWIBcYjueaTppDEIjmUnGqQiLF6ud6lu1Boph2A
 bDFtiJje7HGDpd0z3oWYNu7ipCQfdfvesD5s83NE4Eu0Vemv7Dsu7CPuX2BTOVcX
 5sqvID2FWxD7JRrVp7angVuc2vQjlZ5eWkLz8w5uske7SDCI841nG7TpinQ4PW1o
 a3oqXvZvfm6U7QYm2uldCDMGaCu1NXOwoajRp54zbsGbQK2HBolpfHLtW/bipFXk
 ojysaC8VKsFD3Ed5UG/SatpR4MXXGrPGXgiqKumkTIoErVWajwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=hZHjbksg
X-Mailman-Original-Authentication-Results: ext-mx-out013.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to 9.5.0
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 package/proj/proj.hash | 6 +++---
 package/proj/proj.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 828380293e..8a1650ade5 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from https://download.osgeo.org/proj/proj-9.4.1.tar.gz.md5
-md5  e53d826635908369895060c9226f09f6  proj-9.4.1.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.5.0.tar.gz.md5
+md5  ac46b4e31562890d012ea6b31e579cf6  proj-9.5.0.tar.gz
 # Locally calculated
-sha256  ffe20170ee2b952207adf8a195e2141eab12cda181e49fdeb54425d98c7171d7  proj-9.4.1.tar.gz
+sha256  659af0d558f7c5618c322fde2d3392910806faee8684687959339021fa207d99  proj-9.5.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index d591d4eb6c..a17a0a1feb 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.4.1
+PROJ_VERSION = 9.5.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
