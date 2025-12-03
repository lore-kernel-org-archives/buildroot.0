Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEB1D1BDFF
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A83407F1;
	Wed,  3 Dec 2025 22:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmEJ8TsxM4ld; Wed,  3 Dec 2025 22:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1A4406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799221;
	bh=KG4jQc/zs+TRkiXKEf+p2N0Q4DHLkHyU892Rg53BDMM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M53hBTY4tuo1w22LCQZM/6SsXQa6Q63aslllpUu0K9yrs/2VDDs2ku++rKsQsSPL8
	 NmajJPGXXhVF7TClegW6QtRFWHAdpuHDJWTcjtNDKZvhFaKxwq2Cz01PWRwEOZjx5K
	 CqK9waKZh2T3Ppx21lLkRgSuZloU5Syu8OP3IRkiDDrQxJG4+HvQPXjJq3vzdzAnLF
	 SSLLjmwoAw1T3UkN7vFyaEku5szRU4wY/2X53XMRhxAwUhalLVwsnNexO07jZLIfrv
	 aiVTZVxxX+1T7FvIVHliiBGiznwkodys6DS7z7ge0effmJtkks8+soWFB7f2B9yYQA
	 kNuFV6R4aFgRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1A4406FB;
	Wed,  3 Dec 2025 22:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1405ED3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE5C161222
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8KO0D9QS6A8 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:00:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B095460E1F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B095460E1F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B095460E1F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:00:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 323FBA4C7989;
 Wed,  3 Dec 2025 22:59:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-3FL4;
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
Date: Wed,  3 Dec 2025 22:46:53 +0100
Message-ID: <20251203214709.2321976-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799142;
 bh=FqZQcWozcpbCLYKAgRTIuOlQFDBc/LZgGOHdD/7OAvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vr3dzvCOfZL5hHQJ/oGTKxpWOLrTCj2c7FZZnPaIa8Xemh+sS279YI2NOs7TY/CWd
 6hcutiofZV4D3nUTYWapb3oWdNsP8nVFGQPBXl6NOG/QfEew2cz9k9ZD5WF2SVF1iF
 QFfLSUz/UqlMxXKI1IGaOlZU3uQIf9sOvuu/4N6OLUlmPti2RXKBTTzBAAVkoEsud4
 lphmEnecBm8TAshDgmr7NXUAp4mvLNL6XmaAXpUNaDdYWkCus1eg0VkAev7WVaC8nA
 2TGbI9lm+2O7gD5hlq+9dQUItFqsGTidpZgvOnWDBREX8yTWoQ7/az32nIGBs7xsie
 S4Y9Ctj2DHCNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vr3dzvCO
Subject: [Buildroot] [PATCH/next 05/21] package/flann: fix cmake 4
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
 ...x-to-3.10-in-cmake_minimum_required-.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch

diff --git a/package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch b/package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch
new file mode 100644
index 0000000000..d11b35a805
--- /dev/null
+++ b/package/flann/0001-Set-policy_max-to-3.10-in-cmake_minimum_required-.patch
@@ -0,0 +1,24 @@
+From a6803c235c0107f3690010c2fc429e3875c4b7c6 Mon Sep 17 00:00:00 2001
+From: Silvio Traversaro <silvio@traversaro.it>
+Date: Thu, 22 May 2025 19:26:16 +0200
+Subject: [PATCH] Set policy_max to 3.10 in cmake_minimum_required to support
+ CMake 4.0
+
+Upstream: https://github.com/flann-lib/flann/pull/526
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[backported to 1.9.2]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f79d173a..85d5a560 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 2.8.12...3.10)
+ 
+ if(COMMAND cmake_policy)
+     cmake_policy(SET CMP0003 NEW)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
