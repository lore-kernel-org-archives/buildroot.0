Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08ED1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 294E961B1D;
	Wed,  3 Dec 2025 22:02:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Paz_ns-5m9MV; Wed,  3 Dec 2025 22:02:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51ABF61B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799354;
	bh=7YCLexwVahCPjP1PpjT8wRhvgxpNOPH9D91uFUu5WvM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZG3nMoCu3sckJJstQcz8FPyCGmSogmQ1REYSAWfbx4ve98vD3AHnAEf9DBvyGiyw
	 a2JmD6DlntCml8d61Xjssd70/DLA49i4sEpZs/yjPQqkUHQhC36frcYN4lOU5p7rNk
	 pKlk08EBerEYLx81hPaTGT2Y0XL5IScDX+qVwU33Vh5JNT69fbgCqZMa6ldvmKGYC6
	 PAeCILYQ+GQQAI94V6sUZ/AZt0Q+UMgnnlGmV0r/OInshFmRxdNHQucSaM/Ob0Nhk6
	 JtLQwPDH7Eb+nVkicX/xIXm9NFpkQ8/lyWK0M7AGnTO6MSU2cmurxqs6MlaqjaSzDs
	 eyleCViypPJPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51ABF61B01;
	Wed,  3 Dec 2025 22:02:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0758AD3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDC8440520
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dzc8F7gG9CR7 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:02:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E50724004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E50724004E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E50724004E
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:02:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7364DA4C79CA;
 Wed,  3 Dec 2025 22:59:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugp-000000000Lw-0RdQ;
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
Date: Wed,  3 Dec 2025 22:47:09 +0100
Message-ID: <20251203214709.2321976-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799144;
 bh=wKo9MHnhD8NimJjHAVQtnc1pv3TcX2UHSq4Cn4q2cIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hQbJkGMPvDTFlK8Kl8hUdqYiiRPbMwbAwE1INVMko5+7EwKcCqcQ7LCiHIqNGlhUg
 OutZr0VbKftSZ4b7z+KY46RXhSGvrFItItICHIC+sBVAylANKmYr/7WOEl4Ls2+QgJ
 Xjqf6imXtaEjkgjm+JKAb9YDH8aNCi3HSkLjS8i2ankANyrFucKpKsgwgQpEPjIxNO
 YU56kUFZPngE4QC0iL3cK1v2a2dwDEueY0Gg3KH0i7txBQsz/Vd9neRfvET5BJmx3r
 tIqJWZ7IQn+YHBZx+3l7ntK7DOtb+8tEM9AWh6x0CBKj3OPNV0VkVT97pG/IJTQWV4
 wQwTCDxPSMe5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hQbJkGMP
Subject: [Buildroot] [PATCH/next 21/21] package/websocketpp: fix cmake 4
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
 ...pdate-minimum-required-CMake-version.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/websocketpp/0002-Update-minimum-required-CMake-version.patch

diff --git a/package/websocketpp/0002-Update-minimum-required-CMake-version.patch b/package/websocketpp/0002-Update-minimum-required-CMake-version.patch
new file mode 100644
index 0000000000..da8e7e1da4
--- /dev/null
+++ b/package/websocketpp/0002-Update-minimum-required-CMake-version.patch
@@ -0,0 +1,26 @@
+From deb0a334471362608958ce59a6b0bcd3e5b73c24 Mon Sep 17 00:00:00 2001
+From: Alexander Bock <mail@alexanderbock.eu>
+Date: Mon, 31 Mar 2025 22:04:07 +0200
+Subject: [PATCH] Update minimum required CMake version to comply with CMake
+ 4.0
+
+Upstream: https://github.com/zaphoyd/websocketpp/commit/deb0a334471362608958ce59a6b0bcd3e5b73c24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4f93e243a..92990c7dc 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,7 +2,7 @@
+ ############ Setup project and cmake
+ # Minimum cmake requirement. We should require a quite recent
+ # cmake for the dependency find macros etc. to be up to date.
+-cmake_minimum_required (VERSION 2.8.8)
++cmake_minimum_required (VERSION 3.10)
+ 
+ ############ Paths
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
