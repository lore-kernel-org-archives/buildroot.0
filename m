Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07CC54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 10:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 392E7400CB;
	Sun, 17 Mar 2024 10:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1p7uAVwFbHgr; Sun, 17 Mar 2024 10:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3079A40181
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3079A40181;
	Sun, 17 Mar 2024 10:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F30481BF424
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF8B540584
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 10:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZTN7-ImwvPD for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 10:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7356B4033C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7356B4033C
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7356B4033C
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 10:14:29 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4140fedd38fso113755e9.0
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 03:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710670466; x=1711275266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4efP6xvTw0G9Fso/rRW/luLjoTs2NxRc1n4I+kWDSUk=;
 b=GPi/tS1nUSmP00Z4HPtHhCbmJSpCZYWLi4SS1hSmSEK9p6bOwsiqkud+K5cZ+EkWwg
 95JRZ/qUYVQucBn52ZAFmaEIne3RSiyJxdJelGlUgRQXsG2Evqx+njAH5ywaoJhGf2+P
 xMzBfvywLZa2V+Hq7aK2a5supFec/r72XqY3sczqquddbJ9XJX2FMwmAOJxDqn6knfXC
 3rd/xL70rrN1+eAo5WRVV8eveO8rgrT4LFEauaWRW7UK94aqaQ+tE8iW+yP932lOjgx8
 QgFsP0a6PgGLXrcoohDltkuhzP/ART9gZusGM9WyzkNakckn7F2HByqPotbogJRWzPcw
 6RkQ==
X-Gm-Message-State: AOJu0YwSEVvJzRrksEHM69GT5mikB0ZmBycx7WzstlgZgMUfcjeiz8Fy
 lq0uIPjrtGrorBO1YnJCr6UaYwmqnJ2cDzHbpd+x/8YesbZP8/nSiMP2Ihrp
X-Google-Smtp-Source: AGHT+IGSrjtD+sVoqkozGMhIGjP4lrkmIrVOOq/m4UzFebDmpYvs5vSqgBl1uGyvO7ORGS2+B7Ia7Q==
X-Received: by 2002:a05:600c:548c:b0:413:49a:c3b0 with SMTP id
 iv12-20020a05600c548c00b00413049ac3b0mr7838244wmb.2.1710670466345; 
 Sun, 17 Mar 2024 03:14:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o38-20020a05600c512600b00412cbe4f41bsm14671449wms.4.2024.03.17.03.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 03:14:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 11:14:20 +0100
Message-ID: <20240317101420.62065-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710670466; x=1711275266; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4efP6xvTw0G9Fso/rRW/luLjoTs2NxRc1n4I+kWDSUk=;
 b=Ijr4/VGKdBiP6OK/VMIooCJ5I0LRSZs5Y4ZuYmfGOERMMN4RFf2TCrj2a1utbKTefu
 M8fNxV16nu1jopZEVTzvcJBurhQxb5ZQtslBTnHjMSd9iPko7xMO0BvRWnSNKN7010Nu
 0o2vypLYGB+vfTDMW96BPEomu7tDM6Z+f9SsEUQpHdJ3CK1BhVIanMgIlB0+iuIAgL+e
 NXGTlQAqP8YuyDa7XC6Wjk3BGE7GK/yo7F+aYpQjVN2fEFyrtPQ2vtuz1Ip5EnJiu2Ym
 jkXuc9e6OZTu8GOYHXtKeuHA8tr6UzHlGr/6GoHWgZjUPXZJnIGJ3DJQEixc8bbQTi9b
 TVCw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ijr4/VGK
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: only supports 64 bits
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

osm2pgsql only supports 64 bits architectures since bump to version
1.10.0 in commit e056aeeca9cf8c00c6da62c39979ce6c55c92791 and
https://github.com/osm2pgsql-dev/osm2pgsql/commit/389904269a1b1f246641d203abadfcd5cebb97cc
resulting in the following build failure with arm:

CMake Error at CMakeLists.txt:20 (message):
  osm2pgsql needs a 64 bit architecture

Fixes: e056aeeca9cf8c00c6da62c39979ce6c55c92791
 - http://autobuild.buildroot.org/results/30c2675a732fd810c68dffbb6483f9cf8e4fcbf3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/osm2pgsql/Config.in | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index c6a38f3180..b97b258c59 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -1,5 +1,16 @@
+config BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_x86_64
+	default y if BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sparc64
+	default y if BR2_s390x
+
 config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
+	depends on BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # boost, libosmium, protozero
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
@@ -24,9 +35,11 @@ config BR2_PACKAGE_OSM2PGSQL
 	  https://osm2pgsql.org
 
 comment "osm2pgsql needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_PACKAGE_OSM2PGSQL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
