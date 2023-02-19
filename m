Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EBFC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C22040574;
	Sun, 19 Feb 2023 17:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C22040574
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tQeZj5apGnyX; Sun, 19 Feb 2023 17:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4FFF40B72;
	Sun, 19 Feb 2023 17:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4FFF40B72
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0FBE1BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAE3B40567
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAE3B40567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OE_uRAJs7WDs for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:19:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A171540116
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A171540116
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:19:54 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f12so791524wrr.4
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 09:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w9FqLdlVgLdHtBqaN+OmEP3SdI40TQ5XlD/BYfJfQgU=;
 b=QIPqyLdNxvKjv92evIiw17XEbn24VsB0wXOTNYZuRKNwadajI9qLa2Nbmtk8iFKdAa
 kzXiHClYftZLiZbeL/Z8Fn8aCqNTHtg4/UH0qve8Hstgun9oG7YtpkpWy2h43xdnDJ1o
 +8KU7lDi91/61BkUp1u8G5w4kcMaNpVJ62AXe9uT4R4KQe6dWpEUAbioJHml71gjtswb
 H1sqhZaUYbx2mLUHR90uah0g+QMvyHnDso91up4z+biMbYpiCvrEy73lRa7F+2S6Wh5R
 HLpw7RlSpSLwjmOtXGFlgNowzqfd3r8xvf+O3MwPixcrYH3U2SubWz3pFuvEqGu1Yj8r
 9IwQ==
X-Gm-Message-State: AO0yUKWgkJNdPRpDLWwnQRArWwAErJhgMPHIJd3xmbiMIgs1vleaSGqo
 1JztX1LZdSDis2+G5kM0XfgJNbEw83Y=
X-Google-Smtp-Source: AK7set+5m5AdJ2WbhbE3FBLF8K5gMOcHuUOMzJtDv+2BXdEcaINWic9WD7fc2nVMbd3CQj/2NpXpQA==
X-Received: by 2002:a5d:62d1:0:b0:2c5:5a10:f217 with SMTP id
 o17-20020a5d62d1000000b002c55a10f217mr1673210wrv.21.1676827192387; 
 Sun, 19 Feb 2023 09:19:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l18-20020a5d4112000000b002c551f7d452sm2097393wrp.98.2023.02.19.09.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 09:19:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 18:19:48 +0100
Message-Id: <20230219171948.483505-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w9FqLdlVgLdHtBqaN+OmEP3SdI40TQ5XlD/BYfJfQgU=;
 b=jsWJ9LmSeB6dtU9uokM2JSeGAtCfYk23F40557QvmMXpNcHgTGbq5MEZAmx2xgJrXx
 U9PjA6cc69szvEaf3YRWSW0ZsrLjfSurtViMhKuMb/sI17MYpmvUIFxu8Pc2SQ/yv/51
 UMYeVZfjfPtWQ+CeKqkGBcgq/PURM7iyvdbQgzobG7q1p+gT9pfhvfsBljveBuo+7poj
 DvarroF9kupAnFClZFIzNi/bXxGHvDPkFcr1MfPJizvKy+0TMF163SZgeTpwB1ntnbru
 dVsIoYoRPXiGWVDWx1UpFUWVJBq7JZ8/yGQw9tgZXIV/kI3fSvP/J4WOR0bzwpJQjH5g
 x0Mg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jsWJ9LmS
Subject: [Buildroot] [PATCH v2,
 1/1] package/libmodsecurity: needs dynamic library with libcurl,
 libssh2 and mbedtls
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
Changes v1 -> v2:
 - Update nginx-modsecurity

 package/libmodsecurity/Config.in    | 6 ++++--
 package/nginx-modsecurity/Config.in | 7 +++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

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
diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 5cbe57a866..f3f883ab5a 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -3,7 +3,9 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
-	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS) # libmodsecurity
+	# libmodsecurity
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS)))
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
@@ -18,4 +20,5 @@ comment "nginx-modsecurity needs a toolchain w/ C++, threads"
 
 comment "nginx-modsecurity needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS
+	depends on BR2_STATIC_LIBS && BR2_PACKAGE_LIBCURL_MBEDTLS \
+		|| (BR2_PACKAGE_LIBCURL && BR2_PACKAGE_LIBSSH2_MBEDTLS))
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
