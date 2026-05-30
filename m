Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02120CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 15:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C078742F03;
	Sat, 30 May 2026 15:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuCrmPC5Bg0P; Sat, 30 May 2026 15:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF05542F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780156670;
	bh=4lSz5NYU0q984LE7i8TrpdylZwuIQ01fgL3etJzao28=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mblZwEj5V27OGxkotbgwayCdfjmjffoe3bMdQl1MJv6b25r901qB45uZqjiQ4+kUg
	 QiAuBUKUCjH7p1e6VTghHzwgnxsrjLRcL+6UNvjKKAGA3D5BHEhKlxnB8c4mPYAPU/
	 A3V1bO2zbdVglBlytfa1DTvlIBs5+sFFK0cauIN4RM2913Sd/MsAn2usjrIs9U7cqK
	 Xbe89+cFxf3oPDMOptImynvcD8euwJJDlpVOMWSBdlV6ZUMfA+xO+kvyZ0TBvj5x3I
	 1kdXb3VMqe5VGSBaLsd7u1EDOn7EQJZVkrhINbWmdZGEk5RvmPuh8ToU4RIw4afu8u
	 tjEbiHS8IJp9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF05542F05;
	Sat, 30 May 2026 15:57:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 63C41F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49AB36F5B7
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gcYbMwBOHhO1 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 15:57:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CDB56F5B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CDB56F5B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CDB56F5B4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:57:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07CF2A4C34BE;
 Sat, 30 May 2026 17:57:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42626)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTM3r-000000001Js-0Ce1;
 Sat, 30 May 2026 15:57:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 May 2026 17:57:16 +0200
Message-ID: <20260530155718.657095-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260530155718.657095-1-bernd@kuhls.net>
References: <20260530155718.657095-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780156639;
 bh=GUzGhU/auSLkYQSvEtkFZ7RQO8BEKZ9ZYAOcLAZInrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CRsFUt3yKLOThvsJH4HV5N1TusEeCyXkTn+2Nr7Df9ofcKhtM92m1qNXxiWeZvVJH
 f77lKcw1gcV4d68CmAT6cQJ/yRhj0cNjk30bkY0uwJV7xcstdrBlzDiVLInCKrd3tR
 TiM/yLWOCFDnQKRvN3QQ0DPQ9lJ+tnwQHDneT2MCAsY1UjV7IIP5d0E/lpH06mfErZ
 Rpj0OgV5+Tcjd1Kty28ALuU8NbvMLVtUr1g9h0lAPesQA1aaj94WIUJ7VDmYj+b+Xz
 /DdDIfxtIPBRQ4roJOImHXJX1/QsctB4Z007H9Mfn5pqepkybsiT8xVIjVcOTyvlqe
 FJUoje+b5QBwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CRsFUt3y
Subject: [Buildroot] [PATCH v2 3/5] package/stellarium: bump version to 26.1
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

https://stellarium.org/release/2026/04/05/stellarium-26.1.html

Added dependency to qt5svg needed since upstream commit
https://github.com/Stellarium/stellarium/commit/a5c374bfa314a75c19aa65cc758c68517ef608ad
which was added with this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rebased after the extra-downloads patch was moved before the bump
    Series passed qt5-based Gitlab pipelines:
    https://gitlab.com/bkuhls/buildroot/-/commits/d4c3a7f6096e3dc48fa33a27c697d76fc3f38d48

 package/stellarium/Config.in       | 1 +
 package/stellarium/stellarium.hash | 6 +++---
 package/stellarium/stellarium.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 566f8edc83..20f32e747a 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_STELLARIUM
 	select BR2_PACKAGE_QT5CHARTS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5MULTIMEDIA
+	select BR2_PACKAGE_QT5SVG
 	select BR2_PACKAGE_ZLIB
 	help
 	  Stellarium is a free open source planetarium for your
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index 4298c3dcde..b3f2a9ec9f 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,8 +1,8 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha256  e376e0dc28eae0f7c4b3686fed9c2129c69a87a371b33e24bd79559a5142d613  stellarium-25.4.tar.xz
-# From https://github.com/Stellarium/stellarium/blob/v25.4/CMakeLists.txt#L849
+sha256  578bada2531e39146ccefcf6a0d202867e403b559f54239e8db9f9c003e04443  stellarium-26.1.tar.xz
+# From https://github.com/Stellarium/stellarium/blob/v26.1/CMakeLists.txt#L858
 sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
-# From https://github.com/Stellarium/stellarium/blob/v25.4/plugins/LensDistortionEstimator/src/CMakeLists.txt
+# From https://github.com/Stellarium/stellarium/blob/v26.1/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
 sha256  6e899e297485e457ec1bf84844de29921aeef674f9d5caf60277df45dca6ff76  v2.9.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index de992352a1..07d4a775db 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 25.4
+STELLARIUM_VERSION = 26.1
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
@@ -27,6 +27,7 @@ STELLARIUM_DEPENDENCIES = \
 	qt5charts \
 	qt5location \
 	qt5multimedia \
+	qt5svg \
 	zlib
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
