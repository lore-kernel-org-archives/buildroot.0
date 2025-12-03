Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE61CD1CDA1
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDF560DFF;
	Wed,  3 Dec 2025 21:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gt15BjlqCOM5; Wed,  3 Dec 2025 21:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB1B60A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799146;
	bh=v/gkH94jfhz8Otkb1Stzpx9wIsZK4YAvmQ3dRUlfd7U=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fn2Bsi5q2gPeT1G+/iqijwm4bhfN9DqfRrrFQZGJuk96VNcNpdiONeHqSin+FJZ0R
	 OrLaUbQCBYOOk0/PGc8AHD2vmI/2PMYH0KE731kviy3VEqtzGKALaoQVegCbICM8yv
	 nHr+F3aI7IkdDTo7m1PeUkyKp7XddpV6sb1wm6ygvucP2NIuG3o8yq51T9Ha/KVVeo
	 yMqJDB2nMCsNLDT9Mld7gJH1j8mfE4zLSM5go85hjlGVwuoirwP0g3l204Z5IZAhdj
	 SIN5AMReiQM9Ed1JjbpceA/ilpdDxirqWzksbzgNls7XbE2Q9s4JeAYhHa3K8ijytZ
	 XfCkRQgMyn//g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB1B60A5D;
	Wed,  3 Dec 2025 21:59:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56906D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD4B84227
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k6-6EViimtob for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:59:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2E4E7841D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4E7841D5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E4E7841D5
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EC333A4C3D04;
 Wed,  3 Dec 2025 22:59:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-41ED;
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
Date: Wed,  3 Dec 2025 22:47:07 +0100
Message-ID: <20251203214709.2321976-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799141;
 bh=6mY9x6LrLlqp7/siTnW9CLCm37jn3Q2U0wR3ldK1HMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RmIq/qoIQ98hT7U+lpGN1XhyJypOSURgklJmUmEQ4r6QB4yhm0mBWQk0PO5RTY/Jo
 qaPBD8Ox+HjOgykbup9yDyJK2BYUFnreciGvliE1FFysZe8W3QoGCBuoXUk4wYON91
 2MBLLdJ2vXilx9ke4JeU9kCOOcMr4sqDhXCeqREcd4a1gLd0l6oUkecMwry1hkBLQS
 lcHAyxu5ChQgAmQIGzAJX4QPRsp7nWKx1U3yQ2GVWZD25cjca2ynQtoEfncdoEL4OF
 BWm6KA6dFwE7FW+G7Wy/+OM94PtdBfJsBhv92R3JsId5c/Xz97QsDwiHXxqDBtdHtj
 w/3kfaRyNWvlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=RmIq/qoI
Subject: [Buildroot] [PATCH/next 19/21] package/qhull: fix cmake 4
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
 package/qhull/0001-Cmake-improvements.patch | 37 +++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/qhull/0001-Cmake-improvements.patch

diff --git a/package/qhull/0001-Cmake-improvements.patch b/package/qhull/0001-Cmake-improvements.patch
new file mode 100644
index 0000000000..c75bb7932b
--- /dev/null
+++ b/package/qhull/0001-Cmake-improvements.patch
@@ -0,0 +1,37 @@
+From 62ccc56af071eaa478bef6ed41fd7a55d3bb2d80 Mon Sep 17 00:00:00 2001
+From: Cristian Le <github@lecris.me>
+Date: Wed, 2 Jul 2025 15:07:37 +0200
+Subject: [PATCH] Cmake improvements (#158)
+
+* Bump CMake policies -- Add higher policy bound (it is not the maximum version of CMake that can build, it's an indication that the lower bound can be bumped up to that version without degradation)
+
+* Use GNUInstallDirs -- This has been the standard install interface since CMake 3.0
+
+* Use more common design for the Config.cmake
+
+* Use `target_include_directories` -- Use target_include_directories to propagate the include directory.  Note: I don't know how the user consumes the package as #include <file.h> or #include <dir/file.h>, it is the latter in this implementation.
+
+[cbbarber] user_eg_r.c uses
+     #include "libqhull_r/qhull_ra.h"
+
+Upstream: https://github.com/qhull/qhull/commit/62ccc56af071eaa478bef6ed41fd7a55d3bb2d80
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[removed other parts of the patch, kept cmake bump, rebased for 8.0.2]
+---
+ CMakeLists.txt        | 105 ++++++++++++++++++++++++------------------
+ 3 files changed, 63 insertions(+), 48 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b2060f49..28714b15 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -68,7 +68,7 @@
+ # $DateTime: 2020/09/03 21:26:22 $$Author: bbarber $
+ 
+ project(qhull)
+-cmake_minimum_required(VERSION 3.0)
++cmake_minimum_required(VERSION 3.5...4.0)
+ 
+ # Define qhull_VERSION in README.txt, Announce.txt, qh-get.htm, CMakeLists.txt
+ #   qhull-zip.sh (twice), qhull-wiki.md, qhull-news.htm, File_id.diz, index.htm
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
