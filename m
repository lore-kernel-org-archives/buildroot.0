Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BB5C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 16:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F75A84A0D;
	Fri,  7 Feb 2025 16:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCDtu7mUwVhM; Fri,  7 Feb 2025 16:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191BD84A07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191BD84A07;
	Fri,  7 Feb 2025 16:03:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A3681B7
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEAB441378
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ZiY0yQyUGbG for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 16:03:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6CE041272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6CE041272
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6CE041272
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 16:03:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a054b.dip0.t-ipconnect.de [91.58.5.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0D82A4C49E9
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:02:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54846)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tgQoT-000000003zp-0DEb
 for buildroot@buildroot.org; Fri, 07 Feb 2025 16:02:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 17:02:41 +0100
Message-Id: <20250207160241.10112-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250207160241.10112-1-bernd@kuhls.net>
References: <20250207160241.10112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738944166;
 bh=+Dnv7R5oeT1wiG0LHR8hU+AhK4RlIYDR5trEMKReH1c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UB7Iy4S8zMNZTmgwWQUoSKS0skgunTdpPkIonXpeFGswweB6YQq6gyqXZO3LfRiJy
 rLYsBbBB1CyCroBf65gM8cuo0sIzPpsdgWRQuwiR5yBkIlHB8kBTnjuQ0oOgS8zdQt
 YVhDH+cMrIpbWpSPh4sBYn7XCszrL7iQekjBvR+ffpFwzQkMCyymUIrGFtfBK64a96
 ZN3J3sKW5t8AqxcGZhHSgjyyS4Jk+KeD0e2G0BPIFxP1aL/gN5iKnOatnF3Po8F25z
 OFNlQY8tvqELx9sM+u9caLg+ObOeOw1UCW1LwZWIn+9xcOMpEov+CB0UkTAUi5kOgy
 mbJFUkZ2NBlBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=UB7Iy4S8
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-waipu: bump version to
 21.9.1-Omega
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
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 593bae1cdb..9112fa16f7 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b314155b643eca1936931fe6c010b2f9d50b07a2e0786e8cd8db41ea6f8c1f87  kodi-pvr-waipu-21.9.0-Omega.tar.gz
+sha256  9604bf46ef5502306c59d93cd7f9a7ec298e30a17197dd2d8d49300c6ee51a9c  kodi-pvr-waipu-21.9.1-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 47bef06966..d830c9d114 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.9.0-Omega
+KODI_PVR_WAIPU_VERSION = 21.9.1-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
