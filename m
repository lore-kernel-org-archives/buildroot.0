Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB59C61D85
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 18:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB69681E6E;
	Tue, 21 Nov 2023 18:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB69681E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7WUsrM0oBrxN; Tue, 21 Nov 2023 18:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F31E681E2B;
	Tue, 21 Nov 2023 18:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F31E681E2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C0F891BF32B
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 18:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5E5A61104
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 18:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5E5A61104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o2QZyjQ5EI9a for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 18:25:45 +0000 (UTC)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA6B160AB2
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 18:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6B160AB2
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-58ce8403881so578477eaf.1
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 10:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700591143; x=1701195943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FrghSCJ4n8yq6LDtTVV/dzoH/m3ljtC+0zfFSFC21Pc=;
 b=Ub8G/BKVM+La3U6vWb6z6CuH4n0NvX/r1wTddz3AFXzNG3kopihQRuLlxV786hCqGo
 3Q0H5kEcTYz+F/VJ/c4XqQCBPAcb1+XYIVDZqXv7S+vEqyng4A5leL3mZ1PLb1S2dEja
 mQUkWuHFpM8FcvQ1ddzfD3cAxEDilY+96FhakE0+fZgyO332WzSAQ2zB9DzV49NEP8ip
 8vTwM9LPzUD/Rt2YtnnwtL3JbGe9J5omnA0XmeZzKAfHq5XrB2hoQe+c7egE06OlCiyY
 fft5FqcjueA09FNun2Z1munBRhmJLlrEwbUy1Ja6AdeqTyyoBfN6sedaKf1fUaxm3Z66
 rhUA==
X-Gm-Message-State: AOJu0YyK3zQwLlJd33L92UcL4sM5zOuriPFHG3uI99ek6HhRh9jshfAs
 Su4tnEQa0W6n0Nr04nQ1hpMSw41sSHpdAg==
X-Google-Smtp-Source: AGHT+IH+6w8aOvWyHCwD6wsuI98X2XYDQXCpkMdMV2jchVCxkU6bSX2xBu+bLjzaSXXjriR1QbtL4A==
X-Received: by 2002:a05:6358:5281:b0:168:de6a:d653 with SMTP id
 g1-20020a056358528100b00168de6ad653mr14875320rwa.21.1700591143462; 
 Tue, 21 Nov 2023 10:25:43 -0800 (PST)
Received: from localhost.localdomain (c-68-36-104-89.hsd1.mi.comcast.net.
 [68.36.104.89]) by smtp.gmail.com with ESMTPSA id
 o1-20020a056214180100b00656e2464719sm4199906qvw.92.2023.11.21.10.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 10:25:42 -0800 (PST)
From: Byron Gallagher <trippgallagher98@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 13:25:25 -0500
Message-Id: <20231121182525.4549-1-trippgallagher98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87fs0zx9el.fsf@tarshish>
References: <87fs0zx9el.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700591143; x=1701195943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrghSCJ4n8yq6LDtTVV/dzoH/m3ljtC+0zfFSFC21Pc=;
 b=YrhCB0n3Hge2Vejv7BWlRSl2aI3HHkHn+3LXiBha84j+Ge/R15LoHDn2P62YfU3Y+P
 /QMyhKs93qmpSTp0VSpf4VLPO1I/BJUWumcgmDWyYqaxnl6PvgqGiUwOidDQ4zV6sG54
 Ogh4BSXCm+4xga7Ww2TxjsC2nCbimPV3ktubxxZTiSSNabc/D35fMRBv+BfMx40CwyHX
 V0Wumafs125te6POKXD4maoTfDVFESdMhqsj5hKjTPEtWxxupEaqNUjL78jgMgyAePdc
 SNJnYz7WXrJMhpGQB3PTUdD50XW2qLmY3QXxg66xyOnMGGKDtvQ/Q4UiktoP3i46PB7J
 YfcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YrhCB0n3
Subject: [Buildroot] [PATCH] package/socat: fix static openssl compatibility
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
Cc: Byron Gallagher <trippgallagher98@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

4028ee71743a25af172809e098e4c8eb61bf55f4 disables static openssl
compatibility due to issues linking against zlib.

This patch re-enables the functionality by patching socat's
autoconf to include zlib when locating openssl. Bug also reported
upstream via socat@dest-unreach.org.

Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
---
 ...-build-link-against-zlib-for-openssl.patch | 36 +++++++++++++++++++
 package/socat/socat.mk                        |  2 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/socat/0003-build-link-against-zlib-for-openssl.patch

diff --git a/package/socat/0003-build-link-against-zlib-for-openssl.patch b/package/socat/0003-build-link-against-zlib-for-openssl.patch
new file mode 100644
index 0000000000..257f5225b1
--- /dev/null
+++ b/package/socat/0003-build-link-against-zlib-for-openssl.patch
@@ -0,0 +1,36 @@
+From 0434a4674a012a35f6390d9afc4812de59a394ab Mon Sep 17 00:00:00 2001
+From: Byron Gallagher <trippgallagher98@gmail.com>
+Date: Tue, 21 Nov 2023 12:25:18 -0500
+Subject: [PATCH] build: link against zlib for openssl
+
+If openssl is static, socat will not find it due to autoconf
+failures on AC_TRY_LINK without -lz.
+
+Upstream: sent to socat at dest-unreach.org
+Signed-off-by: Byron Gallagher <trippgallagher98@gmail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9d60473..ae0e6bd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,12 +580,12 @@ if test -n "$WITH_OPENSSL" -a "$sc_cv_have_openssl_ssl_h" = 'yes'; then
+       if test -n "$OPENSSL_BASE"; then
+ 	L="$OPENSSL_BASE/lib"; LIBS="$LIBS -L$L -lssl -lcrypto"
+       else
+-	LIBS="$LIBS -lssl -lcrypto"
++	LIBS="$LIBS -lssl -lcrypto -lz"
+       fi
+       AC_TRY_LINK([#include <openssl/ssl.h>],
+        [SSL_library_init();ERR_error_string()],
+        [sc_cv_have_libssl='yes'],
+-       [ LIBS="$LIBS -lcrypto"
++       [ LIBS="$LIBS -lcrypto -lz"
+        AC_TRY_LINK([#include <openssl/ssl.h>],
+        [SSL_library_init()],
+ 	  [sc_cv_have_libssl='yes'],
+-- 
+2.34.1
+
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index f958f26522..0741605687 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -39,7 +39,7 @@ SOCAT_DEPENDENCIES = host-autoconf
 # incompatibile license (GPL-3.0+)
 SOCAT_CONF_OPTS = --disable-readline
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SOCAT_DEPENDENCIES += openssl
 else
 SOCAT_CONF_OPTS += --disable-openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
