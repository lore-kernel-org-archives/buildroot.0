Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF646D1CDA1
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFDC76175C;
	Wed,  3 Dec 2025 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ghyL6yoMmqpV; Wed,  3 Dec 2025 21:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEEE60DDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764799171;
	bh=oYlWY6H/Qc86u5zXxXVd2b8X+0j/33AiGpsfam/KOGI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vl/OtJuhK5heqGkqueBeCrolCz9dTfW2bwnm6CL05qJqqsy/RrG3MlZWg3qXUmKte
	 wjm63m0MjvU91BwtT5B0oOxCM7Nf3kBP4ynu34N5LdpBJXy8zahx6v08WO/N/aaU46
	 /LS9XsybRqIphOmBhWPYeVOpgR1utGS7lG7oedjH86PSKgMb7zQMVkm+9h9Q5+E8AD
	 d5rJj1tnq33iJoCGTnuXGwTEzkkJKBP3FB6CEnUcpPzL+yGIdMi+OmHv/46GIDLbQ6
	 qPlRP+2JBlRaDpfRcyduVx7/3UNvRzPTrbpEeKwKD6u7nfwQ9m19ZthZXnF+AFC6lE
	 un+R9Y6ZInlRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEEE60DDB;
	Wed,  3 Dec 2025 21:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5FD1E7
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A6940097
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xh38VPI-v7LC for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:59:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E9EB40193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E9EB40193
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E9EB40193
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:59:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62698A4C7985;
 Wed,  3 Dec 2025 22:59:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55700)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQugn-000000000Lw-3qzI;
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
Date: Wed,  3 Dec 2025 22:46:55 +0100
Message-ID: <20251203214709.2321976-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251203214709.2321976-1-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764799141;
 bh=Ee0dRlaDGg9pNd7ZI+SfJS97GBi9p+wKTK3qgKmH37o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=dOMNkJjQ5yeZoRwn7E9hDYFuxO4L6ObeqwByBvuLgbLD6UwrKYZUVvcic+EIUGTBu
 d7UFiydZyoBJ2C/ANh8EOs/ZjY2rxJfRJMoSbuTwpWqO8BkqlObU5iedQS2DU/zVJc
 mEz3jb0xUNYS54AIxnjtmymzWjpGjackyCQeuYpqRA6Kd9VnOPMOE6ZC2kZ1tqGJIU
 2xHyEtyJkswQkxlERuCGf4sOG+Us+NW58XfX+3kmF03XqpE3cpk5CKl8sqk3ygmWcY
 djj4GvC0iMGL6tXGE5kjnS+15rSnYQihi6okUld2seK78bHe51jkZSMB9JqIPMIeuP
 8qYQ/WRGxcQOQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dOMNkJjQ
Subject: [Buildroot] [PATCH/next 07/21] package/flare-game: fix cmake 4
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
 .../0001-Minimum-CMake-version-3.5.patch      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/flare-game/0001-Minimum-CMake-version-3.5.patch

diff --git a/package/flare-game/0001-Minimum-CMake-version-3.5.patch b/package/flare-game/0001-Minimum-CMake-version-3.5.patch
new file mode 100644
index 0000000000..934dcddc74
--- /dev/null
+++ b/package/flare-game/0001-Minimum-CMake-version-3.5.patch
@@ -0,0 +1,26 @@
+From 5b61dfd69f4ecbaca6439caa9ae41b3168e4d21a Mon Sep 17 00:00:00 2001
+From: Justin Jacobs <jajdorkster@gmail.com>
+Date: Sat, 5 Apr 2025 18:31:03 -0400
+Subject: [PATCH] Minimum CMake version = 3.5
+
+From the CMake 4.0 release notes:
+> Compatibility with versions of CMake older than 3.5 has been removed.
+
+Upstream: https://github.com/flareteam/flare-game/commit/5b61dfd69f4ecbaca6439caa9ae41b3168e4d21a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d98c2ae5f..9c1750552 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ Project (Flare-Game LANGUAGES NONE)
+-cmake_minimum_required (VERSION 2.8.12)
++cmake_minimum_required (VERSION 3.5)
+ 
+ Set (PACKAGE "FLARE-GAME")
+ Set (VERSION "1.14")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
