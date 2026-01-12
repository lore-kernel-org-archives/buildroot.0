Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F52D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 427B880F75;
	Mon, 12 Jan 2026 08:43:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CQuL1HSJgdc; Mon, 12 Jan 2026 08:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D89F8460D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207438;
	bh=RNsYpYcYRTcCA1vX0m0n3b+t9X71gCrQHoR5JVspK7c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ReCYB0cENkQCkr3BDl7Wlcow4MZ+DZnEJSSwjxEfJ/O+3u7E/81VKkRAWdSCxrgOU
	 NWY6sakEyOuv/Y5CmRyEjl2ajrfNupC/wBd3WsgSc05gVnL+ytEl4pYyKzoQT9myGb
	 +HsEPQujXoVmyGqRfX1CwRpd8XPl7JWbw/QbViCeIrGR0fcSVW5BjApWBTdwcmVv7U
	 SfsWKASFUTbYSXYbjl0T6AupjEP9Rptvwbz7FHSdvvLo/IwdSEhm+x63lWQc4WzLBz
	 CJiYtg4vYKLOiRshCWu5zwoDGOLf2I2GsWVKVeZsnyuTJYtPatoaEI+LmFWsgrdxAx
	 8e1KdgGyPOcxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D89F8460D;
	Mon, 12 Jan 2026 08:43:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CCC218D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 340B680F75
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqgNgDjQ5UOP for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2183D84610
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2183D84610
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2183D84610
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:43:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2C253A4C4176
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-0z2x
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:30 +0100
Message-ID: <20260112082950.2528445-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206661;
 bh=+Q0XYGdWWX0v0nwUitYnn20jXUNv//KAK88jrriLVpw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=UiHWYZ4zxyDAQtxb+SgptwPSzRFisxPJ5SvX4FoTfHNjj5bOOo5inIjCv+2kdWJ+4
 u7q9wu6cjaYBI44FgQvFWJA7zyxTrhytRhOsw8mRz7rZ50RZ4n2wvFZLGHszudXomy
 8rrq+AaCbduujwV3BPbUjJ7ium40qWUmaaoRnLq7WexFUa3sJNxgrtbdD+Wy9iAsXF
 TXyY/D7IKfTgUC2DVpC+LiZR91oH5m2+3bWLS7t9eOalgot4ndJ5ZUyAagMc8c+g3i
 PJzMeopIlJhx1zDG3113nCG0SGZs4XC5gy9LAchVYAWIjLnHPyy1QkTD84h9vY/dl9
 6uCEHmjtSYOcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UiHWYZ4z
Subject: [Buildroot] [PATCH 022/102] package/x11r7/xapp_xcursorgen: bump
 version to 1.0.9
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

https://lists.x.org/archives/xorg-announce/2025-May/003605.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash | 6 +++---
 package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
index 45bff55ed2..50d65d6c2a 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003264.html
-sha256  32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b  xcursorgen-1.0.8.tar.xz
-sha512  dede5b9e1e09f9253365bbb83fdab26c681641913f3586cef52d4802db9cecc7e252344911cd969a873c3a5c5ebbd4b862f786de263f92ea1bcb2df90236f9c4  xcursorgen-1.0.8.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003605.html
+sha256  0cc9e156ac84ca16ea902710af35e0faffa51d13797071e3b4b6cc7cbd493bbc  xcursorgen-1.0.9.tar.xz
+sha512  d40b96d6f60ee3815ef8ed6217028b39b127f200415661e39cf23af89662aafc6783f9e311f8021fe1a5ccfbc47610909796e569991e6680b8c2133401af476e  xcursorgen-1.0.9.tar.xz
 # Locally computed
 sha256  8c773336b654442ac8018715a52be1a8254895c57c898d5387016e9488cc2009  COPYING
diff --git a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
index 318cd562db..e262001837 100644
--- a/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
+++ b/package/x11r7/xapp_xcursorgen/xapp_xcursorgen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XCURSORGEN_VERSION = 1.0.8
+XAPP_XCURSORGEN_VERSION = 1.0.9
 XAPP_XCURSORGEN_SOURCE = xcursorgen-$(XAPP_XCURSORGEN_VERSION).tar.xz
 XAPP_XCURSORGEN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XCURSORGEN_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
