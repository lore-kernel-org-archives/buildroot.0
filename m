Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE5DC433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 02:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2741B408D0;
	Sun, 16 Oct 2022 02:21:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2741B408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T8i9zHJiMNI9; Sun, 16 Oct 2022 02:21:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C28140510;
	Sun, 16 Oct 2022 02:21:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C28140510
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0CA81BF306
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 02:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 865C5410DF
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 02:21:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 865C5410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4fYXqwpIYzO for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 02:21:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BCE8410D1
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BCE8410D1
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 02:21:01 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 p3-20020a17090a284300b0020a85fa3ffcso11325022pjf.2
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 19:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pwrssj7ZUdJ3pgunKEFZcBDduiEylZk92ULUJdfFqbw=;
 b=5J8u/F7eYIolr82MDXhegbA7Y1EwEQZETlPUWsyJXSIlawJOmE4P4UBoovuSFwGf1y
 5hxt6703Bb5ifZhcwBRNhvrSkSpGWSKa6oISvLfHMm8M/k0P3naRiWxnuBMOTdk2l3Fp
 RZQY/oN8muIdGDzltq+YUJeGHkWEjULXgzC8g/L0+A1SxOrLCismiMXy4QD/zoqaulsm
 m2Bjpm+rn34iN+WC1UsMdvdPF4fyrjQLeO9howe1AZN4R2cEF34/r89weeGTc0wEtUxh
 h+eY26fcd7dZSLo9Yg0TBN6vJmNJqfwK8uE+Exi0h26S51EHhGtMcGatkdeG7IJLYUA/
 jajQ==
X-Gm-Message-State: ACrzQf05cP6kf8rBrUYcqliFL4cq6nOEk+PNbuAhn8acUlTupjUNeSYL
 t2sqPKQDr6MEcZP1rRMMRafnThQV6mJL1w==
X-Google-Smtp-Source: AMsMyM4If2MM4uLsmWSqwl3bZjhDQo7YKzKGopbE6SJwB3PYt7v52E3DFEYhjRI1sMmca4irEtJ1DQ==
X-Received: by 2002:a17:902:e952:b0:17c:7aaa:c679 with SMTP id
 b18-20020a170902e95200b0017c7aaac679mr5436678pll.74.1665886859845; 
 Sat, 15 Oct 2022 19:20:59 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:3a:bc26:2709:3d92])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170902ea0500b00176a579fae8sm4017544plg.210.2022.10.15.19.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 19:20:58 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 15:20:51 +1300
Message-Id: <20221016022051.3870975-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pwrssj7ZUdJ3pgunKEFZcBDduiEylZk92ULUJdfFqbw=;
 b=igp8JqMsnx8d/Qtu5dwgoSMZ5G61KQHfy4nyWaVluyIZ8M0RHxNLWbcJVGq9+ALBOt
 60SAtjZ0U9EKlGiuFK/OxepXJ74u9rvwsHxSTWGWyBsWWJUb7yRiOm/U6NvytKJMJAnA
 UREsbsIVKqQsrFnwBlKXvOnxDYlbTPHEJJIenuirv8abn6RmkCcOUcnAtzzHOt3HErUr
 auEzQwcHvyvNR507n6kZIqo4ejW03Jhbunq+DXatUPG1FRJ3yQSq3EsI3Ik2NbS1fYB2
 I22sH82oeRb7fRBOMKvvC4to0AquJJBc6sWB9DtbO1j4k6SUe2F3XGteJvUcDMq/YP6q
 mJtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=igp8JqMs
Subject: [Buildroot] [PATCH v2] package/syslog-ng: Bump version to 3.38.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new version. Remove patch that has been applied upstream. Update
hash for COPYING as it's text has changed to clarify some details but
the license remains LGP-2.0+L/GPL-2.0+.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---

Notes:
    Changes in v2:
    - update version in syslog-ng.conf

 ...-lib-tlscontext.c-fix-libressl-build.patch | 85 -------------------
 package/syslog-ng/syslog-ng.conf              |  2 +-
 package/syslog-ng/syslog-ng.hash              |  4 +-
 package/syslog-ng/syslog-ng.mk                |  2 +-
 4 files changed, 4 insertions(+), 89 deletions(-)
 delete mode 100644 package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch

