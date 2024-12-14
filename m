Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33A4E7716A
	for <buildroot@archiver.kernel.org>; Sat, 14 Dec 2024 16:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0740384810;
	Sat, 14 Dec 2024 16:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBdZvA3IR_c6; Sat, 14 Dec 2024 16:10:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 952B6845BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 952B6845BE;
	Sat, 14 Dec 2024 16:10:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDDF0C5
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC355605E1
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNTTKZb-oAXB for <buildroot@buildroot.org>;
 Sat, 14 Dec 2024 16:10:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 482656081D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 482656081D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 482656081D
 for <buildroot@buildroot.org>; Sat, 14 Dec 2024 16:09:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c577.dip0.t-ipconnect.de [79.214.197.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66382A4C3BB5;
 Sat, 14 Dec 2024 17:09:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41072)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tMUiK-000000004xH-0Goo;
 Sat, 14 Dec 2024 16:09:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>
Date: Sat, 14 Dec 2024 17:09:56 +0100
Message-Id: <20241214160956.3283057-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734192596;
 bh=QcAIFZWpJ0WhZfUdK0YwqZ/PCMMaoLgLBUBn6Ggizb4=;
 h=From:To:Cc:Subject:Date:From;
 b=LMr0FLZJdWTrs36krK3xnTEDFw2kdf0kaeSE6dDmyUQLh8LEvqVmZo3nhCTGaaygx
 +PUQJmkJz2gQ4xn/CQkmjf2mqpIU5r+sJCIO2SZT9V6HxPKNS0Oi+7Hs6wS+YD2kxc
 jcxXPs/lPPoRsT4CFAC5xdeGLI1u9kSHjqENH1ETzbGQBN/h7K+vCOjHoIb5KTD2pT
 zhTko+/NPwnjLEH5Gc4NvJSsX0TlRwIcU5SWXNaYtI3IYyqOZX6FwI7ENQORi4QZs9
 EzgUdIvkxNrj1CeHO2m+SMmDauhH+WDjcFGL8JzlEFukrDUTR1HRLM3pXU5qPkurz5
 P4sayxCamgiXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=LMr0FLZJ
Subject: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.15.0
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
https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.15.0
https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.14.1
https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.14.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index 7cda8cc2eb..ce88265d9e 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  00dae80465567272abd077f59355f95ac91d7809a2d3006f9ace2637dd429d14  libvpx-1.13.1.tar.gz
+sha256  e935eded7d81631a538bfae703fd1e293aad1c7fd3407ba00440c95105d2011e  libvpx-1.15.0.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 9092ca6a8e..25144f3892 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.13.1
+LIBVPX_VERSION = 1.15.0
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
