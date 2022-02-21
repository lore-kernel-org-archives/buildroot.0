Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B40C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 22:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F26D813EC;
	Mon, 21 Feb 2022 22:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACdVIEV5VB5p; Mon, 21 Feb 2022 22:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C85C813DC;
	Mon, 21 Feb 2022 22:39:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2ECB51BF3A7
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ABF1402B9
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tW39Z9EbEMXm for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 22:39:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D96A5402AF
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 22:39:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so369142wml.0
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 14:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vLMG1FIzGEqUavlz/dEST3cl9VK9P8ZGj9fTwBjxg/4=;
 b=BEbVuVYjtFJ7qP+lwlgZvptFYOhMDbIIYsXGi677anbu3HU5zhNdLPfbIYMSWYreIk
 INOcm8QTckfP9Yfow8DlHPRBVja7BFC0gK5BSilg+DmD69YU4+CLkOjehreNX6XCGRP3
 cPA4wzlgVpMzYuBSPPZls17RoIMBw+wv3IxKdyjvU/S3m2DCvcE5WxeFm2yhXfM2kGtp
 taif0Jli3Vg4ggKn+TZQGy0zVMwSvb3kh6tPUSJLbWLvDz6xs7Huc+M3FWBnbG8zV5/l
 bhzCQP9tEE0C6wlQYqfN3BftjT85qbIlilR2dTfBH/WajXGLjuKYB2+fMiIICS9oO5mG
 GLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vLMG1FIzGEqUavlz/dEST3cl9VK9P8ZGj9fTwBjxg/4=;
 b=ANiLY6mv8cQD4+1Fl3et/iSmgjQoh4W8KlG6TBNXUctkPEj2tn0K+7WJZSdlsRWgt6
 9ct0fd3IaHvX2MhMb7hG0yQA7mIpZR/Cg6x3W1Rcd1/Y4pYiJrbuX5EUX7mQoJF4iDzg
 hFebcP5dxIIiuI7bxf7DG/mNrmo61XgbPO6k/yqGsXBffvH7ZZCE0v9M8n69qJPNAVjP
 VsLjjBofAutOQxWbuZ7UN1omzNsxJSVOPNXD7ok6cvtL0mjFrIr5ucahMdPrc4SPWj6u
 kv5pn/82OePQRmwfuNYuWS6GIBC1OZOJcDWQo1s1t9VZnfJuDs64fo97MqB2xgykyWQR
 dWZA==
X-Gm-Message-State: AOAM531QB/x3NXyjOxoEx3k7XZInbT+tTYBbRQjDzPz2r0feOtdb9Dmu
 cw3EpAusewTM0N1Jo98C/HE/oALB/kc=
X-Google-Smtp-Source: ABdhPJw1YQ1AAIN6p6BKT65Ks5GBU5LTjCgKpEF50VRRH7O+LpZ6w7LRlVhF5TS3xYalOXRTj8pIuw==
X-Received: by 2002:a05:600c:384a:b0:37b:e8ac:851f with SMTP id
 s10-20020a05600c384a00b0037be8ac851fmr928106wmr.158.1645483155931; 
 Mon, 21 Feb 2022 14:39:15 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a7bce0c000000b0037bed2a6fbfsm561969wmc.37.2022.02.21.14.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 14:39:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 23:38:42 +0100
Message-Id: <20220221223842.2201966-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: disable external fmt
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

osm2pgsql doesn't support fmt > 8.0 yet resulting in the following build
failure since bump of fmt to version 8.1.1 in commit
ec7fd50d08690a383fec40748ac9b78c3f764316:

/home/buildroot/autobuild/instance-0/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/fmt/core.h:1728:7: error: static assertion failed: Cannot format an argument. To make type T formattable provide a formatter<T> specialization: https://fmt.dev/latest/api.html#udt
 1728 |       formattable,
      |       ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5af1a0ea176559a5dc787ba945a3a83823f5b1bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/osm2pgsql/Config.in    | 5 ++---
 package/osm2pgsql/osm2pgsql.mk | 5 +++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 315f496d8e..e903e92c49 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -1,17 +1,16 @@
 config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
-	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
+	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
-	depends on BR2_USE_WCHAR # boost, fmt, libosmium
+	depends on BR2_USE_WCHAR # boost, libosmium
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BZIP2
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBOSMIUM
 	select BR2_PACKAGE_PROTOZERO
 	select BR2_PACKAGE_ZLIB
diff --git a/package/osm2pgsql/osm2pgsql.mk b/package/osm2pgsql/osm2pgsql.mk
index b00976d28b..d389fff590 100644
--- a/package/osm2pgsql/osm2pgsql.mk
+++ b/package/osm2pgsql/osm2pgsql.mk
@@ -10,12 +10,13 @@ OSM2PGSQL_LICENSE = GPL-2.0+
 OSM2PGSQL_LICENSE_FILES = COPYING
 OSM2PGSQL_SUPPORTS_IN_SOURCE_BUILD = NO
 
-OSM2PGSQL_DEPENDENCIES = boost bzip2 expat fmt libosmium postgresql protozero zlib
+OSM2PGSQL_DEPENDENCIES = boost bzip2 expat libosmium postgresql protozero zlib
 
+# fmt > 8.0 is not yet supported
 OSM2PGSQL_CONF_OPTS = \
 	-DBUILD_TESTS=OFF \
 	-DBUILD_COVERAGE=OFF \
-	-DEXTERNAL_FMT=ON \
+	-DEXTERNAL_FMT=OFF \
 	-DEXTERNAL_LIBOSMIUM=ON \
 	-DEXTERNAL_PROTOZERO=ON
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
