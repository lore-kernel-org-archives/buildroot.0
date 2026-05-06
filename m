Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2446CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94D7A60EE9;
	Wed,  6 May 2026 18:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNXs5RL1WRKt; Wed,  6 May 2026 18:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A74760ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092962;
	bh=9HHlcdl1PzBJ9IGLQIFkhNeCYKowb5tkl88P3fqb7dk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBSaMGCUDcGe2T3OCzcNUOI8Qj/RDFACkv/RQpLF3+Q9nfV54sMroyHx/NOR3CfjE
	 56hRDGLByk5CzKcdJBi5VGPWPZY3yJXRdFI6VBW5wk3U9JLhJK8pWhZi5cDFUKwTk/
	 FJ2JZt2vOKHFSJxLNdMipPx2a6Aox0bS3LmZF41LQU9Rv5uUpv1hPgmAE8SeoemKN+
	 dnY1cLFlO+4GXsGpYmelRPhJwUMFDSfGuGj1CDFMdpffkfqSotImB/YP7vIDdHK7iy
	 lfbhBjnan6Sv/wyHzI8l27XSVEJeRMjpm/cduL9iLAQGsn3GT148LKf1yCRwY/2Tvl
	 f01qGSqR+jJIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A74760ECD;
	Wed,  6 May 2026 18:42:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEBC317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FE6860ECD
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oT8rbiaFa-we for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:42:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE11860ECB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE11860ECB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE11860ECB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 205DEA4C20E4;
 Wed,  6 May 2026 20:41:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-1ev4;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 May 2026 20:40:53 +0200
Message-ID: <20260506184057.665854-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092862;
 bh=D8cHLvySeI4YbSWvmNzTUbY9jkEkOPwXS3DP3cd4GhU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CIhiAsmYVuPogAFcoOmTwgqrFyDbvSUNtnBPHnsXBxnOxIxBylAyvMmD9wK4ogMmm
 /w5Z9cHZjz2eAH/aKHXjkiaSjclnHal4QP1iL1gBFsQQr4bAcz8fyYjT+BY6+Fm52G
 K8MuP7Ee6SloiCCuW7nfuYx8W3r9UdlUPreStkqo16gQbwmEe34+y1vZ+j6o48cSeN
 31/BgESdiyrSx2umrARpAjvYBA0jizd98P9cpRO0OuU6Rgl13PGwBhvcMgizkppDDh
 QRFFl6kjt70gfaZGNJuyStAp7jo2yKCRfGTYeXOjRNWEPKI/6k5e9J12pi8Lh+FdbT
 hysAeP9yzkWzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CIhiAsmY
Subject: [Buildroot] [PATCH 09/12] package/libcec: optionally use libudev
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

From: Bernd Kuhls <bernd.kuhls@t-online.de>

libcec only requires libudev, not a full udev daemon.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcec/libcec.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 5e6d84ebbd..0e730503da 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -12,8 +12,8 @@ LIBCEC_LICENSE_FILES = LICENSE.md
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBCEC_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBCEC_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
