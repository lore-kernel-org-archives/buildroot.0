Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7B3CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6820B82C3B;
	Wed,  6 May 2026 18:42:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-M25h6RXtnl; Wed,  6 May 2026 18:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6434282BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092925;
	bh=0lXElLdw7VNqLN8vgUdlDKYI/7wySJEjCWRoHbgSW1E=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxdx7tptpGwsT7S/tlHC5YeHR3OtMGGlc3SsJZFSHjDJSEhaW79sOnhjeQyhakhiq
	 jWZizA6+NCMV4h0YYIjtT3Vyc08lLv8t/m5GT06QhDt6IGaq5k/ZBIDAGw9Bjs80ws
	 y/TDfxTraTW1DXtfiBcIHcZrBjmOfnaOge3yAgMW/ymCZMd8pb5o5HoAKhd/6n/1F/
	 dV/vErlWFgJjwTHrEN/cWyyJAnGsio2n00/q0G0AjcNbSJ9VHMS+OB/dqUhdhFWr6w
	 sP4P9st+UqjHy7WR5il3FIAbK2UZuXGoH0/BTnb3W9dpCFX3mrxBzg7KwOrZatGl0f
	 3la+SinLhualA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6434282BED;
	Wed,  6 May 2026 18:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2331D280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20A7F40664
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHYelszR8Mvt for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0040B40663
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0040B40663
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0040B40663
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:42:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D404A4C20DD;
 Wed,  6 May 2026 20:41:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB4-0000000040X-2ZLI;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  6 May 2026 20:40:56 +0200
Message-ID: <20260506184057.665854-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092861;
 bh=pWLySmlKgAfjlSLGoS2z34XoVKFL/z2V1hHRZIxxeS0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Y3UBAlSqj2xpaooiH9Dg0UMYKYdN++B6aCBcoAfu2e/G/2fQxzLUb0Y+WfjYtV+y5
 w+sUgHCy6cUlKiC9KT03+jHhwSnHYdIHr0y7ABow7dFlGsOYJjBZF2dUU7Pg/QKdiX
 osck+ll5zVuyithOJfehjLeH4i44OOkxrVokLrvU/0aLHS1WJiRyzy0DsaSknOlJup
 ic+ARGv8+qOHwqfJltSNNiRPA/om18W8kzTTL/l0Ut9neS6TEAEeWYpEqnuMjAHDV4
 /IDMarWmkSCdho7TUtSj7g+GNyxOD8WTLTg+yLNCZR6p9wHCOM4dSQQpp2H7Gxx/vX
 9wPcyi5aUBlIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Y3UBAlSq
Subject: [Buildroot] [PATCH 12/12] package/mesa3d: add optional dependency
 to libudev
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
 package/mesa3d/mesa3d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b4179908c3..34d0fd0ba2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -251,6 +251,10 @@ else
 MESA3D_CONF_OPTS += -Dvalgrind=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+MESA3D_DEPENDENCIES += libudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 MESA3D_CONF_OPTS += -Dlibunwind=enabled
 MESA3D_DEPENDENCIES += libunwind
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
