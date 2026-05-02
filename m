Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D3CCD13DA
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 06:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B4860E72;
	Sat,  2 May 2026 06:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RIlPxDLTkyp; Sat,  2 May 2026 06:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E60E60E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777703239;
	bh=YGN3y1vmNsbPij+0Nr9qQHw6bGHTfqNUQVZHMrFYDnQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iRFZC0zcs8eUGqY6mbacOVLAhjD5tUobZaJAsBkhMmn6x33uF5z4EvymoCCVjf3Ed
	 uxEAabkRwURcNRRNqqFOVvLgS2qjpjYZDaOIEjkidxf1twEWcq8vIxPG3V4dmWnzBm
	 EQupG179E5NF7IsZdTC3GXOrs0FC/qlYCqyNH/LRLkl4FSvFE//YHOC6i+1Hl6lvb+
	 hAKQdSUrMwDu0vVHDcyH1mbKnxQEqPB1JATwcFqPtB+ATLVnlRuLrv1k6Bf3gvnNXt
	 jPCreZiXOrC05SE2PkdsPew5ghempremE96dG44Nj703KF2ZgCN/JuRBzKcZ55Zw8X
	 PioXHS1Ybjg6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E60E60E71;
	Sat,  2 May 2026 06:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E1392127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 06:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A0A83AAA
 for <buildroot@buildroot.org>; Sat,  2 May 2026 06:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-Ia-92f2D0j for <buildroot@buildroot.org>;
 Sat,  2 May 2026 06:27:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80A7683AA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A7683AA3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80A7683AA3
 for <buildroot@buildroot.org>; Sat,  2 May 2026 06:27:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD742A4C00B7
 for <buildroot@buildroot.org>; Sat,  2 May 2026 08:27:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wJ3on-0000000079v-2SDt
 for buildroot@buildroot.org; Sat, 02 May 2026 06:27:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  2 May 2026 08:27:13 +0200
Message-ID: <20260502062713.703617-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777703233;
 bh=ixEP1gay7KcPfrdb1Tg/8kA4LToSoMR5q6Qtk3y04uY=;
 h=From:To:Subject:Date:From;
 b=gY5rWx7zUKpBXwH25yOAn9f003UyC3HljbXGolY15FyK6aC+I3tPxYbJ0XLnqqGLj
 rpGdCyLoBbc+S7S2hKg7KgGgreDUEX5fBLG8PTKYlWH2Pj4YeKOExGYZqVysil5hU4
 MD2eGtcNe5gNmlNuicJcZp9FPkyJx3sei4BLZ4OjwxdzxfyEJipRZTLbm54sqTQFfo
 QlKp3giFKxa2sPq8P9ePvggKE1Kz8YMm8I3flrQw/zQD1weJnAv1G6RHMhwpZIsVvP
 BMlhz8a8tPLk54SE9gK/RkQP27qAGM/deqF6ZRysQ5tEj8kvOUqiLxJEFlfNvV8d9q
 ojaysC8IK65ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=gY5rWx7z
Subject: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.4
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

https://github.com/OpenVPN/openvpn/blob/v2.7.4/Changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index d2e72bbbc0..438212a4bb 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256  24f54cb0759330762f1140b874c07c8542c6a08b13457d8570dafd387d49397a  openvpn-2.7.3.tar.gz
+sha256  18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce  openvpn-2.7.4.tar.gz
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 7598c9430a..68f0d30e4c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.7.3
+OPENVPN_VERSION = 2.7.4
 OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
 OPENVPN_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
