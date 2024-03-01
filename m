Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC9C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 17:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53D2F41C82;
	Fri,  1 Mar 2024 17:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udw5RprXqIAP; Fri,  1 Mar 2024 17:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2A041C6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF2A041C6A;
	Fri,  1 Mar 2024 17:47:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4EE1BF2F7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6568183B42
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 17:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKIhJNaEKhcz for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 17:47:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71B0783B3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71B0783B3B
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71B0783B3B
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 17:47:41 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso28311541fa.3
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 09:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709315258; x=1709920058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OgXgq0sEKATv7t42FhbwRR4rJwk4mYiUA4HngGm9yrs=;
 b=KPrqAH2PqhcnHVQ0cGorNaqUzBZtJbgGVs7O3vAnlDdijBhuOO9yjQL7av7T1F4zVr
 mLoU+3iypTlgFo42BTYKh1x0ti7MhQHf1cFvk1Pou/5b8fc3kFf8O7kjA2xvkJNWtHtR
 rUiQzsVgQ/z+5yFxbWpTBmzABRPeWqhBNfAzIECEWItzbAe43ihP7/ULOC1oJd4T38jI
 aIB94dTY9KhU/T7ZKU5ULsA17RoTLMQ9Rw+rnUjrmC41rrUcYErU5+L19AJNjpRWFOVd
 GQg1SV5X4cPJzXDZuYXlGHgB2N7Au2dgW/KAbomZCZkeHDf74e5RYAKKirvOKxJZjpCn
 Pv9g==
X-Gm-Message-State: AOJu0Yzt2jCsyEa0Q3NTK39yBNLovb11+Bv5QOWouKv+vWh/uEHIRWVD
 Iw+qZWIFXzrHcuhbYKVfxvIJMq7aEzCnKmLJMETNS3rJuykraz+FtzydqiU5
X-Google-Smtp-Source: AGHT+IG+vaNRJAe4r+/skBo8pwlBJlOnCmZCQskr7RjZkkfDdU1OmBEXHj52pZ180gO/NQSaZPHDMw==
X-Received: by 2002:a2e:3a08:0:b0:2d2:9b43:8d48 with SMTP id
 h8-20020a2e3a08000000b002d29b438d48mr1883712lja.39.1709315258176; 
 Fri, 01 Mar 2024 09:47:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c1d1b00b00412c7b91ef0sm2731348wms.37.2024.03.01.09.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 09:47:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 18:47:35 +0100
Message-ID: <20240301174735.783943-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709315258; x=1709920058; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OgXgq0sEKATv7t42FhbwRR4rJwk4mYiUA4HngGm9yrs=;
 b=nISsCYTsFFxf6JSuvPTxIxzoOREFMv/ufC6XRG6lI99x071ioNP76QxcPidvflBUno
 Mikh2mhOjrB/isiZrjcc29wp8C+Nv1GSKSwxxUwD3HaHIJcyZxLgPsAIMB2WVzhcA5b7
 xCgomPpiE0XBNh6g89z1TKDSELKfyjQbGNp5g/MCff3jSfXrF1Pf4SJ7dwx4+n5u64dE
 bSByDQiEtoOQeNqfKie51dYFBrRQZu6LDMislpQX6l0oVANLFuaiXCNdVWTlJrxvxcG9
 fku+qHQBxe29rutgYYuiMzArfrhvKZn4s2a3PJGLyTR56VVz2DXDXI8XFudkZKECeUg0
 DtgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nISsCYTs
Subject: [Buildroot] [PATCH 1/1] package/squid: needs C++17
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

C++17 is mandatory since bump to version 6.2 in commit
2a7c6816f02f45946e896577d78e3470331b2d63 and
https://github.com/squid-cache/squid/commit/09835feb258c3058d028918e36d959dccb3f7496
resulting in the following build failure:

configure: error: *** A compiler with support for C++17 language features is required.

Fixes: 2a7c6816f02f45946e896577d78e3470331b2d63
 - http://autobuild.buildroot.org/results/06755c324f0bf37e52976fce48a5ad62915193da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 6272140768..89b5a377c7 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,10 +1,10 @@
-comment "squid needs a toolchain w/ C++, threads, gcc >= 4.8 not affected by bug 64735"
+comment "squid needs a toolchain w/ C++, threads, gcc >= 7 not affected by bug 64735"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
 		!BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
@@ -12,7 +12,7 @@ config BR2_PACKAGE_SQUID
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
