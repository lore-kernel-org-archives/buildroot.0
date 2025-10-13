Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE84CCD18F
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 17:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15BB608A4;
	Mon, 13 Oct 2025 17:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQHGq51HaXEA; Mon, 13 Oct 2025 17:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA84C61323
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA84C61323;
	Mon, 13 Oct 2025 17:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F113BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57F1640A41
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5Zi3rpccJul for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 17:56:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5425B40B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5425B40B4A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5425B40B4A
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:56:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EA8DA4C69FC;
 Mon, 13 Oct 2025 19:55:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlO-000000005Im-0l13;
 Mon, 13 Oct 2025 17:55:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:54:42 +0200
Message-ID: <20251013175513.86276-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378115;
 bh=/ye/hDikEQ47ZOkj8YVcjl1OSNwPRjFCftHZxaB34ZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n3WJIPHjsl1rFiAr4wtCRtiX9AXu+ijoFKpv1vEW3A+s99OmfjU650wGycU2goTJU
 N0TFh4m1qrRK1X5/lwqZzgV5eZMT+N2tCEtLSSHZtkQz2eZ7VqEqDW1Pn5XMLaf/i6
 gEJ4X4Fc9YUiI47lpa9ZZ8U7Dgn2dPLiQik0bw2b2Y/AJmTCQ/gCrRtEd4yLAhGjRp
 vfPXE/TJtL+TDCaOkAz29T386Dee2RqzyO9IvWL7yrC76e+nflKOPhFXD4dqwG59TF
 cYjeFKSwzjMWOv53k/DpZuWAWc4/y28CjOBsKAjCfPHiQ/Z6oyfFYja6X/YboOI5JL
 AXCnc72ZWnTCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=n3WJIPHj
Subject: [Buildroot] [PATCH 05/36] package/python-posix-ipc: bump version to
 1.3.0
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz <olivier.matz@6wind.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/osvenskan/posix_ipc/blob/rel1.3.0/history.md

Updated project URL due to note at
http://semanchuk.com/philip/posix_ipc/

Updated license hash due to upstream commits:
https://github.com/osvenskan/posix_ipc/commit/5ddd92995681595acbc530b7fbd4b7ff36279a16
https://github.com/osvenskan/posix_ipc/commit/5ddd92995681595acbc530b7fbd4b7ff36279a16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-posix-ipc/Config.in             | 2 +-
 package/python-posix-ipc/python-posix-ipc.hash | 6 +++---
 package/python-posix-ipc/python-posix-ipc.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-posix-ipc/Config.in b/package/python-posix-ipc/Config.in
index 2c62678679..59200de66c 100644
--- a/package/python-posix-ipc/Config.in
+++ b/package/python-posix-ipc/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_PYTHON_POSIX_IPC
 	  on systems that support the POSIX Realtime Extensions
 	  a.k.a. POSIX 1003.1b-1993.
 
-	  http://semanchuk.com/philip/posix_ipc/
+	  https://github.com/osvenskan/posix_ipc/
 
 comment "python-posix-ipc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/python-posix-ipc/python-posix-ipc.hash b/package/python-posix-ipc/python-posix-ipc.hash
index 427e4c7b55..1f1d98bcb4 100644
--- a/package/python-posix-ipc/python-posix-ipc.hash
+++ b/package/python-posix-ipc/python-posix-ipc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/posix-ipc/json
-md5  523a31c4dbd56e0d4fd677f33e126e5d  posix_ipc-1.1.1.tar.gz
-sha256  e2456ba0cfb2ee5ba14121450e8d825b3c4a1461fca0761220aab66d4111cbb7  posix_ipc-1.1.1.tar.gz
+md5  2488e63c881311f2bb697a0344ba9070  posix_ipc-1.3.0.tar.gz
+sha256  6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876910896f47d353448  posix_ipc-1.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  2b58f0bf31a8cbd7e56bfef030e9f7f02758ce8a810d073ccf41753bdc2a0747  LICENSE
+sha256  3f65e6e3d932adabcc6176dad775c6e538711483ef8de45a3ec47a12525f56b3  LICENSE
diff --git a/package/python-posix-ipc/python-posix-ipc.mk b/package/python-posix-ipc/python-posix-ipc.mk
index bdd2f1d4af..48d6588310 100644
--- a/package/python-posix-ipc/python-posix-ipc.mk
+++ b/package/python-posix-ipc/python-posix-ipc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POSIX_IPC_VERSION = 1.1.1
+PYTHON_POSIX_IPC_VERSION = 1.3.0
 PYTHON_POSIX_IPC_SOURCE = posix_ipc-$(PYTHON_POSIX_IPC_VERSION).tar.gz
-PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/07/7f/b954f224a226960a4aa98b6c5fa3d4f3fafb20bb8461446e41b563aee863
+PYTHON_POSIX_IPC_SITE = https://files.pythonhosted.org/packages/2b/a1/16d4b5a7dfc3dbb5965debe0415b6dc4866d4c94a1229f5b12cde7b78de8
 PYTHON_POSIX_IPC_LICENSE = BSD-3-Clause
 PYTHON_POSIX_IPC_LICENSE_FILES = LICENSE
 PYTHON_POSIX_IPC_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
