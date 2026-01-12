Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EABD25044
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 524D0614E9;
	Mon, 12 Jan 2026 08:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvR52_3zSttZ; Mon, 12 Jan 2026 08:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BEFF614CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768205431;
	bh=U1CotUMY7+cyBmtmiY8F6SvMunyp2CRr/fAK0dEHYj0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NC6whvkIkh+90LB40e/PYmSOo0q5z17uzznJxV4oUkc+UNbYGjFh55P43dUiSNS6x
	 zSYR8yIvNu2m+ZZ2cxzoljo399lMhFSSCUd2ihYATWcJh6XT2mppHDMF5mPu4WYsjx
	 IsbWPS+uADlERJn/Wk3cJw/dEpFQRZzfqcJK18Ef1fqYKt8LeJGV2XA1Yq0dRIlLuI
	 iYBW80HUrbq00lJv3HYhS9sDfvLbwBLWdqKzjWxhLD0lMoTGB8hW3Z+wPPEVaSqnTZ
	 5NtHLYS9w+65VPkQUeNWTQQkgVH+cWq3DhTJi2E123l8fdOMAB6FZVZiHYu0IrJZ7F
	 deJPCvDDSKlwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BEFF614CC;
	Mon, 12 Jan 2026 08:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD6C18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 718424148C
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zDwkKomicX1 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 580554148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580554148B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 580554148B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:10:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 18D42A4C3BA1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuZ-000000003M6-49vq
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:53 +0100
Message-ID: <20260112080419.2516889-78-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205113;
 bh=i8BcLT+30TAc22/JP1e0jAK2E2T/917cPI1YcY++iDY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Kd01Vew2JY9qftCqphjM/eLQJXaARegSMpbkPpCVM33Yq7MtkBFFQhay0O9Sg3Bbn
 YYDnjt5C7t947U8g5Hz9Z4YQiKgR/ZlGIvAdhO4SLvpHN+Pfsd42DdipVJYMb0aYoF
 JKGpIts7xfmjr01OsElw8wcsiTQTau2f9aCUWwllletRwlsyYSxfTBTIywfwsQYp7F
 GYSCAf0wxQbxM66MBGwHnvvOsLcFAsppBB9+Rjb8NPexKImNnDOWTGgcW1uyXtEZ8e
 eiAJgNPPOngIFAKHry9O590xlM4vX0ZeDyUECBh2TYm/5XlPEoSiDTOUH00ZFyQWw3
 PPK/e7Bms8VUg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Kd01Vew2
Subject: [Buildroot] [PATCH 078/104] package/x11r7/xapp_xpr: bump version to
 1.2.0
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

https://lists.x.org/archives/xorg-announce/2024-March/003477.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xpr/-/commit/6f34ba3a67e2c25f4fd6b2878038793422bf8770

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xpr/xapp_xpr.hash | 8 ++++----
 package/x11r7/xapp_xpr/xapp_xpr.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xpr/xapp_xpr.hash b/package/x11r7/xapp_xpr/xapp_xpr.hash
index 28ebd77810..0ffcdf3a5f 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.hash
+++ b/package/x11r7/xapp_xpr/xapp_xpr.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003177.html
-sha256  a0bbb11475366622632440b1c6f16d19964b4516483232fe5f46c169528557c5  xpr-1.1.0.tar.xz
-sha512  53eb896cf1844036a13b1018ffcecbc6a0a56eebe0d7cb6331dbe691207498d2c41f3791655b7fc081acfef2ed9904987f363b710bf0eeff6c8d33f819a951cb  xpr-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003477.html
+sha256  8b9402f8331309f0a9d8143d4d6129c4a7479ff9449616849b9f1e2a5835cec3  xpr-1.2.0.tar.xz
+sha512  49538a757aa60e754ecd39273510a6e49ebb77b730be62e3fa60f00261c9c1e208d39e1ca3c61889a5ad7fc7c2255fa1f669fd19ecf98e18cb8aa9189cadc15d  xpr-1.2.0.tar.xz
 # Locally computed
-sha256  5e8ff9b5d3fc86b5d0bc5957c9ee0aa1a6d0fb9a6b116aae70762b628a0d5069  COPYING
+sha256  46f4634338006ce194cd0098a159c701f4587ab8e21c40ce510d8504e85fe128  COPYING
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index 4db4cd3309..c388335573 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.1.0
+XAPP_XPR_VERSION = 1.2.0
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.xz
-XAPP_XPR_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XPR_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XPR_LICENSE = MIT
 XAPP_XPR_LICENSE_FILES = COPYING
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
