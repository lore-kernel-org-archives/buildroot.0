Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94748CFD2F6
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 06:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C8281AF4;
	Tue,  2 Dec 2025 06:30:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNDlRNoTLn0o; Tue,  2 Dec 2025 06:30:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BD9781B3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BD9781B3E;
	Tue,  2 Dec 2025 06:30:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0DF7E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCC2860BC5
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-e8oWe74kju for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 06:30:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E2D46077B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E2D46077B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E2D46077B
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 06:30:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E4B7A4C10DC;
 Tue,  2 Dec 2025 07:30:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55196)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vQJuA-000000007hm-3C9S;
 Tue, 02 Dec 2025 06:30:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  2 Dec 2025 07:30:31 +0100
Message-ID: <20251202063031.493123-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764657031;
 bh=3Rm0Zq/TnEsotMFMIGNUaVwPITr/+NDJoJdt/lf+yew=;
 h=From:To:Cc:Subject:Date:From;
 b=diUHrqnZIo0ptpjTIbudJ8qnJxzH63i6Db8T+zXVBiYGtEqsOdOjWOl/73SYNw8uS
 wNOXiiYDpe4Axn735JYe3eGp+8iQXwiYuOs3GHiBfgWmdXW2JOoDv3yYgXHV7gZfu3
 W1QvFnoHCANNzInC3j68QyshD7wzsp2eAcsgxXyIpEt42rlUrF6r1R2ap9v9tKS0RX
 rRjYkq/LSWe5EwsqZLZLLiaZ6tnx63W3JzlXS49h+74IT8HaLKz5fAgkDKzCLWdhiY
 7lIYevX0lev/0xLY8fkj4KhtLHGYCu3I2aFc77583g+ayDzTqT9bb+4KEI/SGH4jOq
 3Wl91fmd5sjVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=diUHrqnZ
Subject: [Buildroot] [PATCH/next 1/1] package/speechd: bump version to 0.12.1
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

Release notes: https://github.com/brailcom/speechd/blob/0.12.1/NEWS

Added configure option to disable newly added pipewire support.

Fixes:
https://autobuild.buildroot.net/results/271/271e44f5ce9be0a2e16dfa2d9ee65701422a49c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/speechd/speechd.hash | 2 +-
 package/speechd/speechd.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.hash b/package/speechd/speechd.hash
index 0b02a35792..a16134deb6 100644
--- a/package/speechd/speechd.hash
+++ b/package/speechd/speechd.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cc4b388fce40681eaff3545e9cc0642216c13c420d5676a4d28c957ddcb916de  speechd-0.11.5.tar.gz
+sha256  32a730f6fb5981b9bec7e04f3674fd7d29e54935f46cf6354dbb9ab1f9b23b2d  speechd-0.12.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL-2
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL-3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 669bec0634..5bb40bb570 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPEECHD_VERSION = 0.11.5
+SPEECHD_VERSION = 0.12.1
 SPEECHD_SITE = $(call github,brailcom,speechd,$(SPEECHD_VERSION))
 SPEECHD_LICENSE = GPL-2.0+, GPL-3.0+ (buildsystem), LGPL-2.1+
 SPEECHD_LICENSE_FILES = COPYING.GPL-2 COPYING.GPL-3 COPYING.LGPL
@@ -27,6 +27,7 @@ SPEECHD_CONF_OPTS = \
 	--without-voxin \
 	--without-ivona \
 	--without-pico \
+	--without-pipewire \
 	--without-baratinoo \
 	--without-kali \
 	--without-pulse \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
