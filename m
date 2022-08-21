Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A18CC00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 11:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3D2812DC;
	Sun, 21 Aug 2022 11:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3D2812DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGP_C863lHJI; Sun, 21 Aug 2022 11:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 091F1812CA;
	Sun, 21 Aug 2022 11:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091F1812CA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8FC1BF3A7
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EAEFA4034B
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 11:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAEFA4034B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xYHHXhzRW2jA for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 11:43:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE2C6400E5
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CE2C6400E5
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 11:43:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so4621502wms.5
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 04:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lC+xmtQD7RAmZuW1Wq3KKunu4R39RLS7U1ZOO4lxIx4=;
 b=dbEgX1S8aXUU83ybjcWsKwC7Z6wQ2K8y28DMu87aC8/1soMd+Ly0GEPABRkfUCbMoq
 kw6WMLTS6kuvJOJGh7SZGpQ5kacXQ3Mb1WNeRmihc9UeWxP/jdDKcMOZrb4aPayss+mz
 JrmehOBS7nu7PKvkdSiaR7n177jBwhrm/HIO/fpzmQmFQFfg4Cj8ZetfwMo5CE1nBnzq
 L+GwaaNr3dUjiQi7GHpFDQ73O5M8NND42QD9q9zzHbVpufWTQkR39pSYvtniSEFZi00X
 8Y2Wd6Nc1XjPwFOkDHznrsA4AzNtYXVVJj040DglXKd8TrxXJdrIaEYwz/CQtrpJeOWo
 X3jg==
X-Gm-Message-State: ACgBeo1j23BSlm+MGR0JZZev6LeInq2AJI/DaysMtZdUKmf64LNlr6S7
 sHvlTD0l7KoOrLHzXKmIvvm65y02B20=
X-Google-Smtp-Source: AA6agR44mpjS67PsAeU0JPzoO9mppOjjGsad3z72t6p9j126cw3tX0dBf4gVE3MvfJyaZVsq5gH62Q==
X-Received: by 2002:a05:600c:4e49:b0:3a5:dd23:90d7 with SMTP id
 e9-20020a05600c4e4900b003a5dd2390d7mr9421322wmq.41.1661082226798; 
 Sun, 21 Aug 2022 04:43:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d6105000000b002251c75c09csm10345066wrt.90.2022.08.21.04.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 04:43:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Aug 2022 13:43:43 +0200
Message-Id: <20220821114343.10984-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lC+xmtQD7RAmZuW1Wq3KKunu4R39RLS7U1ZOO4lxIx4=;
 b=lkyTK/Bn+QFu793ZOsUwwiXPoHde21Cu73bRwUzALJW9ckvqP6asxfy+iWC9WrproP
 I/G0F3mgLQnvlGntw/xbA1VAmM5Tn0UDXK5xpthNax5DNgJ6ywHti77FjJaSdi0we0QL
 E6N05T/IS6+ckwUllEeH2RwTtQvjPm3ELFy6UAj0NzUpFdkflfzPu2uDnwawUiSrFfFa
 QlY6AXwlp5crbcLwjJOLJ791dFI0Ia/cTe8EzmnroVs8I3nIaTkOtvOsl0gUPpTWF9t8
 sneNecP1v/PAZF5wEvzXNXO7e8v1oieam/UZGm6VziZZQUTa3mtuLd0AweDhgT1GFjA8
 Mf/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lkyTK/Bn
Subject: [Buildroot] [PATCH 1/1] package/zeek: needs C++17
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zeek needs C++17 since its addition in commit
ea36681572255ec906167308c07adc42ed2ac9f9 resulting in the following
build failure:

CMake Error at auxil/bifcl/cmake/RequireCXX17.cmake:46 (message):
  GCC version must be at least 7.0 for C++17 support, detected: 6.3.0

Fixes:
 - http://autobuild.buildroot.org/results/4d11e8bea1f7ed0b04cd7e123ed2f352e7a9e77f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeek/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/zeek/Config.in b/package/zeek/Config.in
index f2a769621f..114ec4235d 100644
--- a/package/zeek/Config.in
+++ b/package/zeek/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_ZEEK
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-zeek
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
@@ -33,7 +35,9 @@ config BR2_PACKAGE_ZEEK_ZEEKCTL
 
 endif
 
-comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library"
+comment "zeek needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 7, host gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_HOST_GCC_AT_LEAST_7
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
