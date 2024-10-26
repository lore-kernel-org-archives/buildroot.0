Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC72D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 044B8605DA;
	Sat, 26 Oct 2024 20:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id om11YLzw-L7o; Sat, 26 Oct 2024 20:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CBFF605DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CBFF605DC;
	Sat, 26 Oct 2024 20:59:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFEBF5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6FD8124A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-f3xk_0j6Q2 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:59:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A4FD68122A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4FD68122A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4FD68122A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:59:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b313.dip0.t-ipconnect.de [84.161.179.19])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC8EAA4C0CE0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 22:59:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54952)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1t4nsU-000000004a7-0OmB
 for buildroot@buildroot.org; Sat, 26 Oct 2024 20:59:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:59:18 +0200
Message-Id: <20241026205918.2664678-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1729976358;
 bh=Q6eC94MKhtAXVea5ej9+DnQ//ABdZARfO05op7b98wI=;
 h=From:To:Subject:Date:From;
 b=UToVpJoyc05k/RuxPuPqi0N3SbGGzD193nsZ0wdKYqt3BWHnaLKSEKg6f26npa9x2
 uuQIxBqzswKlGvEN+vwV7vo/WILOEH5BF87r9Cjatn11Ef07fCagJLgNUFRL/byxgV
 479nElCenxYGCtfQqpTrjpxOtRJZwhD+HXK0k6ur0SniWQqGde5OHd4qbQakWWGNhE
 JaAP3pFwT/bqLnW0KDNafBRvwp4NTnVpNv3+gvLCrV6nfApUjbqjAAITDHmhqSk0Fl
 dps4hLjZlI0vI92eJMjwX2F7RJ9n/iUEKlvIP8pAYZzhFlR2RKN/9c5aGUiiVNaq0D
 8c2kt8EMiLojw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=UToVpJoy
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.47.0
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

Release notes: https://sqlite.org/releaselog/3_47_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index e9017c4855..ba2c0956d8 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  67d3fe6d268e6eaddcae3727fce58fcc8e9c53869bdd07a0c61e38ddf2965071  sqlite-autoconf-3460100.tar.gz
+sha256  83eb21a6f6a649f506df8bd3aab85a08f7556ceed5dbd8dea743ea003fc3a957  sqlite-autoconf-3470000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 614b4b8ed2..e6d681e501 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.46.1
-SQLITE_TAR_VERSION = 3460100
+SQLITE_VERSION = 3.47.0
+SQLITE_TAR_VERSION = 3470000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2024
 SQLITE_LICENSE = blessing
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
