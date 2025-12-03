Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE846D1BDFC
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8372060DDB;
	Wed,  3 Dec 2025 21:47:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cJhCnWUYM7_G; Wed,  3 Dec 2025 21:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03F7960897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764798449;
	bh=HJLkcpxSIkPzBGd4yoP50OzRVaO0NCjmlR3PmClXpBY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fabP63kSr96Tzlo7RdrFYVV4lDUoXW4f0rQZ8Vg4/j2gWYwxjJyz/iTdPN+q++d4l
	 5HMzYRBNVbK0u0LPjN8nPcEJrqds0xMFnCMTMa1aw/AXJ99MGVUykIKcGNwllftwfB
	 yHd2fq55HYvLLXw1ci3Es+kVPtoY28cmmQ/nXjY33Dh+ZVs79uMTekLu17lceM+Cqo
	 fxO86Tm+MJjTEgfX2V3Ytaz++xiNGvdlSc+K9kSvUNFRIsRb9PPfZyIIWiu2kuhov/
	 zcr8ikO2lrTXJ6ScKZIhoCG/gK97ml+CKmQkyK34o4FGZMhK5ADgOVXBCuaBdq20OK
	 ZQXUBbEB0125g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03F7960897;
	Wed,  3 Dec 2025 21:47:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05DFCD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBD0C40097
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88WmSfCzN0MG for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2C014004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2C014004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2C014004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:47:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 55082A4C7984;
 Wed,  3 Dec 2025 22:47:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-2HOP;
 Wed, 03 Dec 2025 21:47:10 +0000
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
Date: Wed,  3 Dec 2025 22:46:50 +0100
Message-ID: <20251203214709.2321976-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764798430;
 bh=2ytRCRTD5oNFHR+wBjifMPbYnq50yI616zeXDUi8koE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qrQKgA7FhFnv4jipvYsC74aQAvsZlVmuzhWNk6tHHVRM0ndfGN0yryEm1ovQSET3i
 xkZYkAYYIs61gt0YFhbAGGNDJXszikjWjzxglnnMhSU1OiwMeJ1qN0JfONdjHfiqIz
 Hb8mWXiE5bC7CQn7jT/4iOhGzEKxpL86wBRD8ejfWU/FotqOsbMDhaotUHB7Azujmh
 uAL1wQdx6/i0mVKT4dVWl/3LvSxlyGM9XgfgD4TcrTlo+zmjx6Z2Ebuz4L9fkVTYAL
 6SkJ699SWMa74iH03TunH1PlG/6qzIoyCJWw5pFJ9W2CpIIApRTKgPeniw4y0MtxJM
 MHiMobIHcCZZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=qrQKgA7F
Subject: [Buildroot] [PATCH/next 02/21] package/bullet: fix cmake 4
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
 .../0001-update-CMake-required-version.patch  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/bullet/0001-update-CMake-required-version.patch

diff --git a/package/bullet/0001-update-CMake-required-version.patch b/package/bullet/0001-update-CMake-required-version.patch
new file mode 100644
index 0000000000..f2805c90cf
--- /dev/null
+++ b/package/bullet/0001-update-CMake-required-version.patch
@@ -0,0 +1,22 @@
+From d1a4256b3a019117f2bb6cb8c63d6367aaf512e2 Mon Sep 17 00:00:00 2001
+From: Erwin Coumans <erwincoumans@gmail.com>
+Date: Wed, 23 Apr 2025 14:17:20 -0700
+Subject: [PATCH] update CMake required version
+
+Upstream: https://github.com/bulletphysics/bullet3/commit/d1a4256b3a019117f2bb6cb8c63d6367aaf512e2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a695b71726..e7a58e6d67 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.4.3)
++cmake_minimum_required(VERSION 3.5)
+ set(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS true)
+ cmake_policy(SET CMP0017 NEW)
+ #this line has to appear before 'PROJECT' in order to be able to disable incremental linking
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
