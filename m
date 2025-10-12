Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3ECCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 15:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A4040C06;
	Sun, 12 Oct 2025 15:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTpHSrC0foaW; Sun, 12 Oct 2025 15:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 038F840C07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 038F840C07;
	Sun, 12 Oct 2025 15:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 081D512B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D838116C
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGU8CuVwFWtC for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 15:23:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A16798116B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16798116B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A16798116B
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 15:23:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1495A4C6766;
 Sun, 12 Oct 2025 17:23:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50168)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v7xv6-000000003vW-0So3;
 Sun, 12 Oct 2025 15:23:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 12 Oct 2025 17:23:36 +0200
Message-ID: <20251012152336.93115-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760282616;
 bh=+341ZazTpdR7CDCibqT/ij7ilIvVj3nbIouZ4/jngvs=;
 h=From:To:Cc:Subject:Date:From;
 b=T9JYeAyzmAdVEhkCM3v1bdT3jX+usPDLSZ64FAvH1fZP958Uz4blF7Zoa9kEh8xN8
 pG4r773/4yI3sFjVoUbxp9en3//8cXO5ynPY/CWF3JqXSU4TP7oLHodstawqPzZLSg
 1md/l23Hl2y4A6PhRlDiEmsDm74MNsGMYhS6WHW+TgMpecmuZqDQ1cjBHLh+Vx4/EC
 ohU2EWu0IAHN2vfrX98dPmUIIQcWdKwChnX/J/H5W5uYRimOxBDPfX9bwcovZ2pUhu
 4zm1vFcYYLnlOtRtTF0vrXpPoTg4Ul9YpkKw0PurGEej7b5JHdfdqW60qphVj8uzvn
 Ihn9cVkOFHrOA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=T9JYeAyz
Subject: [Buildroot] [PATCH 1/1] package/libvpx: security bump version to
 1.15.2
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
https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.15.2
https://chromium.googlesource.com/webm/libvpx/+/refs/tags/v1.15.1

Fixes CVE-2025-5283.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libvpx/libvpx.hash | 2 +-
 package/libvpx/libvpx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
index ce88265d9e..1082721f1a 100644
--- a/package/libvpx/libvpx.hash
+++ b/package/libvpx/libvpx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  e935eded7d81631a538bfae703fd1e293aad1c7fd3407ba00440c95105d2011e  libvpx-1.15.0.tar.gz
+sha256  26fcd3db88045dee380e581862a6ef106f49b74b6396ee95c2993a260b4636aa  libvpx-1.15.2.tar.gz
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
 sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index 25144f3892..4f4144f4ff 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPX_VERSION = 1.15.0
+LIBVPX_VERSION = 1.15.2
 LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
 LIBVPX_LICENSE = BSD-3-Clause
 LIBVPX_LICENSE_FILES = LICENSE PATENTS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
