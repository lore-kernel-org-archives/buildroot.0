Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A93E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 10:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEDC881F5A;
	Sun,  1 Oct 2023 10:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEDC881F5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDFV5j45p-wi; Sun,  1 Oct 2023 10:00:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E957E81F4F;
	Sun,  1 Oct 2023 10:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E957E81F4F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 13C571BF342
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 10:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE53281F45
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 10:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE53281F45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sky3xqeOspl4 for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 10:00:14 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A464D81F16
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 10:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A464D81F16
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4064876e8b8so54779175e9.0
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 03:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696154412; x=1696759212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7AIJwxaf86ucez9Dw9e1nvxJ2FL3s3Geqf7hvVrl3OQ=;
 b=G6RAf15Nq6aJ+PV3WFYaxQH3zdWOQq9uMYonuDGPXSPOdyTPqAiePzMCOTIYW2larz
 sp/xCcvUNV4/hYzPOfZgyCIEejScyh8JDC+ihjYCStxf4YwS9G7Qlb6H8NyxLU8Bo+c4
 iLtKkwmAYJp/FIF48ma8ocY2QI7aaO29XO9MuMFiAAbu4O6llqH82YMx0ZknzmA7rbyE
 zFduguZ5IsNjei+wt3pXP8+VexG0J2M/DKDLKPILwmw8+kSYto0Fuw5ng6RH12EkMFEX
 bV73eorvJhI86vdYnNsL4itTeqCCq4kHZEhkqX82W9e0O03AzZbNAri+CP1pY3ql+2R6
 jGmQ==
X-Gm-Message-State: AOJu0YwuVe+pRk6c8IMteWs5iL7Ui5Y2TR3xc2Rm63mYjaAKlQ/3NxwB
 o4UR92LZOiTFsYCupBiCeZsyd5uWZ0w=
X-Google-Smtp-Source: AGHT+IEyfgfV/NFNAjNDaVy00Fb9sAZS0Fuiu6pz6ahM/srH3isrO/chl8+uKG+6T5PqAQJuKVtTSA==
X-Received: by 2002:a5d:6408:0:b0:323:306e:65cf with SMTP id
 z8-20020a5d6408000000b00323306e65cfmr7331491wru.10.1696154411925; 
 Sun, 01 Oct 2023 03:00:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j6-20020a5d6046000000b003259b068ba6sm5190552wrt.7.2023.10.01.03.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Oct 2023 03:00:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 12:00:09 +0200
Message-Id: <20231001100009.468927-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696154412; x=1696759212; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7AIJwxaf86ucez9Dw9e1nvxJ2FL3s3Geqf7hvVrl3OQ=;
 b=cUTa172Oc8za89RJW7WnSaUQAwF8Ncy1T/JGvQMN6NNCHkeI8eRIfRLlBRotfn6CD9
 y7xmGpTAGmZGavEk2ShQ1qp+i/ZCmrkumHc3/42cdLcZyKTWIsixdVXB7kAAlKMYLDo7
 V256+yOkeJMoLEwWWZ0PnQOjU4FQTNrXq8kMVtFnpxpWcmPSWYNX3ODBdGcJpwBJPoI0
 BReGPte8ZMAtNutxn0FXL608ZPjWtlTZiSqqWBUNNn/QEhfOUu5mzVnhivfHhMTLtUUh
 1Jqo9BOQ21SA8sWK3dGti14791WRjoSP2828hJ5+Rfn8H6kSy68+PPIQ2gArXv38GWKy
 QWwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cUTa172O
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

Fox the following build failure with libressl raised since bump to
version 4.1.1 in commit 683563da8095c2eb69e677402b9bef7217ae90d9 and
https://github.com/syslog-ng/syslog-ng/commit/bc05f28a4b511ac9090195280163a7f822712ceb:

lib/transport/tls-context.c: In function 'tls_context_setup_cmd_context':
lib/transport/tls-context.c:320:3: error: unknown type name 'SSL_CONF_CTX'; did you mean 'SSL_AEAD_CTX'?
  320 |   SSL_CONF_CTX *ssl_conf_ctx = SSL_CONF_CTX_new();
      |   ^~~~~~~~~~~~
      |   SSL_AEAD_CTX

