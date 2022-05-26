Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F1AC433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C266661425;
	Thu, 26 May 2022 08:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id romoHVg5X9wX; Thu, 26 May 2022 08:21:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C18F860C02;
	Thu, 26 May 2022 08:21:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6291BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 841C242561
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bm3iJKeahXkQ for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7973A4255F
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EE4D2864D7; Thu, 26 May 2022 08:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 May 2022 10:19:25 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: f4677f0078ab966a3297ad7db025e4a840106c28
X-Git-Newrev: c2dd57638b07645ac9143609cce51921e0ffffea
X-Patchwork-Hint: ignore
Message-Id: <20220526080925.EE4D2864D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/wolfssl: all
 features needs dynamic library
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2dd57638b07645ac9143609cce51921e0ffffea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Add dynamic library dependency to BR2_PACKAGE_WOLFSSL_ALL to fix the
following static build failure with ibrdtnd, a "wolfssl all"-enabled
libcurl and openssl:

/nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/opt/ext-toolchain/bin/../lib/gcc/sh4aeb-buildroot-linux-musl/11.2.0/../../../../sh4aeb-buildroot-linux-musl/bin/ld: /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/bin/../sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libssl.a(ssl_ciph.o): in function `SSL_COMP_get_compression_methods':
ssl_ciph.c:(.text+0x25ac): multiple definition of `SSL_COMP_get_compression_methods'; /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libwolfssl.a(libwolfssl_la-ssl.o):ssl.c:(.text+0x1ca60): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/be1d327ed4c91a6280a88906a399dfe146f0b64e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7d211f67016446b9e843259b1195be04691fecec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/Config.in      | 5 +++++
 package/libuhttpd/Config.in    | 3 ++-
 package/libuhttpd/libuhttpd.mk | 2 +-
 package/wolfssl/Config.in      | 4 ++++
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index d8072c0afc..e7bdb8cae0 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -72,8 +72,13 @@ config BR2_PACKAGE_LIBCURL_MBEDTLS
 config BR2_PACKAGE_LIBCURL_WOLFSSL
 	bool "WolfSSL"
 	depends on BR2_PACKAGE_WOLFSSL
+	depends on !BR2_STATIC_LIBS # wolfssl-all
 	select BR2_PACKAGE_WOLFSSL_ALL
 
+comment "WolfSSL needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_WOLFSSL
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIBCURL_TLS_NONE
 	bool "None"
 
diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 97fc984ea0..a552a88f0c 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_LIBUHTTPD
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBEV
-	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
+		!BR2_STATIC_LIBS
 	help
 	  A lightweight and fully asynchronous HTTP server
 	  library based on libev
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index b8cf935d01..0d5306c6dd 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -18,7 +18,7 @@ LIBUHTTPD_CONF_OPTS += \
 	-DUSE_MBEDTLS=OFF \
 	-DUSE_OPENSSL=ON \
 	-DUSE_WOLFSSL=OFF
-else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 LIBUHTTPD_DEPENDENCIES += wolfssl
 LIBUHTTPD_CONF_OPTS += \
 	-DSSL_SUPPORT=ON \
diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
index 3c6d68f592..3a97125e8d 100644
--- a/package/wolfssl/Config.in
+++ b/package/wolfssl/Config.in
@@ -13,9 +13,13 @@ if BR2_PACKAGE_WOLFSSL
 
 config BR2_PACKAGE_WOLFSSL_ALL
 	bool "enable all features, except SSLv3"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable all wolfSSL features, except SSL version 3.0 support.
 
+comment "all features, except SSLv3 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_WOLFSSL_SSLV3
 	bool "enable SSLv3"
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
