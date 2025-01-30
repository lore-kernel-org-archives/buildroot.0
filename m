Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8561CC0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 18:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3849A408E7;
	Thu, 30 Jan 2025 18:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-2w0vN9LDdd; Thu, 30 Jan 2025 18:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FE7640913
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE7640913;
	Thu, 30 Jan 2025 18:26:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 575BB128
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 466FB60EDF
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5zyNzft_eAy for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 18:26:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E7F660DDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E7F660DDF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E7F660DDF
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 18:26:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca57.dip0.t-ipconnect.de [79.214.202.87])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98307A4C042B
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 19:26:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40988)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tdZFC-0000000022O-3aMD
 for buildroot@buildroot.org; Thu, 30 Jan 2025 18:26:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Jan 2025 19:26:27 +0100
Message-Id: <20250130182627.194122-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738261587;
 bh=R0ndUH0Kn09E6om8ei4v1qboy3S/gWwcesXvpkuNjM0=;
 h=From:To:Subject:Date:From;
 b=E68BBi2gZLPGm9NE+2y15Sc+ujfA+2CX7gfKngmSXd1fAp3KtGLCq+ZdqdhNDyAx4
 68vgc7HTC6kXyovGrBWDfj7tHS1y/bA1rmktdBrazrAAUBPV+bBCd91RXEg66f/S+5
 rzJm7j2pD9J2jXrAPx60Up8Y8FqvcPMdzXzA1dKh6KKmUcSYdU5KHGedG+gqEmMVQM
 /a9aaQ+MonzZTZAqMkL+oxl2pN5ztADA6L7i8vMTmHxL3k2BMtrgFEk7N97+2n0gp/
 lZjyfLaJDWP+U/uR4/u+Bq5fWSvP1iQum3/hKr7lXfU3U17iKNvtHSecyiacmef3GK
 7UN9bldnaN12Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=E68BBi2g
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-waipu: bump version to
 21.9.0-Omega
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
index 90b599e452..593bae1cdb 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  200c78d7ccde19046274549c1a59d1f1dc0763b73bb38f50f714e7a0627cb8d3  kodi-pvr-waipu-21.8.8-Omega.tar.gz
+sha256  b314155b643eca1936931fe6c010b2f9d50b07a2e0786e8cd8db41ea6f8c1f87  kodi-pvr-waipu-21.9.0-Omega.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index edf7892dfa..47bef06966 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.8.8-Omega
+KODI_PVR_WAIPU_VERSION = 21.9.0-Omega
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
