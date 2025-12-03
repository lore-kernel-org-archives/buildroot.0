Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2439D1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5985E61ACE;
	Wed,  3 Dec 2025 21:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwew855fzOpi; Wed,  3 Dec 2025 21:59:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDB560DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799185;
	bh=siresViwXnqEM/cy4IBPbf5ikYLWMlWcqirCEjx+sdw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YuXXVyCVofqFM8WpEdLCn3D0mj16xWsllqXAMl4pO+thESHJsjT39xVM3+G4LJ2p/
	 nlp0mJ7FgN8J74qOXlLqqGJL67aXJYRNW1qHuVOPt3NZ2Gzk+ppHvgtPfynDNfENRq
	 2ErQF+Anj0Ggk0yQ8/B1CfLOhkfdcUYmdsLma67/414EmSBIr4ZjXFpjyppk9wgHI7
	 OTcRwg2XLB6N7jVUtkw8xhHoG+H5ZqzQqOhl91fl5WgR3RrJHy1Ot3f3TwSH6TpEnX
	 Qjh/IMr/Lkxxh/veKmQ6P1eQ2VGNmZ0fiK6EyL1FbpZSCu88meFeMUEA1to6d7RMEu
	 rEgnqEItaW2QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDB560DDB;
	Wed,  3 Dec 2025 21:59:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E040D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24BAB80B17
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q2doxpmqHraU for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:59:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1464F809D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1464F809D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1464F809D1
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92C73A4C7986;
 Wed,  3 Dec 2025 22:59:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-49w1;
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
Date: Wed,  3 Dec 2025 22:46:56 +0100
Message-ID: <20251203214709.2321976-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799141;
 bh=fao8mWdUryFy3RI7i1X7gFJxcGCEpg4ZAPjF4D4AHlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iHP0gje2Ey38I7N9jRVCxH9ibnV+6YVPTl+8rW96LYKopOC89J+R9OIjdvqmyFmGl
 PS5gHvz3RjhJkkCKwlv4knIw16Q441jnSnoXBzvKKEZGue2nREHvOL+3b95rArTO81
 VMebs4US+PFTfFbrVi4OqA7a9ZSKxBh4dkqfn4pm2xHvhN0ZrsxCQao5PikBGmyhQz
 fXOZhbkZ/v4Chqa656SlMvGrteL93K1NWVVdM8FHmGspXVD2SZ/cZ+VLkvxctM3ju3
 GTnViPkfapZcRzIcWI9hB8PfcqeF8BSqotzRDlyQEFSv4x2PACb05zg40rN8A12xpv
 RB9HkVSY6RSAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iHP0gje2
Subject: [Buildroot] [PATCH/next 08/21] package/gflags: fix cmake 4
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
 .../gflags/0001-build-support-cmake-4.0.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/gflags/0001-build-support-cmake-4.0.patch

diff --git a/package/gflags/0001-build-support-cmake-4.0.patch b/package/gflags/0001-build-support-cmake-4.0.patch
new file mode 100644
index 0000000000..de01384d05
--- /dev/null
+++ b/package/gflags/0001-build-support-cmake-4.0.patch
@@ -0,0 +1,53 @@
+From 70c01a642f08734b7bddc9687884844ca117e080 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Mon, 31 Mar 2025 18:35:49 -0400
+Subject: [PATCH] build: support cmake 4.0 (#367)
+
+Signed-off-by: Rui Chen <rui@chenrui.dev>
+
+Upstream: https://github.com/gflags/gflags/commit/70c01a642f08734b7bddc9687884844ca117e080
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt             | 2 +-
+ test/config/CMakeLists.txt | 2 +-
+ test/nc/CMakeLists.txt     | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4b5db235..a664bb12 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,7 +70,7 @@
+ ## - GFLAGS_INSTALL_SHARED_LIBS
+ ## - GFLAGS_INSTALL_STATIC_LIBS
+ 
+-cmake_minimum_required (VERSION 3.0.2 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (POLICY CMP0042)
+   cmake_policy (SET CMP0042 NEW)
+diff --git a/test/config/CMakeLists.txt b/test/config/CMakeLists.txt
+index 6190b253..205121e8 100644
+--- a/test/config/CMakeLists.txt
++++ b/test/config/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ ## gflags package configuration tests
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ project (gflags_${TEST_NAME})
+ 
+diff --git a/test/nc/CMakeLists.txt b/test/nc/CMakeLists.txt
+index d00b07d0..1b4d511a 100644
+--- a/test/nc/CMakeLists.txt
++++ b/test/nc/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ ## gflags negative compilation tests
+ 
+-cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
++cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
+ 
+ if (NOT TEST_NAME)
+   message (FATAL_ERROR "Missing TEST_NAME CMake flag")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
