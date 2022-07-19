Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E0EC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Jul 2022 15:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BE2540ADA;
	Tue, 19 Jul 2022 15:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE2540ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2npDQHnKyMTJ; Tue, 19 Jul 2022 15:51:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B67640C6A;
	Tue, 19 Jul 2022 15:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B67640C6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CAE91BF228
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA1E360B14
 for <buildroot@lists.busybox.net>; Tue, 19 Jul 2022 15:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA1E360B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kc_moXFUC-PI for <buildroot@lists.busybox.net>;
 Tue, 19 Jul 2022 15:51:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35FEE60AF2
 for <buildroot@buildroot.org>; Tue, 19 Jul 2022 15:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35FEE60AF2
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2B03883D7B; Tue, 19 Jul 2022 15:37:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Jul 2022 17:49:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 079fccdee5a2a10fc8275094512b8423548ea147
X-Git-Newrev: 6d07e2618c085c7769f695125d6e3392d9d97093
X-Patchwork-Hint: ignore
Message-Id: <20220719153758.2B03883D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: requires TLS support in
 libcurl
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d07e2618c085c7769f695125d6e3392d9d97093
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uacme configure script fails when libcurl does not support TLS. This
means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.

Add a kconfig knob to libcurl, BR2_PACKAGE_LIBCURL_FORCE_TLS, so that
_TLS_NONE is not an option. Select that from uacme.

Note that, beside selecting BR2_PACKAGE_LIBCURL_FORCE_TLS, packages will
have to also select a package that can be used as a crypto backend by
libcurl. Use of BR2_PACKAGE_LIBCURL_FORCE_TLS is unlikely to become very
common in the foreseeable future, so we don't need to optimize with
automatic selection of crypto backend.

uacme already needs a crypto package for itself, so the above
requirement is naturally met for uacme.

Fixes:
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/

Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998@free.fr:
  - keep the current forward select
  - add the kconfig knob
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998@free.fr: tweak commit log with Baruch's suggestions]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcurl/Config.in | 7 +++++++
 package/uacme/Config.in   | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 3381decca8..bc2f8f47f2 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -45,6 +45,12 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	  - DICT
 	  - Gopher
 
+# Packages must select that if they require a SSL/TLS-enabled libcurl.
+# Those packages must also select one crypto package that can be used
+# as a backend below.
+config BR2_PACKAGE_LIBCURL_FORCE_TLS
+	bool
+
 choice
 	prompt "SSL/TLS library to use"
 
@@ -77,6 +83,7 @@ comment "WolfSSL needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
+	depends on !BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS
 
 endchoice
 
diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index 58b7c534e7..796f54754e 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_UACME
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBCURL_FORCE_TLS
 	help
 	  uacme is a client for the ACMEv2 protocol described in
 	  RFC8555, written in plain C with minimal dependencies
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
