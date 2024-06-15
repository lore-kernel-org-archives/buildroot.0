Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FE6C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 18:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C324160749;
	Sat, 15 Jun 2024 18:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jhqhbd8lVkCX; Sat, 15 Jun 2024 18:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70CD60774
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70CD60774;
	Sat, 15 Jun 2024 18:20:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 802081BF2FD
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC6560774
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 18:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ID9_1czantf for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 18:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 43D9160749
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43D9160749
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43D9160749
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 18:20:32 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-35f089e35e7so2075076f8f.0
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 11:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718475630; x=1719080430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wThLgkJXO6KmzwYsQAJ7uGefgJ7aWwnThz13Fp+cXhk=;
 b=nK+pn2lOt8WBDyKtEjJ1x40qyDlYN6ZpuRDIL7FbmVPdQJWJWZLB3+z/tGBlLej9CK
 KigIiELLRoMKw4LsNyyno94hQkNJJgs4SVcuOluQqt0FnJ3XxmJFaNipCpE8iJPcDh0X
 Nsts4Ho6b7e/5Jrd7EtC4OPWJbsqYP3Y8PJooQqFG6epDhVxVh6fIfTjFqhr1xTTDUUt
 PxIYC95y4KLtb33YNFM32UiA6sYA0jJqKR+3xA9pqXzhn4kCbgcQi1yZHogghvCDHf8F
 ts4slpgi4miV/3MI8mSBC/q+b5Q2HqGF+vG9bVcsXz2eGn+FS0LavI7OVtjPM7YRKOlt
 /GSg==
X-Gm-Message-State: AOJu0Yxp8RTwQYIpdZvGtvsBYEOx0NIVBAanlOR053XMF2LAEMNHLg5C
 ZwOn96tJFBCy8EjD0VXUrfazAwrw8B/9UdbK0tZskCKrfi71povw6quCag==
X-Google-Smtp-Source: AGHT+IH1DNw4SPNDBu9/WrPAra/5QsQUGG2d4E2DvgF7Ib7x1DiAeLgoswRyPf5J5rUTntiE0yRTZA==
X-Received: by 2002:adf:f249:0:b0:35f:10ac:ea50 with SMTP id
 ffacd0b85a97d-3607a7c3179mr4554330f8f.37.1718475629525; 
 Sat, 15 Jun 2024 11:20:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-360750ad082sm7616742f8f.59.2024.06.15.11.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 11:20:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 20:20:23 +0200
Message-ID: <20240615182023.2963494-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718475630; x=1719080430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wThLgkJXO6KmzwYsQAJ7uGefgJ7aWwnThz13Fp+cXhk=;
 b=Iklax0UdcU7vsx+Vs8PHmNwS4P1bTfliyB98BhVdiKC6O7DvZ2sjN64A9C2w1QKOFL
 OgbRoL2URAfa1KKO15oN7eOVPZUjg8tUURJvat/3bklJJzqrgFEvN1wFanEByNGA2d2i
 gQy5T8UxytP4QGhSWtnwXeciztlIMd9dizbvUUYh3JAa8zU2DaT01J0QX72seUan1mYU
 4MB2UsQVFZ4LjPyJF+HDkA8cDvRlD+hDSJuT84p7Bf1Cc7hOEvrxeW9drTHL9ZzEVi05
 L4MLffWCbaOppJwFv2xLAd00KYcsm9rilLPXpTgXQdS8lyMSqgJwj+k1oocyRNpNCb4I
 IJNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iklax0Ud
Subject: [Buildroot] [PATCH 1/1] package/nut: needs threads
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

threads are mandantory since bump to version 2.8.2 in commit
4edd837ac0193db83202030ee2997ac811e6bc45 and
https://github.com/networkupstools/nut/commit/ff401e538bcbead62a3532887135518ef9e779df:

In file included from nutipc.cpp:38:
../include/nutipc.hpp:455:3: error: 'pthread_t' does not name a type
  455 |   pthread_t m_impl;
      |   ^~~~~~~~~

Fixes: 4edd837ac0193db83202030ee2997ac811e6bc45
 - http://autobuild.buildroot.org/results/d16a24d60b298d7616a516ec0c6c30696ed93a58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/Config.in | 5 +++--
 package/nut/Config.in      | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 80759e9566..35f544b626 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -430,13 +430,14 @@ config BR2_PACKAGE_COLLECTD_NTPD
 config BR2_PACKAGE_COLLECTD_NUT
 	bool "nut"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NUT
 	help
 	  The NUT plugin collects uninterruptible power supply (UPS)
 	  statistics using the Network UPS Tools (NUT).
 
-comment "nut needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "nut needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_COLLECTD_OLSRD
 	bool "olsrd"
diff --git a/package/nut/Config.in b/package/nut/Config.in
index df647b9b48..0ecd33d583 100644
--- a/package/nut/Config.in
+++ b/package/nut/Config.in
@@ -1,11 +1,12 @@
-comment "nut needs a toolchain w/ C++"
+comment "nut needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_NUT
 	bool "nut"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Network UPS tools
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
