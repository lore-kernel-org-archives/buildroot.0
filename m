Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768FCC432BE
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:52:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F37360F02
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F37360F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBE1140545;
	Thu,  5 Aug 2021 19:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KJBEmOJPkSIP; Thu,  5 Aug 2021 19:52:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D1B340532;
	Thu,  5 Aug 2021 19:52:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4B11BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4459D4022F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNQKzKwfu20V for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AC1D40222
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 46CE28B3F4; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 22:30:51 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 506bace2fe1f1236b9888f4cc7bd32d1c81760f0
X-Git-Newrev: 03889590606e4a5aa3adf990e5b31c82c49ccf12
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.46CE28B3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libuhttpd: fix build
 with wolfssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=03889590606e4a5aa3adf990e5b31c82c49ccf12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with wolfssl raised since bump to
version 3.12.1 in commit 4d85defa7103aadc74223868fb83ed0bed144f4d:

/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
      |                                 ^~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/25db1e999950bbee069ba7364a228184a6a77808

Note: we have a reference to a pull request on the 'ssl' repository,
because it is a git submodule of libuhttpd.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: explain the reference to ssl/pull/1]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-openssl.c-fix-build-with-wolfssl.patch    | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
new file mode 100644
index 0000000000..deb1a0f93b
--- /dev/null
+++ b/package/libuhttpd/0001-openssl.c-fix-build-with-wolfssl.patch
@@ -0,0 +1,47 @@
+From e5c5ed1c64cfc715729c9bfbfdcc4be225f344ff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 4 Aug 2021 11:32:39 +0200
+Subject: [PATCH] openssl.c: fix build with wolfssl
+
+Fix the following build failure with wolfssl:
+
+/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c: In function 'ssl_context_new':
+/tmp/instance-4/output-1/build/libuhttpd-3.12.1/src/ssl/openssl.c:174:33: error: 'tls13_ciphersuites' undeclared (first use in this function)
+  174 |     SSL_CTX_set_ciphersuites(c, tls13_ciphersuites);
+      |                                 ^~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/d0fb629b40b05ad828775894fabed878692bb222
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zhaojh329/ssl/pull/1]
+---
+ openssl.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/openssl.c b/openssl.c
+index 8f3d8b7..c42638c 100644
+--- a/src/ssl/openssl.c
++++ b/src/ssl/openssl.c
+@@ -71,14 +71,14 @@
+                 "TLS13-AES256-GCM-SHA384:"		\
+                 ecdhe_aead_ciphers
+ #else
+-# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
+-                "TLS_AES_128_GCM_SHA256:"		\
+-                "TLS_AES_256_GCM_SHA384"
+-
+ # define top_ciphers							\
+                 ecdhe_aead_ciphers
+ #endif
+ 
++# define tls13_ciphersuites	"TLS_CHACHA20_POLY1305_SHA256:"		\
++                "TLS_AES_128_GCM_SHA256:"		\
++                "TLS_AES_256_GCM_SHA384"
++
+ #define ecdhe_aead_ciphers						\
+                 "ECDHE-ECDSA-CHACHA20-POLY1305:"	\
+                 "ECDHE-ECDSA-AES128-GCM-SHA256:"	\
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
