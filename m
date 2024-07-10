Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E0EC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF736066B;
	Wed, 10 Jul 2024 21:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9z4CFPcUsSH; Wed, 10 Jul 2024 21:04:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C25160673
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C25160673;
	Wed, 10 Jul 2024 21:04:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAE641BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0EAF81151
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nM249ooQCaA for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:04:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5DDE810F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5DDE810F7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5DDE810F7
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:04:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b57c.dip0.t-ipconnect.de [84.161.181.124])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B563DA4C106F
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 23:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43884)
 by fli4l.lan.fli4l with esmtp (Exim 4.98-RC3)
 (envelope-from <bernd@kuhls.net>) id 1sReUa-000000007OF-0ONm
 for buildroot@buildroot.org; Wed, 10 Jul 2024 21:04:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:04:48 +0200
Message-Id: <20240710210448.90301-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1720645488;
 bh=7ag2m3tOkQOsFpI2LwwCzX05pGwFeK2kOXVcBRsEHbA=;
 h=From:To:Subject:Date:From;
 b=WR0hOO6Q0RoBL6AsFWOFkpFtzwnVwdLZYCT9Xs7j3FerHl41K7DL7PQh1VAEiNOgZ
 VQkkK7zLY0g2Uu4miYB2vBX09+qAGMEMm8u7e/fz+MgLBLvXmG9Hd296M7ssMajA7y
 +6sYSrXA7PxVGgMNH0sYpgu+Ydw/HH5hIRS/NJbrpJZAnQH4UCIrNw7YreWloJr8WQ
 dtCu+JSji6FhmkKCeowDbjQDE2gprO6U2Fko7eskOIqndh4PN1+yrxfdNvKtZoIN9y
 AUITMkvy9fNgkB21lEWiaG/LlnLeeoOe8brxA94EItzTVBCj12Er390U1rMehvY00x
 tWHOpHwGbxkvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=WR0hOO6Q
Subject: [Buildroot] [PATCH 1/1] package/leafnode2: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/leafnode2/leafnode2.hash | 2 +-
 package/leafnode2/leafnode2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index d03ea472b1..8ab57c93c7 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  1c74de60c3f91ef6f8a3ec20f0c34a0933658aeac8e3723a5f286c0646319e5c  leafnode2-ce7d3b13fb285c9fb7bffc382ea10fd41e12582d.tar.gz
+sha256  2a72a405599cd9f01cd44b6655c8986bf589b1f766c32957a70c147e39177a30  leafnode2-c514997a8c50bd28a34893d0436b0330f5719238.tar.gz
 sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/leafnode2/leafnode2.mk b/package/leafnode2/leafnode2.mk
index cba6b1f72a..71b27f180c 100644
--- a/package/leafnode2/leafnode2.mk
+++ b/package/leafnode2/leafnode2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFNODE2_VERSION = ce7d3b13fb285c9fb7bffc382ea10fd41e12582d
+LEAFNODE2_VERSION = c514997a8c50bd28a34893d0436b0330f5719238
 LEAFNODE2_SITE = $(call gitlab,leafnode-2,leafnode-2,$(LEAFNODE2_VERSION))
 LEAFNODE2_LICENSE = LGPL-2.1
 LEAFNODE2_LICENSE_FILES = COPYING COPYING.LGPL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
