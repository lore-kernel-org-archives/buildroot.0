Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5AAC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 17:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491DE80EA0;
	Sun, 18 May 2025 17:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZJci1EjWlmN; Sun, 18 May 2025 17:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 671D780EA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671D780EA8;
	Sun, 18 May 2025 17:36:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 739F9E4
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7097280EA8
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLKTgdMLxQPN for <buildroot@buildroot.org>;
 Sun, 18 May 2025 17:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E69B80DA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E69B80DA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E69B80DA0
 for <buildroot@buildroot.org>; Sun, 18 May 2025 17:36:52 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 049E2A4C2059
 for <buildroot@buildroot.org>; Sun, 18 May 2025 19:36:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34482)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGhwP-000000002Cs-19Ak
 for buildroot@buildroot.org; Sun, 18 May 2025 17:36:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 19:36:49 +0200
Message-Id: <20250518173649.2148027-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747589810;
 bh=mbjrioTjkPPS8f2D/w8kX0tH9W10elY7xI/AeZsog1Y=;
 h=From:To:Subject:Date:From;
 b=mWvuaCKJ4eLAyhZoEpFdSwARWVipT/k/0USUlcTPfGDPDPEYESrhpAhyRfmdemvJ6
 yNoAeCNInVGYCkg9O60q7gzP1GZR77a30FwExpqiHNZVa8HgJxwFDHT8GgiwHqvegj
 t+mj6kIbbWjQLmfiQeuT3kiw9fHo7WaFjFTZNyZxpB1BrUpq0zkWmgncZCoNw0M74c
 qG/8GKxGyDAbECsehEuQaG7wKRLTNYXJQPUu7RWksIHjfy+4qIfSmyziVKwwqnJ2jt
 CxmhU0rkq69vTAAIj5OhStw9wijZUupSqsfSBACdEP0YMkKTs6oltZ5lQ6LTFy8vuG
 mPv5I30six6aA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=mWvuaCKJ
Subject: [Buildroot] [PATCH 1/1] package/usb_modeswitch: bump version to
 2.6.2
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
 package/usb_modeswitch/usb_modeswitch.hash | 4 ++--
 package/usb_modeswitch/usb_modeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usb_modeswitch/usb_modeswitch.hash b/package/usb_modeswitch/usb_modeswitch.hash
index 765a2438c2..0bd9ee9889 100644
--- a/package/usb_modeswitch/usb_modeswitch.hash
+++ b/package/usb_modeswitch/usb_modeswitch.hash
@@ -1,5 +1,5 @@
 # From https://www.draisberghof.de/usb_modeswitch/usb-modeswitch-versions.xml
-md5  69d00d6ed7097b97d972a159d14cfba1  usb-modeswitch-2.6.1.tar.bz2
+md5  cf3b9f052fe49b02b385848eedc7264f  usb-modeswitch-2.6.2.tar.bz2
 # Locally calculated
-sha256  5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34  usb-modeswitch-2.6.1.tar.bz2
+sha256  f7abd337784a9d1bd39cb8a587518aff6f2a43d916145eafd80b1b8b7146db66  usb-modeswitch-2.6.2.tar.bz2
 sha256  6195429209313925c0eba6c0da4ee7a6cb4277b99e35c886913f80f91ec20b94  COPYING
diff --git a/package/usb_modeswitch/usb_modeswitch.mk b/package/usb_modeswitch/usb_modeswitch.mk
index f2ee004b42..aa5646adee 100644
--- a/package/usb_modeswitch/usb_modeswitch.mk
+++ b/package/usb_modeswitch/usb_modeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USB_MODESWITCH_VERSION = 2.6.1
+USB_MODESWITCH_VERSION = 2.6.2
 USB_MODESWITCH_SOURCE = usb-modeswitch-$(USB_MODESWITCH_VERSION).tar.bz2
 USB_MODESWITCH_SITE = http://www.draisberghof.de/usb_modeswitch
 USB_MODESWITCH_DEPENDENCIES = libusb
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
