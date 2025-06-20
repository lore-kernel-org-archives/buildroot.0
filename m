Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45010C7115D
	for <buildroot@archiver.kernel.org>; Fri, 20 Jun 2025 06:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC6960F03;
	Fri, 20 Jun 2025 06:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EACxDQBrhvT5; Fri, 20 Jun 2025 06:26:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4154060DF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4154060DF7;
	Fri, 20 Jun 2025 06:26:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D437E2
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F59740D32
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGeNbvhgtk1g for <buildroot@buildroot.org>;
 Fri, 20 Jun 2025 06:26:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 96FB74093E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FB74093E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96FB74093E
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 06:26:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b017.dip0.t-ipconnect.de [84.161.176.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BBA5BA4C2461
 for <buildroot@buildroot.org>; Fri, 20 Jun 2025 08:26:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39856)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uSVCc-00000000139-3ho6
 for buildroot@buildroot.org; Fri, 20 Jun 2025 06:26:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Jun 2025 08:26:17 +0200
Message-Id: <20250620062618.20796-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750400778;
 bh=HlS1KO7FYu9zBLs5/B7uoCJe3iNtod8r8RP5V6ASdmI=;
 h=From:To:Subject:Date:From;
 b=V+H/azJ695ipDoyQnSCEwJEfXB/9TH7qLj1K7hIxWBlZTgKTRKhFS4/G/j933gHX1
 JHvTpBexOAA9WhIzgBMvQvbKxstfXQ/i7AJ+sfTaJau549usMbnVEq4dwPpHVr7NQF
 0YC9fT+FY4F9O1m8VPK0P/EYtjFbYYFSNHLG4aTksqpitBU9QQdWVDBFK1tofpWPha
 Myq8NgRHrsxvAw6BZELhI9Y0qXSopbdqjJsIsKbiRHwS+f+LLd9RQMNKibARJdzLNW
 +JD28Uzm1EooC81fqpYFGw/IDrHa17IXbFX1m5Pfo8DNu6HiZ3h/HGawi+28XdsLYa
 hFo9ivQLp9hkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=V+H/azJ6
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-ffmpegdirect: bump
 version to 21.3.8-Omega
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
 .../kodi-inputstream-ffmpegdirect.hash                          | 2 +-
 .../kodi-inputstream-ffmpegdirect.mk                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 9592808c71..8059858c4d 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5b8684792d33115e7169778ac3d9b846a8a750d4077cf0d9af57003b2e8e014b  kodi-inputstream-ffmpegdirect-21.3.7-Omega.tar.gz
+sha256  0648c6bbb2143cec0c3f48ad476f2c213f20c809caaf5ac74c8ceb4e53635f4e  kodi-inputstream-ffmpegdirect-21.3.8-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index e88ce4ee64..9fb9c95e13 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 21.3.7-Omega
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 21.3.8-Omega
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
