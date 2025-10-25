Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A92CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 10:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87E7B80A6D;
	Sat, 25 Oct 2025 10:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plurKRVhFaVJ; Sat, 25 Oct 2025 10:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87407809C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87407809C6;
	Sat, 25 Oct 2025 10:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36E53D7
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 10:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C75560661
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 10:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Svm8kCh12kGb for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 10:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63AA560659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63AA560659
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63AA560659
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 10:49:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf49.dip0.t-ipconnect.de [79.214.207.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93F51A4C47E8;
 Sat, 25 Oct 2025 12:49:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53280)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vCbqB-0000000067N-1LOX;
 Sat, 25 Oct 2025 10:49:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dominik Michael Rauh <dmrauh@posteo.de>
Date: Sat, 25 Oct 2025 12:49:43 +0200
Message-ID: <20251025104943.1597513-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761389383;
 bh=gaSuwZEKppfDEEdt7SgPAMo+/bYFQ810tIbtAG3eJKA=;
 h=From:To:Cc:Subject:Date:From;
 b=N7aOBoPPk38pZwM6GesvRvQrBPJ5epCDL5A5Sr5eDZcjOUeP5adnt/b/k5QCNyewv
 YPJ0E5d1YJ9uyfTlGQy6oDkD/5Aw/ozGfcyCzt30wwXnmSaHfJBIPtMpdfD0mWeZ0P
 ZWKPVF5M6q02zCVVxcI4B0PZ7U8sWBA2YIxB5jGKd1lGG5EJNKO88wqFYnF7AvRLG3
 Dqwn23VBF63PjFxpaT243bFWSQ0/q/SvwizY4F0EegXF6DkBpFcIpEIo9L58h4XL0N
 pJKxFAND8CrKkV+Y6wyAVZyBUnuBxeV2tgk8TlPHoPrVi4cYeg++YvY54SK5hexuFm
 AtCtHh+15uQMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=N7aOBoPP
Subject: [Buildroot] [PATCH 1/1] package/gdal: bump version to 3.11.4
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

Release notes: https://github.com/OSGeo/gdal/blob/v3.11.4/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gdal/gdal.hash | 6 +++---
 package/gdal/gdal.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
index baec7c910e..a264a44b7c 100644
--- a/package/gdal/gdal.hash
+++ b/package/gdal/gdal.hash
@@ -1,6 +1,6 @@
-# md5 from: https://download.osgeo.org/gdal/3.8.2/gdal-3.8.2.tar.gz.md5, sha256 locally computed:
-md5  178461c9c1cd4503e36559a1063bb752  gdal-3.8.2.tar.xz
-sha256  dc2921ee1cf7a5c0498e94d15fb9ab9c9689c296363a1d021fc3293dd242b4db  gdal-3.8.2.tar.xz
+# md5 from: https://download.osgeo.org/gdal/3.11.4/gdal-3.11.4.tar.xz.md5, sha256 locally computed:
+md5  5d60c5213d22a636913dbe4b3164281f  gdal-3.11.4.tar.xz
+sha256  6401eba2bb63f5ef7a08d2157f240194f06d508d096898a705637aeea9d3bbe8  gdal-3.11.4.tar.xz
 
 # Hashes of license files:
 sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 77ffb514c2..4217f178b5 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDAL_VERSION = 3.8.2
+GDAL_VERSION = 3.11.4
 GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
 GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
 GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
