Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806C0D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 596246151D;
	Mon, 12 Jan 2026 08:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iMHzaE5T5o1P; Mon, 12 Jan 2026 08:34:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE6961534
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768206847;
	bh=DR8AWHrwy8gajsUi4stxoz+aqL7FVAHfxYkQsWUi3j4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NADZoQ3M+/Yz43HqKaz/IzhY442XL+uzVVUWdnyxEtxJ2qCJIzqn/8Au7etCU1vhy
	 8YMwRnLwPPI+U8fyHlIBBnMJVknRHu3QsTHQZxiQOmxQpOYhgam3A5YBJ+1Feqzbwe
	 IZRAWW/YOM/ToDHjgpFfM7W8ZbX31ZVXreVkNZ0d7tUhspNDXSYdfsgPILPfO/r1qd
	 bINGP1k0MsmAjlls2ILQVMNeTpXBP6xMItALho10FadR4n5KAjQqogu6DqOHW/3XQZ
	 KhZdrxbbdj2J5Xco8y+5O5LbOXadmvtUK4li5BJmq8YMx/sqcvIaU51o+j7OKnVutz
	 bAfaS7bujA8fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE6961534;
	Mon, 12 Jan 2026 08:34:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 079B818D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2DAC8457B
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTFLzwkHX270 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:34:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D614D80A68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D614D80A68
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D614D80A68
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:34:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E716A4C3BC1
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:30:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJF-000000007z0-1xDe
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:29:18 +0100
Message-ID: <20260112082950.2528445-70-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206617;
 bh=0FvT0u7g8d7Inl6btPzuHhwr/dcoIihbiE7wRB8DX78=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RczdMl+elq8WOmScjSisnispFO84IMgvv9qxvuFmNU/rud4+yTpUT691cXps3AUIo
 iU1vGJ6Er5snESbr9wN8UpyZF9eMeSoyW4COfxpjhEtUdbQuO9l5ywLKhCAMagLGK0
 XxPQFeoPOmKFBW67PYm+hx0zI1ocvpH/oELjkxRPaGIKRltHSrFw7qp7JdlSie0/sE
 +pL3Oc6IHRYJQlwm3b+Zvht6CoGdESffTz7HN7R6oM546Lq5HooZuo/jL+9PUTrVES
 FJvxzZfNmg5YQE1WRJg7cuvnb2O6vgqIOchmZ61a4345/dsb+bitaOEnEfcFabnGHu
 nvnxirBKiMDKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=RczdMl+e
Subject: [Buildroot] [PATCH 070/102] package/x11r7/xapp_xman: bump version
 to 1.2.0
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

https://lists.x.org/archives/xorg-announce/2024-March/003486.html

Switched tarball to xz.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xman/xapp_xman.hash | 8 +++-----
 package/x11r7/xapp_xman/xapp_xman.mk   | 4 ++--
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xman/xapp_xman.hash b/package/x11r7/xapp_xman/xapp_xman.hash
index 4436ca3111..a2f2caef1c 100644
--- a/package/x11r7/xapp_xman/xapp_xman.hash
+++ b/package/x11r7/xapp_xman/xapp_xman.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2019-July/003011.html
-md5  629436867b202098967636b17c8d303c  xman-1.1.5.tar.bz2
-sha1  ec76dbd010f68974e05dfe8bc4b91731a3b7285b  xman-1.1.5.tar.bz2
-sha256  4e3c2c7497e9734a6d3c8e1b6a364612892bb31e9f33076c9fdae7177ab60978  xman-1.1.5.tar.bz2
-sha512  f6b2be424a79f298bf1a81edce4172572195c9efc9454e5b7b7046f344ed08154c77ccaa763ccdf3f1a30b64aa4802783bf813ee637437ccb1fba434fc5d4400  xman-1.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-March/003486.html
+sha256  f18db80bd72a0c27cf38b2a7b75485ee48cd22aab10f2ff58de54d83e268b406  xman-1.2.0.tar.xz
+sha512  072dba172fd30606c1e185c6e50b3b9a9ec5e430eb2ac7f0c476e1c2de998e8c0b5fbf53de20a7339d39a8990255e77fe72d3928b43d055e8463f8069389d192  xman-1.2.0.tar.xz
 # Locally computed
 sha256  4c3d6d6fc5661c64285931a0871728f3745d962d877477235dc66e4043db3d36  COPYING
diff --git a/package/x11r7/xapp_xman/xapp_xman.mk b/package/x11r7/xapp_xman/xapp_xman.mk
index f8abfe577d..d1c88febd8 100644
--- a/package/x11r7/xapp_xman/xapp_xman.mk
+++ b/package/x11r7/xapp_xman/xapp_xman.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XAPP_XMAN_VERSION = 1.1.5
-XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.bz2
+XAPP_XMAN_VERSION = 1.2.0
+XAPP_XMAN_SOURCE = xman-$(XAPP_XMAN_VERSION).tar.xz
 XAPP_XMAN_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XMAN_LICENSE = MIT
 XAPP_XMAN_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
