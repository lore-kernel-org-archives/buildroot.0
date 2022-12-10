Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDA6C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 21:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8E660B3B;
	Sat, 10 Dec 2022 21:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8E660B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bB-1tV3AmhI5; Sat, 10 Dec 2022 21:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C80A60AD1;
	Sat, 10 Dec 2022 21:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C80A60AD1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7217A1BF3DF
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A6EC80BFC
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 21:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6EC80BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GDMs8fKNs4M for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 21:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091AA80B2B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 091AA80B2B
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 21:09:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so2184470wms.4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 13:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=clWy23jrKnF0H8dwYSqlD0mC7ntJNvu3gZ2B5FPwSQY=;
 b=g73wqsrwYrJUdzYu/bzo4ud1B/eUXM81id9lxhS6yfKyzJWlNy2IbIYGdtK9g/8I/v
 5afj3La31MRixcx/AIHZsegDoCNPyIQciEnzOwckdR7s3K7Omis/wGEPPfinpyoeHjqA
 9y6wxHFDiAWZ7CTpblLx9ikbuMx/LBNAnbZrg0gK/js0Z/koQvoJfrTt4fb2cqjysOvw
 ZiTjRSWpDfHkhiHeTWKI0eyi9qwXOq4M97FxHL4k8cNJvZnP3/2C0v7yt5QnZ0hokBAP
 FUppSFUZpBDBY4LyZ4/MidnUyGxCWO1w036fftlNd/wCglcB3cdcDToFfrBJlMFH2X9N
 SC7g==
X-Gm-Message-State: ANoB5pkuEmLRMiXP8TBI4LEYSs3r28DqE5gBHM09YEv/xKlVS6i2FOaa
 uIVVi/nibImT5pdjt5CIchYiDjN6w6Y=
X-Google-Smtp-Source: AA0mqf56G3MxmfVYy7UptcJgTCtYJnhV2C+6N/GMPrCZ3RDdF4ue89o5C5H4RLVu3kRYwZ5nfVkhgQ==
X-Received: by 2002:a05:600c:3b0e:b0:3cf:b067:4161 with SMTP id
 m14-20020a05600c3b0e00b003cfb0674161mr8580168wms.15.1670706551637; 
 Sat, 10 Dec 2022 13:09:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 iv15-20020a05600c548f00b003d1f3e9df3csm4369205wmb.7.2022.12.10.13.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 13:09:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 22:09:05 +0100
Message-Id: <20221210210905.14201-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=clWy23jrKnF0H8dwYSqlD0mC7ntJNvu3gZ2B5FPwSQY=;
 b=p2qhEzg+Z4gbAtdZTI92WJKa5Lt9MJWZHVxWE1V8iU8/SMNPgnt1GcsjiVtH+JzH8m
 N3bR482VbagNC6wuxwUnzVh0iNFFbZR0sWhcUhE5LvzI3M0PnyHEwqECaeqsBqKc4Zvw
 L0oDDRVZHzf6QI9sG3GisvHsrShdcPuQ8Zkp6kKTZPgn36ff6SJU1Cbhj1zw+OitXSZ7
 tFWxwP6Bqy681Z7w0h8FVzDwZSSH3VvhevjOEUCa6hp3DeVb0Cdwh5WSfGTcErXS7Osw
 e6cV2jXJzhLo+txRAeYQwDSpYQMxt+DLJsAJi5izM2AvyPqaNsNdu6TefDZ7pkhrlla3
 Tweg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=p2qhEzg+
Subject: [Buildroot] [PATCH 1/1] package/gqrx: fix dependencies
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 34cea39024bf8dedaa071bc5f2d903755501215c forgot to update
gnuradio dependencies

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gqrx/Config.in | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index adcdbb0896..442b28e546 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -1,15 +1,16 @@
-comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
+comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_USE_MMU # gnuradio
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
 
-comment "gqrx needs a toolchain not affected by GCC bug 43744 and 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744 || BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+comment "gqrx needs a toolchain not affected by GCC bug 43744"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 
 config BR2_PACKAGE_GQRX
 	bool "gqrx"
@@ -21,8 +22,8 @@ config BR2_PACKAGE_GQRX
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_QT5
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # gnuradio -> boost-atomic
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # gnuradio
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_43744 # gnuradio
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # gnuradio
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
