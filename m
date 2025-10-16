Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00656CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 18:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A3FA606F1;
	Thu, 16 Oct 2025 18:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfgPNBZwFeFX; Thu, 16 Oct 2025 18:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E31A6070E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E31A6070E;
	Thu, 16 Oct 2025 18:20:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E224D8
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E30240535
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zo9ADl-z5Zuy for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 18:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CD1C240532
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1C240532
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CD1C240532
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 18:20:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58D9FA4C6F2A
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:20:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42668)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9Sah-000000000Lj-47AH
 for buildroot@buildroot.org; Thu, 16 Oct 2025 18:20:44 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 20:20:43 +0200
Message-ID: <20251016182043.3395066-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760638844;
 bh=Ks9ANLcyhaTblQ40vAE7jA0DdOgeQ7Q5IzzSvCittRU=;
 h=From:To:Subject:Date:From;
 b=e4pOamz9Uhp8cW/D0Jq/IxyEHo+n5iPNzp6U16CvbrttaKvQPJeOysWNSH7BNTAN9
 BoynmdQ8VgyZ4zEN40mhdx7FfdGwjMaOFN1f0ziwBnqjVs8qOQODaU8hdO9vT+t5KJ
 Y1kE8wA9uAczBTuc9qR/2sZuK0mSm+7QNDLOmY9X/vkE6UYphGBL4EsjpBfC/n/6br
 lzZXQkPoN26hNPu0oLlyOOdwhFe+pA16iecuKlh7vUVtPHWyggq8JX3RAIR5ZNgRGG
 +eS1AA48IAHeVochdcm97QoQiK7AoYSqB8NkhmMV19T97bRKeAvMZwMznXXeTrzxgV
 8G7fXNWsKPW6g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=e4pOamz9
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/samba4: security bump
 version to 4.21.9
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

Release notes: https://www.samba.org/samba/history/samba-4.21.9.html

Fixes CVE-2025-9640 & CVE-2025-10230.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 9fff75bcb4..ae37e497cc 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.8.tar.asc
-sha256  e78c36653a37e9647513e5408fc8052375901560d36b8744cd21acc9e4d91fc8  samba-4.21.8.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.21.9.tar.asc
+sha256  9d60206efb450c08700a85504ec2b63257be7c6e1c393627da54e047b4e9ea75  samba-4.21.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7895ec4a4c..c2886d9ea7 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.8
+SAMBA4_VERSION = 4.21.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
