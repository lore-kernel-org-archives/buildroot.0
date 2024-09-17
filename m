Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D7CAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 18:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D68660770;
	Tue, 17 Sep 2024 18:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_6q6h_r1Mq1; Tue, 17 Sep 2024 18:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A71608E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A71608E6;
	Tue, 17 Sep 2024 18:20:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C74171BF310
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3786608E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 18:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ENhx28YkRnqT for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 18:20:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4C25360770
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C25360770
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C25360770
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 18:20:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0e02.dip0.t-ipconnect.de [91.58.14.2])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4748EA4C13FE
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 20:20:43 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46086)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sqcod-000000000ce-0Sxe
 for buildroot@buildroot.org; Tue, 17 Sep 2024 18:20:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 20:20:42 +0200
Message-Id: <20240917182042.3009700-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1726597243;
 bh=aGSzagDAbKWOdQYPDWbd2WOJ5hmScJoINKMcxflAw0A=;
 h=From:To:Subject:Date:From;
 b=Sxk8n+0uukAy0172tUHwUwvc6FlfkY6GCa0h4GRy47yf/r38NrJx6D8EJnYlYXOJJ
 IsqGzpi2/HcblvYpUxB5vrFeAmP++ZiOgo8eRmnA58TYdE2fwynd86qlsHJ8KBCCUH
 kElwwY4te3SKrC+qfkEXseUuzTUD33+gp+wWVk9b4DOD826JnLxTqx2Sq4761OpmCR
 d2yPekgE8m9ih0NnDE/CYcs0J7aXazU4ImhXKWBdzYRsAmbCNrGb9tD4rvYYWn5TXe
 sRoRmtMnbjmG6KtvM/ZwudkzB2JTEAXX6VDgHmv3i80Ze/PVrYJFXPbI/0u2X8VySY
 76ICj2V1dheYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=Sxk8n+0u
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.20.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes:
https://www.samba.org/samba/history/samba-4.20.5.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 71fe862901..2c867a03bf 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.20.4.tar.asc
-sha256  3a92e97eaeb345b6b32232f503e14d34f03a7aa64c451fe8c258a11bbda908e5  samba-4.20.4.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.20.5.tar.asc
+sha256  0697a8a57ff8b268cc268d508ee4f9ec86fd82350e84eba47a709242b71f6962  samba-4.20.5.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f08303a346..4cece4b477 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.20.4
+SAMBA4_VERSION = 4.20.5
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
