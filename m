Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CCDC4167B
	for <buildroot@archiver.kernel.org>; Sun,  3 Dec 2023 18:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3649E4167F;
	Sun,  3 Dec 2023 18:29:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3649E4167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQrPwkIzYjhO; Sun,  3 Dec 2023 18:29:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73361415F8;
	Sun,  3 Dec 2023 18:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73361415F8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D956B1BF408
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE2A760759
 for <buildroot@lists.busybox.net>; Sun,  3 Dec 2023 18:29:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE2A760759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cAj174FVslsQ for <buildroot@lists.busybox.net>;
 Sun,  3 Dec 2023 18:29:18 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA6EB606F2
 for <buildroot@buildroot.org>; Sun,  3 Dec 2023 18:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA6EB606F2
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09b021daso5622145e9.0
 for <buildroot@buildroot.org>; Sun, 03 Dec 2023 10:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701628155; x=1702232955;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TtgvENXm+G52zFyCyd9kIuEtpK29fDwkwa4Mo9N/R7U=;
 b=XHb00YC0NI7nk6JXy/HdN8LrPCWR1KS+9uhGZo9+aS1QbdRF2B9fhDSg4SGjeQKy4S
 bU9FYemJYAJoPpkGfHEVNElEZvdoes5T+ISZEI2pTKrudV5YHOzOa5mHLOiy+0kZhrYV
 vnMUFf1PYXIWtWBqjBDZJYH0HNKp3JUGKytAmEx852obV/WLDRoORK2rlRAa2Qf1gBPh
 ork8Ol6nnJGd3Nbjomcbw+qGnsDDibMkvlzCidKToKOd+A6P4Va0H3EFTtfd30SrlsZ0
 h9SS17AwuV4oQeX69YVJpgPnmRPUgL/x0yNiKGL122MVYGKg21nQ6wFCxEdajSKKjxT0
 K+9g==
X-Gm-Message-State: AOJu0Yzs0XzfeU8Oz/mfg5CHGsY1U+IvHUf7JZvZol3f2CHhYFJkE72k
 XBMRjBjPL47mdDaPtPj1GOk9110ksBI=
X-Google-Smtp-Source: AGHT+IGnYDX5h7TZ73Vcx7KnjE8KuRqYKcb4J3bfTdFhMrJexu09tsqp6l19BnEDU7S05mhlnN1GqQ==
X-Received: by 2002:a05:600c:4e4d:b0:40b:5e21:bddd with SMTP id
 e13-20020a05600c4e4d00b0040b5e21bdddmr1749991wmq.108.1701628154571; 
 Sun, 03 Dec 2023 10:29:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 t16-20020a5d5350000000b0033338c3ba42sm4773374wrv.111.2023.12.03.10.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 10:29:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Dec 2023 19:29:11 +0100
Message-ID: <20231203182911.290968-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701628155; x=1702232955; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TtgvENXm+G52zFyCyd9kIuEtpK29fDwkwa4Mo9N/R7U=;
 b=gId51BqOT6zi+kTnJxAZnq7STsLN1zTV8UaQ08GOAHavbIg/NrAcN486Foua3Zn1VP
 a3V5hlb76ROr8XRCqgEULa0KKSN5kxxXCTayB5n1wO//qZ/z4wle3g7dMvc6y14c5VsD
 YGe+n7R4HSWCjwFDdJ/7dYSDe6xbdIRAv6XYTMchVR1dMK4xsbwyOwdt1BrZ9fVZTiJD
 zrmzS93frEPoKxPUdTtXI8wNnkcAN8alnZdgVrQH4RULN9/f8eimmPdKe6065OmSjyI4
 wxJ7T3Tu1xtYpPpIr9aVKH+bjHYUqyq05fMRsAnW1mPUSxZSbA+1OEadh+Se567UktYi
 M3vw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gId51BqO
Subject: [Buildroot] [PATCH v2,
 1/1] package/openssl: add BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
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

libressl doesn't support all architectures since bump to version 3.8.2
in commit 21eca49ed5110872407b76ab9337d2877c4cda24 and
https://github.com/libressl/portable/commit/b98c56fd5e86fa76eb55a98a2266a923f64f705c
https://github.com/libressl/portable/commit/71ce0b8c3e07079a40011d2f3515969e3bdf302e:

In file included from /home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/rc4/rc4_enc.c:61:
/home/autobuild/autobuild/instance-4/output-1/build/libressl-3.8.2/crypto/../include/openssl/rc4.h:75:9: error: unknown type name 'RC4_INT'
   75 |         RC4_INT x, y;
      |         ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1f6ac121b3771ccc4b0e846c061b7002ccb63963

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Move BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS outside of choice

 package/openssl/Config.in | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index c7641ecefa..30db152fad 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,3 +1,14 @@
+config BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
+	bool
+	# see include/CMakeLists.txt
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_RISCV_64
+	default y if BR2_sparc64
+
 config BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	bool
 
@@ -32,6 +43,7 @@ source "package/libopenssl/Config.in"
 
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
+	depends on BR2_PACKAGE_LIBRESSL_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# uClibc doesn't provide __register_atfork() without NPTL
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
