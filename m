Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5E5ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 23:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6979F40292;
	Mon, 31 Oct 2022 23:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6979F40292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OdJbTVY9rUeD; Mon, 31 Oct 2022 23:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9449A40157;
	Mon, 31 Oct 2022 23:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9449A40157
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2B1151BF297
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0042A40157
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 23:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0042A40157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjvoRu_-7aun for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 23:13:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31144400CC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31144400CC
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 23:13:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id j15so18037475wrq.3
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 16:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PbDaMJuDXTArPVLKLEo4s6YyplfyO6Mracgl9ntaCKE=;
 b=rszCNDjIfdkekuitwYh42qFdhcov8NMI8rb7aOSHbRo7aoeGAlI3Ak81hP3mv3EsGc
 imeNWVlPRlhqxIVhvs6T2Hv1xJLLyCduWsdB/SZmmoGg0BpfYnsD4PiQZIS8vZ4wnRsT
 UHuKCbvtvydUDKGsOAwJp61DR5c6csIed8eYWWFXGLLl6bqvwTLo701PeV18M7K0WEud
 V88y2CkEYhGKdezXhjCcklctjOpsAeG/JOCA8DQjej8wwJ1tE9/lvyQRitaC1EGuQN1X
 70GxTvg1ryLNq6Dc5h7F99pAtwLwH3dt7JtL7M2CK8bu+DJGhcUyl6Eor792M0+iK9vj
 WBVQ==
X-Gm-Message-State: ACrzQf3gCri0GEzxpBP6siu5Xm7FcQG1ka/AEh9IwEHx9nLcV7AgQqqR
 aKM+JAbxoDgdx8DwoRAGit3IRPkEmGk=
X-Google-Smtp-Source: AMsMyM4gJYq7P6rhBdUrSPjZmUXLYOua6ye/P3Ug7b7vclXps13G0ZHqPH3f7cfaUYzAe6c+mJ2mcA==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr9604675wrb.487.1667258023812; 
 Mon, 31 Oct 2022 16:13:43 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003cf774c31a0sm2651124wmq.16.2022.10.31.16.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 16:13:43 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 00:13:33 +0100
Message-Id: <20221031231333.706055-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PbDaMJuDXTArPVLKLEo4s6YyplfyO6Mracgl9ntaCKE=;
 b=pIBbLZGdKU/8GSGyLra4PAGEQqb+OIUkSQeBjNfmVv+6gwzrWgH9+w3NVWNURhKAbS
 j0wLfUpaQOCZwBQXY2QR5Va1WNi5CklaRMlYsA76dkgZ405Dk8MX8+HVTO5e3nN92aVz
 ORzzY2WeJ6U60V+GjMBL/5NzFgldC1f5RJVzuVe2FP2KnXD0QEXzoZhtKF53qe1Fx6xB
 KmLzHa2AqduDCpYXO9CE0U3ilhb5g6zJU0S+MKHoG1P9+NS5DwuYQrwXjpTo+CndBclP
 bebK0Y4PglRyoQf0nBXvzTgU7QMdV151+GxqHG+KjbEdSSuAiNy33lVFtiLy0O9UTggi
 VM+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pIBbLZGd
Subject: [Buildroot] [PATCH 1/1] package/libtorrent-rasterbar: openssl is
 optional, not mandatory
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Philipp Richter <richterphilipp.pops@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssl is optional, not mandatory, since the addition of the package in
commit 0393f5d34433e34e49ff7ce0fb998735453ed4fc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtorrent-rasterbar/Config.in               | 1 -
 package/libtorrent-rasterbar/libtorrent-rasterbar.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/libtorrent-rasterbar/Config.in b/package/libtorrent-rasterbar/Config.in
index fe9a9fc027..459edc1be5 100644
--- a/package/libtorrent-rasterbar/Config.in
+++ b/package/libtorrent-rasterbar/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_LIBTORRENT_RASTERBAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_OPENSSL
 	help
 	  libtorrent is a feature complete C++ bittorrent implementation
 	  focusing on efficiency and scalability.
diff --git a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
index 914e0cbca3..085b38343c 100644
--- a/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
+++ b/package/libtorrent-rasterbar/libtorrent-rasterbar.mk
@@ -11,7 +11,7 @@ LIBTORRENT_RASTERBAR_LICENSE = BSD-3-Clause
 LIBTORRENT_RASTERBAR_LICENSE_FILES = COPYING
 LIBTORRENT_RASTERBAR_CPE_ID_VENDOR = libtorrent
 LIBTORRENT_RASTERBAR_CPE_ID_PRODUCT = libtorrent
-LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost openssl
+LIBTORRENT_RASTERBAR_DEPENDENCIES = host-pkgconf boost
 LIBTORRENT_RASTERBAR_INSTALL_STAGING = YES
 LIBTORRENT_RASTERBAR_CONF_OPTS = \
 	--with-boost-libdir=$(STAGING_DIR)/usr/lib \
@@ -37,4 +37,11 @@ else
 LIBTORRENT_RASTERBAR_CONF_OPTS += --without-libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBTORRENT_RASTERBAR_DEPENDENCIES += openssl
+LIBTORRENT_RASTERBAR_CONF_OPTS += --enable-encryption
+else
+LIBTORRENT_RASTERBAR_CONF_OPTS += --disable-encryption
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
