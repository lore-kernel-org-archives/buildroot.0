Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CCEC44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A64240775;
	Wed, 15 Jul 2026 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDBu1mzwmV0m; Wed, 15 Jul 2026 21:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2871740795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784149443;
	bh=ai36AsUWWV43Vo9hwhTIfluy3wZl/L3FOrBOsaycAzs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BkKVdqA5ygMvtnzK8MEk3HZw7NdEY/z7bkWk+KwniRZqS9qX5PYt6Wxv4IWSvW0gD
	 bWJEL/vid7l1NIzXWAP3OOdF6jeJdb3LAjCF+Jtgx9whOhvHb3Lmd+pRxvglAdIMKc
	 rOGz4AY/+hhxHkLTdauedN+Vz5UDWM960vCkp7cRA85hfMDJgL5c2csZVr2Fk6vwxy
	 JNw+3nHueMeEIAs+bcNf6iLezh1wFALCtM1TYFNaaeQpRlrQyKsIuvXDkcdDxWkYEy
	 RUjRiz2p4nfj95d/Y0vVNP8AA0ZPyaHaXFSU3Ulal+StiXjuQ4z4ddfhpVKrLBtMT1
	 AFKce3ebx/BXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2871740795;
	Wed, 15 Jul 2026 21:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B6E2320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D2E140122
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 21:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gp3SjZr2tggE for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 21:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 371A040061
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 371A040061
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 371A040061
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 21:04:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1ce.dip0.t-ipconnect.de [84.161.177.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0FC4A4C20A9
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 23:03:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34754)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wk6lq-000000001Rr-0g0Y
 for buildroot@buildroot.org; Wed, 15 Jul 2026 21:03:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 23:03:58 +0200
Message-ID: <20260715210358.1131846-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784149438;
 bh=qoRBAADiAR+MrJUj8VLV71UeKQzwQgcB86p2iEbtWMM=;
 h=From:To:Subject:Date:From;
 b=G9TbvsgzroYxsd9tBjCitCrbbggaFMKUzkCm7IeI6TZkYCLNpXB60HTgTihBbU3Js
 CkMivggLwY+M6BC9/GWUIcQd9KAG4buFDWzYqzYibMthVvEpyDcbNx7meYVT8s5imX
 glVn6Bew7Vq9YGhaVKXTZWXLlSdefTxpZ/E/ntAKkEorRQcgh0I5vRvsu3fwJi3M5+
 HPCKpu6Mafc79+KQ74Tmk2PcJP/TOr1IzRvoljCUdqOurhQZLoTNIAhNZsKZsmPwft
 7yT1/iVutHS6+J9hIlp5yKe/dTo/sre6mjLeP3xRcQKjOPwyGGVbNWKY4SUL31+o7E
 iQ53RfqeTHjOg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=G9Tbvsgz
Subject: [Buildroot] [PATCH 1/1] package/libvpl: update configure options
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

Upstream removed configure option INSTALL_EXAMPLE_CODE with commit
https://github.com/intel/libvpl/commit/8434de3cbc2c06822e43d4b24cfd543a6bce1bfb
which was first released with version 2.11.0.

Upstream re-added a similar configure option named INSTALL_EXAMPLE_CODE
with commits
https://github.com/intel/libvpl/commit/f8d989160e3817cd9c18716120dccc1c8c23e915
https://github.com/intel/libvpl/commit/7c803c85383b011c1552d06585588ab7a8fcc4d3
which were first released with version 2.15.0.

Buildroot bumped the package to 2.15.0 with
8e713dcc88e24c47593abb84c9aa15f09610ae11 and forgot to rename the
configure option.

Remove libva/x11/wayland-related configure option due to upstream commit
https://github.com/intel/libvpl/commit/8434de3cbc2c06822e43d4b24cfd543a6bce1bfb
which was first released with version 2.11.0. Remove the selection of
optional packages for these dependencies as well.

Removed unneeded libatomic handling.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1d9bf9feb1df50fa2f6ff6fce484b6ba477206f0

 package/libvpl/Config.in |  7 -------
 package/libvpl/libvpl.mk | 28 +---------------------------
 2 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
index 5a370ed2e3..eac901f9a8 100644
--- a/package/libvpl/Config.in
+++ b/package/libvpl/Config.in
@@ -10,13 +10,6 @@ config BR2_PACKAGE_LIBVPL
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
-	# libva support needs a libdrm with intel driver
-	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
-		(BR2_i386 || BR2_x86_64) && \
-		BR2_PACKAGE_LIBDRM_HAS_ATOMIC
-	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
 	help
 	  oneAPI Video Processing Library (oneVPL) dispatcher,
 	  tools, and examples
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index e5ab9ac8ee..53a576a0a7 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -13,32 +13,6 @@ LIBVPL_DEPENDENCIES = host-pkgconf
 
 LIBVPL_CONF_OPTS = \
 	-DBUILD_TOOLS=OFF \
-	-DINSTALL_EXAMPLE_CODE=OFF
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBVPL_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="-latomic"
-endif
-
-ifeq ($(BR2_PACKAGE_LIBVA),y)
-LIBVPL_CONF_OPTS += -DENABLE_VA=ON
-LIBVPL_DEPENDENCIES += libva
-else
-LIBVPL_CONF_OPTS += -DENABLE_VA=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-LIBVPL_CONF_OPTS += -DENABLE_WAYLAND=ON
-LIBVPL_DEPENDENCIES += wayland wayland-protocols
-else
-LIBVPL_CONF_OPTS += -DENABLE_WAYLAND=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_XORG7),y)
-LIBVPL_CONF_OPTS += -DENABLE_X11=ON
-LIBVPL_DEPENDENCIES += libxcb xlib_libX11
-else
-LIBVPL_CONF_OPTS += -DENABLE_X11=OFF
-endif
+	-DINSTALL_EXAMPLES=OFF
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
