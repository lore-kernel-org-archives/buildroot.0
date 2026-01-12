Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760DFD25051
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BC4F80B11;
	Mon, 12 Jan 2026 08:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0UqAhUL2_AC; Mon, 12 Jan 2026 08:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FEF580DCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207004;
	bh=3KsH6TSToUWTusCZaeZRK2DmK6MydQrN5IPdJUvtJrE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VhaAHfK4d6rhC6aLpATT0dffrHcbVAKWeOiBXqNBoY6ZEOWJmB4XGUbS/bQFkEQwx
	 FEGHyguoPotlf+7I1djLtmcabuAzCXGYUPBgdN9EeRW2cHuGq8L2X20hokOpyVp+ZR
	 JyeBonL7bXtD01zZPIXPc0Me79caA1/0DUN/CvaqB1dKwb3EYs17iDKmtIHwhy3PE/
	 6GQ38s8WMu0WnIWVHpSm4gBYYcRG4ZVGsMkyoN7ng3dbz/AUuOdNvxtVcmemAfG8SO
	 ZQ/F7NQqBTwcPfee0uS1lLRNPqRq5ZbgWF3tHmJy1I74MHtTrbqid0rZ/mZ6k9plfd
	 mzPPRZoYvKppA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEF580DCB;
	Mon, 12 Jan 2026 08:36:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D3DA18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1071861569
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id exVlY39wpBp0 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:36:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0836D61507
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0836D61507
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0836D61507
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:36:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E6B82A4C3C4F
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJG-000000007z0-1TRm
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:31 +0100
Message-ID: <20260112082950.2528445-83-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206627;
 bh=kzQVwsTd1/FyJZNYc8r2RTpBcaK9NWNqz4ML2qeKSbc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=vDvzktHOwYpRN9t/rawyEeOekhs0g5fi0F2o1dyEWGdEkdqhrUJ1w3xEHu6y9gWHv
 Cv/8fZIwOBvqlMKi5lSicZ1BxIc90QGyVyNk8wSVy+L/SqTqL4TzIUmdtFtXhG2VWb
 pa9oA+iOr7up5Lx18LuKRr/NhUBkXZvD0ExRCMAQPLutZxomuXb+zbhpM1YPmtBrH1
 EXgei2hfFc+COrLUKuSXnV84qKY0L7YdYb8ssuQPhouAwGQcSnD2XF+mOekGbZK4d9
 3IvaHz3gK9Dz+86MoX//NzAmoB1wCWbp0wAHB1+QAnhFjXW0U/AewD1CMnCO6gwPWj
 2Gogz9bKpq7gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vDvzktHO
Subject: [Buildroot] [PATCH 083/102] package/x11r7/xapp_listres: bump
 version to 1.0.6
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

https://lists.x.org/archives/xorg-announce/2024-March/003470.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_listres/xapp_listres.hash | 6 +++---
 package/x11r7/xapp_listres/xapp_listres.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_listres/xapp_listres.hash b/package/x11r7/xapp_listres/xapp_listres.hash
index 30fccec9d3..ae3e733c74 100644
--- a/package/x11r7/xapp_listres/xapp_listres.hash
+++ b/package/x11r7/xapp_listres/xapp_listres.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003142.html
-sha256  ce2a00bbe7d2eb8d75177006f343c80443a22d52570c48a43c6fe70ea074dc9d  listres-1.0.5.tar.xz
-sha512  caa3626773031fbf6d8bcc1f697afe6add64fe4a8d1d766c42d5c2346050869dd23a26a1718411134ab05c75835facf0786cab5595721a16df423cdc54dd813d  listres-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003470.html
+sha256  4d1c53efd69ba654f2877e1577e994c78874b0512fa1b0666cffcf452aee43ca  listres-1.0.6.tar.xz
+sha512  182919c8ba5569af3dbf59421de2dfd3e755b3bd2d6d548c6d2664c20b73f937e64dc73811821c19af93fffbc2d5c8d2db8d9cdd9bf1b93b0f29cb683e13ebe7  listres-1.0.6.tar.xz
 # Locally computed
 sha256  aefb540c54bc95c68702cd2ae668c559e63cc1a84f55ae5c0e78547e7d75d2d5  COPYING
diff --git a/package/x11r7/xapp_listres/xapp_listres.mk b/package/x11r7/xapp_listres/xapp_listres.mk
index e0d7487f68..e2585a3d98 100644
--- a/package/x11r7/xapp_listres/xapp_listres.mk
+++ b/package/x11r7/xapp_listres/xapp_listres.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_LISTRES_VERSION = 1.0.5
+XAPP_LISTRES_VERSION = 1.0.6
 XAPP_LISTRES_SOURCE = listres-$(XAPP_LISTRES_VERSION).tar.xz
-XAPP_LISTRES_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_LISTRES_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_LISTRES_LICENSE = MIT
 XAPP_LISTRES_LICENSE_FILES = COPYING
 XAPP_LISTRES_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xlib_libXt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
