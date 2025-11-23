Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3839ECFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B726073E;
	Sun, 23 Nov 2025 17:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jBcZ3gO3WJB; Sun, 23 Nov 2025 17:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 333086073B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 333086073B;
	Sun, 23 Nov 2025 17:07:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF485E4
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58336073C
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkuLpfT_y-Uc for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 17:07:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8F0C606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8F0C606ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8F0C606ED
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 17:07:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bcad.dip0.t-ipconnect.de [84.161.188.173])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0EBC0A4C7594;
 Sun, 23 Nov 2025 18:07:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34888)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vNDYX-000000001Wc-1WzO;
 Sun, 23 Nov 2025 17:07:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Nov 2025 18:07:19 +0100
Message-ID: <20251123170721.909469-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763917642;
 bh=dx3YzTg1in+fi/SWx2Bq8kKd+Zvj/YX1j+7ub5Nalmc=;
 h=From:To:Cc:Subject:Date:From;
 b=IyS4XZ4ft9/o+cJdHqZGVtUY49yUPWLJkvabD2aHhfAiiR12fAZLvTYmfv3Id7drD
 1/EORV1fcDp4hn1eP1uFZQ7aa932CtNJMktgX3nyceSHGKilkqwIOO3yiUUgaQF23N
 wU1H4zwK1TYwxv2j2u4ExFOHzmQolWa4aN8+57hHKEoJyRA/P6OZDwgqZI55LF/k/4
 +vAbB0tmTWsXvULwOfg+H7EWUjABAN2qKEArXD18F9f0QUJU0AU3XgvunuYgoamG86
 rOBurzntWih94mjrkBpH8TETd0lLD2XirB/nrB/SRDTvEQh2e/qI4rq3gDf7eG/pcM
 DChq7UcrXvXTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=IyS4XZ4f
Subject: [Buildroot] [PATCH/next 1/3] package/meson: bump version to 1.9.1
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

Release notes: https://mesonbuild.com/Release-notes-for-1-9-0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c83daae6c9..581cfe62a7 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.8.3/meson-1.8.3.tar.gz.asc
-sha256  f118aa910fc0a137cc2dd0122232dbf82153d9a12fb5b0f5bb64896f6a157abf  meson-1.8.3.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.9.1/meson-1.9.1.tar.gz.asc
+sha256  4e076606f2afff7881d195574bddcd8d89286f35a17b4977a216f535dc0c74ac  meson-1.9.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 0c460eca6f..29082dcbb5 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.8.3
+MESON_VERSION = 1.9.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
