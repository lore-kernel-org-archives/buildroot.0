Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4834AF364A6
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 18:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1194681A81;
	Thu,  9 Apr 2026 18:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8Ml2a18wPHY; Thu,  9 Apr 2026 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A18881902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775760069;
	bh=zeAZI3eW6I5Q3T/VItNEYFQT7LDKP2KuT/4MErz0144=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fqB8zLujrwZwOPUyWsfDe2MkyRYj+TFExkMRRs+Ch5N9J7Tb2NTmPWIvTqXLNzGAr
	 BJz9/a3LxQpP34uEVDSozVJwCHgNBdWsX3IiFsRTLXZaPrkdfPrG+uJjEn4poYlbZn
	 Rxd4vMYDk7OqC+6d92hcbkHBTgYBUnfReM50mD/8Z65Viqz41BiY37UPRTn6Z93SeQ
	 cQrPdt/WeD6kYKKQXYxtKav8ZQrNFdZlUK1o3b3EjbdhTeXNQ04T190y6Eg0R232jK
	 GQbLtDs/5fBEaIsYy6/p6Q0JcurVg342Z/IoCS7iNx+lrZXfmqLuvR3+sLs/bAOdLz
	 F55k6EDWU4cdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A18881902;
	Thu,  9 Apr 2026 18:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5356F1F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3699940D86
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4YOrEMCQC4K for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 18:41:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ECD3E40D84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECD3E40D84
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECD3E40D84
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 18:41:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c238.dip0.t-ipconnect.de [79.214.194.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 39033A4C0DF4
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:40:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57198)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wAuJ6-000000004H0-2gqy
 for buildroot@buildroot.org; Thu, 09 Apr 2026 18:40:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 20:40:46 +0200
Message-ID: <20260409184048.3180731-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775760049;
 bh=9ZHxsILbYgafeUCeGQ+Xstk/CjHOMMeHxjk3XLgCess=;
 h=From:To:Subject:Date:From;
 b=fSC7SSp929LDHEFs+DVhb8OEKySxGbyJ+8CeKKxZRRGa2MUPsd3wVcoNDSXaRwS+W
 C+CgqdaY3pcvSkkI1zVEUSw5Q5v8Rz/dugbPkYwnKn1vv5OlrT5g7OPmRu4vpCGlNN
 l0Ks6WpaSRpXcF0CMyDON1B/m6Gr68Wtdfc9d5hrFVKONfZnDgiOyn6mSRWrpbaMRl
 f1mvxr8EPPRcjRBsOUvTa+Iq9rWyx9fs95Qx5IsWVAOUiyZYWV0KieNQZQ5TDymGKJ
 K7gMjfCHtlGfjeRwPtA1D/2SSWci6Qgv5NoRQ0QXdGd+tupJx0+yFOH1iKesv4GLWV
 dNmHcqgIsYBBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fSC7SSp9
Subject: [Buildroot] [PATCH 1/3] package/kodi: fix wayland build
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

Fixes wayland-related build error:
make[4]: *** No rule to make target '/usr/share/waylandpp/protocols/presentation-time.xml',
 needed by 'wayland-extra-protocols.hpp'.  Stop.

by adding a configure parameter pointing to STAGING_DIR.

The build error was not recorded by the autobuilders and can be
reproduced by this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_WAYLAND=y

LibreELEC added this configure parameter seven years ago:
https://github.com/LibreELEC/LibreELEC.tv/commit/d19ab98bf324364bf36b7c2d630524267dfaaa01

so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/kodi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index c31e789503..02feb17b4d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -126,7 +126,8 @@ endif
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
 KODI_CONF_OPTS += \
 	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
-	-DPC_WAYLANDPP_SCANNER_FOUND=ON
+	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
+	-DWAYLANDPP_PROTOCOLS_DIR=$(STAGING_DIR)/usr/share/waylandpp/protocols
 KODI_CORE_PLATFORM_NAME += wayland
 KODI_DEPENDENCIES += libxkbcommon waylandpp
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
