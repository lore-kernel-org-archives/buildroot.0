Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513D7CCD184
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 08:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1050F40F32;
	Sun, 12 Oct 2025 08:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOdwHHkNaBKM; Sun, 12 Oct 2025 08:59:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 446F640F43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446F640F43;
	Sun, 12 Oct 2025 08:59:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE2C12A8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A061D40BA8
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qb2Ebmd8RFZs for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 08:59:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3470A4009D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3470A4009D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3470A4009D
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 08:59:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 56DDEA4C661F;
 Sun, 12 Oct 2025 10:58:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47704)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7rus-000000000ns-33TX;
 Sun, 12 Oct 2025 08:58:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Date: Sun, 12 Oct 2025 10:58:58 +0200
Message-ID: <20251012085858.3442695-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760259539;
 bh=xgzMDx2pwm6UeoYp5yi0e2q5T2Prw/Zs8pSwbI3r+24=;
 h=From:To:Cc:Subject:Date:From;
 b=i6rG4CRe4bAfCn+nlrFMsHe1Niu8+xiKwrDmp30837KyTNaxttNg6zTe5+wpwrK6K
 21NvH78HURHlF702Ava514rpHQ2u+2J/Bhdw3NfwDUeychvI/WixfCoqSmsD2egsCM
 EyetqDm8Zu2ig7yNsAoe9QlSrxOt6GSKMLTAIgBs/XFw1crqriKj/tYNOeOGk8l1WV
 Lg0X7FM4aD7YNrcawVK84vCpUd2cR/iVc9rZLOO9zATiW2Jjb20QG8uj6gxYHiSDry
 O/09FeaYzYX6L1fn37s23l/huRDClTTIRn8R+bBxF4PkgrBdaVvouABpjJTzehXCA1
 llbEuRrFuv1Sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=i6rG4CRe
Subject: [Buildroot] [PATCH 1/1] package/wireless-regdb: bump version to
 2025.10.07
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

Release notes:
https://lists.infradead.org/pipermail/wireless-regdb/2025-October/001796.html
https://lists.infradead.org/pipermail/wireless-regdb/2025-July/001775.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index cb915c4415..4b2c67965f 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  57f8e7721cf5a880c13ae0c202edbb21092a060d45f9e9c59bcd2a8272bfa456  wireless-regdb-2025.02.20.tar.xz
+sha256  d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3  wireless-regdb-2025.10.07.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 999a986de2..055238be5e 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2025.02.20
+WIRELESS_REGDB_VERSION = 2025.10.07
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
