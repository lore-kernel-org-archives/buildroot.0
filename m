Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA15CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85B796064E;
	Mon, 11 May 2026 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNvqrzEldhfi; Mon, 11 May 2026 18:54:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA91260651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778525692;
	bh=ZiBLwXY2k0VLemSXu+AoOHvqh0rVgbW/9ON2KPAsff8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FdsEbUQP36/WHV3h3ssCxwBiYPNsmqTFSYTcJ8Q3b32Ugw5PCWIiPSfVU2z7KrUZ8
	 2sktWSXfPpztwDU9p8RD+5Dya16/zyR4kZm7m0DZmNtuxEC1fHMXndE/8FRQR7BVBs
	 A5of6fF6pIDPiTdeJ1HodkbtU8KZVhNJs8r03rb1EGz03LosW191bTRP0Y5LbXV485
	 CKfu8TDoeY7Ob9Dr/1yzZjO1gBWjmgbZzS6hnUBGYxFNMxTGAddhkTV1Sgia5EOqRC
	 bMdQvaVX4lFlFEt92/OhcwH7HD6iXE1ESvIvHJY1KxFehhzVlBbEk2Erjk5q901H8i
	 ln06RJpkpijTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA91260651;
	Mon, 11 May 2026 18:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 340E0173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19AA24005E
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsnmQ-bO-gCf for <buildroot@buildroot.org>;
 Mon, 11 May 2026 18:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0F3D640074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F3D640074
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F3D640074
 for <buildroot@buildroot.org>; Mon, 11 May 2026 18:54:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c559.dip0.t-ipconnect.de [79.214.197.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D0EAA4C0A4F
 for <buildroot@buildroot.org>; Mon, 11 May 2026 20:54:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50866)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMVmB-000000004Dp-1iYg
 for buildroot@buildroot.org; Mon, 11 May 2026 18:54:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 20:54:47 +0200
Message-ID: <20260511185447.3298731-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778525688;
 bh=bCMTdbNmYkPDxQAcJfAgQtVhMIVhaUcOP/lXLDj3GYg=;
 h=From:To:Subject:Date:From;
 b=Sh4kQ5ITMwq1+s8zwOjUnBQW24o4UEvO30TTExNjoO45Q19I8D851Zd72ISygbP1z
 4nxJH7J8nku2648mc/ftMJ3kJqXVRRRBF7s4yb/DbPWE8d5i36YBiJjWyJ8FQjzixd
 Gt/G/xZQB1V7SaItf/ELTSNqH+wPDwivglltu4HXGCjdcUrlZ4AmWSGNWiDB/hWvpE
 +wM6RblZTGN/wn4hFqbtDooHPbe6FFQcffK1M7yQ7V8bAEReVBazTUr2Ow0DRmICow
 AHoBNrbbMGdDa1obYmwvgKxEybCMmePHRLpUGiGTNFcY5sUvsm0Q2iKEoBKyQbsWWN
 +s6YVsi7IZJoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Sh4kQ5IT
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: security bump version to
 2.92rel2
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

https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2026q2/018471.html
https://thekelleys.org.uk/dnsmasq/CVE/

Fixes CVE-2026-2291, CVE-2026-4890, CVE-2026-4891, CVE-2026-4892,
CVE-2026-4893 & CVE-2026-5172.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 258f0b1e93..74ee5c415b 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.92.tar.xz.asc
-sha256  4bf50c2c1018f9fbc26037df51b90ecea0cb73d46162846763b92df0d6c3a458  dnsmasq-2.92.tar.xz
+# https://thekelleys.org.uk/dnsmasq/dnsmasq-2.92rel2.tar.xz.asc
+sha256  43d72b8c129bdf33d17bafedc98823f63e46b5005128066bf0d2a472a32ce06a  dnsmasq-2.92rel2.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 74fc053089..d7ae8a3312 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.92
+DNSMASQ_VERSION = 2.92rel2
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
