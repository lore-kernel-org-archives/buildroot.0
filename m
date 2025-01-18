Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FBCC02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 08:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0388170546;
	Sat, 18 Jan 2025 08:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14_VvtJn_qGC; Sat, 18 Jan 2025 08:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E48CB70556
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E48CB70556;
	Sat, 18 Jan 2025 08:39:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03DEDB89
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6B0A41389
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ju45hE-H9zY for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 08:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F36F04135A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36F04135A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36F04135A
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 08:39:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C8131A4C465A
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 09:36:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56018)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZ4Jr-000000001aJ-16w4
 for buildroot@buildroot.org; Sat, 18 Jan 2025 08:36:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 09:36:30 +0100
Message-Id: <20250118083638.2882800-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250118083638.2882800-1-bernd@kuhls.net>
References: <20250118083638.2882800-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737189399;
 bh=teQGFMNqTecZZzKQeOxDYt5OU1ruhnWr32b4gbHerp4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DxOV5zz0WSJL8EMFCdSCEsWDhCTEvz8GScO648bHZHLtauf5ex/zui5V0/pikMivC
 hSjxKLSR8ELoUp49TT35th0XuvdQ2n2qamfGhri1v9bFqSIN5Gg6DXwpXDD+icbZR4
 XjazafllL1X2NrtTWnRH4h1FhUk611um2wj3BvIYrRXZr9F2P7e91bkUqR8td/lO6z
 98G1AaUi/4EqCo65RjI7MR/Gi4VrJMjjEzTI2xFkIdjBVLhyz3eIaFzGG6lE4eCvvx
 ZhoDXvnKs7J+v5CkzrmE+B1G8OYuVYGm1Vg0ZWAmIdrhtQvwOfyte8wn0AccGYsZxE
 reTfzppu3L2lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=DxOV5zz0
Subject: [Buildroot] [PATCH 05/13] package/kodi-inputstream-adaptive: bump
 version to 21.5.9-Omega
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
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index a2b0664fcd..92814e8da2 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e0fb99e4e8d1612300eb0e7c4122a37d41a42a4e8da21162fc6477ecc2398962  kodi-inputstream-adaptive-21.5.7-Omega.tar.gz
+sha256  1db831ebb0acbda2576e684f8af089c524025c6a410eefb7a015cbbb505aa04d  kodi-inputstream-adaptive-21.5.9-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 01b46fad05..ed33c7bdf6 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.7-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.5.9-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
