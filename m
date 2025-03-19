Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F2DC35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 10:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A149C81233;
	Wed, 19 Mar 2025 10:16:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAKxLR0QcQqz; Wed, 19 Mar 2025 10:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95E2581234
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95E2581234;
	Wed, 19 Mar 2025 10:16:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D8BD9CD
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 10:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6B254022B
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCr14FE-Itbk for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 10:16:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F3B340409
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F3B340409
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F3B340409
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 10:16:50 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-abc28af1ba4so111009666b.1
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 03:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742379408; x=1742984208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tA/0e94HKhdmbF/Bza46Czf/WN0Ti4HhubGX501azOg=;
 b=gmlexwiBbn2AS7Jt/OfDCylNsJchUCdh/M6f78NLRX6hhtT+rhL0xzMwJ1fhc/03SY
 8uaC2fhqYv0kP/G56YLsm/rjGbjQCa7mjL50caMUo6Fh7Za4bVMRJRNjYlZnLEkanY1q
 8AOuLLhwPcGXa5VKuJJu/7IbW4jE9HSluMiUe22XQ+RcMBUBTVWUgguAjVBEwGJtCvUB
 9YTb6Fab++usT+iDpuJ69ZervnfIrChKcdZLXJwrU7DNypBjkukYYwisyMra6NjDTUff
 7foUo2alcNRseGrSXVhQartp0rBDOOO8BwcRAqjydSeNam8DnuG+DeUg6fWrIqNlxx62
 1ncw==
X-Gm-Message-State: AOJu0YxHjEILb7VA7ns51fjrNOSb1+AYblBcLucaJgkYhF7tyPQctkf8
 x8SJZuynah6datKi2ISydpAjHd9GYAr2fggdD1iuHjE17ZUeG43u+nJxwZ993BymS6bPTRqWQNp
 W
X-Gm-Gg: ASbGncueGHISXo8dwClMJ6GyKKY+LXdJYBmH8elhOOcfq/cMuEGNabRTiaIp5n7lRZf
 qrQ9qhejC1eVxjh039+Zo7D3EaeIPET33y5i943sKxkFYKtQMn4OU8wBINVK2dcpdMUavkIjyK6
 DGF9pGdCGVuc14m23e+4Atbh2eMyYHuIWYulTmV7dxiAmoYjY/D//BMSsE7MsJi4xej4HWFw6wV
 4DOvU6YMBDQcKz1j1XziecYp/Gviss8T5AqFJL9s1FTDCSGG05D+QMrKkfE0LTWLHuJTUm6p7ji
 AgWM7Sr/L+dJT0TU8N2Q2Pvm5V0R9kp79PJ/ByBLbpTQbg0IVdnUdx2p9/YbaUm4CswminadnGi
 DAyajmW448D4tEOQ9XH/4EZTEgnD1FhJFO4z6CSBM8HRA4hd56LFpFiOFajiqF5hSbyQJXbW/vD
 sr/MCDuvuepQ==
X-Google-Smtp-Source: AGHT+IGFEos4J8N0Ys09Bbi2KcL/JO7NiDoH+C/qhRVyo9w+qGliZK8L1I/JEUktnIRJ9v54g/Wt5Q==
X-Received: by 2002:a17:907:a58b:b0:ac3:66fb:b197 with SMTP id
 a640c23a62f3a-ac3b7c34122mr85673366b.3.1742379408280; 
 Wed, 19 Mar 2025 03:16:48 -0700 (PDT)
Received: from fedora.arnhem.chello.nl
 (2a02-a211-a140-6480-ea4e-3e0b-5fd4-931c.cable.dynamic.v6.ziggo.nl.
 [2a02:a211:a140:6480:ea4e:3e0b:5fd4:931c])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac37dc4e0afsm416581066b.21.2025.03.19.03.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Mar 2025 03:16:48 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Wed, 19 Mar 2025 11:16:45 +0100
Message-ID: <20250319101645.1387015-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742379408; x=1742984208;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tA/0e94HKhdmbF/Bza46Czf/WN0Ti4HhubGX501azOg=;
 b=MZwQ/0HCDg9T94A+LNZ5dYDX9Q+DciS6ozh7zRqAnPCPNn9m18sGJf23lDsT0/zz4x
 Wc0sVtpWNOZ5NpI+/mP4f5KCkQ4J7NOe0Fx24TkFhhUnHwKaqvKGkB6Ft5EQsmXMO8UT
 OTeZH19WCxFx3qmii5XJZ8mlyCLxcpkzCnoVo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MZwQ/0HC
Subject: [Buildroot] [PATCH 1/1] package/libressl: bump to version 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...0001-always-expose-SSL_OP_NO_TLSv1_3.patch |  2 +-
 ...ists-txt-Fix-HOST-variable-for-ppc64.patch | 26 -------------------
 package/libressl/libressl.hash                |  2 +-
 package/libressl/libressl.mk                  |  2 +-
 4 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
index 48f3fa16e0..dc333306f4 100644
--- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
 index 46f24b2ea..4048a6e63 100644
 --- a/include/openssl/ssl.h
 +++ b/include/openssl/ssl.h
-@@ -412,11 +412,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+@@ -404,11 +404,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
  #define SSL_OP_NO_TLSv1					0x04000000L
  #define SSL_OP_NO_TLSv1_2				0x08000000L
  #define SSL_OP_NO_TLSv1_1				0x10000000L
diff --git a/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch b/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
deleted file mode 100644
index 8da8fedae2..0000000000
--- a/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d Mon Sep 17 00:00:00 2001
-From: OPNA2608 <opna2608@protonmail.com>
-Date: Fri, 19 Jul 2024 11:41:46 +0200
-Subject: [PATCH] CMakeLists.txt: Fix HOST variable for ppc64
-
-The code here defined HOST_PPC64, but the rest of the build system expects HOST_POWERPC64.
-
-Upstream: https://github.com/libressl/portable/commit/e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c496ad97b5..670aa9a1a0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -373,7 +373,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
- 	set(HOST_POWERPC true)
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
--	set(HOST_PPC64 true)
-+	set(HOST_POWERPC64 true)
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "riscv64")
- 	set(HOST_RISCV64 true)
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "sparc64")
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 692dce28e3..65f728d6f6 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97  libressl-3.9.2.tar.gz
+sha256  4d841955f0acc3dfc71d0e3dd35f283af461222350e26843fea9731c0246a1e4  libressl-4.0.0.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 7e92ea3a11..e4d22ce82c 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.9.2
+LIBRESSL_VERSION = 4.0.0
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