diff --git a/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
deleted file mode 100644
index 2c438627a4..0000000000
--- a/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 6f93484cea81ff8d45df213d5d2b4cffc4eadcad Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 16 Jul 2022 18:09:25 +0200
-Subject: [PATCH] lib/tlscontext.c: fix libressl build
-
-Fix the following build failure with libressl raised since version
-3.37.1 and
-https://github.com/syslog-ng/syslog-ng/commit/c7ba645918480da06b9e065c62ebd630312b0c7f:
-
-/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_client_sigalgs_list'
-/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_sigalgs_list'
-
-Fixes:
- - http://autobuild.buildroot.org/results/84cf9f6a0f6de831a685b73c42eab868952c8b15
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/syslog-ng/syslog-ng/pull/4081]
----
- cmake/openssl_functions.cmake | 4 +++-
- configure.ac                  | 2 ++
- lib/tlscontext.c              | 4 ++++
- syslog-ng-config.h.in         | 2 ++
- 4 files changed, 11 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
-index afd7b96bfe..319dcc2e23 100644
---- a/cmake/openssl_functions.cmake
-+++ b/cmake/openssl_functions.cmake
-@@ -42,7 +42,9 @@ function (openssl_set_defines)
-     DH_set0_pqg
-     BN_get_rfc3526_prime_2048
-     SSL_CTX_set_num_tickets
--    SSL_CTX_set_ciphersuites)
-+    SSL_CTX_set_ciphersuites
-+    SSL_CTX_set1_sigalgs_list
-+    SSL_CTX_set1_client_sigalgs_list)
- 
-   foreach (symbol ${symbol_list})
-     string(TOUPPER ${symbol} SYMBOL_UPPERCASE)
-diff --git a/configure.ac b/configure.ac
-index 8cfab2251e..ecffb84f06 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1055,6 +1055,8 @@ AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
- AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
- AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
- AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
-+AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
-+AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
- 
- CPPFLAGS="$CPPFLAGS_SAVE"
- 
-diff --git a/lib/tlscontext.c b/lib/tlscontext.c
-index ddde21dcaf..dedcf1ce5a 100644
---- a/lib/tlscontext.c
-+++ b/lib/tlscontext.c
-@@ -598,11 +598,15 @@ tls_context_setup_cipher_suite(TLSContext *self)
- static gboolean
- tls_context_setup_sigalgs(TLSContext *self)
- {
-+#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
-   if (self->sigalgs && !SSL_CTX_set1_sigalgs_list(self->ssl_ctx, self->sigalgs))
-     return FALSE;
-+#endif
- 
-+#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
-   if (self->client_sigalgs && !SSL_CTX_set1_client_sigalgs_list(self->ssl_ctx, self->client_sigalgs))
-     return FALSE;
-+#endif
- 
-   return TRUE;
- }
-diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
-index 1817deea50..004b0a7be6 100644
---- a/syslog-ng-config.h.in
-+++ b/syslog-ng-config.h.in
-@@ -57,6 +57,8 @@
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
-+#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
-+#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_STORE_CTX_GET0_CERT
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_GET_EXTENSION_FLAGS
- #cmakedefine01 SYSLOG_NG_HAVE_DECL_DH_SET0_PQG
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 45b94facf9..69db9b4b78 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.37
+@version: 3.38
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 764ff45733..6fce7be996 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  d67a320cb896cd5d62f24d9e1bec138847fa4618ae13a3946cae2b75c528ee14  syslog-ng-3.37.1.tar.gz
-sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
+sha256  5491f686d0b829b69b2e0fc0d66a62f51991aafaee005475bfa38fab399441f7  syslog-ng-3.38.1.tar.gz
+sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 64b3b24498..a7176ad129 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.37.1
+SYSLOG_NG_VERSION = 3.38.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.38.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
