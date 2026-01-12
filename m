Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF856D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85DB56163F;
	Mon, 12 Jan 2026 08:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJTe0bvQZ-Nz; Mon, 12 Jan 2026 08:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06AE46157F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207729;
	bh=K/Dgm/mEsb7XxqTZSN6Ka7DmdHoserLyBC7NEchTpZA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dX1myWzKTiTeILhyrjosD+hfvYxi5SZVfPiSt4eGb/dpjMK0daJv3/VtNGP9aVnwD
	 T6zCg/BtHihY2wsOdJ4V4swPbdIIATmdaAexOy3zyKtiR4m4d/7zIInm782N2k3PUf
	 RYCwXMYSRnnjMFkNgjL/4GpWDLxOoDBXDoDeUcm6Y8vxL1sHoGzehk3fLoCbLmTWA5
	 4DMb+onKQHf0RPV6C12Ys6JV9MgcNrHqQToWXNpUVwIb3ocnXz2Gdfd2yLKvIeubPl
	 eviw59rmtHm5j2+384tNfSY5b94KaUjwAiPibL+qrmkRdFv0wSN7tZ+tg4JiWI1vx1
	 AZYIwYjuUrcDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06AE46157F;
	Mon, 12 Jan 2026 08:48:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B617718D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D5BA846CF
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cB5yKtlQg8D8 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:48:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8292A80DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8292A80DB2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8292A80DB2
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:48:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CDAA6A4C4232
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-2y7W
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:52 +0100
Message-ID: <20260112082950.2528445-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206669;
 bh=tgdAZhQkui8gcUcD/ZIGlvU264+BIkALm0eBZl2iuws=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=ncVJ9OgUV0r8aHtpIi2cJzee8p/D///yFyMbULfNul0gu4g/WHDHBB+eqpnjylEoY
 lqWKuzQQrmSfPFLDZIEw8dpsyh+mCNF439p1ZmJgzgQ7BXQNZDDS2MJL0wV7gaAkYb
 gZ39B/MpoNF51PX29hD7b4q8v6jDempkjDZFgjBpcwR7mU2L2d8uS4FMq5X046Eeuo
 Oj84v1rMjecuJGBppQkCoNbAx6ZR6MGQ6IKj1fedrpqbrwwcxt906zjDUWvL8PljyE
 xnJvzeH8bQKtNKclW0FyK1IEw27NwVEcSHpvAIeXKqjv64WqVoS5xBVevOSJDrBjnG
 AdW2pjssaVZag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ncVJ9OgU
Subject: [Buildroot] [PATCH 044/102] package/xutil_util-macros: bump version
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
