Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10708C3ABC3
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2CD160EBB;
	Mon, 12 May 2025 21:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxfSmeOnkvs3; Mon, 12 May 2025 21:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDFC160EBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDFC160EBC;
	Mon, 12 May 2025 21:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 466DC71E
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B5D240629
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxQhw5Pdt3tj for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4929340271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4929340271
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4929340271
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:48:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68BD7A4C055D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 23:48:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56086)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEb0N-000000000La-2W6m
 for buildroot@buildroot.org; Mon, 12 May 2025 21:48:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:48:11 +0200
Message-Id: <20250512214811.452878-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747086492;
 bh=MBbzxfglEFaKNjzJf25cgbYVBaZw0gyXCiTutwltfZI=;
 h=From:To:Subject:Date:From;
 b=nJYHNPuTBIep596kTu3qhYwvJ8hH9JGv+KQReKnxVuo9+kziHePytKpEDEVJ1Swu0
 rH3s9dtmDzdVjnMUhaxV4yuXWhUKrO+wGCfsn+tMky2+2msOhLqxZQQmytvxr6aSHB
 eI7NgtoTgBWwNeljTBly8hZQkumXkZnTy4c1CMQkh+K70nyo7lyfYXWFEv+tX/2U2f
 lPAfDnJoTXeEeHlTLX5RVQN+EkqlPecNljgK4lgN+VUhaFZNW1X3oJWBW5GbuP+f45
 NbGVcz3QyRLSZk7zXKQfyvWeJYPpuAULomqzTi6B5CegmiqxyzPTnweMqIFRsAbp2f
 PMypI36oygqcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=nJYHNPuT
Subject: [Buildroot] [PATCH] package/netcat-openbsd: bump version to 1.229
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
 package/netcat-openbsd/netcat-openbsd.hash | 8 ++++----
 package/netcat-openbsd/netcat-openbsd.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index e55dea53e7..267e02f844 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,6 +1,6 @@
-# From http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.218-3.dsc
-sha256  a28a5d39abaf481747b1e78b4b50e96d0cdab0ffef289cba156dc11941c64857  netcat-openbsd_1.218.orig.tar.gz
-sha256  19229ebc825d12cd805843228c498cc881dcef127a9d680fcfbd8cb2da966161  netcat-openbsd_1.218-3.debian.tar.xz
+# From https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.229-1.dsc
+sha256  493e3973ffca7fedf0435e498bf18ebc934b1c3aa76db2b29cf80f98d9175a86  netcat-openbsd_1.229.orig.tar.gz
+sha256  c3bff4330a2fe1fbe384861eacbf4f6ad2c59912aa772efad07462644ed9d936  netcat-openbsd_1.229-1.debian.tar.xz
 
 # Hash for license file
-sha256  acfd1d822ee2e8e0b196c7a369383d0cb9bc131b56c3c95976a32498728fe1e3  netcat.c
+sha256  fe62c02c86f4cad7c5c031a1a5601fd2e37e7f2773def39bede8652fe51716bb  netcat.c
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 311f8aa819..a5ea4727af 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = 1.218
+NETCAT_OPENBSD_VERSION = 1.229
 NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
-NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-3.debian.tar.xz
-NETCAT_OPENBSD_SITE = http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd
+NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-1.debian.tar.xz
+NETCAT_OPENBSD_SITE = https://snapshot.debian.org/archive/debian/20250429T083749Z/pool/main/n/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = netcat.c
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
