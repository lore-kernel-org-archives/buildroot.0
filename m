Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C8BD1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA02E40390;
	Wed,  3 Dec 2025 22:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IbCik97v-OR; Wed,  3 Dec 2025 22:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58FF6402DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799306;
	bh=srjE6gG1b4bD3vABFJbgVZLjVPqai2VneSG5u2GG9ok=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bq3Tcg/K6wC0Hr39jge7LAlMscFXQQdF6mZPiqDxgmN9Jlx+F4jChbjzHS7n1rBvM
	 uU32Y2HPNPwA4VWvgVvuOceqVIeaKm3IUXwqg4GoidZy7aSRP7vkgfWqVmDC/TWYWV
	 OBlLypf/tYX/xk1i/BKY0r4Z26YBvSaGQlPr3pNdkvJQBN7RwpK5FLzIZFXOCmbwAt
	 5vkR8R3xD5j4k7OUkKhmTKR+n8Dafl57Oo1qsXXcRBGW5uRBephldMTo3sH8hCFilu
	 y1b4+JLCDIyI5smTfaDQ5Gq10a5XNnw+oo2c0hwvr6ByJbeOOY3l5JztlK61RJLUSQ
	 rF12mw1PH34/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58FF6402DA;
	Wed,  3 Dec 2025 22:01:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04780E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAF354004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6p5A0zBozCs for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:01:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4EF640420
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4EF640420
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4EF640420
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:43 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A33F4A4C7990;
 Wed,  3 Dec 2025 22:59:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-367V;
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
Date: Wed,  3 Dec 2025 22:47:04 +0100
Message-ID: <20251203214709.2321976-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799143;
 bh=dCzcYGkgD5GgB/JIDVqNd+GtsUlFuLkoaMoNY3vDknM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Sad0o0lo3temAkfwYl2byIffy5By1KJai6VEcAsACmV9cpFs61ZSw5F3CK4K5CLoH
 wGOIjQcknS3iewYDjK6RXwPfol4lyZEzeYrGImnEuUpf8svTbSjYNPA26rgN+URYkI
 ld4vxi0DDiYdAH6lIX/byNTYd+29LxZxQV/2CV55rXSDa0bz1VA7Ya0DSmHwa85Nri
 7YTHDT67sMc2F1Cdxxve78Iy1K9fTcTufsJNZFCqmpW7a5ZZk7Eb1FtsU0nXj6fh5t
 XwSSkt8GuQPnmLnFY/RXbtDwRvTtEuZv62jG4BF215APOXr4Y9nSsI5HC/hjOzTKCI
 WLYjG/43W32kw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Sad0o0lo
Subject: [Buildroot] [PATCH/next 16/21] package/libvncserver: fix cmake 4
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
 ...001-CMake-require-at-least-CMake-3.5.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch

diff --git a/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
new file mode 100644
index 0000000000..e7b30e3db6
--- /dev/null
+++ b/package/libvncserver/0001-CMake-require-at-least-CMake-3.5.patch
@@ -0,0 +1,26 @@
+From e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@jolla.com>
+Date: Tue, 13 May 2025 08:37:07 +0300
+Subject: [PATCH] CMake: require at least CMake 3.5
+
+CMake 4 dropped support for version requirements < 3.5.
+
+Fixes building with CMake >= 4.
+
+Upstream: https://github.com/LibVNC/libvncserver/commit/e64fa928170f22a2e21b5bbd6d46c8f8e7dd7a96
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 205f3928..9b8118c8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 3.4)
++cmake_minimum_required(VERSION 3.5)
+ 
+ set(PROJECT_LANGUAGES C)
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
