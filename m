Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFB4C3DA7F
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 20:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A411860A80;
	Thu, 15 Aug 2024 20:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCKRRX5Ya1kT; Thu, 15 Aug 2024 20:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97865608FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97865608FB;
	Thu, 15 Aug 2024 20:00:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F01D61BF599
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB86581EA2
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 20:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zJoZXJzDon9 for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 20:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.103.80.154;
 helo=mx.kolabnow.com; envelope-from=zgyarmati@zgyarmati.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD5C7811A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD5C7811A9
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD5C7811A9
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 20:00:46 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id B528D31134C5
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 22:00:44 +0200 (CEST)
X-Virus-Scanned: amavis at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out011.mykolab.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id y3IOc70xLIFq for <buildroot@buildroot.org>;
 Thu, 15 Aug 2024 22:00:41 +0200 (CEST)
Received: from int-mx011.mykolab.com (unknown [10.9.13.11])
 by mx.kolabnow.com (Postfix) with ESMTPS id 2E37431134C2
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 22:00:41 +0200 (CEST)
Received: from ext-subm010.mykolab.com (unknown [10.9.6.10])
 by int-mx011.mykolab.com (Postfix) with ESMTPS id 01723315B747
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 22:00:40 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 22:00:36 +0200
Message-Id: <20240815200037.509695-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20240523; t=1723752041; x=1725566442; bh=z3DSFurHWQSSrPGGxog
 1/9Td5U9bfLVXxNubEDdL8VM=; b=If8wqEdnrY6kN8HVECIiEASQcvthhFethY3
 Ja/gIRe585fGdy/hHEPVsBSEOWPJ7Dv8Pr1qKhD3B8abZW+gJN9/eup06cZD7BKG
 mTG7xevrNmkeOUv7sB3ZnySZzV9juRq7Zo/bGIa8BQePclg1ETk+x81InABT7+Be
 ytohgrAjTQw7GGX5CXrK9iZQzlwu8DB7g7ldVjoVsnNzp5N6FE6mlbe8pRbmy7n6
 WPPdP1EZ87xUiPhXOucMdCwZEo/I5v2xpkC9quzQguWaV5piA+H9/G7OgjEwaV3n
 pxFY6f8X62eP5VQHiiDD7QX+xrsZhsKSx8rLS13zE0OSH+yjUHg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zgyarmati.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kolabnow.com header.i=@kolabnow.com header.a=rsa-sha256
 header.s=dkim20240523 header.b=If8wqEdn
X-Mailman-Original-Authentication-Results: ext-mx-out011.mykolab.com (amavis); 
 dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to 9.4.1
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
index 22e6a43bf7..828380293e 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-9.3.0.tar.gz.md5
-md5  f1d70cb8873bb4429a03c437c65c41c4  proj-9.3.0.tar.gz
+# Fetched from https://download.osgeo.org/proj/proj-9.4.1.tar.gz.md5
+md5  e53d826635908369895060c9226f09f6  proj-9.4.1.tar.gz
 # Locally calculated
-sha256  91a3695a004ea28db0448a34460bed4cc3b130e5c7d74339ec999efdab0e547d  proj-9.3.0.tar.gz
+sha256  ffe20170ee2b952207adf8a195e2141eab12cda181e49fdeb54425d98c7171d7  proj-9.4.1.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 0e913fa335..d591d4eb6c 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.3.0
+PROJ_VERSION = 9.4.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
