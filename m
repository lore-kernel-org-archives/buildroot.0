Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A1EC61DA4
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9621240B78;
	Sun, 19 Feb 2023 17:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9621240B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iL9qFwYO0tQM; Sun, 19 Feb 2023 17:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0EBF41195;
	Sun, 19 Feb 2023 17:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0EBF41195
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D65C81BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9B8881E19
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9B8881E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVpgGMLDliQD for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:16:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9653F81E1C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9653F81E1C
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:16:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 j41-20020a05600c1c2900b003e1e754657aso723391wms.2
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 09:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ScAj7yK+pEZVmLf++TOZb0CSyVKGZgKRPygubWDpqC0=;
 b=Oxwju0HSJwaWtSjKAq6IULI9SbrSFdGQPukRZ1mwwk6mlLb4DofplrvCO5467tL3q5
 o4QCGqrfKNhKNUbCy3tGKHUmEFPaY7NaFfwG2bE1+rfcOLN0YSz8CxLvudrE/1HkkJK4
 qh2KTxNRbewV8RJ+1ERYeWjp3Wyejrs6yex1JGmFYkYgov5PFul+ElhUNqMF8WHvtxTd
 A1PFYkUVf6xJwbWOqlaCqLdLHuD5/7GO+zRwJ+aBlutXdIFUFbdB0smPIMN4Vlv2Rvtx
 eR8BIf1Iu2/w+3OrKKvK5WCyb/kxRrNDy7vBNdkkuW5TfyVQqg8ic326H9zchOhuouqJ
 1T4Q==
X-Gm-Message-State: AO0yUKWwDTdJTm3OtEU4vtWbMCo/SDodWyPMe1X5vfWenJV8tVZeIoz6
 ndfaGoD6BDtjszDRhSmN4rUP6TTmHoU=
X-Google-Smtp-Source: AK7set9JLHiu9R/NOdr2VjUhvCkMiUg1t2Kwy9N0IgR14qkMTUgq3WpM76uDa+Sd7XPazwo0tGvJqA==
X-Received: by 2002:a05:600c:1616:b0:3e2:662:ade0 with SMTP id
 m22-20020a05600c161600b003e20662ade0mr4787941wmn.27.1676826963428; 
 Sun, 19 Feb 2023 09:16:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z23-20020a7bc7d7000000b003e2096da239sm12537371wmk.7.2023.02.19.09.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 09:16:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:16:00 +0100
Message-Id: <20230219171600.481355-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ScAj7yK+pEZVmLf++TOZb0CSyVKGZgKRPygubWDpqC0=;
 b=kV66AriJG5Rp1BPUrYEmK3MS9vSn1pCpV57Fcmnq1zHMDp64FTPH2FAo33IsIwo7/9
 wJrh1fhAMeAIphZfYMwWkML54L3paLWEGj1b018uC+fyRfQD+oncE5n+DdptjQIAxun2
 phDkQJjornnsLpcgPFS7Ey6J032iXeE1LFn51x78QmbdwzPoj2OjM/lmHyCF9T2lgzeo
 7f1TKnmQ2+gFgO+3fUysM6iMkMpjj8oDT+LEexKwbyjTr3ce2YdW3UiaVHBKWXsHtDjK
 rOo7vmSfvS/nk8n5XB6FzX1pdFsj7Fu5CTEpMQYyqc6omnLKYs1cfDqSTBC6RUj74v2m
 I3Kw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kV66AriJ
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: needs dynamic
 library with libcurl, libssh2 and mbedtls
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as
mbedtls can be pulled in libcurl through libssh2 resulting in the
following build failure:

/home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le-buildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o): in function `mbedtls_md5_init':
md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init'; ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b25959a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libmodsecurity/Config.in b/package/libmodsecurity/Config.in
index b15d808759..027c62716c 100644
--- a/package/libmodsecurity/Config.in
+++ b/package/libmodsecurity/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBMODSECURITY
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# libmodsecurity embeds several mbedtls source files
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS)
+	depends on !(BR2_STATIC_LIBS && (BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS)))
 	select BR2_PACKAGE_PCRE2
 	help
 	  Libmodsecurity is one component of the ModSecurity
@@ -21,4 +22,5 @@ comment "libmodsecurity needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libmodsecurity needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+	depends on BR2_STATIC_LIBS && (BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
