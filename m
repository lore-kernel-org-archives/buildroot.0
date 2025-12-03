Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAACD1BDE7
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 22:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93F2C60A5D;
	Wed,  3 Dec 2025 22:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRRF8sKsXrHZ; Wed,  3 Dec 2025 22:01:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA77A60DC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799269;
	bh=D4lycW34rUeL/r8LmgM+GgxgmBKR2vnbgU2oKtNg/s0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WaOuc+iU2HmPBk2jgsnLCy5YhKxeBhbtpDBKiCk3aei/lW2BW27vUcD90oHKL6b4f
	 fA5XmLpWLO9q0DGiiVhroXhvUWIQRbw0BDArYJYVnGlzOL4K+zjRwoeyTrCwDqPS3g
	 48IKMWTGTk954Gh+8aHaoajaH4DGmYwwHThLNlxgpyKjUgBcRA9JLDfoIYzj+3Hbrz
	 Bu/voH7zWjsE0w/u0lNbSC9QuLOgSjgPgAE+MfISZkhPrxVE58Q+SQ4vDQKNPk///U
	 6UXLgi/8xQURaB5FQprKFyysfnpxTv4tDO5/fvO4ydvGlFy1GqQsEcGdbyp25lOebU
	 8YUDS0kXOoxiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA77A60DC3;
	Wed,  3 Dec 2025 22:01:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75788D3
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 677A340420
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgV3a0dIrWQ8 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 22:01:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65151405C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65151405C2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65151405C2
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 22:01:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04751A4C798D;
 Wed,  3 Dec 2025 22:59:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugo-000000000Lw-1d79;
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
Date: Wed,  3 Dec 2025 22:47:01 +0100
Message-ID: <20251203214709.2321976-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799143;
 bh=EiWDoSqTeam+sRya4kMUeV4wE36Qls0PWNoYpot7wws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HCSp0tBIGmcJj6MWQrY6BAAEZejaB8lY8Ro1Hhi7Q00ZVmryEV+E1y8C1TeP3odYB
 0VPN5XBMzb/8XcqyRjp0m8JFvUTwjDHCeXyZmyhvMG0UNpWfOwg8UVazM83ZHUTRqF
 d5rN8w8Kiuf8z9n5QWB0zbPPN+UeU3ns1nYI9TNUZa16GqUn1brov4i01Amj63l/iP
 JuCr3BNLTFlYLXMlkXjGR2fWzCvQVzkRzXRVVeJculc1LKOgVl7iuT7hKGExIa7nRk
 zFpaLxzU3As8tTJKGOguVhd8TRlHJlibc9P8jg8gG5LKRZ1a7ASObNWUv/WOACyCIZ
 AWZ0x17TJDEPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HCSp0tBI
Subject: [Buildroot] [PATCH/next 13/21] package/libmodplug: fix cmake 4
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
 .../0002-Fix-build-with-cmake-4.patch         | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libmodplug/0002-Fix-build-with-cmake-4.patch

diff --git a/package/libmodplug/0002-Fix-build-with-cmake-4.patch b/package/libmodplug/0002-Fix-build-with-cmake-4.patch
new file mode 100644
index 0000000000..7c75d510c2
--- /dev/null
+++ b/package/libmodplug/0002-Fix-build-with-cmake-4.patch
@@ -0,0 +1,36 @@
+From a133c89548383f88fe0d0da618ef3c06c7f08f22 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 2 Dec 2025 18:00:15 +0100
+Subject: [PATCH] Fix build with cmake 4
+
+Fixes build error with cmake 4.20:
+
+CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+  Compatibility with CMake < 3.5 has been removed from CMake.
+
+  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+  to tell CMake that the project requires at least <min> but has been updated
+  to work with policies introduced by <max> or earlier.
+
+  Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+
+Upstream: https://github.com/Konstanty/libmodplug/pull/101
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d9fd20d..9f9c94f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8.12)
++cmake_minimum_required(VERSION 3.12)
+ 
+ project(libmodplug)
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
