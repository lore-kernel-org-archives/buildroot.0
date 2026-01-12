Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27172D2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 000A28449B;
	Mon, 12 Jan 2026 08:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPK2D4nebFhk; Mon, 12 Jan 2026 08:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15822844D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206217;
	bh=K/Dgm/mEsb7XxqTZSN6Ka7DmdHoserLyBC7NEchTpZA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/QaDg4xym975t6OhvJ5xflCx9UlJ7loakXLyGK2U7XaOXRtfoh1dKbOdfxqm0rbY
	 JAnA6AgkyOb7xRD/9vunYWSPmKMod+PZkoP5O0dFqogrNdB7oL85EbVUoIuU1pRVOu
	 F4fEcGIS88H0Z26r0IyrcUPCuNLLO3CCUDfZuB8t2gP6V/S+LUmg1ALXIIf9Ld0pth
	 d/i9XgXNbJ70LeUeVmbvrHVnnXHOUiCiugIIykEDtUmj70YVY1Gsuqrf7SCLicxECf
	 D126D9IBXGD5qkov74xdC5XqUKIkWF8EeCl5syETsO/lqvcWzSi+pApu8kgHvhOoBi
	 yNROTMgBbR12w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15822844D9;
	Mon, 12 Jan 2026 08:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87B5B18D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D67C614B8
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocUjJlh8TKTB for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 552E8612BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552E8612BF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 552E8612BF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:23:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07512A4C422E
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:05:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33104)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfCuX-000000003M6-2iRB
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:04:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:03:20 +0100
Message-ID: <20260112080419.2516889-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112080419.2516889-1-bernd@kuhls.net>
References: <20260112080419.2516889-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768205148;
 bh=tgdAZhQkui8gcUcD/ZIGlvU264+BIkALm0eBZl2iuws=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=msjQDFY5McJVHsZ+w2emUHr/4JAlG6iTzVT4ZktRCIb/ioOSr8D0cXcUkRDIhuVpS
 i1PPBzdaBtESBIniWUxo2E8hivrJHfjjD7LKrYYZ/rqkFX+G6ZTubDDgMD9mPR45by
 jq2mI6MEzt0Rjkyo0Ni5jJxy1LSkTB3gXbgELOxi0WR359M/r1cqrdBFtPIf5ayezi
 fF+EDlWtnsqEwkMN+Md3NtIKBnU2LkAYKqXMHiIdzTE1cEsaCgWMDPmWd5CsklsoeU
 Ep5XDcqcoUOdbSbLRrI2UR4MZtPwrnnMW1nOvMMjq6sdR6Q7Ur0dI+cD3ydplI33p9
 TOKD1wwjzrLpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=msjQDFY5
Subject: [Buildroot] [PATCH 045/104] package/xutil_util-macros: bump version
 to 1.20.2
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

https://lists.x.org/archives/xorg-announce/2024-November/003556.html
https://lists.x.org/archives/xorg-announce/2024-April/003509.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/xutil_util-macros/xutil_util-macros.hash | 6 +++---
 package/xutil_util-macros/xutil_util-macros.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xutil_util-macros/xutil_util-macros.hash b/package/xutil_util-macros/xutil_util-macros.hash
index 4fcddb7a85..fc3ea8996c 100644
--- a/package/xutil_util-macros/xutil_util-macros.hash
+++ b/package/xutil_util-macros/xutil_util-macros.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003324.html
-sha256  0b86b262dbe971edb4ff233bc370dfad9f241d09f078a3f6d5b7f4b8ea4430db  util-macros-1.20.0.tar.xz
-sha512  76caefb118bf1675d7b2b96e1bbb04eb9a320b02e120839e55a22ef98538ecf00d0e686a67186fc8fdc8492d277ffe3125ae8b7ac61ce4739edc0de3f468d2eb  util-macros-1.20.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-November/003556.html
+sha256  9ac269eba24f672d7d7b3574e4be5f333d13f04a7712303b1821b2a51ac82e8e  util-macros-1.20.2.tar.xz
+sha512  7d5ae8dbb6c1977e40c024f63d1405e7d5a40a38b90b01208d8dc1f1548e309734d1dec177b68bbf342a4d7d56ab0cfb4c8c36575c6a774b5a76a88d926c6d7b  util-macros-1.20.2.tar.xz
 # Locally computed
 sha256  7db0516389152a90c20ea910e8839d10204ebc25ccbc71fc7f5809dfb98e80ac  COPYING
diff --git a/package/xutil_util-macros/xutil_util-macros.mk b/package/xutil_util-macros/xutil_util-macros.mk
index e2e40eb84e..0a9720b394 100644
--- a/package/xutil_util-macros/xutil_util-macros.mk
+++ b/package/xutil_util-macros/xutil_util-macros.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XUTIL_UTIL_MACROS_VERSION = 1.20.0
+XUTIL_UTIL_MACROS_VERSION = 1.20.2
 XUTIL_UTIL_MACROS_SOURCE = util-macros-$(XUTIL_UTIL_MACROS_VERSION).tar.xz
 XUTIL_UTIL_MACROS_SITE = https://xorg.freedesktop.org/archive/individual/util
 XUTIL_UTIL_MACROS_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
