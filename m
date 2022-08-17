Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78AFC25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 22:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12E6B83EF0;
	Wed, 17 Aug 2022 22:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12E6B83EF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AK25KEBSnqzk; Wed, 17 Aug 2022 22:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159BD83EE8;
	Wed, 17 Aug 2022 22:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159BD83EE8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 373181BF573
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 22:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17FCD60F4B
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 22:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17FCD60F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmISVcIwfJ47 for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 22:36:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D67F60F42
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D67F60F42
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 22:36:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r16so8513212wrm.6
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 15:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=oI7tB+K3XMp2NXkn6bgWcYQbkA55/03BYVUe+IXHpSE=;
 b=q9GyX+S1qo8BcUBU2N65guoy7gtrtgHV5Ud1BaxbvxiBDouNo2tCFPAfypys+G/Wic
 EIvEvU8sgBj7+qrTNYdxNxTkp27iHC0GyVaVXJikqZprmGsxz6eVpSCCTpLW1aocQts/
 51U5HqqIT4R8cPndSWC9IZ1LPLbNOb5RG+5lkHXjV+eeUU4MW0vvlgf9uFAwFu4Rl6Gl
 hPJcQjesxzKfBmTIUwItie8aiMhnRx8JvZFKv2lT1hxz6DzyHd+taFEfeFcVHLNfmSnS
 zlgB85Gu5ua/dvzlIMyIFTkIt41RvJDM9A+KpLOFq6dwfoPuouBSQYf2P+zKgXrVmnhS
 C0KQ==
X-Gm-Message-State: ACgBeo3KaISNFV6t/wUOTpEbiVl0+59aCwHDDxGJ0tCGehUD5YBe5LtQ
 X2cjruwV1hSzVNgorOvN9C1eq/sN0Ok=
X-Google-Smtp-Source: AA6agR4DEY2dY7Ae2VpL4c3e17mBSZoxF4L5ZXFV9XyJ6ADT+GUR+Gz7CSGf0Iuo9j9DvFO41ogevQ==
X-Received: by 2002:a5d:6646:0:b0:225:259e:dec5 with SMTP id
 f6-20020a5d6646000000b00225259edec5mr76286wrw.566.1660775780071; 
 Wed, 17 Aug 2022 15:36:20 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00d8e5b341f3f5f170.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:d8e5:b341:f3f5:f170])
 by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b003a62052053csm1251960wms.18.2022.08.17.15.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 15:36:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 00:36:12 +0200
Message-Id: <20220817223612.218840-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=oI7tB+K3XMp2NXkn6bgWcYQbkA55/03BYVUe+IXHpSE=;
 b=h88pGmwuo4LaEKYLJI65mYJFeOEOmH0PUykporE9xeV44el4XRl41cG+7duw4M/kF0
 fWM1Qlst70m1aOMgIDHlc6EMMBbWpgRuqGdIQ/Vr47WVPKhlri0Yl/sMnqgZcnF3MAUS
 SiEiusE8gAPhacvNhEjEZB/ID31DICFRWbWp/reXZzSGXNVNtHcKoWsv9JZ2+cuzLHkl
 3eL0DSIrLRTzPSzyf6FLwH5SymXWliG+QrWk+1Bmcb+e9lypJ+vq+v7lBwgUr2se+pVy
 LzSh0aSrW8wyD0ATpkfY9hbjwyupF5/Ck7ru5LqzlXJYKng75mkm7AXVqgEX440e4Zht
 OXqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h88pGmwu
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libressl build
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 3.37.1 in commit 2546a31ccef6fed6c3bd40d6a1f13f4d0898cea9 and
https://github.com/syslog-ng/syslog-ng/commit/c7ba645918480da06b9e065c62ebd630312b0c7f:

/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_client_sigalgs_list'
/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_sigalgs_list'

Fixes:
 - http://autobuild.buildroot.org/results/84cf9f6a0f6de831a685b73c42eab868952c8b15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-lib-tlscontext.c-fix-libressl-build.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch

diff --git a/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
new file mode 100644
index 0000000000..2c438627a4
--- /dev/null
+++ b/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
@@ -0,0 +1,85 @@
+From 6f93484cea81ff8d45df213d5d2b4cffc4eadcad Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Jul 2022 18:09:25 +0200
+Subject: [PATCH] lib/tlscontext.c: fix libressl build
+
+Fix the following build failure with libressl raised since version
+3.37.1 and
+https://github.com/syslog-ng/syslog-ng/commit/c7ba645918480da06b9e065c62ebd630312b0c7f:
+
+/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_client_sigalgs_list'
+/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_sigalgs_list'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/84cf9f6a0f6de831a685b73c42eab868952c8b15
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/syslog-ng/syslog-ng/pull/4081]
+---
+ cmake/openssl_functions.cmake | 4 +++-
+ configure.ac                  | 2 ++
+ lib/tlscontext.c              | 4 ++++
+ syslog-ng-config.h.in         | 2 ++
+ 4 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
+index afd7b96bfe..319dcc2e23 100644
+--- a/cmake/openssl_functions.cmake
++++ b/cmake/openssl_functions.cmake
+@@ -42,7 +42,9 @@ function (openssl_set_defines)
+     DH_set0_pqg
+     BN_get_rfc3526_prime_2048
+     SSL_CTX_set_num_tickets
+-    SSL_CTX_set_ciphersuites)
++    SSL_CTX_set_ciphersuites
++    SSL_CTX_set1_sigalgs_list
++    SSL_CTX_set1_client_sigalgs_list)
+ 
+   foreach (symbol ${symbol_list})
+     string(TOUPPER ${symbol} SYMBOL_UPPERCASE)
+diff --git a/configure.ac b/configure.ac
+index 8cfab2251e..ecffb84f06 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1055,6 +1055,8 @@ AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
+ AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
+ AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
+ AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
++AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
++AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
+ 
+ CPPFLAGS="$CPPFLAGS_SAVE"
+ 
+diff --git a/lib/tlscontext.c b/lib/tlscontext.c
+index ddde21dcaf..dedcf1ce5a 100644
+--- a/lib/tlscontext.c
++++ b/lib/tlscontext.c
+@@ -598,11 +598,15 @@ tls_context_setup_cipher_suite(TLSContext *self)
+ static gboolean
+ tls_context_setup_sigalgs(TLSContext *self)
+ {
++#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
+   if (self->sigalgs && !SSL_CTX_set1_sigalgs_list(self->ssl_ctx, self->sigalgs))
+     return FALSE;
++#endif
+ 
++#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
+   if (self->client_sigalgs && !SSL_CTX_set1_client_sigalgs_list(self->ssl_ctx, self->client_sigalgs))
+     return FALSE;
++#endif
+ 
+   return TRUE;
+ }
+diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
+index 1817deea50..004b0a7be6 100644
+--- a/syslog-ng-config.h.in
++++ b/syslog-ng-config.h.in
+@@ -57,6 +57,8 @@
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
++#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
++#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_STORE_CTX_GET0_CERT
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_GET_EXTENSION_FLAGS
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_DH_SET0_PQG
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
