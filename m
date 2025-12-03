Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4111DD1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 180D060A5D;
	Wed,  3 Dec 2025 22:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNhCWyU_OwdK; Wed,  3 Dec 2025 22:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A6EC60DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799233;
	bh=89FXigMVAVPKkQWZdTrHaw14olH51dBPV80EjQHhPd8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0dMdY0Diw+b10o9ElwyXLVbyKeunlv0MY4O0PXCGeGd9bGJYfQcRmxmj5Aa6woDa
	 5ysuZQ/T5IZftqONEiSqiGFbHwEXawQaWje+qUPz33XMVXKq1c+VWRtAShVjZO97Yw
	 i6+6eagEaQT0vSkNLbmbpN+jMcWRDUjzLpfWWTP8rsLuSBBxJjlv1WBU1iZmMDER4Z
	 TLfannqna/eFmAMTq5OTauvBaDt30XMq80gibADxFCBAI6Q+ihi0/4Awyc3YQE1ORF
	 c4mWx8fsMB9JY/1bT8pgo18Iwrsk1Ejp/oq9h+1oGSV/jXEnmfjX0lHphEhozPZ/iZ
	 +9foeT+bKrtXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A6EC60DC3;
	Wed,  3 Dec 2025 22:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A64DD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10E55401D4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftvhSUZt9Sje for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:00:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00C084004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00C084004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00C084004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63F98A4C798A;
 Wed,  3 Dec 2025 22:59:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-0eku;
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
Date: Wed,  3 Dec 2025 22:46:58 +0100
Message-ID: <20251203214709.2321976-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799142;
 bh=D83Z1tZFMlCGmJc9EO/ASp0lsPp5tH2xrQEucGKfWy0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rjoQQhuGLNrGuQfmnv/YmnuvXGMDRjShCMfr+DAv1Kr3eFGSVsKg6supU8rSraxmD
 6EbUsBdZ5IlQ5L65dsr5ExDYYj83mynycgs5Y6O26I4UZmoDf2V8/3rK7xFrlTZ8Jj
 u5USO2k/HiJfIGuxsTyFMAGT25nyx3ij15z6kwxicrzPEbqJ79/unzQ81PEVyidBpN
 5sZYKVxtmg0hB8PxTCxERnUcBGbqq9ivsHeieFazUzWAiU0QIk2y7oMGd0hCfOH0TW
 HQ8frREfhXz/SyA21MNrWawI9ZcPn8c9LbIIclMuOk+P9E2xryq531sfGs+NJuV9Kg
 ShP7TkY2iLWSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rjoQQhuG
Subject: [Buildroot] [PATCH/next 10/21] package/libcue: fix cmake 4
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

Not yet found by buildroot autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Raise-CMake-minimum-version-to-3.10.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch

diff --git a/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch b/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch
new file mode 100644
index 0000000000..f61b752004
--- /dev/null
+++ b/package/libcue/0001-Raise-CMake-minimum-version-to-3.10.patch
@@ -0,0 +1,42 @@
+From d62e39506f4f9b12d58efbd2f1e2667c06b13a19 Mon Sep 17 00:00:00 2001
+From: Andreas Sturmlechner <asturm@gentoo.org>
+Date: Sun, 28 Sep 2025 22:12:39 +0200
+Subject: [PATCH] Raise CMake minimum version to 3.10
+
+Signed-off-by: Andreas Sturmlechner <asturm@gentoo.org>
+
+Downloaded from Gentoo commit
+https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=67d125dc0333e62fccb360f5918b044aa4bdf978
+
+Upstream: https://github.com/lipnitsk/libcue/pull/73
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 2.3.0]
+---
+ CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c4f9d8e..0d3cb04 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,10 +1,14 @@
++CMAKE_MINIMUM_REQUIRED(VERSION 3.10 FATAL_ERROR)
++
++if (POLICY CMP0145)
++	cmake_policy(SET CMP0145 OLD) # since 3.27
++endif()
++
+ SET(PACKAGE libcue)
+ SET(PACKAGE_NAME libcue)
+ SET(PACKAGE_VERSION 2.3.0)
+ SET(PACKAGE_SOVERSION 2)
+ 
+-CMAKE_MINIMUM_REQUIRED(VERSION 2.8 FATAL_ERROR)
+-
+ PROJECT(libcue C)
+ 
+ include(GNUInstallDirs)
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
