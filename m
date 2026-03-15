Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5EED58B16
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 07:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A2D86103C;
	Sun, 15 Mar 2026 07:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0W2a46-W8qG; Sun, 15 Mar 2026 07:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B27BB61038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773560938;
	bh=rW9yMOqGwvyPdj3ScswUnWGAV399UWGxxRv8AGN3v+Y=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UYN3IxRDmmFZcz1+opuMNnG788aOwfY8ncBA/NjtoXmfjZt7eiZJzoA0naR6cNuty
	 mpH/RFh8AFp1aDo2u3QFf27mr9l9Rw+5KUY+YThEoOotIu18ZutAZzYXph04ZdLGBI
	 wjH/PYaruQzkdQmPbRW23oOOOPnb3D1zmJWGOfUzvJ16DeW6Xlkti3cQuzJaT7jRHW
	 XSJ6dLThlOfMJ3TOszlO1HtnXm8acOhaWcepTmOGS0t5U1SK25Dt2jIswgqFKUXRrg
	 r5i1d5KmrWgU+UBaH07kzcdRbKN/Lvqb0hcCtIJYTPoSWaNS/jTXg1wN5b7NG318Pk
	 41LqUTJTvSZ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B27BB61038;
	Sun, 15 Mar 2026 07:48:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C13311B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 07:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7295405F5
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 07:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3gr-TsYcyMbN for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 07:48:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C94A4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C94A4022B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C94A4022B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 07:48:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D61EAA4C11D8
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 08:48:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48274)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1gDS-0000000088n-0HJH
 for buildroot@buildroot.org; Sun, 15 Mar 2026 07:48:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 08:48:48 +0100
Message-ID: <20260315074850.8072-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773560930;
 bh=lkQpRbr6mQxk6uMSjOMlDQjRFOYPjkrgRCedkE3/JNg=;
 h=From:To:Subject:Date:From;
 b=YQEEi/FatrSFI1Nqu9GmtjNWNvH/qjJ6kxsw1SRpZhYSBrckasRSXmzeSEbX2+tIg
 NzywRxeebgURrvxe3QYzP+m54hmlZ8x5qF4c8L4DIfmt34q8ouyBn4rObOxLduv2nO
 wRmPRKVeg0mxKOErQdGzL9/qllfuDQQKdKh8vwOdLu0LTTavicR2N8TvjZvysj2svA
 JYRVqXrcHCSx4rjlajhP6fB49xOWaEHEQ3uYsD1iABgjnsKzlQzBB+v7UE+bgCp6/s
 LI2KqgY0AJcnKtPGGKd28eSgypT33ACUCRdTm7rRVPW6ccjT77cF1xrEmaB5yUAzjk
 RZWt4ZQ6Tf1MQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=YQEEi/Fa
Subject: [Buildroot] [PATCH 1/2] Revert "package/sqlite: bump version to
 3.52.0"
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

This reverts commit 04dbf7a38f4e83a1c6444b910209a0e3a350b14c.

Upstream withdrew this release:
https://www.sqlite.org/releaselog/3_52_0.html

"Due to backwards-compatibility issues associated with some new
 features, the 3.52.0 release has been withdrawn."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 9ed3781dca..055e935a4e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f6b50b0c103392af32a8be15b2b9d25959de9a00a70c3979128aafeaa5338b3f  sqlite-autoconf-3520000.tar.gz
+sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 4b334714ff..795bc32dbf 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.52.0
-SQLITE_TAR_VERSION = 3520000
+SQLITE_VERSION = 3.51.2
+SQLITE_TAR_VERSION = 3510200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
