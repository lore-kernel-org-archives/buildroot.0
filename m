Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A28D3B7E1
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 22:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C7C16065E;
	Sat,  6 Dec 2025 22:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHEh3XQADP8T; Sat,  6 Dec 2025 22:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4084060674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765058483;
	bh=LP7JK1Hko+7MX2bJEoVt1quCLBVvb4XGASk8sbjRM5g=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LS+8lhfer9y/sewHJIOmpKk9NuDNeQE8IzLmNq+X5mHMXE0V+gRmTICL/oeQkSaIY
	 tY3jphPp8O9eEPaq2bkjVWAmMm/mCmRv84UPXdO8rM3BLrwO2eH4eW3kaPUp4wSJkP
	 4dYSJ37hw7ORRhgIRWqLG1sPjlxHe3TXwcH0IjsZbK0S9c79swVIGfVKMck56AP5/Z
	 26vkvp7mAcYTwfW0rP6KvkYVE+n0uFMSBojbuLwK8vjsMmdxjDLyMnbd3pbVp/27Ck
	 YT+fiQ71y6jEnn6IYpxErSz3UsHJNJknADNFhsAcdEKDh9ccoDSSHjZRKRiEbx7jOu
	 /B6r3V1Hyww7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4084060674;
	Sat,  6 Dec 2025 22:01:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB5E8E7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 22:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD9D1830E2
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 22:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Y-BoM33Gxm8 for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 22:01:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 016F781E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 016F781E1F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 016F781E1F
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 22:01:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACD38A4C05A8;
 Sat,  6 Dec 2025 23:01:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41614)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vS0L7-000000001ur-3vnJ;
 Sat, 06 Dec 2025 22:01:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat,  6 Dec 2025 23:01:18 +0100
Message-ID: <20251206220118.2392443-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765058478;
 bh=1DNtui+O+0lT8k19eIRIJ7n5MLZWrz1PdgEO2vJe4uI=;
 h=From:To:Cc:Subject:Date:From;
 b=OOjCoErUAZAn3yfZY5yTFMVYIi1x1OXezfn99vDib6a91Z0P4zO4sX4zm7Z4+H1kR
 EFdRLzUvVSXMA64LHZPb3ijDwhNTbOqG7gvph3jGLuOKaxDcz9PiQ0kYvuC6pGUrPp
 9FHy3WabKXxbfL3j2Xm62eL3BjM7LSwzi72capUH2+J/si5oBvXiIU9d2MrM6LaD7t
 T0tuIK27Kju++KCEJ4fHIv5ey2M5i8pqi/n9OC1TRsD8UD/HHk8Ux8YZmgmO2nRHg+
 QqCEWCHiqlDTMNtsKsJOPGIjkO7IuOzrdD9Yp+nUYMup1K4JekSOmU4wCH1cr2FkEM
 JiW+XS3rljF+w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OOjCoErU
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5enginio: update SITE
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

Old URL returns 404.

Fixes:
https://autobuild.buildroot.net/results/064/0647daa54deb9df953d43b438ac05ebefb81b6ce/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt5/qt5enginio/qt5enginio.hash | 2 +-
 package/qt5/qt5enginio/qt5enginio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5enginio/qt5enginio.hash b/package/qt5/qt5enginio/qt5enginio.hash
index f1ad364ca3..f268458e52 100644
--- a/package/qt5/qt5enginio/qt5enginio.hash
+++ b/package/qt5/qt5enginio/qt5enginio.hash
@@ -1,4 +1,4 @@
-# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.tar.xz.mirrorlist
+# Hash from: https://download.qt.io/new_archive/qt/5.6/5.6.3/submodules/qtenginio-opensource-src-1.6.3.zip.sha256
 sha256  d907060b355512ceb7a8c3f6980e3979c20d54320b6804303b6c5e8ed42d3912  qtenginio-opensource-src-1.6.3.tar.xz
 
 # Hashes for license files:
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index b74775f298..dd3f3a5d6f 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -7,7 +7,7 @@
 # Qt5Enginio does not follow Qt versioning
 # see https://bugreports.qt.io/browse/QTBUG-50111
 QT5ENGINIO_VERSION = 1.6.3
-QT5ENGINIO_SITE = https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules
+QT5ENGINIO_SITE = https://download.qt.io/new_archive/qt/5.6/5.6.3/submodules
 QT5ENGINIO_SOURCE = qtenginio-opensource-src-$(QT5ENGINIO_VERSION).tar.xz
 QT5ENGINIO_DEPENDENCIES = openssl
 QT5ENGINIO_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