Fixes:
 - http://autobuild.buildroot.org/results/dc4d60d752e579ef054915eee3d7e3e73c25929b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ort-tls-context.c-fix-libressl-build.patch | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch

diff --git a/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch
new file mode 100644
index 0000000000..17cc72b983
--- /dev/null
+++ b/package/syslog-ng/0002-lib-transport-tls-context.c-fix-libressl-build.patch
@@ -0,0 +1,97 @@
+From ede106afd7d70a8f962acf10a4e3f4a50a70cb15 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Oct 2023 11:27:09 +0200
+Subject: [PATCH] lib/transport/tls-context.c: fix libressl build
+
+Fix the following build failure with libressl raised since version 4.0.0
+and
+https://github.com/syslog-ng/syslog-ng/commit/bc05f28a4b511ac9090195280163a7f822712ceb:
+
+lib/transport/tls-context.c: In function 'tls_context_setup_cmd_context':
+lib/transport/tls-context.c:320:3: error: unknown type name 'SSL_CONF_CTX'; did you mean 'SSL_AEAD_CTX'?
+  320 |   SSL_CONF_CTX *ssl_conf_ctx = SSL_CONF_CTX_new();
+      |   ^~~~~~~~~~~~
+      |   SSL_AEAD_CTX
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dc4d60d752e579ef054915eee3d7e3e73c25929b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/syslog-ng/syslog-ng/pull/4655
+---
+ cmake/openssl_functions.cmake | 1 +
+ configure.ac                  | 1 +
+ lib/transport/tls-context.c   | 4 ++++
+ syslog-ng-config.h.in         | 1 +
+ 4 files changed, 7 insertions(+)
+
+diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
+index 5afbd7f12..da06ca59a 100644
+--- a/cmake/openssl_functions.cmake
++++ b/cmake/openssl_functions.cmake
+@@ -41,6 +41,7 @@ function (openssl_set_defines)
+     X509_get_extension_flags
+     DH_set0_pqg
+     BN_get_rfc3526_prime_2048
++    SSL_CONF_CTX_new
+     SSL_CTX_set_num_tickets
+     SSL_CTX_set_ciphersuites
+     SSL_CTX_set1_sigalgs_list
+diff --git a/configure.ac b/configure.ac
+index d636bbefa..46e43db7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1136,6 +1136,7 @@ AC_CHECK_DECLS([EVP_MD_CTX_reset], [], [], [[#include <openssl/evp.h>]])
+ AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
+ AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
+ AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
++AC_CHECK_DECLS([SSL_CONF_CTX_new],[], [], [[#include <openssl/ssl.h>]])
+ AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
+ AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
+ AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
+diff --git a/lib/transport/tls-context.c b/lib/transport/tls-context.c
+index be2fea68d..713b63f31 100644
+--- a/lib/transport/tls-context.c
++++ b/lib/transport/tls-context.c
+@@ -314,6 +314,7 @@ tls_context_setup_sigalgs(TLSContext *self)
+   return TRUE;
+ }
+ 
++#if SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
+ static gboolean
+ tls_context_setup_cmd_context(TLSContext *self)
+ {
+@@ -347,6 +348,7 @@ tls_context_setup_cmd_context(TLSContext *self)
+   SSL_CONF_CTX_free(ssl_conf_ctx);
+   return result;
+ }
++#endif
+ 
+ static PKCS12 *
+ _load_pkcs12_file(TLSContext *self, const gchar *pkcs12_file)
+@@ -593,8 +595,10 @@ tls_context_setup_context(TLSContext *self)
+   if (!tls_context_setup_sigalgs(self))
+     goto error;
+ 
++#if SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
+   if (!tls_context_setup_cmd_context(self))
+     goto error;
++#endif
+ 
+   return TLS_CONTEXT_SETUP_OK;
+ 
+diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
+index 412294d2a..6d01b84a0 100644
+--- a/syslog-ng-config.h.in
++++ b/syslog-ng-config.h.in
+@@ -60,6 +60,7 @@
+ #cmakedefine ENV_LD_LIBRARY_PATH @ENV_LD_LIBRARY_PATH@
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_EVP_MD_CTX_RESET
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
++#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CONF_CTX_new
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
+ #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
+-- 
+2.40.1
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
