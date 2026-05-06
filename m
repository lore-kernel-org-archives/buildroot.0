Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB47CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4026D8186A;
	Wed,  6 May 2026 18:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kseP_ibG_Cqe; Wed,  6 May 2026 18:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B0F817A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092997;
	bh=Rk8aL62Yg/E4cKtIVZbGPn28XzW7HUZ71NkuxQKEPvg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gb4O5EvkwS3Erj6wUQMEf5mE3giRS7jXo42ngM7gRDRXSL7emIUbqZHHjszMZUA08
	 GRBekeycQsow3c1Bur0ub5jKOf7QVu9+B/rLfsT9vqdEcx8mFI1VYCNqVEhx/ThAjT
	 jBb7h4DCH4Yk3WDPeQDxrvm3AWG09AB9WPxBy5JrGfwW8FPNxNO+eOgL5/bpVEmsQM
	 mI6nMNR0BGBmsnXS7MyrKexoWTZyt06yhOr7+hwdjS+JY+bjF1h1bFLDOe3QX2kZ9w
	 rwjimJBbp87PQmvn9y5Tw4+bha11EftsLyAotOffQEDZW5f+XEidudVv+RCohEoTMt
	 4Q2LwaeKgnYHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B0F817A1;
	Wed,  6 May 2026 18:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3235B280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FB7040664
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8UC95scfHjf for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:43:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 023F040663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 023F040663
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 023F040663
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:43:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B675A4C20C5;
 Wed,  6 May 2026 20:41:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-16R7;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  6 May 2026 20:40:51 +0200
Message-ID: <20260506184057.665854-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092862;
 bh=7v3iWTrGT9RLo9Zo5jyRP8UNurV+wGgYHWUwaZv4ufI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HNpHNVlsUTbIqB7M8EdrIyyu0K5leif+POfTX/hFUuHsHnerROTHn8UGsNS8Jja+x
 WKw2AWTmjUNfq9eShdrmfxLWC2Spx/Px7obyRN8DeRCG34HepnjRTOB/RRwN8sPa6U
 Yrr7I7uQc2eIm+vB0gOlat3H/lFI4iQAuCnwaBKftH8WonZil0WArD243+/RvsGQLM
 aN1N55EaqFKkmj70g/W81gHgn75jMP6SbcLg7tE6F8oLbaYWSoQv03lYwslRou7SRX
 cRM9RNsdq6BqTo+JJ0VWi7zq5RLYtk3nVTTUT1oUWs0bz01AUYQJF2HoD9si5VQyVL
 61qvP0haGXSZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HNpHNVls
Subject: [Buildroot] [PATCH 07/12] package/libinput: only needs libudev,
 not udev daemon
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Bernd: adjusted for libudev-zero]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libinput/Config.in   | 6 +++---
 package/libinput/libinput.mk | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index f5253dfec2..eb5ed75c85 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_LIBEVDEV
 	help
 	  libinput is a library to handle input devices in Wayland
@@ -34,5 +34,5 @@ config BR2_PACKAGE_LIBINPUT_PYTHON_TOOLS
 
 endif
 
-comment "libinput needs udev /dev management"
-	depends on !BR2_PACKAGE_HAS_UDEV
+comment "libinput needs libudev"
+	depends on !BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 8b930805b2..26475c2ff3 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -7,7 +7,7 @@
 LIBINPUT_VERSION = 1.31.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.bz2
 LIBINPUT_SITE = https://gitlab.freedesktop.org/libinput/libinput/-/archive/$(LIBINPUT_VERSION)
-LIBINPUT_DEPENDENCIES = host-pkgconf libevdev udev
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev libudev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
