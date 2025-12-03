Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51F3D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BADD561B33;
	Wed,  3 Dec 2025 22:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ombOQ3WfmqPr; Wed,  3 Dec 2025 22:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49BFE6170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799319;
	bh=nFLg0IXyStbcmOAjsq/qC2AoTmYRewkpDksTy/jQ6FA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvAKKTDx5uslAPrblngHE8JB5ydb3Cj/uEHBs6nApIkou9ZUkdzZWfh4WKsnU1+Qy
	 4Jw7xHxHWIdA1nqxCBTQ7DXUzWE1O2N+g/pRnH0ROhoOqwL5KEwdzNnI5w96KZoxLI
	 Y9ErpM8L2RQ0c2DS1pjiJSHrIvkp7eR+zCZki5BHGUDSw005Gv17f+pF+pCeloXxrI
	 1MtLazmDGH8ibGd1wwCzqxhuMu1DVzRf17N/6x5Yg2HJLl/MZe3Yj62YaRFW0CsmpR
	 lwXCvst/k/CXqMJbJDcUzg9SwSiR/n/3wSCZ+2KlzTSzx25wpGe5rRvaaIJrIROVUV
	 wX5HisNAv6YTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49BFE6170E;
	Wed,  3 Dec 2025 22:01:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD62ED3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3D4E40420
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qESqesa32q49 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:01:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 982DE4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 982DE4004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 982DE4004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D4627A4C79C7;
 Wed,  3 Dec 2025 22:59:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-3Otu;
 Wed, 03 Dec 2025 21:47:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Alexander Dahl <post@lespocky.de>, Davide Viti <zinosat@gmail.com>,
 Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  3 Dec 2025 22:47:05 +0100
Message-ID: <20251203214709.2321976-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799143;
 bh=61eblvWXzlBNpSqzFaF1G7wIUOcOEO71/pZgLd3bI8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YLX/HN++zu8EZnOT7JRux1vPiy//vVybfpZ9g3wK/u33xFepQz6SA5I03VPiRw0MF
 G+nM6smdoB9SrePzJfJTPK7IivAEQ29I4dqhunCkFB7ULCY2jFCh9ehjdSzL4oSJV4
 x2L3N2W3dZ94Xaj3tLfudwFayYivY0vjXG4Lj1qyxJMyKKdNpGCrONPeiPnbg4le7M
 deVavKxR5cx6ZWJr73pHULiNuUI52e5Rpuyg7p8fRzBmgBE9QWwpwEWPuXFKBEYZXk
 /Zr2qnh0KPSyHwTtJufhCbttimcOg66ZOW1iZJlGYI9YMlV2wvuW+RRItGAXr05qS3
 vMTTKjMf+l0cQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YLX/HN++
Subject: [Buildroot] [PATCH/next 17/21] package/mariadb: fix cmake 4
 compatibility
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../mariadb/0002-cmake-version-REQUIRES.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/mariadb/0002-cmake-version-REQUIRES.patch

diff --git a/package/mariadb/0002-cmake-version-REQUIRES.patch b/package/mariadb/0002-cmake-version-REQUIRES.patch
new file mode 100644
index 0000000000..6c776f5d63
--- /dev/null
+++ b/package/mariadb/0002-cmake-version-REQUIRES.patch
@@ -0,0 +1,25 @@
+From 726cc3684b4de08934c2b14f347799fd8c3aac9a Mon Sep 17 00:00:00 2001
+From: Leonid Fedorov <leonid.fedorov@mariadb.com>
+Date: Tue, 30 Aug 2022 22:41:44 +0000
+Subject: [PATCH] Proper external_boost for storage manager, cmake version
+ REQUIRES
+
+Upstream: https://github.com/mariadb-corporation/mariadb-columnstore-engine/commit/726cc3684b4de08934c2b14f347799fd8c3aac9a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[partial backport for 10.11.15]
+---
+ storage/columnstore/columnstore/CMakeLists.txt |  2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0be025103b..15f0eb0f48 100644
+--- a/storage/columnstore/columnstore/CMakeLists.txt
++++ b/storage/columnstore/columnstore/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.12)
+ 
+ PROJECT(Columnstore)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
