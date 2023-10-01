Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB55E748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 14:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B413341F97;
	Sun,  1 Oct 2023 14:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B413341F97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sstalrF9yYiC; Sun,  1 Oct 2023 14:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6745A41F94;
	Sun,  1 Oct 2023 14:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6745A41F94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B65111BF909
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F6A360DC2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 14:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6A360DC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5pcc1cydY0qZ for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 14:47:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CB8F60D90
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 14:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CB8F60D90
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2976583566; Sun,  1 Oct 2023 14:47:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 16:38:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db38d928292aaca493c80527008b9bd7e6db602
X-Git-Newrev: b38aed4eb4246dff4815d85ae1603db2899fa98f
X-Patchwork-Hint: ignore
Message-Id: <20231001144733.2976583566@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: fix libressl build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b38aed4eb4246dff4815d85ae1603db2899fa98f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ransport-tls-context.c-fix-libressl-build.patch | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
