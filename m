Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F33BD6AAEC
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F934118F;
	Thu,  2 Apr 2026 18:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHa68M26x4CB; Thu,  2 Apr 2026 18:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B4C4113D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775153079;
	bh=hOOFkhnDi/IxsnaAKFJcDPinsxPHc5B+m5hVWHuMp0s=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MB6cFZ26CY2H38ZUyql4coaJdqgzXzDd1aRBaBhjvS8tDgo5KW9DHeoZII0sklEmB
	 44N8gx3OzsQlZWBuUobJXktXJW2oNC4cS/P44LdUq5qPxXdCr1goXXGzYRvS28yglk
	 YZZwZHtdKZ5pYW3ZV5K4ryFsxC/Tb6tDhxKHVq14mV/8rzk1JwiNutO5dg1G/w3XUw
	 IC+IQCUIAEflexpA96UsPnpvSWBHuVAirriKXMjVHbvff6mkX857aqVNovDaqGXMAZ
	 hNgEDKNO9Szfqgysox1wUfVpyLl+ANOdCLFjPd9s7RuBymIwdOh5IPr4dPXvdvZ2Tc
	 77kpq8AWXqU0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B4C4113D;
	Thu,  2 Apr 2026 18:04:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D222CC
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68BCB607FE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KPKSEIxDdNz for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55FCC60777
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55FCC60777
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55FCC60777
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:04:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08f0.dip0.t-ipconnect.de [91.58.8.240])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6ED15A4C32CE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:04:34 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54882)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w8MPB-000000000Ar-3jMa
 for buildroot@buildroot.org; Thu, 02 Apr 2026 18:04:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  2 Apr 2026 20:04:34 +0200
Message-ID: <20260402180434.2780058-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775153074;
 bh=lhuwrxAaDcQpA1qkU0JKyk5dw6F7HsLTN5p3ENuyC78=;
 h=From:To:Subject:Date:From;
 b=VkbIcr56pVIkoy6qutFxHLuoHhwEiidwiCS5kqDk3cNYGwnWQdi6VNqexDOax3/Sk
 VIr7FGSOZpe3qNLaUMm0OCwyV8ila+Ttf1jGqA6SOgurxEQTOUyLWvaYdCweuk3Td/
 iKh9tCHiztknTWDlY9ohnDxYlmHAH7xW+uY4g7Mcg/jD0aA7F2laMINXgAPP1txOJJ
 BDpdiY8QFUTnW0IKCyQfKDBsiKoO+FMXEMs/p1t1E4H0mJ6fKO12U/mOVWy9ELTg3p
 P1o7ZU39++Lxlowi0fFmCss2+oL7ISILHBjXp+01ePKWVTsL9u6c4SVAl/6pLbfSB4
 EV3HOok8SUZmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VkbIcr56
Subject: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.406
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

https://github.com/vcrhonek/hwdata/releases/tag/v0.406

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 5d0014d4eb..b7323fe117 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  13605519e72e46aa13d5eede1901a07a6c83cd25ef866a86e7458047b5c81ce5  hwdata-0.405.tar.gz
+sha256  1ccfd1ca723595b1fe8794f4157ec5635be1ebedb5d13769b4be75d0b75bc199  hwdata-0.406.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 879eb51322..e12ce7efb6 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.405
+HWDATA_VERSION = 0.406
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
